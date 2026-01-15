Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1710D3CCB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 06:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUe9xaCu/BxL8CnPbA+ZqFBfunp7fWJWif/Sui7jr1c=; b=2ewtF4sVEFawLl3K1PXGeJsXqZ
	28F4IuevoGlHEjSzIYAwBbzIsr9sFcZoKldhSTElcensET8MnLwa4M+y6Oy2gHjdDCTKCm6g21ZIk
	a9w+pVGm1im5K/KS+eEXkzbsu28360Xy9z7/ZqvraMpgAMkdzjRdEU67+wGqF6LfRN1HshmfweiTT
	3dnn/Uv0nPmPwoLIka23infZfIsxURDEs8MJ6zkDcoTNqpJi6rK+uIFkg+B/Kw+Eh11Rqy2bm9X90
	L2yJEieeJFKER2Z8NaLWFRdeSpiQB4rTpI6Kqh/cdsZQj8RAZ070DtQReQxF3zpU1p30OJpNjx3sp
	0KIotJwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgGpy-0000000Br2N-44xZ;
	Thu, 15 Jan 2026 06:28:06 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgGpu-0000000BqzA-21BM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 06:28:03 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 02B2D7A00F7;
	Thu, 15 Jan 2026 01:28:00 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 15 Jan 2026 01:28:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1768458480; x=1768544880; bh=iUe9xaCu/BxL8CnPbA+ZqFBfunp7fWJW
	if/Sui7jr1c=; b=m2DO218IewUiA7nW660qSl1AJa6G2gDclTfeCDoIZSDPOAh+
	5yk7SQ+QUlSwBDowDxr0tCw3rNgb8f0c3Bn1Ze7si/EJn2qs9wAdxECbNufFHwmu
	BAruzNP3xJhZT9dLismS3B+kyF2rXGv+bNvEFoPz2F+k0VE5gDnbQjQBSOK+Mle5
	1687bELiaz0DVZu2SihNhCJCG/nZZVFwSBWO8P7nnmKI7q2fyou60/iWXO/IdENa
	qE7pUQjCxmZZguhVnGKmW9G/xWu2EzYA8/bn5bh0TyMbUwtv0H+WxyevVkh+Feue
	lIXq2uqGqm71jMNekDhokPOUexKTEwjFb1LAKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768458480; x=
	1768544880; bh=iUe9xaCu/BxL8CnPbA+ZqFBfunp7fWJWif/Sui7jr1c=; b=q
	ymqlchigQom2EQFZ78kW16lzteC/fBERO7SZL1pLHhJDkJfAZfmJoXkZ28ia7y6t
	r8sXm15dUDFPv0wuCfRHd+vEdDWl4A0eu590TLaq+spkM+kkwb/4q1MgwzvR4ksL
	0JE8LBX9I3C7lAED4+IMSrS2+9E41Artq/HWBBrJVgXyzJZA25Cd9n4f8sByoPwu
	dM2aJcPM9tZD5+4StTkmg+o1r0fq7146eSp6KEEU1ZFVrW++RnpApu4lKAxCmzlh
	FA9bLS208BrP/GgNNJShMvk5qU3xJ+JhUF1XA25IOoZ+QWd6+arq0Z7bQvwC46Jt
	W7+bjDZCObNXieZg4rDXA==
X-ME-Sender: <xms:8IhoaYCUzAdPiiTl-TY5l-Zo4UoBiqIbGm8U4MxYk0iAysxRIYRnIg>
    <xme:8IhoadEaOjiIuxHDCDBwTjyaAQNw1jSEIx1gOEfJnhRc6WTt5vHP_zpMO-tgSjvAF
    uFpvLrEIHeRPUX-I68JzwulgERNpf6e5-g5jDcTHpjMNCsqv51TVR8>
X-ME-Received: <xmr:8IhoafMFn6J3vvjNPWggBjPifcbEgEGp6uTdxi41l9-zigJFAlwPsRjXAFg-mom5ts1Q4K0XfwRGyR8G9163SYLNWv7fJd9oxgkTe03gyg9gFcIA69GMKE0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdehfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforghthhgv
    ficuofgtuehrihguvgcuoehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruheqnecugg
    ftrfgrthhtvghrnhepiedtheeivdfhiedvffdttefhffeltdelfeejgeekvdeikedtffdu
    keeffffhteegnecuffhomhgrihhnpehtrhgrvhgvrhhsvgdrtghomhdrrghunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrthhtsehtrhgr
    vhgvrhhsvgdrtghomhdrrghupdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguh
    hosehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlh
    eslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghtthesth
    hrrghvvghrshgvrdgtohhmrdgruhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:8Ihoae6PnmC7v2ug0o08l-DhDMtZTp0PNDe4kRkJlzV8WdJzgtx7pg>
    <xmx:8IhoaShMuy1U6Jl5LqpZl8kFXMyRyuJX4GrBWda6twOept6nFUFI2Q>
    <xmx:8IhoaTcTrbW_I9twZKyaUjl8yohz_1UzTdx-ARHJLZKQhy-wK-yJ7A>
    <xmx:8IhoaayUrwufuYLPptkPMef-uT7_-OsALu6jqv8GD51DTNI_v9i0hA>
    <xmx:8IhoaQcK572p6IBTE7-7OgH8n4qUlj9THOAug79ScUu5UskgtX5oAvg0>
