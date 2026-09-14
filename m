Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F3FC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7ANb8OPjIVJHlipscVgoMQ4zuRZUD8dC1mUN1Ymtt0=; b=Yhdt/QGhZsvqOTvWAemYx3gTc9
	p00zkG2zB+FOf95k/wKVl/8eAu6wtKcJdLCKwvl+MmdZGUbhz6vdPPHrYATgJNHGmg5Gw7v9iDFm2
	W0TxyvGObHPgVssBMxon9jgj0+7T1BvpTVH0VstZlzujPx7LvHx33sQ5fWiwCht5ko42aI92ZLP99
	pwq0FESXXU5d+C9J0VhWfPwR5cEql6wGhvh5U01RLGYiW3MN9n2rRMVC4UeONgwaTAIOPrMOyfOhr
	uYGlVazk4lXmTftIm9Qnw6osKuMkZAiBG7KYm5n6Hs1ftmmOPUMLGUTeUugai6oFEDPuJrK1V5oX0
	CgZYeDBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x671a-00000003q64-1itf;
	Mon, 14 Sep 2026 13:47:10 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x671N-00000003pxW-0eXs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:47:00 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789393611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7ANb8OPjIVJHlipscVgoMQ4zuRZUD8dC1mUN1Ymtt0=;
	b=vQ15ezdjPe9EzIjXoaKsgbAP/x41fYotZimQlqw8hvzVN/yehjP0EUdXz/cr5Br0I6aXuk
	r5J5nOcm3ijjNq07K04XRu9YTUiLUrBadsyQl4tOeuKgVDO27Ncm7gWBQyHtqtJyeRvTQB
	hQDilogqUNtwYgpqPEHA1LCi2I+yPRZiaV8V0it8Qt018VN7QhVLT1YQTR1U4RsugvhXBX
	ucq+auz6cEbLTJwUD8pzyJgW4zkctuyTCq6iMKAw/zxfqbxIfnKmZRvmEAjX2G+Szeat+B
	3iQxfQwAqM2+vPLxnJL4j3JskHc153bb7rMP8fWimeREaHpa25to+htsrZhQ4A==
Date: Mon, 14 Sep 2026 15:46:10 +0200
Subject: [PATCH v2 2/9] ARM: dts: imx6ul-kontron-bl-common: Add GPIO labels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-2-8e12bc5f1f10@kontron.de>
References: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
In-Reply-To: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Oualid Derouiche <oualid.derouiche@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=+pyws9R7YxcGiBu21aWCHnox53fIOKOKZJHrE50fyaA=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWv5r1NeWTbSU69La8uyL1kjP/Oz3C+xi82Lz/oZzWtYc
 bld0lq0o5SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCKpExkZHlyeaby37ta1XkuZ
 B/95p2iHM2fpWvF77vD2nPPdIavpKMMfvp8L72TE31t3xjj0pFOR0soZz3a8vKi/dvMc1+0+AWd
 amQE=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_064657_565817_4677FA38 
X-CRM114-Status: UNSURE (   7.81  )
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

From: Oualid Derouiche <oualid.derouiche@kontron.de>

Describe the GPIOs and their purpose using labels.

Signed-off-by: Oualid Derouiche <oualid.derouiche@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
index a71669bef7d4..65c5f4450c36 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
@@ -132,6 +132,22 @@ ethphy2: ethernet-phy@2 {
 	};
 };
 
+&gpio1 {
+	gpio-line-names = "", "", "ADC_REF", "AIN1",
+			  "", "", "ENET2_MDIO", "ENET2_MDC",
+			  "AIN2", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "SD1_CD",
+			  "", "", "", "",
+			  "CAN_ADR0", "CAN_ADR1", "CAN_ADR2", "CAN_ADR3",
+			  "", "", "LED_H14";
+};
+
+&gpio5 {
+	gpio-line-names = "DIN2", "DOUT2", "LED_H16",
+			  "LED_H15", "DIN1", "DOUT1";
+};
+
 &i2c1 {
 	clock-frequency = <100000>;
 	pinctrl-names = "default";

-- 
2.55.0


