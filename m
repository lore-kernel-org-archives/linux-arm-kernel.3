Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E725EEEF309
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 06:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WfslmvgIdI2+lkhe/ajja/biDUUS7aCfKq3X/UX+k4o=; b=nN8HvoCBay2DxO
	cdJi54uLLT4k0f1T0yhXwh/IsxDQgOuk6q4WphQy5QhN/ztOhiB5zOzj1NQL+8PVngHXmMG4m97fr
	jt0kBGUmxolHQhvqM4dNLGa4Rs9VV/KLwTA3QhRPhv+Gawnv5BvzaEBpBXwbbAwZSj3Yug07+rIM9
	7xvA/GyrsgjK5YXMrI81B41hqvh+JEoRuqtcsLUQx0SZJ5UQfU8rZpoW/SzthhrUAycgB1i01f6ra
	CHj9BQ7Rcm12cxmigYtjNr75KIMieBZoH0Zi9A01/6QBGtkLIun1Bj5JGAVMD5G/wxjI2YsbOIfsQ
	5RAA6hDkOJIMJllMabPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1wD-00000000yWs-2VQG;
	Thu, 05 Mar 2026 06:11:57 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1wB-00000000yVw-1hsi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 06:11:56 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b936b85cc71so943032566b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 22:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772691113; x=1773295913; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WfslmvgIdI2+lkhe/ajja/biDUUS7aCfKq3X/UX+k4o=;
        b=Amur7d3FQ/HTqLx57ldhUpAxhrHrDZKwBDxoganHntdlEmmp9cnMvlA1LocJntQoAC
         85LwUf86hO75R5Cag4C77flmn+WWq/Ruj8j01gJLakds60ltRUOKDqjsLP99seBG0fez
         7IW4Nu4/q34/9kM0jel/D2ds5tQ997DwvmUM2BacXps7/WqkQTdOVsq+Bzj8cs/WjPST
         UWT6c6iKXBIRwS/Yk+BqifF2Vhn/0ltAQfOwVoRvel09iQvbwooP9tQ1XzqyMnZSKWYQ
         q6g9sdRN69ntKiZ/KzyKpW156Lg/99DR9Zy85GazdQYT5yYLaPAUTmRkZqTSHAAhQ3n3
         d3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691113; x=1773295913;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfslmvgIdI2+lkhe/ajja/biDUUS7aCfKq3X/UX+k4o=;
        b=O2948rDqNWVLLr61S36zHjKbnsDw4l1ElBFeZumzVSEzuyO90RYzYdltu1BDbxLTBB
         FfH4BTmDaSackl5qtcLMm8rya2KD3Lqx+Yi6yb5egFsg+SLUWeaMCPSa7Ng74sll2/FY
         TYqKJUN03mncUW5rADwWa2DDXcAod2Jxuy+J9X8dzWZqfcyHq4uGXRBixqDksPyvJwvi
         fY5EyhxokCEhdQSQBW+1pNxS/c2uWWGf+ix06f4MxZT7nYefTWeIdz40LMbSCREz5ut1
         aMkLPs73nmGlseTZVCgg7RqqgnXBb3KmOTbuKLZ4KM+KBjFK2eeDPcMc65nj85nZjs3R
         0BMg==
X-Forwarded-Encrypted: i=1; AJvYcCWk6L2lJIxooqqAHjkt5cpZQu5SuoxiEfL0IfHI8U0ml3pqqULFNmR/WB8VLt6FD/SMl2O08gD1UtlnUS13iE8f@lists.infradead.org
X-Gm-Message-State: AOJu0YxGI/PKyhbZkPiyjcCSgsTEodmTi+DMld3yaRVNg9Th0UJt/m+4
	nc47h7F3gDBSZ2cIbK8YpOd3WpbHwICKZcFgdbl46qUjeHeQVhb4gXxk14pzsb1ZfXXD+0ljPPE
	5697MmYPGYw==
X-Gm-Gg: ATEYQzyjO4lRIdKhC67sB8ZxewfywLqCKxZvwnAOvJ3iDPBumnT7l6wC27/06vBPQsW
	9aYBLvlUVSo5tBIYTZiiscpsDJLbaUtdIbwB7JxKfvHz6JgoBDz/ePUcW1RVVPRNs35yqUqz5B7
	Gbg7PHUaQ0/l4gf1LRfmgUXpDL8R/Rb4Ng/rU5EeNjJY6lrQagV+Kd3sHc4aASV8ilpq/zPk/gA
	FBIju7Pu8qv8apUeqd0YwH8xSCow1lkHdGBb/cCpZGJmUe79+ikvQpIydwamhQTgllcVJ7Wjf8U
	AlWPR/REPbhy5TEjHQ8KXDed5X2L/YySpGZho9qupqVjfTahcDYg7xDOTOxg7Uib0CJpK0KThe5
	Jywl5EPbOwBaLYZ3uMqU5yUYzVeXj+i/E0FbKlPbhG3uoG3mlwhXLLnTazCZKW0B+TaWdJh0aKt
	fx+pkjI6VXn9EPWxRYfhyyVgLGqn2/Vjqz/4W29wAiV+V+HxidxpMTxbaYKxgayehj4l4vV+4yg
	8zsQH5FKgonhlk=
