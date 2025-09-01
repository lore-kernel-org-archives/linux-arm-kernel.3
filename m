Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5C4CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 10:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=39FAD1QerJTJ2wPDicB9GX9umyPWc2w9EF21fWNdZbI=; b=w+OEFoYypvL+Qdd1BhA96bhHcj
	NQjDi4c1Hf4b7NZuvAAvhvHfZ3EDoBBjDP7GmFy/vTR9DmyUWcfnFv92XKHMFzRQCZ7KUqHe5MOK9
	vdu/EStTM69leymKzsz43hmp1J2dyMvXy95GPF43n8d8tW7YMltrnmsvZHSKP9IuXTlF9Q36uPzDs
	GFmWjYMFFtRLs1qw6Yymz5+Vcrk+tGxR8n2vpeLo/aDOHtrsXS/KbrIwtA3s2GJav1x8h8pjoXD1b
	Xvgfx7SJFfNKsdFwBoQnLPMNgSLDPv7ilwC4HCGGhxhes/LXDwcp7PHwsFaMo+BFPdKUTPT9G7yt8
	xDKXGQdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1Qv-0000000BrJO-1Hzm;
	Mon, 01 Sep 2025 10:06:41 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0Tv-0000000Bh1a-3VJh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 09:05:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1756717525;
	bh=39FAD1QerJTJ2wPDicB9GX9umyPWc2w9EF21fWNdZbI=;
	h=From:To:Cc:Subject:Date;
	b=P+9ISj1LA8P845PzgFgH7wvHF7yK59Q5K03aNevrA8EsvMFBjqgop2x/i6zk2oVvp
	 gInN4arVIDojBXa3KMkDzdgPGgT2AmNIfh/4Est4ZseeKX/OLgGohhmyzVlX2Ms9yi
	 s01W+JT8R3uBuSzDVTiUptAdhxZQSl1NdNQfVM3w=
Received: from localhost.localdomain ([112.94.77.11])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id 15734035; Mon, 01 Sep 2025 17:05:23 +0800
X-QQ-mid: xmsmtpt1756717523tsm2mneqs
Message-ID: <tencent_57056C4B1E98EF5C0517A5685B2E4D060508@qq.com>
X-QQ-XMAILINFO: OZsapEVPoiO63+vEsiWKluVtiIBpWewsVodXuXNWp0lHvtfnS4+Vm87kD/r3Bc
	 mjc6f8ekkcGEW4icjagtQHy81zLTTjkvjLddFHuPZndRa0A8LWmQoF/Kbjtda+R3ofzOmXRLgmAO
	 oqJ0EMYzUMBh1ctrX5RBzYs/hQ4cPfFkPXqWm9NqNagz1IRYnKvYa2k9J14nb8UEldzrdAnbLiU6
	 E5j3y4pGCwTZNnn+9MoB6CwpbTr8OS33PVB1s3+qRlbM9ABvRxwDjDY34LraRL7UueSLo3NpyV6x
	 uQCWUeO1qH1lvpxdVS305wEa+yxSiYwrZuNyBozNdZNyS1fGTDy7JJjembuK4tVOmaK9Op3LHfh3
	 jd0rfJ7au5NvskOH8h2vwz1sQZtYcKorr/U6E/fyFEkl+75YvFxQJUINKtAcJfByxgL0cY6Bpxgk
	 PM47gjuv3kQryFJ8N/f2B+Z6Byzv4OzGhHcZcY0GtcYG3P6y+Ri1fIptaQx6PUNaI2x2aI3TT4dA
	 //J/fRe0FWCrUJJf+6VejxIi56CuNKQouNwdUlz8H6s5xUCB69nvvZ9vATzlfU/QyA6ZMI9QY639
	 w5/cljq1pV3G5NKksm4ggDB0Gv6R9HTH2tgNeCuoJqEyUGsQqfC8MMRf57Vo0395ddmsQCC3g4v9
	 5pM5GdGxK49xJFO9QO8C3Zr/6HOPu0unvmyvYlcb3spk2oCT5DTwJ+HcMZSO666HcP7prRQzCnsX
	 NugM8H4NPlexqiQBOaprITLJ9JqZWR+3s5evsDMXUIPZGE5fV1wY5chaRn25NePhwjrlZiZuaBj2
	 fPYMBQx/GnrqwBIHieVumdRTbZ5+ScCQV5agE4TcM1eotn/s6+X1mMtxcGY7Gl4BQw73IDxhCGo2
	 sK7ZoFMAM8eClZrrMKqt3UddMshgRozo9C+PRzsjG7jUATC+9lgOxuIRVanrQzLWaeirH3Lu9uYL
	 TZaV4KuW6eacif1Y/DWSzT/HrxLCg+SPS8SL4hKnWSsTphdGEvnMXaqDdetRSPVZ5ckcK+/ZC01U
	 cKVLfteP3R2AAvB55eJCUH9nMt5FOtMvjfm7Ebyw==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Conley Lee <conleylee@foxmail.com>
