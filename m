Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9A2E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 16:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obxeOv5xS3pelA9rBXGzBgBDhhTmHuY1TLuS9kkDxuM=; b=qnd2EGcFCDxGSpSq670b8NAus1
	9J3kgtmuc7s49NmoCEWldL3wiG7Uf9UpT4g/WyAlHS0/rCE+bPepZBfKWDhgzpSMXnU5HA6uiXuoK
	tDM5i1fIBcJhIy5fffBhTuQtywKJSgloAkjmGGliP4TZNlvNaHHIdF22bVwpSNRDaetxpX7Unh4C5
	zoiAGUO2nzbTLk7I7If4rE0EqPA9e8kojbAx5pZAwXrfrlfSYjnS8jh0FcUaCTRepuo+zJ15v3gwJ
	7DKn3DvBwTYaGp2+e28ISSYz/aXcq3zd2+NU0e3sD0qUMvnLhH2XCN5eJnJUP5pGbq0mtfe+Bpngp
	IDYuLzEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNx9q-0000000HDe4-3BAi;
	Wed, 18 Dec 2024 16:44:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNx8O-0000000HDR2-1T2Z;
	Wed, 18 Dec 2024 16:42:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=obxeOv5xS3pelA9rBXGzBgBDhhTmHuY1TLuS9kkDxuM=; b=b9NzLt6aR6WEi8aZiCa9QDGKFj
	b5YEFDWiz6NiZ/qWC1v+BzaqszvXu8Kb5OgZXrYqdP0anWHF4JBVyLg9NinBO32bGdfqkt3gwJwDR
	fRNc4miuzUebN8mYkOL65cCvvEFLUj6dqdSPA/KR1aON1oqT1f9iB2ll85DvYVuPYu5MQCSjvkAgv
	1N4ffaWNDWZo0e0llTBpcoBDmUQEbNbsV4hjDvKgtQCu/AFDRnQk/ml3nEcoHrFvRfgBzNpgF7Jma
	YtBaW72DPcF240N1J5K/8fi3nUvaF6nHqYGNCRbAsfGDN/ff/tt0r2iwcz/D/sG3qRq2XU4B0OCEY
	ChVAMQRg==;
Received: from i53875bfb.versanet.de ([83.135.91.251] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tNx8C-0002kl-87; Wed, 18 Dec 2024 17:42:40 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	hjc@rock-chips.com,
	krzk+dt@kernel.org,
	s.hauer@pengutronix.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v6 00/16] VOP Support for rk3576
Date: Wed, 18 Dec 2024 17:42:29 +0100
Message-ID: <173454013836.591676.16677827979094919661.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241214081719.3330518-1-andyshrk@163.com>
References: <20241214081719.3330518-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_084252_482585_756BF0B5 
X-CRM114-Status: GOOD (  13.61  )
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


On Sat, 14 Dec 2024 16:16:59 +0800, Andy Yan wrote:
> Thanks for the basic work from Collabora, I can bringup a HDMI
> display out on rk3576.
> 
> PATCH 1 is a carryover from the working when add support for
>     rk3588[0], is very usefull when some people want me
>     help debug some issue online, so I really hope it can
>     be merged at this round.
> PATCH 2~8 are bugfix of rk3588 alpha blending which report and
>     test by Derek
> PATCH 9~13 are preparations for rk3576 support
> PATCH 17~18 are real support for rk376
> 
> [...]

Applied, thanks!

[03/16] drm/rockchip: vop2: Set AXI id for rk3588
        commit: 7b256880fdb2d7f23393b87bb557090f049e686a
[04/16] drm/rockchip: vop2: Setup delay cycle for Esmart2/3
        commit: c766998ba6df126ab6934d32ff2ff080316ec630
[05/16] drm/rockchip: vop2: Check linear format for Cluster windows on rk3566/8
        commit: df063c0b8ffbdca486ab2f802e716973985d8f86
[06/16] drm/rockchip: vop2: Add check for 32 bpp format for rk3588
        commit: 7e8a56c703c67bfa8d3f71a0c1c297bb1252b897
[07/16] drm/rockchip: vop2: include rockchip_drm_drv.h
        commit: 77b1ccb2a27c7b3b118a03bf1730def92070d31b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

