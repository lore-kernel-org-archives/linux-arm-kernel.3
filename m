Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66A7CE7AEF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iw1b7mgtqhcAtILv6duMfwCUeS0n5z2Q5TNu4CCdxVE=; b=0sBueJm+C9lXEPasXaqwXK3ljb
	24+GbVmLZ51cJaOCdXPCwJkQKccQNrZnnDWVkWAQmT9E15R7dshJzZvXGly8RHkybbKzaXPFgvmlg
	2+glyqYnobMG8sV8LfNRJWP9HP3na0FpuadLhFPnrxEhnACn2wWpHXjYokdtJ1jcVrzgtb0YuoncL
	eo/ETL4Uk4aIwn5uPDJ6VRHxi8bRHMK4HZkbKzjRsx0N9syB/k/o0d3PhPw1CSdXNTwJNbEW3Olci
	AcQmFzhEFFV4AszLEHAhAE766rfia4FOgzeXnIlO6dvR02ocO0mh/YDF+FsUB6nrgSwKvI/AhGBKJ
	mqQ7FMEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuWu-0000000CK4y-34LV;
	Fri, 14 Nov 2025 14:12:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuWm-0000000CK1h-1qyz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:11:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E118441D1;
	Fri, 14 Nov 2025 14:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29ECCC2BC86;
	Fri, 14 Nov 2025 14:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763129511;
	bh=mTtLJkC8ZjzMtE19mKVd+FtcGarZmx9IQ2vvvMjQJ1s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=L+OZox8o1zV+UgRXT+uOHHgMLTBQpf5lTYKDQEpChkzyQpbeFJuO2aZU0zmUGOyoW
	 dAA6xAdJOhJml+KDxnj1ScluljnFsUFhBt5L2yAWKg4TMP1ujXFRlpCPQZY4FYRXtF
	 3sn0y4a3My38AotWvRIljCsqOXby4yAYdj8dOg/vHkCHkE+HI2DvjuD4VGsFmccEv+
	 zdWEjThYEBYxTfeVeLAjHhu7x72Tt62oBo7sVXQq9tY0nWXYoWG/+c6yiXUx1g0XKN
	 p/HPY8Q1UenT4qAzsfi0o4wBj847fzMdvrNkzXghoYHe2c77lTvlIXH7eXlyea/AZl
	 H+OOEs0VJlkFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101F0CE7B15;
	Fri, 14 Nov 2025 14:11:51 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Fri, 14 Nov 2025 15:11:50 +0100
Subject: [PATCH 2/3] arm64: dts: freescale: moduline-display: fix
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-disp_fix-v1-2-49cbe826afc2@gocontroll.com>
References: <20251114-disp_fix-v1-0-49cbe826afc2@gocontroll.com>
In-Reply-To: <20251114-disp_fix-v1-0-49cbe826afc2@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763129510; l=1271;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=A/MMLDiGbqabv2busN3iJ3qqT/bsCqxgmXodKtDcUZg=;
 b=n6l0t60l1FOiDpkQxRskl1y+G6Fe9wDxFVerCWKAVl1g46IaaWaigUVBuXS4d2BihfojgfmWO
 L1HQN67q9CABf0heICn6pKZWeZHk4xLnmQVASPaqu+1uZfTrmPWYx8d
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_061152_505862_586AB745 
X-CRM114-Status: GOOD (  11.50  )
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
on the Ka-Ro TX8P-ML81 SoM, so add it. Also add the hardware revision to
the board compatible.

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
2.51.2



