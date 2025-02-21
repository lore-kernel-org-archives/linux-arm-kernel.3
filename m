Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE203C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 20:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HOnW1Ydd3mEGmkYd1wAkSF1KEHTUQp/FI13uGVZWzx4=; b=Lay2MECtseaH0B
	XQQHLkfZOXHxA061bIIjmrUh4opblbXEbXltp+OmN8cD3bB/62cpx4DtVLRGAwI1Wvx1xSBw3wcIB
	NxaSjZI485TWbdeJzBPJ/QDs67LQDVJE7nL1kSnM79keoIDgaw99makHlNvZKY3NCKfV74Q8zMMDl
	PEvqQ1R9XRF+5WJrqtyvheN3R6follGvYyUdrH2NMkgqdreaQWKSWYBnfmV6hGNlyB+KHEPJXyqt4
	GZPtjzc5dGqr8S+LL85Ce+5uW/NU5PeflWRhZFXpiQqoMvzmIJMVlQ+FKXqHINiDpgrJ/Uo6yshrA
	umeaWaHaGQZV4cDta8IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZTJ-00000006l5g-42XJ;
	Fri, 21 Feb 2025 20:18:05 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZRq-00000006klO-0VOw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 20:16:35 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ab7430e27b2so412099566b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 12:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740168992; x=1740773792; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HOnW1Ydd3mEGmkYd1wAkSF1KEHTUQp/FI13uGVZWzx4=;
        b=Gc7a2mqHYcS7gNVr9SqGRTwDwa6xPG8nOOHF38/Ni9Hjr4y/jbT976h2geO/9wtWW1
         TclDeUmvTq2LnycZcBVXVIX1ZnubjeovpAXkUgWuNcuJTPLctn/rVGXCSDvl7/Sqh6Un
         wpd7h6Z8Y7ogfD7X4Uno8dlOvzIPlb4qTrxotVWNGaMoQVPI3ZjHQBRO7yxFf7DA1BCO
         dacNVOV9IxPkm8TmgQGTJephvlb8FUB1njAV21las+w7u02DjyWavi8zeDQmYQGWxRff
         H6/+dcJ0m6mHsGsqeteR//bZrkDIu3tVEFBRxP86K0OsQWbRFNirRGLll8vbwcmGMOgH
         BRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740168992; x=1740773792;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOnW1Ydd3mEGmkYd1wAkSF1KEHTUQp/FI13uGVZWzx4=;
        b=CsTtL4yhcIzXESy310Rx6UMYoRphFea096Tk1Xsdo5BihritI8xXmrqLuQ5rLm4x9E
         fMtoUyw0loFtVm79kzcwJpAddTulKXf6L0RVnpm3xccQYIl/7DSKIZA7uTDCksxkdUX7
         GZZN57GJnwbX+W+rGRPv6WUyfGQPnS38cSa5tSggaq2GrHaCHSUhPT4ye0EpAdLcPbWT
         Arql7wKJUmSowqCfcPa01pjGbpj23bA1YvF8jqgp71ftNq8bziLj5iO+4dlvV9PpqdB+
         cO/IPYBUuc2dGmj6qavCJDQdsYWEN75RB3TJys26/DAQCIVvK4Ew7hvE8nJiatswLQjU
         ZfBw==
X-Forwarded-Encrypted: i=1; AJvYcCU3swlz+fAjiJ9aFNF0li5FtcnlEnsI6Qo8Tvk5PMU9XR/rrkI/Cg35w6iOa9LBwnp4iWXQ0/DCBrRH6zXQ25sZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwXvg809PquuQpusRvnKrxzz9LQMklB50wBVfiK2AlUzcIapUc2
	HcT4ktiFk95LScCv/FysvBwdsxUq5AShYgbSrRWX2Hil4pXWlzTT
X-Gm-Gg: ASbGncv/Vj6ZwhHlzEf4e9rcPrEmiP0qKfQpfLSia16ubiAYl+tFLqrFQbDXef5vheL
	M6Z718qmJ/GY0ab3D2s0XD8UJuMSEnQqd1d5zVrl3OLSZ5/au2ikWIfAkVM96M0t4pM2YT8XMQT
	xpjAjkcvi0QpqhXX84C0ZCBLz8IMXBtdk6upzM1JJltU5tX60NRUVS/jFp3K3N2MPNiAiTMJtam
	dyron+uyZZfKktlilEmb0npXhQCiwuHPX6e8ajZ2AakIMfwwf7LkDqa3XuKQa3iUP+aBE6yIhhv
	zl4J+EZKpbC/Vmfz2OZmsV7+b5jZHt/OSdd9xysP+tjytmZ0LQJWwFZgGUsAuaDZZN0MohXo
X-Google-Smtp-Source: AGHT+IGBCXqFh6dVss0FJaa0R4w77fQmveolGcalYyOeZbZ8ZnN8wMd3he5AW2qgmgbfNBz9J/WLBA==
X-Received: by 2002:a17:906:3291:b0:aa6:7737:1991 with SMTP id a640c23a62f3a-abc0d99370emr406213066b.2.1740168991705;
        Fri, 21 Feb 2025 12:16:31 -0800 (PST)