X-Received: by 2002:a17:906:794f:b0:b88:5a74:4cd6 with SMTP id a640c23a62f3a-b93f145f23bmr296129266b.43.1772691112851;
        Wed, 04 Mar 2026 22:11:52 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec3243sm849355966b.53.2026.03.04.22.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:11:52 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v6 00/10] pmdomain: samsung: add support for Google GS101
Date: Thu, 05 Mar 2026 06:11:49 +0000
Message-Id: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKYeqWkC/2XNzYrDIBSG4Vsprutw/K+z6n2UWajnJBVKUnQIL
 SX3PrZQ6pCN8InP64NVKpkq+949WKEl1zxPbdj9jqVzmEbiGdtmEqQRAIKPVbTzihw1Ju/QQTh
 o1p5fCw359kqdfto+5/o7l/urvIjn7TtiP5FFcOADpAgJBAUXj5c8hTJ/zWVkz8oie+k7KZtUg
 w4WowyD8hupOin6P1WTLipw3ilvyW2kfksLQh46qZtMkVxEEzRY2EjzkRJMJ02ThKR9wmhcsP/
 kuq5/H2ldR4kBAAA=
X-Change-ID: 20251001-gs101-pd-d4dc97d70a84
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_221155_517754_A45D7ABE 
X-CRM114-Status: GOOD (  18.56  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

This series adds support for the power domains on Google GS101.

There are a few differences compared to SoCs already supported by this
driver:
* register access does not work via plain ioremap() / readl() /
  writel().
  Instead, the regmap created by the PMU driver must be used (which
  uses Arm SMCC calls under the hood).
* DTZPC: a call needs to be made before and after power domain off/on,
  to inform the EL3 firmware of the request.
* power domains can and are fed by a regulator rail and therefore
  regulator control needed be implemented.

Bullet points 2 and 3 are new since version 4 of this series, and
related changes are in patches 1, 2, 9, and 10. I can merge patch 9
(SMC call) into the gs101 patch (patch 7) if preferred, but for now I
kept them independent to make it easier to see changes compared to
previous versions of this series, and because patch 9 actually applies
to not only gs101, but to many newer Exynos SoCs, and to make patches 9
and 10 themselves easier to review and reason about.

The DT update to add the new required properties on gs101 will be
posted separately.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v6:
- collect tags
- patch 4: update commit message footer to clarify that while
  old/existing DT are now incomplete, they'll be updated once binding
  is accepted.
- Link to v5: https://lore.kernel.org/r/20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org

Changes in v5:
- add domain-supply to binding (patch 2)
- Link to v4: https://lore.kernel.org/r/20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org

Changes in v4:
- drop unneeded or already merged patches
- drop patch "pmdomain: samsung: convert to regmap_read_poll_timeout()"
  as Marek reported issues on some platforms
- rebase
- DTZPC related changes
- Link to v3: https://lore.kernel.org/r/20251016-gs101-pd-v3-0-7b30797396e7@linaro.org

Changes in v3:
- use additionalProperties, not unevaluatedProperties in patch 2
- fix path in $id in patch 2 (Rob)
- drop comment around 'select' in patch 2 (Rob)
- collect tags
- Link to v2: https://lore.kernel.org/r/20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org

Changes in v2:
- Krzysztof:
  - move google,gs101-pmu binding into separate file
  - mark devm_kstrdup_const() patch as fix
  - use bool for need_early_sync_state
  - merge patches 8 and 10 from v1 series into one patch
- collect tags
- Link to v1: https://lore.kernel.org/r/20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org

---
André Draszik (10):
      dt-bindings: soc: google: add google,gs101-dtzpc
      dt-bindings: power: samsung: add google,gs101-pd
      dt-bindings: soc: samsung: exynos-pmu: move gs101-pmu into separate binding
      dt-bindings: soc: google: gs101-pmu: allow power domains as children
      pmdomain: samsung: convert to using regmap
      pmdomain: samsung: don't hard-code offset for registers to 0 and 4
      pmdomain: samsung: add support for google,gs101-pd
      pmdomain: samsung: use dev_err() instead of pr_err()
      pmdomain: samsung: implement SMC to save / restore TZ config
      pmdomain: samsung: implement domain-supply regulator

 .../devicetree/bindings/power/pd-samsung.yaml      |  33 ++-
 .../bindings/soc/google/google,gs101-dtzpc.yaml    |  42 ++++
 .../bindings/soc/google/google,gs101-pmu.yaml      |  97 ++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           |  20 --
 MAINTAINERS                                        |   2 +
 drivers/pmdomain/samsung/exynos-pm-domains.c       | 254 ++++++++++++++++++---
 6 files changed, 399 insertions(+), 49 deletions(-)
---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20251001-gs101-pd-d4dc97d70a84

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


