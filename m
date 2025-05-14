Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28722C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 08:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fgAn+W098LeR8Lh3eBwV9tHNEUGssk34GqXfBvFmMz0=; b=AviBVnHo13Yo4WCy7AgXl6DZeJ
	c+IklLDQJqz4OSyg3cCnefxyKkJaaE9bNFYVCkF9A3KR3sZWNE4aGmwcID3EuvWIoZO4ev36f6+g+
	cj2X+2fVILJPybpDkxBvTiwNPNnqru6ss0r1tQxLHQ27J6SkRaH2qnfPPq1dXCeqoZQyOwQm9gmpq
	TG6yfj+6sFUQPSFXritiIkJPbkbAeBoZg1a0Hv0t9IN7odxbwnLs76VDP7kKy01HDOplRZqQSGVto
	zSE8L4PjDz7QTkxHRRTPIJ573HL4ml7FQ/mVmMWL8kYYjON9mVz0k8W5oJ4dFsJ8jHIpTIkr+USkh
	6E4NWYlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7At-0000000ERYr-11pJ;
	Wed, 14 May 2025 08:09:11 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF72F-0000000EPr8-3jHN;
	Wed, 14 May 2025 08:00:20 +0000
X-QQ-mid: esmtpgz12t1747209560t57538c21
X-QQ-Originating-IP: UkugXRb1Btj1MtZ3FYGKjn7tGsu8nL5lEn2522Dv+Ag=
Received: from chainsx-ubuntu-server.lan ( [182.242.225.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 14 May 2025 15:59:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4869173618778214123
EX-QQ-RecipientCnt: 10
From: Hsun Lai <i@chainsx.cn>
To: robh@kernel.org
Cc: i@chainsx.cn,
	conor+dt@kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	sfr@canb.auug.org.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 0/3] Add support for Sakura Pi RK3308B
Date: Wed, 14 May 2025 15:59:11 +0800
Message-Id: <20250514075914.194651-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Nn0cKypYUfjdbV0acRFjxyMfhlNsFPYKbPTemBtgV+o0QPcQh1HAEhXz
	oK3cPe9JXPRSKMgi84MytHxDPJ3ara1RffGPyWNmQq7LHq9UaLnELd+LuCeeH6wTsybLu6q
	1HleJyJat0zXWAzTcn1y6djXejyc9nNCKlCPXVKtFbMbtmB3QjbF50E9mERqV5F1KcwWYsq
	xUIKzzKvAaZooREHD5gXtde9T9GY/gRdblhu/yNvPyhHz6ANlTBd9ocO61VxXSa38/C+tek
	fCvRG1FDhYu/5Qeh1Y91HOpNUW7XLdTQcR6VoWe0LE8WpDu7N891Ax4ITyaEShuvZK4Bafa
	X9EYtDW4aPEs9KWHh/S5z857BdNqFxST6lZZbXIjpGzPbXOhrFtzI2CRCGYzN4vESfQYXAg
	tL3xQe3WXHA5jQg9386P4jCCcvbfET6u60QSJWWC8zdzH91zJUIoy9P9QjHb+kOItXQ1bsJ
	GJ+Xw+0tBJU/rpxS0XrYoJc/Y9F+kqHFdF85iwQ4Bhkx3UllPlmLzXs34DSksgl9Ye27ViL
	mPNClXXqNnqmry8HNb1GLE4qbDpmdgUQAbT63dXRsInpPskOJq8gHE7XAw6MRe7m5fwDdNm
	Sr/bU84YF5WVeTr1Fo77TbyZeaTTBiuxQ5y43crCxOnQxK7S8luTutvZDFg4yAU9pT1tH/w
	G4H8h8q7Gp2+pOQ8fTpAnpcg2EEv/bTiBWDADifVaVfi/KJgn7sP1XWDwzLGyG5z1BkH0eM
	P0W30mqfRAP/qSOy7XjLcOiHzfnwcow1rQ3EjGdaU1IlfagCJrfo7QgqVSr2lH1Q7vmzM2H
	1VEMBBbhzDLrEFQZBE8mfrtzg9R1j7xPlZt+/gnLOREI1wiYPP/yoRonFisLusJ04yYKlOP
	v29ZN+XMSvxOeaPkOmgd2KMvbKvOnw0bYLpJM1Tmfa1EbjlkTeirq/kn1xrLuBfX9gDvuSj
	u405XmtiOC1VZ08UnKbrPwNKN12BXs5dcn3ClWCaIuA09d+g9iPhN5Qio
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_010016_378046_CD213C96 
X-CRM114-Status: UNSURE (   9.15  )
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

Changes in v2:
- Update regulator names

Changes in v1:
- Add support for Sakura Pi RK3308B

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