Feedback-ID: i426947f3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jan 2026 01:27:58 -0500 (EST)
From: Mathew McBride <matt@traverse.com.au>
Date: Thu, 15 Jan 2026 17:26:45 +1100
Subject: [PATCH 3/3] arm64: dts: ten64: provide gpio-line-names for all
 system gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-ten64-dts-updates-2025-12-v1-3-a56380bbb2ac@traverse.com.au>
References: <20260115-ten64-dts-updates-2025-12-v1-0-a56380bbb2ac@traverse.com.au>
In-Reply-To: <20260115-ten64-dts-updates-2025-12-v1-0-a56380bbb2ac@traverse.com.au>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mathew McBride <matt@traverse.com.au>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768458468; l=2513;
 i=matt@traverse.com.au; s=20260115; h=from:subject:message-id;
 bh=uo7g936uAZ4vCtliz4JoQ9pKjqlkd8DK31ts+X/i5y4=;
 b=pWAFfjEMuAwB19pyqBQGuZkGx/meLMQG2sS82HiPQs2/OlsMvc+sEhhMbG8K3toMTzcRn2jls
 f/MJVoJKqhoAHo/CpmTklq0Pdk5unXVSoOFxh8YR14zay+P7/Sl8gPp
X-Developer-Key: i=matt@traverse.com.au; a=ed25519;
 pk=SM+aGm9Y2fPJ2prfH/b5lab73fTBrKL5UsJwdzv7Pbg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_222802_570337_46CF3FF2 
X-CRM114-Status: GOOD (  11.05  )
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

There are GPIOs on the Ten64 board which are intended to be
user controlled, as well as some that are used for system functions
(such as SFP control lines and associated LEDs).

Providing the gpio-line-names will be useful to users of the board,
for example, in the /sys/kernel/debug/gpio listing.

The master GPIO list for the board can be viewed here:
https://ten64doc.traverse.com.au/hardware/gpio/

Signed-off-by: Mathew McBride <matt@traverse.com.au>
---
 .../arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
index 0a460eebd636..f35889b80fe2 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
@@ -264,6 +264,48 @@ &esdhc {
 	max-frequency = <25000000>;
 };
 
+&gpio1 {
+	/* Only GPIO 17 is utilised on this controller */
+	gpio-line-names =
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"",
+		"EXT_PWR_DWN",
+		"", "", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
+&gpio2 {
+	/* Only GPIO 27,28,29 are utilised on this controller */
+	gpio-line-names =
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "",
+		"P6_GPIO_A",
+		"P6_GPIO_B",
+		"P6_GPIO_C",
+		"", "";
+};
+
+&gpio3 {
+	/* Only GPIO4-9, 11-13 are utilised on this controller */
+	gpio-line-names =
+		"", "", "", "",
+		"P6_GPIO_D",
+		"P6_GPIO_E",
+		"P6_GPIO_F",
+		"P6_GPIO_G",
+		"P6_GPIO_H_ADMIN_BTN",
+		"",
+		"TCA9539_INT",
+		"SFP_XG0_ACT_LED",
+		"SFP_XG1_ACT_LED",
+		"SIM_SD_TRAY_STATUS",
+		"", "", "", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -273,6 +315,24 @@ sfpgpio: gpio@76 {
 		#gpio-cells = <2>;
 		gpio-controller;
 
+		gpio-line-names =
+			"XG1_TX_FAULT", /* Upper SFP+ signals */
+			"XG1_TX_DISABLE",
+			"XG1_PRESENT",
+			"XG1_LOS",
+			"XG0_TX_FAULT", /* Lower SFP+ signals */
+			"XG0_TX_DISABLE",
+			"XG0_PRESENT",
+			"XG0_LOS",
+			"CELLULAR_RESET",
+			"CELLULAR_POWER_OFF",
+			"CELLULAR_DISABLE",
+			"CELLULAR_GNSS_DISABLE",
+			"ADMIN_LED_P",
+			"ADMIN_LED_N",
+			"USER_SWITCH",
+			"ATX_HD_ACT_LED";
+
 		admin-led-lower-hog {
 			gpio-hog;
 			gpios = <13 GPIO_ACTIVE_HIGH>;

-- 
2.51.2


