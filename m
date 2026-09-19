Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB9CC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 06:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TwiobJ0QVUukI+CdTiaJqaPzQBOrtrKOudVidJSVEnI=; b=IfHUEyLTjF3uMFViYNdEsIJ7jc
	4x0clBw+sSiAr/e/9HUYyp+LjLods8vcdDZetZyrbw3QlUBUCJeNL+u0uI2R/imuS7XdmvVlJWaFo
	peq9jquh9SdMIZOR9OucLmPT0WxS39BoVnCvialNsCcL7G8aeJQs/041Ts6eDi0vacrI3rqmcOO0f
	ld3EL8qa8itV3QESEUtHxIv3pk7mk8MX1gEnjUvZk6bKNLFASKjlyPiajvXaExbhhbCIM7V9kskP4
	X3H+NkGZjQdayVUt1xRRAR1eprSdUlGT5Jehtznl6T0FEeAhW6UrgeS0hA12scwil9ZEOvQLRqRpt
	BKMk9DtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7oyE-0000000G0YC-3Hi1;
	Sat, 19 Sep 2026 06:54:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7oyC-0000000G0Tm-08zJ;
	Sat, 19 Sep 2026 06:54:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7E61447DD;
	Sat, 19 Sep 2026 06:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64DD8C2BCB9;
	Sat, 19 Sep 2026 06:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789800882;
	bh=hEdrTD32oe2/I9cR/yjQrulOh/1vVMPBRlmgmhgVQjk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QykD5yAA6HdWx3vtl89E+OH8jQTF723YOHsLH63U2uzCPlwkM9ZpimUc6F2Jqwmcf
	 ZvXoVSbnhOi+GVN3a1wn6dxBrEtz7ZEvq4D02qj/D43A/Q+P3PF7oW+uZsC94OMJqz
	 AsGgSYzJu5eOCBKoeDyUJfylXmpz4J6Xp5au+suHG5ykdvRYp0qxZ0amcaPCHUdOiD
	 LBaoKWlVtgWUTyhgP1LNHZF1Deu8hWdfQYHn5M+GdodtKaPV/lM83r05b1Csnsdw4D
	 SQEAzrliI1HH1KqZVyGXgzdUc7xEL8GH2QIDjD82bga7TLkpeHCFkutpGI9a/sKF2R
	 0Ata62g6ZBzqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE79C982D8;
	Sat, 19 Sep 2026 06:54:42 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Sat, 19 Sep 2026 08:54:36 +0200
Subject: [PATCH RFC v3 08/12] MAINTAINERS: Add NXP S32G SerDes and SerDes
 xPCS core entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-s32g_serdes-v3-8-9d68868c1e89@oss.nxp.com>
References: <20260919-s32g_serdes-v3-0-9d68868c1e89@oss.nxp.com>
In-Reply-To: <20260919-s32g_serdes-v3-0-9d68868c1e89@oss.nxp.com>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Bogdan Hamciuc <bogdan.hamciuc@nxp.com>, 
 Ionut Vicovan <ionut.vicovan@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Clark Wang <xiaoning.wang@nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 imx@lists.linux.dev, linux-pci@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789800879; l=2660;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=70ytBTY/vqqrPhxtoodwY/4VDh473gjOqn6LRPOWYM8=;
 b=Om0ZuI6pu07/DLvXn3Rx4guHCRPj5cyP1gtDDT6BJmeypaWsaiDdQ+A2iAzWrZF87xn/yHPgD
 s5z+W7wminCDp8NUncmsUDh2drgtwAwg0QNSWZ0Q6bRPryF4MUtMpw+
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
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
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Vincent Guittot <vincent.guittot@linaro.org>

Add two entries.

ARM/NXP S32G SERDES DRIVER covers the S32G specific parts: the SerDes
PHY driver, the S32G XPCS platform glue, their headers and the SerDes
devicetree binding. The R: and name forms match the adjacent ARM/NXP
S32G/S32R DWMAC ETHERNET DRIVER entry, and netdev is listed because the
PCS glue lives under drivers/net/pcs/.

NXP SERDES XPCS SHARED CORE covers the transport agnostic core on its
own. The core is not S32G specific - it is shared with i.MX9, whose
glue is a separate driver - so keeping it in the S32G entry would make
the S32G maintainers the default contact for i.MX transport work and
vice versa. This follows how drivers/net/pcs/ is already organised:
SYNOPSYS DESIGNWARE ETHERNET XPCS DRIVER carries the shared pcs-xpcs
core, while each vendor glue (pcs-xpcs-nxp.c, pcs-xpcs-wx.c,
pcs-rzn1-miic.c) is listed under its own vendor entry. Only netdev is
listed for the core, so i.MX changes to it do not reach the ARM lists.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 MAINTAINERS | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3b2eb2a7a89a..38c6b5e1af0d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3371,6 +3371,20 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
 F:	drivers/pci/controller/dwc/pcie-nxp-s32g*
 
+ARM/NXP S32G SERDES DRIVER
+M:	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
+M:	Jan Petrous <jan.petrous@oss.nxp.com>
+R:	NXP S32 Linux Team <s32@nxp.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-phy@lists.infradead.org
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
+F:	drivers/net/pcs/pcs-nxp-s32g-xpcs.c
+F:	drivers/phy/freescale/phy-nxp-s32g-serdes.c
+F:	include/linux/pcs/pcs-nxp-s32g-xpcs.h
+F:	include/linux/phy/nxp-s32g-serdes.h
+
 ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
 M:	Jan Petrous <jan.petrous@oss.nxp.com>
 R:	s32@nxp.com
@@ -19788,6 +19802,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
 F:	drivers/extcon/extcon-ptn5150.c
 
+NXP SERDES XPCS SHARED CORE
+M:	Jan Petrous <jan.petrous@oss.nxp.com>
+M:	Clark Wang <xiaoning.wang@nxp.com>
+R:	NXP S32 Linux Team <s32@nxp.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	drivers/net/pcs/pcs-nxp-serdes-xpcs.c
+F:	include/linux/pcs/pcs-nxp-serdes-xpcs.h
+
 NXP SGTL5000 DRIVER
 M:	Fabio Estevam <festevam@gmail.com>
 L:	linux-sound@vger.kernel.org

-- 
2.55.0



