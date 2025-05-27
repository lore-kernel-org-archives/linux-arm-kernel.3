Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61831C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 13:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZyUHCE5D6jcUxtjUukL1pd72/M6NGBITAWNwlrkvHyk=; b=eihvTQ2rGReJEN
	1GtT/hpIr5lq8UnkaURfaA/aL8h23zm9mmAbipF1ZQf4pMpU4lXnlcDki/3k/bicbjxPXwHRoo5fZ
	5M6sKgQ7h5EgijsucBbuodzojR0woakeHSP4ndKOtTgret0+YbquN7nIHJi8nZa44mlMoCSO2Shid
	9IY1hepwS4twX26yrfsX3KcgJySfy02dTd6fLtwXtf/784YjgQiLatdQfVqDWixw6d0NVeY5ZWBav
	6XfxANjJ07MJBizBHgFRcYa8xFtaqmXYDcjkNI5YX9RHmH+FNi0cZupTCBybGUxnnw9ObOheSKqeS
	ss9DOjGc3NEdkOlaTL3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJuEO-0000000AntS-04E3;
	Tue, 27 May 2025 13:20:36 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJu0R-0000000Alrk-0RlY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 13:06:12 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAUYAu012749;
	Tue, 27 May 2025 15:06:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=ZyUHCE5D6jcUxtjUukL1pd
	72/M6NGBITAWNwlrkvHyk=; b=P/Sh8j3fjKcMfz+7vdIvt8wiKxAwLYXJ120DEW
	HbZR1X9Q83e3Ofc4BnNS7eo11Ca0qUWPVwRdvgBxUovTsPwF6Tp5dBLLSUoY7hBM
	gI8yvawBvhLpNlJgzUllJKPCqc4o2g2um8MdFBzOBII5AJJYsgZYOOCTNktDx1UW
	rkD5XGlBUvc+TVpEqF0TinfO242qD2mHbkxey0FcZ24sBYVBGp04ZEAHhs/re30B
	wI9n6iHbPV5ZhQ9HNCXv88Y0UYG336/ft6qdEb8gsEG78veHBTCMUix/7QfJW+2S
	jqXgPrzFRmv2D1VNQJkWgw47LKHGLorv0Zs7GJutYKCCTkZg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46uqp4j1qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 15:06:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E707040046;
	Tue, 27 May 2025 15:04:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DCB7DAE0792;
	Tue, 27 May 2025 15:03:46 +0200 (CEST)
Received: from localhost (10.48.86.139) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 15:03:46 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Subject: [PATCH 0/5] Introduce STM32MP157F-DK2 board
Date: Tue, 27 May 2025 15:03:16 +0200
Message-ID: <20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABS4NWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNz3eKSXGOj3AJDU/M03ZRsI12jRBMLk0QDQ0tz40QloK6CotS0zAq
 widGxtbUAHz6zzmEAAAA=
X-Change-ID: 20250527-stm32mp157f-dk2-2a484a01973a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Etienne Carriere
	<etienne.carriere@foss.st.com>,
        Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>,
        Conor Dooley
	<conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.86.139]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_060611_433212_C9AD352E 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

The main hardware difference with STM32MP157C-DK2 board is the SoC: 'F'
variant embeds a STM32MP157F SoC, which has the same level of features
than a STM32MP157C SoC but A7 clock frequency can reach 800Mhz (instead
of fixed 650Mhz for 'C' variant). That's why
stm32mp15xa/stm32mp15xd/stm32mp15xd dtsi are introduced, pending cpufreq
support.
stm32mp157f-dk2 device tree reuses the existing sketeton for STM32MP15
DKx boards, but it is SCMI-based with I2C4 & PMIC managed by OP-TEE,
like other STM32 MPU boards (STM32MP135F-DK, STM32MP257F-DK/EV1, ...).

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
Alexandre Torgue (1):
      ARM: dts: stm32: fullfill diversity with OPP for STM32M15x SOCs

Amelie Delaunay (2):
      ARM: dts: stm32: use 'typec' generic name for stusb1600 on stm32mp15xx-dkx
      ARM: dts: stm32: add stm32mp157f-dk2 board support

Etienne Carriere (1):
      dt-bindings: regulator: Add STM32MP15 SCMI regulator identifiers

Himanshu Bhavani (1):
      dt-bindings: arm: stm32: add STM32MP157F-DK2 board compatible

 .../devicetree/bindings/arm/stm32/stm32.yaml       |   1 +
 arch/arm/boot/dts/st/Makefile                      |   1 +
 arch/arm/boot/dts/st/stm32mp157f-dk2.dts           | 174 ++++++++++++++
 arch/arm/boot/dts/st/stm32mp157x-dk2-scmi.dtsi     | 252 +++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp15xa.dtsi              |   5 +
 arch/arm/boot/dts/st/stm32mp15xc.dtsi              |   4 +-
 arch/arm/boot/dts/st/stm32mp15xd.dtsi              |   5 +
 arch/arm/boot/dts/st/stm32mp15xf.dtsi              |  20 ++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          |   2 +-
 .../dt-bindings/regulator/st,stm32mp15-regulator.h |  32 +++
 10 files changed, 494 insertions(+), 2 deletions(-)
---
base-commit: dc392342b7bb14b12f2de96201937cb02be7802f
change-id: 20250527-stm32mp157f-dk2-2a484a01973a

Best regards,
-- 
Amelie Delaunay <amelie.delaunay@foss.st.com>


