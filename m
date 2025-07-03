Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00140C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FklnJtDo9yeFD4xiZdN1VsVaoDfKdcDRiLzMHURLjos=; b=qxYNUbgX9RRO1ZSBwrtqm9/Vrs
	j95kt3WF2IuhvzrV9JA3DVrDBhGbXJlTF1KLXfGrA5PHx6JYAq/8E2jytvg/CDJVJvr1KRzXQt2xE
	mnN5pGFy9Z0+wg3Tl1hkeYbf0CokJNvlAi5Aaikw0Ch/ju2eepQZoeVTrD7jZuwc0bjLh1TzJ3nvB
	PBIkSnvxQSuyp7QqsK9y61GZbbBsNWz0k4Y9sPmy1oDK4WNl6eZOSYQC9oXvxSCYjz2h2SuJXCyyM
	6UXqv3tb6RegYAPmV52tGlCh9rjPuvIS2SGseuhQ/E3sTiTXd8YibeQPPeVJ9/X+lnrXmag7LRNWI
	MzSsnECA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzX-0000000CTG6-07PL;
	Thu, 03 Jul 2025 20:57:11 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLbc-0000000BmCZ-24ZG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 15:12:09 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-55502821bd2so16398e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 08:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751555527; x=1752160327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FklnJtDo9yeFD4xiZdN1VsVaoDfKdcDRiLzMHURLjos=;
        b=Q+CJGoaEyYn4m+OAuIhHJlrHAPU1cA0zRxEZ9wdZw5SiVyJJKVC6Awa1j8bD4QsknE
         LO3yAx5tPuN4e4uPeIaYB3xQtq+Z5hTQbCAbSmrLywFrvtatZ28ewrvTVYqWCaXXxGej
         MHSdllSb42dkcTLjGTyxNw2Swh/lAcWR/QicYiydljaEJ/ep/TgObHywhmX47XVx/fp+
         QAR+jphWmm1ZsfHRosd34jQb9trKbNmUbGJxOQrShD8Lf7QFvr98LU4lKkDa4lv7SozX
         OvXJhcadz2Qo5BiUCV1HBwedOIMP5Nz1gB0OabPtb6XaTLiIG8lOTXWUXpQUPtNIDH1J
         JQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555527; x=1752160327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FklnJtDo9yeFD4xiZdN1VsVaoDfKdcDRiLzMHURLjos=;
        b=WxOM9nw70e+etLZddTVuM7DJFP5ONPjLWYjnf/g4jhv0j1FLNISi9mZ5gUfRjJBUSX
         U01WJHLfegt1NHcambvlgEaIV8lEV1AalmtIacH22liQFqDdQvMtYKGeNnPVpxG7VJgi
         JLCAftPJj3dygAkD2pWeXZskVbX9hfdsU/oRY5t2xvb/MDGuRZgTx6mjUevbfsKnRW6Q
         pmke4fotw+32gZX5NN27VPfeEOrACmlWELEF8EVvsEsVBgVlMHTNnMksXnrVO+UsdA0Z
         4tcocrGXOOWcNpitdNsfEVaJ8mglmMfCbBUBGpjoBZ737V+5WUuP7C4/6+awuF/xwD4M
         6yqg==
X-Forwarded-Encrypted: i=1; AJvYcCUAgYpzwEH6PXBXm+hY8UmfbCA+YxDR9QJHBuU/zYBCDp2PPfL/SuCcqcN6QnsnT9M9/WDY0V1OpU6qpVIEbyQI@lists.infradead.org
X-Gm-Message-State: AOJu0YwX2SvZRLhfMqMvmEw22T1Em3aEQQrpdO39lV0/mDo56olgEc+c
	XC3BdWQcikwp+injpbUTYm6RTem0p8Yak9kcsrySGywR7DjN8+r+ui/a/u398mWKConCdZz0
X-Gm-Gg: ASbGncs4aXYTCl0P/v5IT1Mw1g/W9w9DobyGG2iEcn1Q2TgDzFYCtGKd+RU+Lnh8W+X
	e60c12t9bOfYPliVl9l54Zzkg5onsktaA8JnDHmME1fl36dDuzRZFXotOCNoINj1XppUM3An0aS
	OZRA87I+5NBI1ABsLHEXdThx+n+chbBj3ecFdXGoHA+nGwucSF8y4Wgp56/ZkjpxXp1x2ScedAp
	oYe3ZyymS8bGgSbFbCwGGOj8NfPYLumSBKYtG/60+cqg/WvLXLdiQ62GGsikItb67qX5DKiiFA/
	mUiK48DH0lOiFEelDoclUSM6RmHgbEb3MOVFKBsmHVy/AQP4IdqUdOJ5/2N4ugmMH8ART/I=
X-Google-Smtp-Source: AGHT+IFObnwk1CUw/4SeBMAwtqp40i0kVp9nyZ7PpPHlgqYkcRXB6haIqde1G0SGKx5hXuFwxxb7Og==
X-Received: by 2002:a05:6512:4025:b0:553:297b:3d4e with SMTP id 2adb3069b0e04-5562efc934fmr1450440e87.52.1751555526425;
        Thu, 03 Jul 2025 08:12:06 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ae15esm725e87.178.2025.07.03.08.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:12:06 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 0/8] Allwinner: A523: add support for A523 THS0/1 controllers
Date: Thu,  3 Jul 2025 23:11:24 +0800
Message-ID: <20250703151132.2642378-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_081208_541497_AA165851 
X-CRM114-Status: GOOD (  12.23  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

This patch series adds temperature sensor support for the Allwinner A523
family of processors (same die with H728/A527/T527)

Changes:
1) dt-bindings: nvmem: SID: Add binding for A523 SID controller
 - added new patch

2) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - changed clock order
 - added additional nvmem cell with calibration data
 - added requirements for new controllers
 - added description

3) thermal/drivers/sun8i: add gpadc clock
 - removed unnecessary call to clk_prepare_enable() since
 devm_clk_get_enabled()includes this

4) thermal/drivers/sun8i: replace devm_reset_control_get to
 - original function replaced with devm_reset_control_get_shared_deasserted()
 - removed some of the repetitive code executed by 
 devm_reset_control_get_shared_deasserted()

5) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - added possibility to get calibration data from two independent cells

6) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - removed magic digits
 - changed description of calibration data procedure for A523
 - changed numbers of array elements with calibration data

7) arm64: dts: allwinner: A523: Add SID controller node
 - fix typo (sun50i->sun55i)

8) arm64: dts: allwinner: A523: Add thermal sensors and zones
 - cell with calibration data divided into two
 - added passive trips for gpu
 - added information that information obtained from BSP

v1: https://lore.kernel.org/linux-sunxi/20250411003827.782544-1-iuncuim@gmail.com

Mikhail Kalashnikov (8):
  dt-bindings: nvmem: SID: Add binding for A523 SID controller
  dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
  thermal/drivers/sun8i: add gpadc clock
  thermal/drivers/sun8i: replace devm_reset_control_get to
    devm_reset_control_get_shared_deasserted
  thermal/drivers/sun8i: get calibration data from two nvmem cells
  thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
  arm64: dts: allwinner: A523: Add SID controller node
  arm64: dts: allwinner: A523: Add thermal sensors and zones

 .../nvmem/allwinner,sun4i-a10-sid.yaml        |   1 +
 .../thermal/allwinner,sun8i-a83t-ths.yaml     |  49 +++-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 162 ++++++++++++
 drivers/thermal/sun8i_thermal.c               | 240 ++++++++++++++----
 4 files changed, 406 insertions(+), 46 deletions(-)

-- 
2.49.0


