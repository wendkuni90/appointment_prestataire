import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/models.dart';
import '../../../core/providers/availability_provider.dart';
import '../../../core/utils/theme.dart';

// Ordre d'affichage + labels français
const _jours = [
  ('MONDAY',    'Lundi'),
  ('TUESDAY',   'Mardi'),
  ('WEDNESDAY', 'Mercredi'),
  ('THURSDAY',  'Jeudi'),
  ('FRIDAY',    'Vendredi'),
  ('SATURDAY',  'Samedi'),
  ('SUNDAY',    'Dimanche'),
];

class AvailabilitiesScreen extends ConsumerStatefulWidget {
  const AvailabilitiesScreen({super.key});

  @override
  ConsumerState<AvailabilitiesScreen> createState() =>
      _AvailabilitiesScreenState();
}

class _AvailabilitiesScreenState
    extends ConsumerState<AvailabilitiesScreen> {

  // Planning local éditable — une entrée par jour
  late List<_DayState> _days;
  bool _initialized = false;

  // Construit le planning depuis la réponse API
  void _initFromApi(List<AvailabilityDto> apiDays) {
    _days = _jours.map((j) {
      final jour  = j.$1;
      final label = j.$2;
      final found = apiDays.where((d) => d.jour == jour).firstOrNull;
      return _DayState(
        jour:       jour,
        label:      label,
        id:         found?.id,
        travaille:  found?.travaille ?? false,
        debutMatin: _parseTime(found?.heureDebutMatin),
        finMatin:   _parseTime(found?.heureFinMatin),
        debutApm:   _parseTime(found?.heureDebutApresMidi),
        finApm:     _parseTime(found?.heureFinApresMidi),
      );
    }).toList();
    _initialized = true;
  }

  TimeOfDay? _parseTime(String? s) {
    if (s == null) return null;
    final parts = s.split(':');
    if (parts.length < 2) return null;
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  String? _formatTime(TimeOfDay? t) {
    if (t == null) return null;
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '$h:$m:00';
  }

  Future<void> _pickTime(
    BuildContext context,
    TimeOfDay? initial,
    void Function(TimeOfDay) onPicked,
  ) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: initial ?? const TimeOfDay(hour: 9, minute: 0),
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme: const ColorScheme.dark(
            primary:   AppColors.accent,
            surface:   AppColors.bgPanel,
            onSurface: AppColors.textPrimary,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) onPicked(picked);
  }

  Future<void> _save() async {
    final dtos = _days.map((d) => AvailabilityDto(
      id:                   d.id,
      jour:                 d.jour,
      travaille:            d.travaille,
      heureDebutMatin:      d.travaille ? _formatTime(d.debutMatin) : null,
      heureFinMatin:        d.travaille ? _formatTime(d.finMatin)   : null,
      heureDebutApresMidi:  d.travaille ? _formatTime(d.debutApm)   : null,
      heureFinApresMidi:    d.travaille ? _formatTime(d.finApm)     : null,
    )).toList();

    final ok = await ref.read(saveAvailabilitiesProvider.notifier).save(dtos);
    if (ok && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Planning enregistré',
            style: TextStyle(fontFamily: 'DMSans')),
        backgroundColor: AppColors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final availAsync = ref.watch(myAvailabilitiesProvider);
    final saveState  = ref.watch(saveAvailabilitiesProvider);
    final isSaving   = saveState is AsyncLoading;

    return availAsync.when(
      loading: () => const Scaffold(
        backgroundColor: AppColors.bgDeep,
        body: Center(child: CircularProgressIndicator(color: AppColors.accent)),
      ),
      error: (_, __) => Scaffold(
        backgroundColor: AppColors.bgDeep,
        body: Center(
          child: Text('Impossible de charger le planning',
              style: AppTextStyles.bodyMd
                  .copyWith(color: AppColors.textSecondary)),
        ),
      ),
      data: (apiDays) {
        if (!_initialized) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() => _initFromApi(apiDays));
          });
          return const Scaffold(
            backgroundColor: AppColors.bgDeep,
            body: Center(
              child: CircularProgressIndicator(color: AppColors.accent)),
          );
        }

        return Scaffold(
          backgroundColor: AppColors.bgDeep,
          appBar: AppBar(
            title: const Text('Mes disponibilités'),
            leading: const BackButton(),
          ),
          body: Column(
            children: [
              // ── Info ───────────────────────────────────────────────
              Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.blueDim,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.blue.withOpacity(0.2)),
                ),
                child: Row(children: [
                  const Icon(Icons.info_outline_rounded,
                      size: 16, color: AppColors.blue),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Définissez vos plages horaires par jour. '
                      'Les créneaux seront calculés automatiquement.',
                      style: AppTextStyles.bodySm
                          .copyWith(color: AppColors.blue),
                    ),
                  ),
                ]),
              ),

              // ── Liste des jours ────────────────────────────────────
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                  itemCount: _days.length,
                  itemBuilder: (_, i) => _DayTile(
                    day: _days[i],
                    onToggle: (v) =>
                        setState(() => _days[i] = _days[i].copyWith(travaille: v)),
                    onPickTime: (field) async {
                      TimeOfDay? current;
                      switch (field) {
                        case _TimeField.debutMatin: current = _days[i].debutMatin; break;
                        case _TimeField.finMatin:   current = _days[i].finMatin;   break;
                        case _TimeField.debutApm:   current = _days[i].debutApm;   break;
                        case _TimeField.finApm:     current = _days[i].finApm;     break;
                      }
                      await _pickTime(context, current, (picked) {
                        setState(() {
                          switch (field) {
                            case _TimeField.debutMatin:
                              _days[i] = _days[i].copyWith(debutMatin: picked); break;
                            case _TimeField.finMatin:
                              _days[i] = _days[i].copyWith(finMatin: picked); break;
                            case _TimeField.debutApm:
                              _days[i] = _days[i].copyWith(debutApm: picked); break;
                            case _TimeField.finApm:
                              _days[i] = _days[i].copyWith(finApm: picked); break;
                          }
                        });
                      });
                    },
                  ),
                ),
              ),

              // ── Bouton enregistrer ─────────────────────────────────
              Container(
                padding: EdgeInsets.fromLTRB(
                    16, 12, 16, 12 + MediaQuery.of(context).padding.bottom),
                decoration: const BoxDecoration(
                  color: AppColors.bgPanel,
                  border: Border(top: BorderSide(color: AppColors.border)),
                ),
                child: ElevatedButton.icon(
                  onPressed: isSaving ? null : _save,
                  icon: isSaving
                      ? const SizedBox(width: 18, height: 18,
                          child: CircularProgressIndicator(
                              strokeWidth: 2, color: AppColors.bgDeep))
                      : const Icon(Icons.save_outlined, size: 18),
                  label: Text(isSaving
                      ? 'Enregistrement…'
                      : 'Enregistrer le planning'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// TUILE D'UN JOUR
// ══════════════════════════════════════════════════════════════════════════════

enum _TimeField { debutMatin, finMatin, debutApm, finApm }

class _DayTile extends StatelessWidget {
  final _DayState                         day;
  final void Function(bool)               onToggle;
  final void Function(_TimeField)         onPickTime;

  const _DayTile({
    required this.day,
    required this.onToggle,
    required this.onPickTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.bgPanel,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: day.travaille
              ? AppColors.accent.withOpacity(0.3)
              : AppColors.border,
        ),
      ),
      child: Column(
        children: [
          // ── En-tête : jour + toggle ───────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(children: [
              Container(
                width: 36, height: 36,
                decoration: BoxDecoration(
                  color: day.travaille
                      ? AppColors.accentDim
                      : AppColors.bgSurface,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    day.label.substring(0, 2).toUpperCase(),
                    style: AppTextStyles.labelMd.copyWith(
                      color: day.travaille
                          ? AppColors.accent
                          : AppColors.textMuted,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(day.label, style: AppTextStyles.headingSm),
              ),
              Switch(
                value: day.travaille,
                onChanged: onToggle,
                activeColor: AppColors.accent,
              ),
            ]),
          ),

          // ── Plages horaires (visible si travaille) ────────────────
          if (day.travaille) ...[
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
              child: Column(
                children: [
                  // Matin
                  _PlageRow(
                    label: 'Matin',
                    icon: Icons.wb_sunny_outlined,
                    iconColor: AppColors.warning,
                    debut: day.debutMatin,
                    fin:   day.finMatin,
                    onPickDebut: () => onPickTime(_TimeField.debutMatin),
                    onPickFin:   () => onPickTime(_TimeField.finMatin),
                  ),
                  const SizedBox(height: 10),
                  // Après-midi
                  _PlageRow(
                    label: 'Après-midi',
                    icon: Icons.wb_twilight_outlined,
                    iconColor: AppColors.accent,
                    debut: day.debutApm,
                    fin:   day.finApm,
                    onPickDebut: () => onPickTime(_TimeField.debutApm),
                    onPickFin:   () => onPickTime(_TimeField.finApm),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// LIGNE DE PLAGE HORAIRE
// ══════════════════════════════════════════════════════════════════════════════

class _PlageRow extends StatelessWidget {
  final String      label;
  final IconData    icon;
  final Color       iconColor;
  final TimeOfDay?  debut;
  final TimeOfDay?  fin;
  final VoidCallback onPickDebut;
  final VoidCallback onPickFin;

  const _PlageRow({
    required this.label,
    required this.icon,
    required this.iconColor,
    required this.debut,
    required this.fin,
    required this.onPickDebut,
    required this.onPickFin,
  });

  String _fmt(TimeOfDay? t) {
    if (t == null) return '--:--';
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(icon, size: 16, color: iconColor),
      const SizedBox(width: 8),
      SizedBox(
        width: 72,
        child: Text(label,
            style: AppTextStyles.labelMd
                .copyWith(color: AppColors.textSecondary)),
      ),
      // Bouton heure début
      Expanded(
        child: GestureDetector(
          onTap: onPickDebut,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 9),
            decoration: BoxDecoration(
              color: AppColors.bgSurface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: debut != null
                    ? AppColors.accent.withOpacity(0.4)
                    : AppColors.border,
              ),
            ),
            child: Center(
              child: Text(
                _fmt(debut),
                style: AppTextStyles.labelLg.copyWith(
                  color: debut != null
                      ? AppColors.textPrimary
                      : AppColors.textMuted,
                ),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text('→',
            style: AppTextStyles.bodyMd
                .copyWith(color: AppColors.textMuted)),
      ),
      // Bouton heure fin
      Expanded(
        child: GestureDetector(
          onTap: onPickFin,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 9),
            decoration: BoxDecoration(
              color: AppColors.bgSurface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: fin != null
                    ? AppColors.accent.withOpacity(0.4)
                    : AppColors.border,
              ),
            ),
            child: Center(
              child: Text(
                _fmt(fin),
                style: AppTextStyles.labelLg.copyWith(
                  color: fin != null
                      ? AppColors.textPrimary
                      : AppColors.textMuted,
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// STATE LOCAL D'UN JOUR
// ══════════════════════════════════════════════════════════════════════════════

class _DayState {
  final String      jour;
  final String      label;
  final int?        id;
  final bool        travaille;
  final TimeOfDay?  debutMatin;
  final TimeOfDay?  finMatin;
  final TimeOfDay?  debutApm;
  final TimeOfDay?  finApm;

  const _DayState({
    required this.jour,
    required this.label,
    this.id,
    required this.travaille,
    this.debutMatin,
    this.finMatin,
    this.debutApm,
    this.finApm,
  });

  _DayState copyWith({
    bool?       travaille,
    TimeOfDay?  debutMatin,
    TimeOfDay?  finMatin,
    TimeOfDay?  debutApm,
    TimeOfDay?  finApm,
  }) => _DayState(
    jour:       jour,
    label:      label,
    id:         id,
    travaille:  travaille  ?? this.travaille,
    debutMatin: debutMatin ?? this.debutMatin,
    finMatin:   finMatin   ?? this.finMatin,
    debutApm:   debutApm   ?? this.debutApm,
    finApm:     finApm     ?? this.finApm,
  );
}
