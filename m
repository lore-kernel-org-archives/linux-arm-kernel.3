Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5424FC8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 17:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JYpBO8lpkuAPMLfI0gLxlh35zA2IcJHS8Bf1gCOv40w=; b=HBJtVoCj5vqaqpRNOq7+CLmJrr
	hUG4Bl6im03E3RBw9rOv0idkw8AV7L1UFzRMr94WaRZ8xJZJJFOVHiyQhdog7ugkBaq2LfYQ5WPD7
	/2l6U5GOqII2ttiPn9W3muK9uI0B7tvVtyPweAJYr4ObHGumfPShTw1sGSnoCLZVSWgrZvQz2LShn
	9nCh7vPUT4AQkF2Qo2ekwVnF66BLVOnVxvDvH+0JaMLmfIbUyBtqIZz6Nbu1aCgPKsphakHLDVJrR
	T5/uQ9uhaexebmb7FDyQAoPLpwo8rDKpFjS0c/Nwl6CkbwtAMbc7r2EpEwYJ5hRnr/MtbVvHAC0M4
	nfhsB31w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXk1k-0000000F4aI-1bN9;
	Fri, 04 Jul 2025 17:16:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXjzM-0000000F4Ki-28w7;
	Fri, 04 Jul 2025 17:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751649254;
	bh=S8cWKIiwtDiSfStJh84KCei6d3DwGM2GwUkVOE4faQo=;
	h=From:Date:Subject:To:Cc:From;
	b=KWDkUUaoYN5CRfFZTT0YTXnnnEB67PNOS49ze/RoxK2MOpu2GIqsGC51CPfCScOQp
	 F1da3abN0+7q7KS+1jti0WYgANv+bom883yz9AN/RxV5sgRzrMgKeEdRAPJqTdhSMD
	 Roht7RWoTZrdIMj8W+Q5mLTPXAPv6+NMDghupC6Rh2gJiiG9yoZ00laB98vtWBawuf
	 z3vzpz5Iv9sAqRPoUb9UK6qOhDtaMleOppXfUvPp8Ulmv5EJhF3O+aTlQMFj4IUFyC
	 7c401ccgr0l//zJOOjLAIhJBg+zAYYreTsYw1VN7Hbjy2Hmp45gq/GsLRBqmZ9LIcj
	 hy20ndBaFDmkw==
Received: from jupiter.universe (dyndsl-091-248-191-229.ewe-ip-backbone.de [91.248.191.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7161A17E0202;
	Fri,  4 Jul 2025 19:14:14 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 19F71480039; Fri, 04 Jul 2025 19:14:14 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 04 Jul 2025 19:14:14 +0200
Subject: [PATCH] arm64: dts: rockchip: Enable HDMI receiver on RK3588 EVB1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-rk3588-evb1-hdmi-rx-v1-1-248315c36ccd@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOULaGgC/x3MSwqAMAwA0atI1gZStVi9irhQm2oQP6Qggnh3i
 8u3mHkgsgpHaLMHlC+JcuwJJs9gWoZ9ZhSfDAUVlmqqUNfSOod8jQYXvwnqjda4sjHUEFGAVJ7
 KQe7/2vXv+wG/4P39ZQAAAA==
X-Change-ID: 20250704-rk3588-evb1-hdmi-rx-51839109000f
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1392; i=sre@kernel.org;
 h=from:subject:message-id; bh=S8cWKIiwtDiSfStJh84KCei6d3DwGM2GwUkVOE4faQo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGhoC+Ynu96nCSNsKxpenn4F4N4nZhIray6ew
 sopv3oLcmldc4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJoaAvmAAoJENju1/PI
 O/qa3gcP/0pAVYqWKnbMQo58dsFsLmzMm+rZ72RwyO8pvHgKJYwDUuibJYQSMwAI12W//vIOQ8S
 p6KZ4YmF7BClcHA/2cJiIk8Q3WygeLfOxxKjry6LEFOHjqy7Vn0jd7VNXZMbkX77LAdWAmf5kfx
 mxGLyjZYTTgS5CHmVi2NVw14gdZxmB9esDEk8SrIY2ycV1fntN5MiNFjnoTW/uQuxaCWaydbqCF
 W91WhRcOmdUozfmD7ybDOUKUMeRYRQBNZPHNDPGyYxQv8WPCWO5yvZ1BO0xO4VJWxkcEjcrBv3R
 BtxMDzAlrkusn71xdJ1hLCMhLVT0kUBGQlB/6ONIM17NFattTZ+pEo9CD78m4Fd+XigeE6X1Lvn
 OX6jhcFIt9th7c9n97je48RiKodHBJWZRcwOPIs7PheGVkYiq7zJAgoMAoWo/W9ZMkt/S29xz2t
 niKYxym7MgwzzKR+bREw9LGaIaNqADBmVeDh/vVZKFerZNdVwsFs/bfhI8UhQbuENmGfUBc2tT8
 gzfjdpcWb1fCmmLeI/BHAd+jEsNadaUjZHELSAAbou1DUNf8oqyaqQZ8GqvEHVipUCZwc6GzDZ1
 8vRFAXLbgBYF3igUVZ6tX9dMdGSSr0Zb99AlM25zr2V9WA5/+v4yeVFmOCqmRLu+Qnkqqy4c3Ba
 LWGGlvGbb4XH7C0LXrk8fCA==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_101416_718495_5D827266 
X-CRM114-Status: UNSURE (   9.53  )
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

Enable HDMI input port of the RK3588 EVB1.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
index 8e912da299a218b61623e6973d2f955504bd44aa..ff1ba5ed56ef5b985c54fa9e1a433fc81f988f8b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
@@ -391,6 +391,17 @@ hdmi1_out_con: endpoint {
 	};
 };
 
+&hdmi_receiver_cma {
+	status = "okay";
+};
+
+&hdmi_receiver {
+	hpd-gpios = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_hpd>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &hdptxphy0 {
 	status = "okay";
 };
@@ -582,6 +593,12 @@ rtl8211f_rst: rtl8211f-rst {
 
 	};
 
+	hdmirx {
+		hdmirx_hpd: hdmirx-5v-detection {
+			rockchip,pins = <2 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;

---
base-commit: e05818ef75bee755fc56811cb54febf4174d7cf2
change-id: 20250704-rk3588-evb1-hdmi-rx-51839109000f

Best regards,
-- 
Sebastian Reichel <sre@kernel.org>


