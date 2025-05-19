Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ECAC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 09:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5j6I9ztdVG+4vvmFQn5xcv51hqrbyd+Ypoj07f13Flo=; b=PgI4Q5qHg2cgUbz0Ooam4bdztH
	z9VfNgPoFyB2cWVH23fc9/+PuvX6WGARrx1mo0UzypY8Q/zpJqR3m1DvuaNqaE0WCnT3vnVK4o8Bg
	5kChgNTAOOcfT1sBbYIRwaTrNFqUsN6Fs4EQdnYUk2kTyKR+FW2kIz0BHMXHctjgf44nubW4T6izu
	L/z9kXI6SXTtJ+FXxFtoOmpbOT4OUMyKOl1wGydiPR+9ajZe7wl9qd7qenymTGHsKXJJRz9bLViQZ
	7YXpuOwfEE9zcRfd7UNRTTb3GFjBJX/ZfBaxEoi25bYhylOiarAEFKv7rceRQH5sT1e2UBqFPLDDM
	A2XXR5yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGwPa-00000008Sm0-3vIV;
	Mon, 19 May 2025 09:03:54 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGwJs-00000008S23-30Pm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 08:58:02 +0000
X-QQ-mid: esmtpsz19t1747644978tb41e14ad
X-QQ-Originating-IP: eDuQ10kV/w2x2ssHfOTwlUZRzAh8CxixkPLa9o2Ye5M=
Received: from localhost.localdomain ( [182.245.65.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 May 2025 16:56:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4209043980013137046
EX-QQ-RecipientCnt: 16
From: Hsun Lai <i@chainsx.cn>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: i@chainsx.cn,
	heiko@sntech.de,
	andrew@lunn.ch,
	inindev@gmail.com,
	quentin.schulz@cherry.de,
	jonas@kwiboo.se,
	sfr@canb.auug.org.au,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 0/3] Add support for Sakura Pi RK3308B
Date: Mon, 19 May 2025 16:56:11 +0800
Message-Id: <20250519085614.2245892-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OAOHw7tUGLQOoAlHLz1QGnMbFPS6TYA3VAkD4Vqij/ET0vOAw24ak/EJ
	j32cSKdlr+dCcymSyFBFMntzfOPWiL4hVa4CB0UJveTQz9BjKV5+Jw/FmCkzLeV+JJv6d89
	K87udEgq9sP899Ge7jBDYbkWIIYZithKx3aOaL9SDhghYswLzWJygI5zaxE/9s5Dmia8QUa
	d/w9Z1/XrsS58f1qUqLSbHjmDfHN9ZTYa//XCYa1sUMf90QQ5nZ3vCWolpUjOhlrj8JKso8
	NHXuw3/Y0dMoQrzk0GDhxP+YX8mTy1Bp/PqlZanlAZF4LVXrnq8NtpvQTjvxNdvky+Kgkcr
	nZFvGasgaMXuSwz8IGEMac+xiAqDZnmlKTDoZTSsc5TYO7XPjaVh8rebapTkZQmLWljTwAF
	NMaUHR1HkgEayjacIp26kCr4bfZwoHU69vV4eW0vjkDDNsanNimSDStVVbwWGXpKrHnYCty
	QZu9MRs/z00Rma2CF54sIdjzkc0AYbePPNHg606TRUyKSKkscuqhFZYx76Knh590zMDssIt
	fXOjYlWYTXRBvWzQ8woU4C8k53zBeT2uw5ks1odDgafzBOpfYe/y9vgxNxQWZ6YJtYHgmxL
	fDNkfeW5iokHOAqseLpG/OzAAYGPJ9Dv/1tSq+50jOPGULLeKIF/y6pdZi1yB4auXLCS/NS
	rU8X2zo1dSWD8Q6x6qHF+EQYU2rArbVgDWFkmPc+m5lvmiIi2+pdb1bdSe9FPiEtuCyl45a
	oLxVkjgQkJIJDSA741LefjNxG3hlwrQXftq7zl1gchxw8PU6DilFJKCC/GLMfazpIXA4IOR
	Ev19S7Er9g7hlT3jUY+TIdZqAZZ0scZ0u07fQ65xYF5dEsRYmGq+qwboqQqEgQw461uJSVF
	r3PG/EhmT3KWRB8QDYafifFhPO74zQe3MbDPhZCdRHchR8EHffLXxidiLN3663TuG6ielWh
	6Vf3gE12nYiu2H6fa+b9MZQP16kv4uJDoIjv0TIzzbWppqLlHv2OTrIOx2DFj4Rl2zrx53B
	8IK8Y/SI27qJxUCeqF
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_015801_187613_E05B7473 
X-CRM114-Status: GOOD (  10.10  )
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

This series add support for Sakura Pi RK3308B.

Info of device can be found at:
https://docs.sakurapi.org/article/sakurapi-rk3308b/introduce

Changes in v3:
- Remove empty i2c controller (Heiko Stuebner, v1)
- Remove unused spi nodes (Heiko Stuebner, v1)
- Sort nodes alphabetically (Heiko Stuebner, v1)
- Put status as last property (Heiko Stuebner, v1)

Changes in v2:
- Update the names of the regulators (Heiko Stuebner, v1)

Changes in v1:
- Add support for Sakura Pi RK3308B
- Patch 2: Acked-by: Conor Dooley <conor.dooley@microchip.com>

Hsun Lai (3):
  dt-bindings: vendor-prefixes: Add SakuraPi prefix
  dt-bindings: arm: rockchip: Add Sakura Pi RK3308B
  arm64: dts: rockchip: add DTs for Sakura Pi RK3308B

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3308-sakurapi-rk3308b.dts  | 274 ++++++++++++++++++
 4 files changed, 282 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts

-- 
2.34.1