To: andrew@lunn.ch,
	kuba@kernel.org,
	davem@davemloft.net,
	wens@csie.org,
	mripard@kernel.org
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Conley Lee <conleylee@foxmail.com>
Subject: [PATCH] arm: dts: add nand device in sun7i-a20-haoyu-marsboard.dts
Date: Mon,  1 Sep 2025 17:05:21 +0800
X-OQ-MSGID: <20250901090521.533710-1-conleylee@foxmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_020544_179238_EA2E91AB 
X-CRM114-Status: UNSURE (   8.30  )
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

The Haoyu MarsBoard-A20 comes with an 8G Hynix NAND flash,
and this commit adds this NAND device in the device tree.

Signed-off-by: Conley Lee <conleylee@foxmail.com>
---
 .../allwinner/sun7i-a20-haoyu-marsboard.dts   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-haoyu-marsboard.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-haoyu-marsboard.dts
index 097e479c2..62d775c4f 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-haoyu-marsboard.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-haoyu-marsboard.dts
@@ -118,6 +118,58 @@ gmac_txerr: gmac-txerr-pin {
 		pins = "PA17";
 		function = "gmac";
 	};
+
+	nand_pins_a: nand_base0@0 {
+		pins = "PC0", "PC1", "PC2",
+		"PC5", "PC8", "PC9", "PC10",
+		"PC11", "PC12", "PC13", "PC14",
+		"PC15", "PC16";
+		function = "nand0";
+		drive-strength = <10>;
+	};
+
+	nand_cs0_pins_a: nand_cs@0 {
+		pins = "PC4";
+		function = "nand0";
+		drive-strength = <10>;
+		bias-pull-up;
+	};
+
+	nand_cs1_pins_a: nand_cs@1 {
+		pins = "PC3";
+		function = "nand0";
+		drive-strength = <10>;
+		bias-pull-up;
+	};
+
+	nand_cs2_pins_a: nand_cs@2 {
+		pins = "PC17";
+		function = "nand0";
+		drive-strength = <10>;
+		bias-pull-up;
+	};
+
+	nand_cs3_pins_a: nand_cs@3 {
+		pins = "PC18";
+		function = "nand0";
+		drive-strength = <10>;
+		bias-pull-up;
+	};
+
+	nand_rb0_pins_a: nand_rb@0 {
+		pins = "PC6";
+		function = "nand0";
+		drive-strength = <10>;
+		bias-pull-up;
+	};
+
+	nand_rb1_pins_a: nand_rb@1 {
+		pins = "PC7";
+		function = "nand0";
+		drive-strength = <10>;
+		bias-pull-up;
+	};
+
 };
 
 &reg_ahci_5v {
@@ -180,3 +232,18 @@ &usbphy {
 	usb2_vbus-supply = <&reg_usb2_vbus>;
 	status = "okay";
 };
+
+&nfc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&nand_pins_a>, <&nand_cs0_pins_a>, <&nand_rb0_pins_a>, <&nand_cs1_pins_a>, <&nand_rb1_pins_a>;
+	status = "okay";
+
+	nand@0 {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		reg = <0>;
+		allwinner,rb = <0>;
+		nand-ecc-mode = "hw";
+		nand-on-flash-bbt;
+	};
+};
-- 
2.25.1


