Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D655C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 15:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Eaw+jdW66520u78eBxhftj2cqoETidDXk6bpHg3NYGc=; b=35xynADP5+Ozy9
	RpqbHAJYNF/AwM5wKn37eMxBUmz7LUCgbUzFi29WLJS9A+hLcTdw6QpltbVntVW35s9miBWWCM01e
	jUE3YLhVT+izdXZbA++EI8TKct9nwMm5g5xXKgR6uA/hrYTRdbb3KkESDdpJuyE+GpZT/X+0E07pc
	dtcDCY8YL4zy27yZTZ4RdJZ/WBi1NaGvaOJ4PmZuirqnKV8TfeLduaXcKny1EQ2FHlRF3r3pHQ4v4
	+pIrH1F6tQvHnUFWKbStNPezZHBnfhTdu1E+JDbQByCLi/nEtz9Y781nFtnc6D5OoSAG7x8LSPcyT
	6wWgQb5aoG3oXW1wk+TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcR7W-00000002bvi-25Zt;
	Mon, 27 Jan 2025 15:33:50 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcR50-00000002b4i-1InH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 15:31:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10BD944281;
	Mon, 27 Jan 2025 15:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737991869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Eaw+jdW66520u78eBxhftj2cqoETidDXk6bpHg3NYGc=;
	b=TuXSEwTT4vYouXdmLy4C5FMojjMqin618yHzBWrQPiaCoUEJeD86qGTaBcAAJ3N6fyBbsB
	p3lXmEg0BufQdAj/GWZXNFKNcThQrFl02MW9Og9LTSqVAafZ0AZ14um5xnMG8/YKok5+O2
	pw16nsLlgg21LDidY/UCekNMETFfSPua7LJyr3rQ0ygZDmGH8S2xEVmxZfngQWphOt2fhH
	Ft7L5azQ0wkz3l5eLbeakzwRp4CG0n4Pu+FTem0niQIBnXAD5xnaOwRseFkXyNXlr5yZ68
	321L3hPywzS+TDWD4Ip9cgKylLbBcVoMoaNbVLIOe4/2pQzF9BCin1TV8bgAZw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/3] Add Variscite i.MX6UL SoM and Concerto board
 support
Date: Mon, 27 Jan 2025 16:30:59 +0100
Message-Id: <20250127-varsom6ul-concerto-dts-v2-0-4dac29256989@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALOml2cC/3WOQQ7CIBBFr9LMWgygNtaV9zBdAJ1akpZRoETTc
 Hex6tLl+8m8NwsE9BYDnKoFPCYbLLkCclOBGZS7IrNdYZBcHriQnCXlA031PDJDzqCPxLoYmOJ
 HjVLVUjQayvHNY28fq/jSFh5siOSfayeJ9/pTin/KJBhnqHf7RpmeK1OfNVEcrdsamqDNn4rH+
 1y+jt9Uzi+AAv7h0wAAAA==
X-Change-ID: 20250120-varsom6ul-concerto-dts-a08be2a6219b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1754;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ggL3H3b9vvHvowBBgmP5EefUOlcgFfWrzdQSXsK8ttc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnl6a8INZvPu3ofY4jOsB3ewgQLwYqHjop/IqZN
 a1CE3lu5SSJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ5emvAAKCRDRgEFAKaOo
 NsFAD/9F9301v+VRTuoHHeVmv7P8Z2o/QiWbdWwvUArYcWQrsm5eIzlAL+Szpuy666JZ1qYTsNQ
 3As7sUUoojg9cjbnkDC72Zb7xwKoRRBoBmsi8aSYWbP9JBWAmERt3OD3k2SyChEUH8ROc6rosLI
 MKZ5UxXENrX/W7u7sNUPj1p63We7Wp+8nPJEHJGe/KGl/gg5mElmKDoXW6lam92hCOIjakOBVuK
 B0wMUf2abTzc8/xKEM6alwHhVcmggv6ySoR/9fRLjxMET20eA45mY7n0uCe0kyGbgg9eBWYTa2P
 lnwlTlLGtsG60M6ciWklxMFDeDeQRMqURkeXozkXFAIezUBxr2eSX2UUNghl+jd5PozwxslsqJR
 DzCoY+ZAhcXuWDJ4YnqAyITndC7VBZxGMo7LjdXUNBXDqRdfncCzFGGWbocjCbjT09vidr+iO2z
 MxosCou6KbzbcCyxYuc/2/M/FBWXTvHTkEcU5sbHHnakTKhacvFmaDBAjeX8HfDWKZctH44RLDL
 fdqulBlVSct/OWJMg4OnXAXFBtwftUqtnpzPwu838a5H4NYkJI+Uc/W6zw5aDp7ZZj4JL6vzyak
 akl77dIJYyLN3x1yRWQQjQusUhnqFlLpzHNjM2dHRnrW5gvTvKtjCq8Ea4ZgNCCy7PA3d2N2CxK
 yV9hZ2LrG1BE3IA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgudefheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtudeuhfelveehueevudefgedvtdfffeevleefuedtjeeuteelgeelvefftdejteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdro
 hhrghdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_073114_502549_14C2B385 
X-CRM114-Status: GOOD (  10.38  )
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

Add support for the i.MX6UL Variscite SoM (VAR-SOM-6UL) and the
Variscite Concerto Carrier Board.

I tested this with a VAR-SOM-6UL_G2_700C_512R_8N_IT_REV1.3A (one variant
of this SoM), meaning I couldn't test all of the possible options of the
SoM - so this device tree includes partial support for it.

These are based on the 5.15 Variscite kernel fork but adapted for
mainline.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Reviews from Krzysztof:
  - Use imperative mood in commit descriptions.
  - Remove backlight node as I am unable to test it.
  - Rename gpled2 node to led-0, and set function, color and label for
    it.
  - Remove unnecessary comment "DS1337 RTC module".
- Rename binding "variscite,mx6concerto" to "variscite,mx6ulconcerto"
  since this is for the VAR-SOM-6UL mounted on the Concerto.
- Remove pinctrl_ft5x06_ts_gpio iomuxc node, unused.
- Link to v1: https://lore.kernel.org/r/20250121-varsom6ul-concerto-dts-v1-0-eb349acf0ac6@bootlin.com

---
Antonin Godard (3):
      dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and Concerto board
      ARM: dts: imx6ul: Add Variscite VAR-SOM-MX6UL SoM support
      ARM: dts: imx6ul: Add Variscite Concerto board support

 Documentation/devicetree/bindings/arm/fsl.yaml     |   6 +
 arch/arm/boot/dts/nxp/imx/Makefile                 |   1 +
 .../boot/dts/nxp/imx/imx6ul-var-som-concerto.dts   | 320 +++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi      | 232 +++++++++++++++
 4 files changed, 559 insertions(+)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250120-varsom6ul-concerto-dts-a08be2a6219b

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


