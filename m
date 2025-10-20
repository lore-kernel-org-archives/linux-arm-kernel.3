Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2DBCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WjROErYKhqP1tAcIgogbcXDGMXU77l41sCaQUXRHT58=; b=2+QqmLLsCPHki16BJS4PxcuMmo
	izscLpu5Jyj3T2+ukyBpKEYyB/N8pLEX6FntNGqucCy4DoglF9J4hVjbtOlgR5H1dMNg4cDG6Uzqk
	b+lnMTND3vcyr8cGFwXLgM2YsqvXFxR5HroGf0vwzpHEfsE2crCgBil7LiS8ZCU7Hk9qZYQtwd2Ez
	YvPAaTZZd5fAXGsHesxvMOapbIfCpKHYKAs6uQgS6G9k8b5DjOWszrSMwZ9D6Ytvw33abQ3ygwyL2
	skFbSp+c1TR/HzlvX3oqOzmKGj/OtKEyiR/8DFvaTQBrvSWnAzQTvBmjQ2YwjpzmRKJYbY96GkYCS
	SLUHVOPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmoI-0000000CkmB-08q5;
	Mon, 20 Oct 2025 10:08:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmoB-0000000CkhA-20iP;
	Mon, 20 Oct 2025 10:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=WjROErYKhqP1tAcIgogbcXDGMXU77l41sCaQUXRHT58=; b=n1+dgc4Mmf2n6Hd9sgJcv2kU8Q
	HLLAJ7iGtDVf97mKPSMR3JCy9Pa+n4pKGXoN83/0M0TG0Kv6rWwD8ricFEsKLBR1VJskNlKGFDQt/
	QgxDbZ+bxhoEznsH0o4rImXVHydV9rD87XVBPfYkWsnAGUKpYOuCxPO8vG3SlkjbJ6YIRL5G3ac3r
	/QXTRajmdgbU0mKySab1vGMNHaJe75bOoe0qxxb5pORgvqrCfen/qfZLHiReL33d+Jc3wNhoelOIs
	ar76i7VU7w09FmXE8l1fHszR8MgmDdKjZEX0OysrbbTlzMFiV0G6DENtcO3641TjeSG99AqmNd2RX
	1d9nM8Dg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmo6-00000009hqk-2nJD;
	Mon, 20 Oct 2025 10:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=WjROErYKhqP1tAcIgogbcXDGMXU77l41sCaQUXRHT58=; b=2zzLq786MPGYz/ygrrkx47jIO2
	hX7u7VHjOEWgnFQACkEzIvGdUPTnuh41mbdg41CpHLyP1yGjq2yHEfvckxLi+9Mt3ZiltGwUe25uf
	wQgIIGujIgoZoqWDObXFivGSEhsaAj5JAqZENtJIQzZ3P9F+BzwO7oOJgEEXI+cz5TlEZnzqYzTVA
	GAn4tddo1LsHlaF3+1EbG15Fjjbrk0R2faePJ40QDls9nVUj47zkZtM665ERs0v/fNV+RjjHES3e4
	QvDco66F+q1d02kNWhCgBNVUU4cYMdTwsuV7+/Is3gwGJNk5c4WPUz3JmtzQSNoxT2ZEuRbzoFaFt
	IH5s0muQ==;
Received: from [141.76.253.240] (helo=phil.eduroam.local)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vAmo3-00083f-Qb; Mon, 20 Oct 2025 12:07:59 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Move RK3368 Lion ethernet phy to a mdio subnode
Date: Mon, 20 Oct 2025 12:07:54 +0200
Message-ID: <20251020100757.3669681-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_110803_155277_84C2A33D 
X-CRM114-Status: UNSURE (   9.87  )
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

Don't use deprecated snps properties to describe the phy reset,
but instead add the mdio bus subnode to the gmac and correctly
describe the phy there.

This will also help us later to handle a lion-specific oddity where
the phy needs to enable its clock output for the needed mac clock.


Heiko Stuebner (3):
  arm64: dts: rockchip: add gmac reset property to rk3368
  arm64: dts: rockchip: add mdio subnode to gmac on rk3368
  arm64: dts: rockchip: Correctly describe the ethernet phy on
    rk3368-lion

 arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi | 22 ++++++++++++++++---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi      |  8 +++++++
 2 files changed, 27 insertions(+), 3 deletions(-)

-- 
2.47.2


