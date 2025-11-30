---
id: 20251026-142822-tool-014-polygon-machine
title: Build Polygon Tool machine
priority: 5
epic: takeoff-toolbar-arch
created: 2025-10-26T14:28:22.086837-07:00
updated: 2025-10-26T14:28:22.086837-07:00
depends: []
---
Create XState machine for polygon drawing tool.

## Acceptance Criteria
- [ ] States: inactive → placing-points → awaiting-completion → complete
- [ ] addPoint action appends to points array
- [ ] undoPoint action removes last point
- [ ] Point history maintained for undo
- [ ] hasMinimumPoints guard (requires 3+ points)
- [ ] complete action calculates polygon properties
- [ ] cancel action cleans up
- [ ] Tests use input-based testing (no mocks)

## Files
- `apps/lit-web/src/elements/tools/polygon-tool/machine.ts` - Create machine
- `apps/lit-web/src/elements/tools/polygon-tool/setup.ts` - Actions/guards
- `apps/lit-web/src/elements/tools/polygon-tool/types.ts` - Types
- `apps/lit-web/src/elements/tools/polygon-tool/functions.ts` - Pure utils
- `apps/lit-web/src/elements/tools/polygon-tool/polygon-tool.test.ts` - Tests

## Technical Notes
- Similar pattern to calibration tool machine
- Store pointHistory for undo capability
- Double-click or Enter to complete

## Dependencies
- Requires TOOL-001 (types)
- Requires TOOL-003 (MeasurementCalculator for area)