Received: from hex.my.domain (83.8.202.192.ipv4.supernova.orange.pl. [83.8.202.192])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f70sm14127594a12.12.2025.02.21.12.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 12:16:30 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v5 0/9] mfd: bcm590xx: Add support for BCM59054
Date: Fri, 21 Feb 2025 21:16:22 +0100
Message-Id: <20250221-bcm59054-v5-0-065f516a9042@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABbfuGcC/3XM0QqCMBTG8VeRXbc4Z9vR2VXvEV2czVmD1NCQI
 nz3ZhCK0OV3OL//Wwyhj2EQh+wt+jDGIXZtGrTLhL9yewkyVmkLBcqAxVw631AJZCRbC3lJwWC
 wIr3f+1DH5zd1Oqd9jcOj61/f8ojzdY5oBA1LZEQJUhMWdWnBY9DHS8PxtvddI+bIqP5BlSDVb
 ACRmRxvof5BAtS4gjpB59iTYmsKW2yhWaBCWkGTYOVqp6oiZ0u0htM0fQAr3mnuSwEAAA==
X-Change-ID: 20240816-bcm59054-a880695e41e8
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740168989; l=3685;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=s9Ca1JGprDjYoElIXiW7zquH+1K14cmVqWxpnGGfyR0=;
 b=aFJpFuZ+ebHX70O5WBucS7JoKsGSEuk18Xndc8WOLJhnTnDv+6bbkju8vARTfhpQSZwSEV28T
 6RaTBMzd0jCDJCgqyKCSaWEc7TatABVG4UfnieAtNegNHC00gssBy/5
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_121634_165187_4C840929 
X-CRM114-Status: GOOD (  18.03  )
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

Add support for the BCM59054 MFD to the bcm590xx driver and fix a
couple of small bugs in it that also affected the already supported
BCM59056.

While we're at it - convert the devicetree bindings to YAML format
and drop the bcm59056 DTS in favor of describing the PMU in users'
DTS files, as is done for most other MFDs.

The BCM59054 is fairly similar to the BCM59056, with the primary
difference being the different number and layout of regulators.
It is primarily used in devices using the BCM21664 and BCM23550
chipsets.

This patchset has been tested on a Samsung Galaxy Grand Neo
(baffinlite rev02; DTS not in mainline yet) with a BCM59054 PMIC.
Testing on a BCM59056 would be appreciated.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v5:
- Make regulator binding descriptions reference mfd/brcm,bcm590xx.yaml
  instead of mfd/brcm,bcm59056.yaml
- Move regmap type enum to common MFD header
- Link to v4: https://lore.kernel.org/r/20250215-bcm59054-v4-0-dbfb2d76a855@gmail.com

Changes in v4:
- Fix yamllint warnings in DT bindings
- Address miscelaneous review comments related to DT bindings
  - Note that I did not end up moving the regulator refs from
    allOf compatible matches; I explained my reasoning in [1].
    [1] https://lore.kernel.org/lkml/ab853605-859d-44c6-8cbd-44391cd677e6@gmail.com/
- Add PMU ID/revision parsing to MFD driver
- Fix instances of regulator data not matching vendor kernel for
  BCM59054
- Use different voltage table for BCM59054 VSR reg based on PMU
  revision
- Link to v3: https://lore.kernel.org/r/20250131-bcm59054-v3-0-bbac52a84787@gmail.com

Changes in v3:
- Split out regulator DT bindings into separate YAML
- Use tables of regulator info instead of get_XXX_register, reg_is_XXX
  functions
- Drop "regulator: bcm590xx: Add proper handling for PMMODE registers";
  it adds unnecessary noise to the series and will be submitted separately
- Link to v2: https://lore.kernel.org/r/20231030-bcm59054-v2-0-5fa4011aa5ba@gmail.com

Changes in v2:
- Fixed BCM59054 ID being passed to BCM59056 function in the
  regulator driver
- Dropped linux-rpi-kernel from the CC list
- Link to v1: https://lore.kernel.org/r/20231030-bcm59054-v1-0-3517f980c1e3@gmail.com

---
Artur Weber (9):
      dt-bindings: mfd: brcm,bcm59056: Convert to YAML
      dt-bindings: mfd: brcm,bcm59056: Add compatible for BCM59054
      ARM: dts: Drop DTS for BCM59056 PMU
      mfd: bcm590xx: Add support for multiple device types + BCM59054 compatible
      mfd: bcm590xx: Add PMU ID/revision parsing function
      regulator: bcm590xx: Use dev_err_probe for regulator register error
      regulator: bcm590xx: Store regulator descriptions in table
      regulator: bcm590xx: Rename BCM59056-specific data as such
      regulator: bcm590xx: Add support for BCM59054 regulators

 .../devicetree/bindings/mfd/brcm,bcm59056.txt      |   39 -
 .../devicetree/bindings/mfd/brcm,bcm590xx.yaml     |   76 ++
 .../bindings/regulator/brcm,bcm59054.yaml          |   56 +
 .../bindings/regulator/brcm,bcm59056.yaml          |   51 +
 arch/arm/boot/dts/broadcom/bcm28155-ap.dts         |   68 +-
 arch/arm/boot/dts/broadcom/bcm59056.dtsi           |   91 --
 drivers/mfd/bcm590xx.c                             |   86 +-
 drivers/regulator/bcm590xx-regulator.c             | 1289 ++++++++++++++++----
 include/linux/mfd/bcm590xx.h                       |   28 +
 9 files changed, 1378 insertions(+), 406 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20240816-bcm59054-a880695e41e8

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


