Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1E4D2E9DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 11:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GlzTFJ3IMZj9tO6/VpaH4/1od6HePRgJ3wA01MIwe5k=; b=4aZ0ULIGW7SmzInn1Psn2FbqkY
	d3QEirtbkFQX7KCB/cCR6CQjCLhbytoan315OkZwYbpkwatFeewbhVSLTUFK3ye+5ax1Je3GQS2rG
	ocwJqVRXMHJ2nj6/sgu7jabd8Hm/QERFsE0ncETaWx0pZ+ml3pb44MQvQQe62uXLhQ2/L2h2NWVIb
	q0VDADkmfGHUJq6U2rehs1pCiYFD5T2EQnwaE4YevtIaBxCBMAttxJfTnp86gQkFponl/s4oAkE3S
	u/grQvi0KMi44m//4N94SfaEVyBj5mBa/Fc3EilUTIEsBNgtOpfI3E8VBP/WWZlkmg9UWq/tqrCDb
	K1uqlyHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tASje-0000000HUEU-1dH8;
	Mon, 11 Nov 2024 11:37:34 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAShq-0000000HTvY-3cAL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 11:35:44 +0000
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1B97888FC4;
	Mon, 11 Nov 2024 12:35:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731324939;
	bh=GlzTFJ3IMZj9tO6/VpaH4/1od6HePRgJ3wA01MIwe5k=;
	h=From:To:Cc:Subject:Date:From;
	b=Z/6WPIui5FHu6d4dlpqRxa1mXFsPdY0WE5eWCtnfUHLbd4vimQYyGLWuSH0utzmVR
	 4gXcCrWMVrL243NELmUX26yr8OZOFNU+c20b4g2CfQJhy+L0YdfJ/3YElt/ShqkLoA
	 73jUOoNsvGfYon7cA1VApQx9hsOm56xZDDV1mhLnvy5V/Ii6NU9sznvqR0ZfU4ahWo
	 ipVjZpjQjXMTHd2QLV0fNT0fZYD3Jip9SM+eEqifVWJQErXy4cuO14sbT3ICKwMTpS
	 opYkegPhANgeS9BjNrgzNsRzPAPHsWOpEVyq5fH3LYevdmOBan66hviM4YyGcmLWlu
	 cAEUmVguBDkKA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] MAINTAINERS: Update entry for DH electronics DHSOM SoMs and boards
Date: Mon, 11 Nov 2024 12:34:21 +0100
Message-ID: <20241111113524.10727-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_033543_080149_2CFD6CF1 
X-CRM114-Status: GOOD (  11.96  )
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

Update the MAINTAINERS entry to cover all DH electronics DHSOM
SoMs and boards. The DHSOM is the name which covers all modules,
DHCOM is the SODIMM seated SoM, DHCOR is the solder on module.
Use glob pattern to match on every DT file which contains either
of those three module substrings in lowercase.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 MAINTAINERS | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1cf1ac44398ae..40b23e71f72dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6633,19 +6633,14 @@ L:	linux-rtc@vger.kernel.org
 S:	Maintained
 F:	drivers/rtc/rtc-sd2405al.c
 
-DH ELECTRONICS IMX6 DHCOM/DHCOR BOARD SUPPORT
+DH ELECTRONICS DHSOM SOM AND BOARD SUPPORT
 M:	Christoph Niedermaier <cniedermaier@dh-electronics.com>
-L:	kernel@dh-electronics.com
-S:	Maintained
-F:	arch/arm/boot/dts/nxp/imx/imx6*-dhcom-*
-F:	arch/arm/boot/dts/nxp/imx/imx6*-dhcor-*
-
-DH ELECTRONICS STM32MP1 DHCOM/DHCOR BOARD SUPPORT
 M:	Marek Vasut <marex@denx.de>
 L:	kernel@dh-electronics.com
 S:	Maintained
-F:	arch/arm/boot/dts/st/stm32mp1*-dhcom-*
-F:	arch/arm/boot/dts/st/stm32mp1*-dhcor-*
+N:	dhcom
+N:	dhcor
+N:	dhsom
 
 DIALOG SEMICONDUCTOR DRIVERS
 M:	Support Opensource <support.opensource@diasemi.com>
-- 
2.45.2


