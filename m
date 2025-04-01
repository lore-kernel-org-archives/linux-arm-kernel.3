Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A552FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 14:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dvq5pJ8VFEVaQPbrBCwVB6vh+W3FQK+6lG5OG4pglDQ=; b=E+chDd6Xt7QiAkhduoD6yIY9wU
	IFCi+i4nUH178Dkl9r8C54V6xR3hwiMNUbeoCNOXnp3+J556sioypETz/Lh872rbnkOYz3/NqBatP
	rHs6n7b9p/BfAC9SOF1G/CBgHpUfALfyXkYV38uzWIpsz6eF/5Lc9ZNnzlAEpz7ynYiI5JAt9D1in
	eGfTStAIJWO3SmvgucOsotaiEZ4Q4riwmU3orU9njaV5Vd8CYXkVREHCjPJONWAxq7nXQmJAK9GUP
	3RVyg6tSTKAiIPzPEEuKkSG1UWibtfTMVWRWmLfkeJ/V/qRqrY9J8G9PrK+nz0/3/YNaAXjRey7i+
	CDplgvgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzcAG-00000003Wk8-0TgT;
	Tue, 01 Apr 2025 14:00:28 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzc8R-00000003WOe-1v8l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 13:58:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B23A441CD;
	Tue,  1 Apr 2025 13:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743515913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Dvq5pJ8VFEVaQPbrBCwVB6vh+W3FQK+6lG5OG4pglDQ=;
	b=fZzA5qPF0NAIthsFUYyODhoY0nC0KRg5vWfU9rqSA6kYK++5m1+4YUh50i/L8RuhwYSC1c
	a6+f2bFwM6s4iZjBM+CLvaghaTXPNAtzU1pXY9nWIkpvfFidZyhzykgbrVh2Zb7TGD3f/l
	9cSkABaHX9xYFg7DzofnM/bKMgyLJEwmeF8vuv7n/LHFWmInmQ/kdigcYvv9oGH92t7ZP6
	vbJ+HZa2897biFXRY20r3CGPEkIGzDOwzVgR0bJKyHTsDHbKH7iAdh8aPmrZJRmyvV+u/E
	CCEVNMrCCPPnguu4/nFbqz4siNToPzTwLlbXrXzZkveHFGRlf7dFHUm6FVjFAw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	<linux-arm-kernel@lists.infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <stlin2@winbond.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] arm64: dts: ti: k3-am62a7-sk: Describe the SPI NAND
Date: Tue,  1 Apr 2025 15:58:22 +0200
Message-ID: <20250401135822.244402-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedvleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeetfeduleefjeffheevleeggfdtvdduhfdugeeuieejveejiedvhfdugfettdehnecukfhppeelvddrudekgedruddutddrudelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddutddrudelfedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepnhhmsehtihdrtghomhdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepkhhrihhsthhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_065836_081348_FA50E9FB 
X-CRM114-Status: UNSURE (   8.43  )
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
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 40 +++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index a6f0d87a50d8..6cc950f6dbe3 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -737,3 +737,43 @@ dpi1_out: endpoint {
 		};
 	};
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
+	};
+};
+
+&main_pmx0 {
+	ospi0_pins_default: ospi0-default-pins {
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


