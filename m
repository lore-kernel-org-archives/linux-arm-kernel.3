Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0031C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 16:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p+DaVO2cKrSOXgglvum5rI2KZ5xMz6zVaQvUJIMPN0I=; b=i2fylqWYR85BdW4w+FToDIpGgj
	tglI9JTlsdKbjD10W8tgloGiyRFJBmUHcbwzAdxmBNgfcCRcZFfHzvAWdnxr6qbmHM74T8BtCqbDJ
	JBzRh0jF6Du3VoBANAFWc2TG5Op8ylyDTE2fUqmgQh+D1FtfyQ5xZ4wzy6B11dhwWCCbPTT19DyAx
	W1F9kN2HuKvYNHoKN7Nz3/xxd859XYsNHO4bMt2Rir3K0P4Q4beyvrA67vO8piYp5z7jkDGgwLdXB
	T0LHF0IOhSH4dnNVsCGKhWx1MewsTq7LavwodEFAKfxQbedcmaPOw/0UvJeNGihT3njoS2rouY9gE
	3mY8biqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsye-0000000D0pR-3Ivy;
	Tue, 13 May 2025 16:59:36 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsc2-0000000Cx20-21pP;
	Tue, 13 May 2025 16:36:16 +0000
X-QQ-mid: esmtpgz12t1747154119t284e3be7
X-QQ-Originating-IP: 8uXPQpioheAdZ3NtmZqvxBvM7bPXQlo+Ap4Eyie6yeA=
Received: from chainsx-ubuntu-server.lan ( [182.245.65.132])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 14 May 2025 00:35:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15007006065327461002
EX-QQ-RecipientCnt: 11
From: Hsun Lai <i@chainsx.cn>
To: Fred Bloggs <f.blogs@napier.co.nz>
Cc: Hsun Lai <i@chainsx.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 0/3] Add support for Sakura Pi RK3308B
Date: Wed, 14 May 2025 00:35:11 +0800
Message-Id: <20250513163515.177472-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OPHbpUvlYj5kf0/5CT50sV+o2xrXMSEOlMIgbWi/qgk/jTnkcFi0kikR
	PuVgCyJUI95hyFK+dOcHIhToK/OBmJdTvowawbFQ261bXXw1tFASOT606U6p/7baKtTYssa
	ZuLJxa29ul8FsiQ6Y4alyRBrxfX/Ahh4CRKseiHu3T/Dc3aSdbVoUOh8NmOg917GYB1+rvC
	rj3Ya2Us/FDBVB/UEDZ6E+vzw/YdnjflGNo5kTu6MhX8yz+00g00ndnaz0tidqVy6gOlRl/
	Q7JQm3JUI5KAOuky+IV7X2lAE2sIvEXpxAIt80vr66gb2bQs59F9f/CA+Lqgj3pV4+ZUqQF
	F6Ck9HfuJ8/4GgORxAlkdYcBkAnmll1a14PMNQM0fZt/yeYqKPrp0egPceQH3IXqZjO5cdY
	Z5qzrAQ+K6vMTEh/6fhI4jFTRKj3UaIhZn3RF+X9Q/e48LAXM8lqNDdLB7DeYzW3+oytd23
	Cs1nq2/Vk3vvzA42G9K+flTc+KAvtRpPxMEW3IJC8O8BMjhCGsFAp4H0W23f74IM5LqUqnM
	ldUWzGwJAbicAVpj4k7XEdD5JP1hCSpuOoXPdSXDIueHG7QmdhDuDw/yye9zat0sqC63Oqk
	lLvQZhb0zZP0y3Gi7NgETUYr0rI4HCIaQfpGB4DE4Rh931af/8EtxUn6svDF886DY7J2J73
	4BxVt8YTURCjK5eFHaJ/1Y0Xy2BXnerAlGSr76Qna/LkzVQROHzyFL7lPnyyXUygUof0p4Y
	mncdBpv3/QYykFR0vplHgJB7XvUClkne2x/Rv57/Lq1kC8vRVB/3gcHOVWNdSvV5/lJ8odQ
	gx2IO7I8KCBLFQ9fgDQ5QkRDGCey359OYyD8pRq3ShHx31oGmMbcbdJYeKz/JMVIXFvyb7W
	AGO3pAXASqkGOzDyKcAdVMfJsHQiDp4J0FSDZvHEZYNNA3FkxfprmjHBJVodJTldaH44nid
	nmt/w5ZNdIa5ILv0tuTYSKA2U036dI5Ir+zA=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_093615_052949_96759EE7 
X-CRM114-Status: UNSURE (   9.26  )
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

Changes in v1:
- Add support for Sakura Pi RK3308B

Hsun Lai (3):
  dt-bindings: vendor-prefixes: Add SakuraPi prefix
  dt-bindings: arm: rockchip: Add Sakura Pi RK3308B
  arm64: dts: rockchip: add DTs for Sakura Pi RK3308B

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3308-sakurapi-rk3308b.dts  | 295 ++++++++++++++++++
 4 files changed, 303 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts

-- 
2.34.1


