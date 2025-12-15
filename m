Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2895AD59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 10:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WwL08DBtUA04m9uzunJbXUc8Llp3YbCg4yfS44lD4Ls=; b=tgItXuXd4lZ+PrWDB1AmkJ52Jg
	pFnELrTXBrccCnTdEytmRO9yMIhbKWE45eGlpyyeS4NlvtlpgV6zwALU1thwzAoWE22KUttk03Bri
	orq96cxJeZ1cakBGhdCqAIqHWg2wprLgvwNmJ49vU+V9U4k7Jnur26KZSAgkl6+9ZVjCo+sL07fxX
	NvMet93pM1L4a8vp1I1T/rBxzVZoOxHu0EsSx8O5l72GpI1OlJUmQUF1ho/nUjwzPWMPeKzK3Idre
	GMYXo5nnfRXMt+0MPwKz/Hut10Hlu2D20xcfznVmvOQ777K+vAoA3ygeszqwrUz/aNqdpr10eqYmW
	5B7YMUBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5ug-00000003ScL-2CWh;
	Mon, 15 Dec 2025 10:34:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5ub-00000003SbY-3ehX;
	Mon, 15 Dec 2025 10:34:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=WwL08DBtUA04m9uzunJbXUc8Llp3YbCg4yfS44lD4Ls=; b=p73M2icuHuFcZ85SVXu/qzbvGs
	J5Ix+o5O4DROC0iW1OWyHWhqsNyaBVXaZrS9MshP/7JKepF1fevWabj1s8CjYizZKd0pPVKaWnBJ0
	nkJ48KuvPd/VOFOmu3ArCeECZmU9yhcG/pPRWrfyYePNMR4qnlmWukixZlJC0yXN54sknaEbURGx8
	JJcAQRnx3ZQSPixqbn9bYmhObX01zqFFsHkGHPKL0plDIItd21ZTTd02JgoNPRO3SOPNFN0FoAQWb
	MboO8zPISFHiHW/NqtFQu1tzlkc7/SnyVuEBYOQ5vZPwFH2TzwlBxc9wQROSt5De5lFAvE9dhHJK6
	i6AqvtlA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV533-00000002YuU-3eNr;
	Mon, 15 Dec 2025 09:39:25 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BFAVwvL61656927, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1765794718; bh=WwL08DBtUA04m9uzunJbXUc8Llp3YbCg4yfS44lD4Ls=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=S/AQXcF3A3Hh5iIs/mQRi0b8zMDKvvx+Eu3n0dfeRX+1YRIL2Jrvb/ISiT/jvBkXP
	 hI66GYn1xUH/IOUiG4sIbfFuCzoMqaDSL5IANLWc+LCV5+bdVAnSZrLP2kGIYGiOGV
	 93uMRxMIwRr6ttBraOU7KEQiw+xw8IZrwHboJzhJLm1NlzaOf11fUhX6mvv5f9ZX9R
	 UWe3tBd2ARyiF8drKZJXHslFqB7QfYBHxVhHiFlxGOyryaDge5sRPlwy++VMoJTwHC
	 EMWbUFXAV2Js94Yk8LHmAPSa6YYvTHanafzBZPbR+qmrD8HWjpkSvzIyC6gjvqVgxQ
	 034GLCnbPtqAQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BFAVwvL61656927
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Dec 2025 18:31:58 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 15 Dec 2025 18:31:58 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Mon, 15 Dec 2025 18:31:57 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 15 Dec 2025 18:31:57 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <afaerber@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <james.tai@realtek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>
Subject: [PATCH v3 0/2 RESEND] arm64: dts: Add support for Kent SoC family
Date: Mon, 15 Dec 2025 18:31:55 +0800
Message-ID: <20251215103157.27039-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_093922_581536_E98DEA2A 
X-CRM114-Status: GOOD (  10.26  )
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

Hello,

This patch series adds initial Device Tree support for Realtek's Kent SoC
family, including the RTD1501S, RTD1861B, and RTD1920S variants with their
respective evaluation boards.

The series includes:

1. Adds compatible strings for the Kent family.
2. Add Device Tree files for the Kent SoC, TD1501S Phantom EVB (8GB),
RTD1861B Krypton EVB (8GB), and RTD1920S Smallville EVB (4GB).

The patches have been validated with 'make dtbs_check' and
'dt_binding_check' to ensure compliance with DT schema and successful
compilation.

Cheers,
Yu-Chun

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v3:

- Drop the dt-bindings patch (realtek,misc.yaml)
- Drop 'iso: syscon@7000' node and and re-parent the UART directly to rbus
- Change all dts/dtsi to license: GPL-2.0
- Drop all custom bootargs

V2: https://lore.kernel.org/lkml/20251113123009.26568-1-eleanor.lin@realtek.com/

Changes in v2:

[PATCH v2 1/3]
- Fix YAML syntax: remove duplicate blank lines
- Validated with 'make dt_binding_check'

[PATCH v2 2/3]
- Rename: realtek,iso-system.yaml -> realtek,misc.yaml
- Improve description and example: show child node (UART)

[PATCH v2 3/3]
- Reorder Makefile targets to alphabetical order.
- Rename node: use generic names ('arch_timer' -> 'timer', 'reg-bus' -> 'bus')
- Fix node naming and hex format (remove leading zeros)
- Inline overlay nodes directly into .dtsi
- Reorder properties: ranges after reg
- Remove unnecessary status and custom bootargs

V1: https://lore.kernel.org/lkml/20251105104452.6336-1-eleanor.lin@realtek.com/

Yu-Chun Lin (2):
  dt-bindings: arm: realtek: Add Kent Soc family compatibles
  arm64: dts: realtek: Add Kent SoC and EVB device trees

 .../devicetree/bindings/arm/realtek.yaml      |  42 +++--
 arch/arm64/boot/dts/realtek/Makefile          |   7 +-
 arch/arm64/boot/dts/realtek/kent.dtsi         | 166 ++++++++++++++++++
 arch/arm64/boot/dts/realtek/rtd1501.dtsi      |  12 ++
 .../boot/dts/realtek/rtd1501s-phantom-8gb.dts |  25 +++
 .../boot/dts/realtek/rtd1501s-phantom.dtsi    | 118 +++++++++++++
 arch/arm64/boot/dts/realtek/rtd1861.dtsi      |  12 ++
 .../boot/dts/realtek/rtd1861b-krypton-8gb.dts |  25 +++
 .../boot/dts/realtek/rtd1861b-krypton.dtsi    |  72 ++++++++
 arch/arm64/boot/dts/realtek/rtd1920.dtsi      |  12 ++
 .../dts/realtek/rtd1920s-smallville-4gb.dts   |  23 +++
 .../boot/dts/realtek/rtd1920s-smallville.dtsi | 128 ++++++++++++++
 12 files changed, 626 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm64/boot/dts/realtek/kent.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501s-phantom.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861b-krypton.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920s-smallville.dtsi

-- 
2.34.1


