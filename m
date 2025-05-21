Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2714EC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 13:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fZG0S7+MgL6V8YTWxkrL3ikNXVwEkCEKoUfHkILhldc=; b=xbHgPjGJvOXNWNF1QCVzJVPZq9
	bLRM/hItqTOIuYSVfvp63o0ZOKkpoRlg6H+ZGLBnPN5yoQUESxG2AcOWIkMv3mqIZVVT5axq1tKSN
	hb599cnDSmpZMrTEEbNstoYfm6TTIRc4CyPDu9dzC3bqdbaX/2K1fAZrJOm0yTU3hWHRgTbDwD89N
	w0Jpw+9qbifkqqcjjr6G84kJyLt2V7WtQtZKfZ2GhoveY/gFV8QI3++qUvZHiLPY45s8EjhqjJN6R
	g/bUE0J0+7xK5nz55LJc5gZK3mGORFRakkUSw6V3f1RoNB3VgGr5bt/riwrV0pilZsGV3fYtPXK+6
	c139ILiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjvY-0000000G0k5-0jL9;
	Wed, 21 May 2025 13:56:12 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjFg-0000000FtZu-0me0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 13:12:57 +0000
X-QQ-mid: esmtpgz16t1747833073t96ab1b52
X-QQ-Originating-IP: eJZV5Pq/27UhC6wbS5MVd9IwULhg6bRfY+vB2uhghy0=
Received: from chainsx-ubuntu-server.lan ( [116.249.112.84])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 May 2025 21:11:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16382578765588849597
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
Subject: [PATCH v4 0/3] Add support for Sakura Pi RK3308B
Date: Wed, 21 May 2025 21:11:05 +0800
Message-Id: <20250521131108.5710-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OEWWctEIvgU778IB4A/nuQSiHxg1q5POncNoxMLXp13er0M80zzr7q/L
	IHHIY2eBbYespPBkHs3VtIsfdxC1+V+/pEWZEOeFxe845WI1lNDYK9ewDG5+CfIEEOqR7xb
	57KxoB+mqV4SwG4QwZWYgOvDxwI+MCFpv+QSCJICOKCZpPbbFrR87WfwolIdIXsa7fs2OKr
	CW3xenuiitYw/QMNoC4vq4gKSpFj97G+f1PkJo0cHTiBteB4euvs6f1YpubdidzSLBT0Jx8
	nQwUr9tdLv2KEhb7+8G7r+5boT9YVujFZ5nlIsB+IuE72KC4/Cz0rJFjEmBQodwRI4kfj+k
	OprxLwd7bTiguQx9zmANhiZGCP9ZCOWe6w5HJ+QK+IugpDaXIzy4EVL94nt0FKeaI/0ur0+
	HUn5hgKybqWpP3PthhYbRmxhczTmuNyRB+2G0AmKcL2KMMhNBPQua0c7J4Kvezh3uVmPZRM
	yAEk9CdU36Fc4+0BlmA7I5y2k3S7bir+Lc3OkB7aHbcJdt4v2t13z0jS8tehT09rEv8YSck
	rCH0vWNbI79/RbgvmUmMIo/s1m9HrTjVumZ+48l/5Q11Rsi3kY84ZqWJICHguq2dt5lqbIB
	5kDaoOJYG+Wrq8BTHBmMRMxqDx0OfgcXjJAq2paV37OQIi+znkEqynyd6JnuMbTcQteTwEN
	Y9AOzcRQWrSH6tdNDQzkXAh24CCKhGmcOUayjjKG00u8Iq9Ps7crSHjj4RWpz3Dz7maX5e2
	waFQs+Td6LtkPkwa79ybgkrVeAvUfbMqYMB7fMZe8/X34BKiUgqKCKOFByKkvLj4NyGj+jM
	+B4SHj7wKYYg0Jom+8OrvsjdoXPR4Dj8aeXb1gXaPuGCUiJslC+0Qotb5Y6lSuEw754mU/a
	0ZmYIioW1fbGIu4l8+CwsVzfcU3rJKimo79hGdsyMPkLSPm5OJPJ+h0WvVAGVZE3RQqrGIm
	2SgUZadiHxJI5AgE8bVKOcQO58za4NCZyHDGdd3+u+/5HDwLj8wH1Mlx1Beyu8DP+Nwnqpw
	xWMAby6w==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_061256_646749_CE7F3C0F 
X-CRM114-Status: UNSURE (   9.70  )
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

This series add support for Sakura Pi RK3308B.

Info of device can be found at:
https://docs.sakurapi.org/article/sakurapi-rk3308b/introduce

Changes in v4:
- Fix vendor prefixes error (Krzysztof Kozlowski v2)

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


