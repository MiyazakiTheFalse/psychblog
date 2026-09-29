# Psychological Research Ethics Demonstration

This section of the portfolio demonstrates practical ethical reasoning across human-participant and animal-research scenarios. All scenarios are fictional competency exercises: no participants or animals were involved and nothing here represents formal ethics approval.

## Demonstrated competencies

- Identification of vulnerability and safeguarding issues
- Valid, voluntary and ongoing informed consent
- Capacity, accessibility, power and coercion considerations
- Confidentiality, data minimisation and withdrawal limits
- Distress and safeguarding escalation procedures
- Secure and proportionate data handling
- Ethical decision-making and documented justification
- Animal-research harm-benefit reasoning
- Application of Replacement, Reduction and Refinement (3Rs)
- Welfare monitoring and humane endpoint planning
- Recognition of the relationship between ethical design and research quality

## Practical portfolio exercises

### Vulnerable participants

Located in `vulnerable-participants/`:

- `mock-ethics-application.md` — applied ethics review of a study involving adults receiving community mental-health support
- `participant-information-and-consent.md` — accessible participant information and consent materials
- `safeguarding-and-risk-protocol.md` — practical distress and safeguarding decision pathway

### Animal research

Located in `animal-research/`:

- `applied-3rs-redesign.md` — redesign of a hypothetical animal study using Replacement, Reduction and Refinement
- `welfare-monitoring-plan.md` — welfare domains, monitoring, intervention and humane endpoint planning

### Ethical judgement

- `ethical-decision-making-case-matrix.md` — eight short cases requiring ethical decisions, modifications and justification
- `animal-research-3rs.md` — introductory 3Rs evidence
- `protocol_checklist.csv` — structured governance checklist

## Practical tool

`ethics_check.py` checks whether a protocol has explicitly addressed predefined governance areas. It does not approve research, assess risk automatically or replace an ethics committee.

## Run

```bash
python ethics_check.py protocol_checklist.csv
```

## Provenance

All research scenarios and data in this section are simulated for portfolio and competency-demonstration purposes. No real participants or animals were recruited, studied or exposed to procedures.
