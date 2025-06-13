Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90552C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kT0oyU/Nh757Vz/q1GQHVARXcSaMbfaag4GCfYlRurQ=; b=tEjtBicUj3kME8nftAeGuMci1q
	dYZ1KOL57UntQZo5oQG7hez/9BlMNVHpx7drDnxCtGf9UsbfCP8lhACSXVJ4k+d9ugNtr5XqESqEd
	Hx/6if4Qt++1P/OlFkQcbr/GmuQVzwhrUJE5sgfBYSXOEEdYkM5QeIjhx0Fwni4QFfwbQ1HDT6rm9
	7okt+3OT1Y59aYTmwyCkj4oNofgOTBDUdh7bGE2lM2+hObiyB9W1sFxh/ohXam7M7oTPtfzooJiNf
	NVNG+0GFAIFFD5jgbvVXuVvvH0P8HYx0ogFHWLiUOJOs79ZOWgAZMvZYPGUZRQy2LAnKrVyW/wl5w
	a0xwelXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9wD-0000000HQA0-01Bj;
	Fri, 13 Jun 2025 19:19:41 +0000
Received: from relay15.mail.gandi.net ([217.70.178.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ94K-0000000HJ8V-04su
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 18:24:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A535442A4;
	Fri, 13 Jun 2025 18:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749839038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kT0oyU/Nh757Vz/q1GQHVARXcSaMbfaag4GCfYlRurQ=;
	b=OBfKExpt8M5d0lvM2Qq04f0QiyRb6Ve9jo3lGS7pkFPDPDWRFJMsRM3OlivWaUHufkbRNQ
	/lT0pDAcnmoI7TcseDKZlJM5Vty5LXl9wZMKqHiaU4GSNa8OHEJImLfbhdCWkOo8CtFRVc
	NpvEmowYtUeyWlkoB0QjdhuP/zSC7HW0/+sE3iBgz/g6fdVUFJy3J9Co1xd7v8ZZ0OH3YA
	FMEcAo8Zkowr2aPm/kRSe9hxrsX7tQvzjz83fYWVPkqU8LKB/d109zv2T9OKe3AU03rqA8
	LpJGuqJQW6L05uL0HsBIxK9RFUtwSVTmzYIlWzDPVpoTCu6Gju7BjR2IFjD+Kg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <stlin2@winbond.com>,
	<linux-arm-kernel@lists.infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2] arm64: dts: ti: k3-am62a7-sk: Describe the SPI NAND
Date: Fri, 13 Jun 2025 20:23:56 +0200
Message-ID: <20250613182356.1272642-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeeiiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteefudelfeejffehveelgefgtddvudfhudegueeijeevjeeivdfhudfgtedtheenucfkphepvdgrtddumegtsgdurgemvdefmegsjedvvdemrgdutdgrmeelfhgvkeemudgsiegvmeelledtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudgrmedvfeemsgejvddvmegruddtrgemlehfvgekmedusgeivgemleeltddupdhhvghlohepfhifrddrpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepnhhmsehtihdrtghomhdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepkhhrihhsthhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_112400_186767_7E51335C 
X-CRM114-Status: UNSURE (   9.22  )
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

Describe the octal SPI NAND available on the low-power starter kit.

The pinctrl configuration comes from TI fork.

With the current mainline tree, we currently get the following
performances:

eraseblock write speed is 7507 KiB/s
eraseblock read speed is 15802 KiB/s
page write speed is 7551 KiB/s
page read speed is 15609 KiB/s
2 page write speed is 7551 KiB/s
2 page read speed is 15609 KiB/s
erase speed is 284444 KiB/s
2x multi-block erase speed is 512000 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
* Added the bootph-all property.
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 42 +++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index b27759026014..3a8b45272526 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -876,3 +876,45 @@ &c7x_0 {
 &main_rti4 {
 	status = "reserved";
 };
+
+&fss {
+	status = "okay";
+};
+
+&ospi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ospi0_pins_default>;
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-tx-bus-width = <8>;
+		spi-rx-bus-width = <8>;
+		spi-max-frequency = <25000000>;
+		cdns,tshsl-ns = <60>;
+		cdns,tsd2d-ns = <60>;
+		cdns,tchsh-ns = <60>;
+		cdns,tslch-ns = <60>;
+		cdns,read-delay = <2>;
+		bootph-all;
+	};
+};
+
+&main_pmx0 {
+	ospi0_pins_default: ospi0-default-pins {
+		bootph-all;
+		pinctrl-single,pins = <
+			AM62AX_IOPAD(0x000, PIN_OUTPUT, 0) /* (H24) OSPI0_CLK */
+			AM62AX_IOPAD(0x02c, PIN_OUTPUT, 0) /* (F23) OSPI0_CSn0 */
+			AM62AX_IOPAD(0x00c, PIN_INPUT, 0) /* (E25) OSPI0_D0 */
+			AM62AX_IOPAD(0x010, PIN_INPUT, 0) /* (G24) OSPI0_D1 */
+			AM62AX_IOPAD(0x014, PIN_INPUT, 0) /* (F25) OSPI0_D2 */
+			AM62AX_IOPAD(0x018, PIN_INPUT, 0) /* (F24) OSPI0_D3 */
+			AM62AX_IOPAD(0x01c, PIN_INPUT, 0) /* (J23) OSPI0_D4 */
+			AM62AX_IOPAD(0x020, PIN_INPUT, 0) /* (J25) OSPI0_D5 */
+			AM62AX_IOPAD(0x024, PIN_INPUT, 0) /* (H25) OSPI0_D6 */
+			AM62AX_IOPAD(0x028, PIN_INPUT, 0) /* (J22) OSPI0_D7 */
+			AM62AX_IOPAD(0x008, PIN_INPUT, 0) /* (J24) OSPI0_DQS */
+		>;
+	};
+};
-- 
2.48.1


