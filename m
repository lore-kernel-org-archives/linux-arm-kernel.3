Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE26C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 17:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3UOS4rb9TEoPzQPGBF8Xn/wQ30Soac4t1IPb0qzm228=; b=wHs4FLBMcMEEZC
	c94W2GdWduT0NN9ZM+xLAXIHs3FaTRjbkkiw8+JqVVjm91tuh7zDkghxWP1GXaW6600igWSGk6fGz
	5y4Boxm8CgNCKzm9FYEmUVfk/qIhfPTeLnda135YC95lBwWEmypoNDOxoeluLAp71Y/5RlCIkLDkw
	+wXfm62DHF/BpSCmZsPOoJiaCbmYVsIaNtQYCGSxpZsbN680FYv2IqIxf1s8TJYcbXkHi/e9qXMP+
	++4Q82ynM0YCI+pyNOZv5jJPM7iobpS6u8Ht17pZKlFV3I5QZtqNBIMdh0PX/0oJ4iLxtEVONDVH2
	6fL1eI4Kb4yP2to3aohA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhGu-00000003Wwo-0dNq;
	Mon, 10 Mar 2025 17:50:36 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trfV9-00000003IGr-2wHo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 15:57:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4FCBC44101;
	Mon, 10 Mar 2025 15:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741622227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3UOS4rb9TEoPzQPGBF8Xn/wQ30Soac4t1IPb0qzm228=;
	b=L43ANbmvvQwvhWw3boUduOlW+eefJjjM9kIjhGotW8FL/JGRXCe0W2j0VwagP0Qiy6wEHu
	lslBC7x/zA6PUBi3P2/TJnDCHayZuXDtf6Zj/qe1+Sa95bMHxwCm3dsw4Zo9axcqJ75KHh
	7wDkF6ocz5kH15mMOE39AqbKgofyHjhWI3hBj5aLgM2oXph8ZErjlVy52S0sfpR+E6zJJN
	Vurxcl6bn2rg4zyxotC63wG/+S4VProYJLvf5Mc/yuHfNS6QeMevOmPvTa4M3hP1wSVcrx
	I2x5bQSqnPXuYQEA40G4VqRzxzrSOEHfzWICyab/2PVTnpqr4sggV7cQE8pNlg==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v3 0/3] Add Variscite i.MX6UL SoM and Concerto board
 support
Date: Mon, 10 Mar 2025 16:56:06 +0100
Message-Id: <20250310-varsom6ul-concerto-dts-v3-0-551e60713523@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJYLz2cC/3XPTQ6CMBAF4KuQrq1phx+pK+9hXJQySBOg2pZGQ
 7i7BTXRBcs3yXzzZiIOrUZHjslELAbttBliSHcJUa0crkh1HTMBBjnjwGiQ1pm+GDuqzKDQekN
 r76hkZYUgC+CiInH5ZrHRjxU+X2JutfPGPtc7gS/TL8m3yMApo1ilmZCqYVIVp8oY3+lhr0xPF
 jTAL3TYhCBCWS0VCMgLUYp/aH7XtXgf4/v+03meX2fk91YcAQAA
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2120;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=eGDElqtBJShl5L20wjZ0yk8EVx68/Le8s+EeXvF9c5o=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnzwvRwyVq2f0qoWhvOjc1A99tiXYZEUks2qrwq
 UIgtZi/TWSJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ88L0QAKCRDRgEFAKaOo
 NvO9EAC78pAkCEQGTHt7pAqhWCUoSbyohKS0s/A2q2JtpefbZvcIlbmd13wzgdKUAkiOIq6Xexx
 zR2OuH0U/Gc1hui+p3nDdqzfQNJcksmmBKZ7Q7BBMB3yhRGN5Ujw/R4NyOGu2WXRx/wgm+1QSKu
 ML8Rbf/wnow3DDcpGjzw4WWfzMGUUCLfhQvPpWQ0LJ2X8zQjdO7KdhDtSwO6dU3KA6UA790ljLb
 uYGZXU7uoPBoTke1snkeeuJd5iaI1bzSm5r99kdFLl9QTSfnBF4/6Rxx2SeOm40OOwO556AueVP
 Owovf5YyNRhM81U+6N4Ink1WYwxbFg/njI5sFVoeCkLYlXu54PYC6O9GlXx72SWYcy8DMMP/XYW
 QOQqrd+xyBo/B1VQkKZ5FzTjzMrincF/oDDyiwWdqM6aWJKoEM3UUM/EzOYqaI3ph9tfssJEDRf
 OLYzsnmdJ1Xn4WFh1m0CTAk8G+z0uY9UUzccXI9gIInNHSM4BQmhUc1A/MKtpAfi2welVbwof4n
 qCA856tQttTDMe6pNgK0uFIwt86z2tqHX9o1nrfB3XKOh0Js+Jq68n9QSR7vKARvq7qgORcnbzy
 Bdip8jNZRWHtrQNvUn3jOvSaGd4S3AgMz51OxcUVjJqPOchPdGlKYV8Dd22KJ7Q8KYTLmGYxHBK
 Sxp+IonOaHqpvUA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudeljeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtudeuhfelveehueevudefgedvtdfffeevleefuedtjeeuteelgeelvefftdejteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhto
 hepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_085712_194724_1A966FC0 
X-CRM114-Status: GOOD (  10.88  )
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
Changes in v3:
- Reviews from Shawn:
  - Fix alphabetical order of nodes and pinctrl entries.
  - Fix rmii-ref-clk label (remove "-grp" added by mistake).
  - Fix order of properties for eth nodes.
  - Convert deprecated fec properties to eth properties.
- Link to v2: https://lore.kernel.org/r/20250127-varsom6ul-concerto-dts-v2-0-4dac29256989@bootlin.com

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
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi      | 233 +++++++++++++++
 4 files changed, 560 insertions(+)
---
base-commit: 66683f3b2661643f694607283ee8f01b7a934c83
change-id: 20250120-varsom6ul-concerto-dts-a08be2a6219b

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


