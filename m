Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726D8C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 15:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8JYVCrH6PJ04XLrRJrXnDDg8JCjURxqYx8cEKCB0S1w=; b=KH28mza9OBXIXz
	2a7J1Gwzyn7EWzlGN+yMrNqzqjLxRugBKAdr8eYqrl9Gm3H9G+s19Jswgc3Z3EWAyva2mUKZXEWeH
	iv2CKazaKkz8mucyqw/xiNlxkeGcCFg1WJaij9uQqqqXv8jBNsCb4yVZWhllwNAQIhC8fHiD8vz9w
	tU/CpF+8ZFMMnFrvOk78Orja1vNQejYKUIycQcz2DUaBWVbf8odJhAOcNrJiach+bh9hYVnxZM0Q/
	AsExrBfk1MCSznBj8p/UXBgmWAR36GHiux01g3UwaSpXIBpQ1HzC5aNPSSATMF6aGpPCJcUltQ38x
	5O0xmdARGOJU94528bPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tolX7-0000000GFm1-0c9L;
	Sun, 02 Mar 2025 15:47:13 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tolSV-0000000GFGO-1gbo;
	Sun, 02 Mar 2025 15:42:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B48544415;
	Sun,  2 Mar 2025 15:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740930141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8JYVCrH6PJ04XLrRJrXnDDg8JCjURxqYx8cEKCB0S1w=;
	b=SRlaBSrepmvU2U4DVnbIS5Wzq+OxNoIBSgU2SXAZEDSIGfXYlmUJ37KaCYnI2awcDiIYOD
	kPYfWZmTqiL8jQLK83vRaP1inoZc1Y992PWYSz8f15eRHmXtvL3iLaLrBvO4n1FOrrDmCD
	I/DOiqaS4vSMmhw+29Uxv1La7Hjmeb9tcYLaNapbV1XEMaG2YXyoyGp71w1DPzmMb6jEyz
	P54vxU3O+wCfocsTD+mO8otOvAuTqko0SQxXv3PQSEaUx6N78RoLseifBf9KtGKSzVYge4
	nK+IC8z6kFidrMGQ+F31F+SVbBCNjPVZH2OYgM9mq/MVOeUPReXVw9/UFf8E6g==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Subject: [PATCH v2 0/2] Describe the cameras in the PinePhone Pro dts
Date: Sun, 02 Mar 2025 16:41:01 +0100
Message-Id: <20250302-camera-v2-0-312b44b4a89c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA18xGcC/2XMQQ7CIBCF4as0sxYDpBVw5T1MFxQHO4mFBhqia
 bi72K3L/+Xl2yFjIsxw7XZIWChTDC3kqQM32/BERo/WILkcuJSaObtgskxZbfoJvfVWQTuvCT2
 9D+g+tp4pbzF9DreI3/pHFME4c4PQF+NNj0bdphi3F4WziwuMtdYvtGkOSZ4AAAA=
X-Change-ID: 20250228-camera-7a894befafa7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Olivier Benjamin <olivier.benjamin@bootlin.com>, oren@taumoda.com, 
 Dragan Simic <dsimic@manjaro.org>, Ondrej Jirman <megi@xff.cz>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelieeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpefqlhhivhhivghruceuvghnjhgrmhhinhcuoeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdduheefuedtffejveeigfejteeiueelfeekfefgveefvdelgfeihfehjeeujedvnecuffhomhgrihhnpegtohguvggsvghrghdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehiedphhgvlhhopegludelvddrudeikedruddrvddtngdpmhgrihhlfhhrohhmpeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugidqrhhotghktghhihhpsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheptghonhhorhdou
 ghtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmvghgihesgihffhdrtgiipdhrtghpthhtohepughsihhmihgtsehmrghnjhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepohhrvghnsehtrghumhhouggrrdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: olivier.benjamin@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_074227_592145_C37886B0 
X-CRM114-Status: UNSURE (   8.90  )
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

This series adds support for the Pine64 PinePhone Pro's rear and front
cameras in Device Tree.
This is based on some of Ondrej Jirman's patches hosted in his tree at
https://codeberg.org/megi/linux, but I have also fully reviewed and
re-written the code from the RK3399 datasheet, the PinePhone Pro
schematic, and the IMX258-0AQH5 software reference manual.

I have tested these changes on my PinePhone Pro and am able to take
photos from both cameras using libcamera's cam.

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
Changes in v2:
- Rebase on mainline
- Change patch subject to arm64: dts: rockchip
- Rename new regulators to fit preferred form for fixed regulators
- Link to v1: https://lore.kernel.org/r/20250228-camera-v1-0-c51869f94e97@bootlin.com

---
Olivier Benjamin (2):
      arm64: dts: rockchip: describe I2c Bus 1 and IMX258 world camera on PinePhone Pro
      arm64: dts: rockchip: describe the OV8858 user camera on PinePhone Pro

 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 138 +++++++++++++++++++++
 1 file changed, 138 insertions(+)
---
-- 
Olivier Benjamin <olivier.benjamin@bootlin.com>


