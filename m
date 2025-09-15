Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A645CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 02:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gLKbfglhxJbONgRNcwcxNTWdeFfRqEoK1bvM2yhwQgE=; b=Rv66w0Gv/Pugxj2VgB9eQpK9Qs
	WNR0+HytuL1Yc57h5bWvZxhUOCrjpHUzlHFXefWFTBDn+syHbyIeDHb03N/FB5RNc/nhfuN0gZcw4
	IhqqY89aBL0rGhp57PLrsD0RsY+i8bFWRN6xRL8kz+ayo+HmBdkjCyM8LW2W4/BnlEftWbJO9zUD8
	atQ1qzcN5gBiCYj/MZpVkABkuSSRQ9PgQNLgN+M/1OiYeiLTW5+TI50caQJoqaVZY6sIs2MLaKBSJ
	BgizhIZlfQmj43G+9Le+PoBhkGgDL9Jb23aFvpMrD9L1hMVkFsKVctzzpf8olaPXV8vifcL5wnFyn
	6L80eA7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxytD-00000002Z42-2wKZ;
	Mon, 15 Sep 2025 02:24:23 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxytA-00000002YvW-2gK9;
	Mon, 15 Sep 2025 02:24:22 +0000
X-QQ-mid: zesmtpsz9t1757902955tdbed93ca
X-QQ-Originating-IP: zIT1IbJ0qW2TnaG8tjt3QQf9A/JGH1fEpFPpzLnG+5U=
Received: from localhost.localdomain ( [183.51.120.121])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 15 Sep 2025 10:22:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8988539609789202725
EX-QQ-RecipientCnt: 17
From: Kaison Deng <dkx@t-chip.com.cn>
To: Rob Herring <robh@kernel.org>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Wayne Chou <zxf@t-chip.com.cn>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kaison Deng <dkx@t-chip.com.cn>
Subject: [PATCH v3 0/2] Add support for Firefly ROC-RK3588-RT
Date: Mon, 15 Sep 2025 10:22:03 +0800
Message-Id: <cover.1757902513.git.dkx@t-chip.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:t-chip.com.cn:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OegHrGdQ9dQUnbIRCdL+JDtFObX7p1yMy3PEcIh0UxZkddwUVMscPvH5
	DuqFVi2iYwZa8mAG9wzRGFsBrCgxEE3EBeW8c4xa+tXW4jZwO78oVlWBrqN4rsEJrJjbi+M
	PYjB5lK+sMiHyCkcmDY0vtpP8JcytVwcnqrj4bhEzthYN+ufq9/MpViCut/bei2hkuY+E+B
	YuJF9nlYY05U8/AdnaGTj/1liDyP1TypVsnVvU+HTqGfSYuG79ieCmYJAlfCL+TSyqJnQyd
	yKUJD7Vlo1e2bwEbi6aSKIcm1Npa3jAdNVgT8El+UDzf6rzRBZYRPQ5elWLsFR4woIR9Nvj
	WUSgSqyRKA96nHQjl3DPISvmcyV1dtx+tTG1U+UdZmM2B6rAwgONlJtA1Tq6f3BaFX4wLsU
	jpGBkuCuwil7q0yVi1euEPyZbuwQrd5hzlFLuv09qnnp1ib7H1mwHGbLgvYS+izl0Mq692L
	ha51zb7uKU3azm6BdJopQwDi9reHXbC1WSy48LqXixto4TyZCveBNOzXUaSOmw6Exl3IasC
	nBWlzSNyHt2NQ4bojlRQoTUIHlT1pTVkjv//SE1Z26rHK3ctkNmk97Rc28cJGxPX+3ltgaj
	l1QefKZay1zigdtEXVn58UY/vxB6e038POBZs+mBROrBAlj4QfUVxN1aX/F8Ml3ZaD5tqNZ
	F+uzDpeNt9G14dy6gbkq4hrOzsFxCsBc8+gfL3GK6JRNhaemcD12lb6V6qpPUAnyG0Ckj+t
	N+Ou9WafycvZRpMmhrCJVltDCGZRSw1SOrDe/euTNXb3VANdyf1i5a7PJXx0yloIBFDP/vv
	oFM8/l0ykcfutdp7/zqNUrXLY31R6IprLF0HYrUUbGPFbvBBvAUvlyz3aw2jhhed0AvK1At
	3DZ9pt6iCIPt7BwGlHKT1cjbbOY7yswq1P2WPoyiR3DJk4tTTLjKxLfux31zXswAJcmxje9
	/SsMK4S2bOPyrO8uxZIM8UEmOrlUq8HRYAAioC2/gZAD7fcw72s1RnE8N9x1SE+2LVdzgrE
	Nk0Nh8E61EladC4AXjmrv4NTndEDn3hShftX6r71W8DHi8x/nn1jLx4FnmPpFT5ZsMhAjPk
	KpqiCdyOI0L0Y4aE/dnQhSM9EzWusBGlbSIYn0m1XEE8QzReaDoHK6CwarRtlphjQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_192421_628066_AC94652C 
X-CRM114-Status: GOOD (  12.93  )
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

This series add support for Firefly ROC-RK3588-RT.

Info of device can be found at:
https://en.t-firefly.com/product/industry/rocrk3588rt

Changes in v3:
- Change rgmii-rxid phy-mode to rgmii-id

Changes in v2:
- Add devicetree binding documentation for the Firefly ROC-RK3588-RT
- Update the description to match the device tree
- Adjust the descriptions of the model and compatible properties
- Add audio support for hdmi0 and hdmi1
- Adjust the attributes of sdhci in alphabetical order

Kaison Deng (2):
  dt-bindings: arm: rockchip: Add Firefly ROC-RK3588-RT
  arm64: dts: rockchip: Add devicetree for the ROC-RK3588-RT

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../arm64/boot/dts/rockchip/rk3588-roc-rt.dts | 1134 +++++++++++++++++
 3 files changed, 1140 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts

-- 
2.25.1


