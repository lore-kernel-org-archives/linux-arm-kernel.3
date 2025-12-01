Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D09D116F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZcnmSyeXY4k94asJxZ+7zj6ad/cIF+DdM29OrnHlvU=; b=4dYsqbDp2N/OBosEia4KpvZ77S
	oSj21UsAm9AX99E75Xb3ZsnS6xy0/oViNnx1K26eaveHl+FTPOTT758OJj+tn3xTpgmerlXIaEd+m
	933kr1U4eXssuKxy+MQ23Zsxt8xzDPnG+NRn0XULNt2tmGuJLpQZvargdckhwjAfwXv9HoodZ/VcM
	Eg/u0+yp6soEk7EoHyAbvP3hX+pu7L4ANKY+BZ1RZ/V7Jq7/RMoDlg+VPmri9z1v4h6UPbNoZEa2r
	gAPKC9M16twwMb0+87mvQVgx2BUnT3tfhlH/7TVpTNlINEQSH5sB8YZZ6/mRqG92bHcIIn+EQYEzu
	jbblPG5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2Wd-00000003V1r-14sa;
	Mon, 01 Dec 2025 11:57:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2Wa-00000003V0F-3FRL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:57:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CF04F60183;
	Mon,  1 Dec 2025 11:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58995C113D0;
	Mon,  1 Dec 2025 11:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764590219;
	bh=jE9WfLRnysb5M1Ttms9XCql5d7rIaHGctFeo3ynddxo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MeNK+a9GGCviNvf9BKZlKD6yH+DY6ttQBTm46GH3VXwlKxfETMpEnp9bBLBzJXxOS
	 bKAkIul/RTVkMi4JL/Nj7blkZJzGN2mZxdw/l1rRrw2aUPDz9Yv+vbbPvjukOf5dNT
	 PkrLIraVzbDDiZLMz9M40PIS1Zimu95Hp26Idf6m/jum/DNx/fTDKjjWwR+7eCAlsT
	 9J8u3ma9UxUFjh3VA5lEbdVGdVihk/XeqwMOwuq8jSLYl4IzeFgGjiywPma/gtuOL4
	 flHq9kTFp88umkeFSzdK2S934gzgg/K8MGQPlzC1JlVTfhYvm1hh9NG9sq21nK0qQu
	 VK8W9OHobC5Mg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46135D116F1;
	Mon,  1 Dec 2025 11:56:59 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 01 Dec 2025 12:56:51 +0100
Subject: [PATCH v2 2/3] arm64: dts: freescale: moduline-display: fix
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-disp_fix-v2-2-9b03026311b6@gocontroll.com>
References: <20251201-disp_fix-v2-0-9b03026311b6@gocontroll.com>
In-Reply-To: <20251201-disp_fix-v2-0-9b03026311b6@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764590218; l=1431;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=aBjyYr0KgPqqBX1balGgsZXHNYxS/418tzQqfsE7U/M=;
 b=ENP1Jh0LkCOmw9V6meQOx6iaYrkPrEj23ilMw94d30dw9P9X2sEOUdDY08dVr6PNOuPPLJlUa
 kcFQPRxMRHsC3P2JmzfG8k6JMGisI01U0xW1T2fJaQo+xUov9VmixIC
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

The compatibles should include the SoM compatible, this board is based
on the Ka-Ro TX8P-ML81 SoM, so add it to allow using shared code in the
bootloader which uses upstream Linux devicetrees as a base.

Also add the hardware revision to the board compatible to handle
revision specific quirks in the bootloader/userspace.

This is a breaking change, but it is early enough that it can be
corrected without causing any issues.

Fixes: 03f07be54cdc ("arm64: dts: freescale: Add the GOcontroll Moduline Display baseboard")
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
index 88ad422c2760..399230144ce3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
@@ -9,7 +9,7 @@
 #include "imx8mp-tx8p-ml81.dtsi"
 
 / {
-	compatible = "gocontroll,moduline-display", "fsl,imx8mp";
+	compatible = "gocontroll,moduline-display-106", "karo,tx8p-ml81", "fsl,imx8mp";
 	chassis-type = "embedded";
 	hardware = "Moduline Display V1.06";
 	model = "GOcontroll Moduline Display baseboard";

-- 
2.52.0



