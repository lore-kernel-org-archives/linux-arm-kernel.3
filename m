Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE377E77186
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 23:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6qMZJoDhXUbvrzz8pOdo34xzZMBBlZ49Lix3rFbxyQ=; b=aKA5+ljRqEk5PXzHuwljKgJKID
	wxiXvlVVqyfjzh16iCSyTDwm5Jc+wBwpd7c+J/6XqgzpGlqeF5OFxWP+9t/fRwgvbl2wb+fTc8QsH
	wJQzW4WACw93YfR5ip7M8/s5JKpS3IZvv4e6YQGUHGNCffVkWeH73CjLhZ4/1bYMpY8oJgW32ykJX
	8r8YhiusMU7F2V0yFv1ANxyd+zV0dUptCiHkZ0su/Kwla8I284TcccWblzmNYTrnWMealrf6rwofS
	LtBCSNBgMULpT0tKHBzv768LWJ5Sd4dLqOqB2fXhD9raZBYLLH/V9lyVzSKmIq5eyB+3kdUppu+tO
	Ok9SHy4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9VK-0000000D8qn-1P7z;
	Tue, 10 Dec 2024 23:18:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9Pg-0000000D7qr-1sDO;
	Tue, 10 Dec 2024 23:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=a6qMZJoDhXUbvrzz8pOdo34xzZMBBlZ49Lix3rFbxyQ=; b=Fvt3fmaiFWWht9AoPwUG+KIf0p
	12noGPd5E/Sp8r3lrbpNIs3BSUMyILLWEq33ywtYHA0n/dwVmueG/+vzSQBkYATKDHnEoCnXeZGla
	WTx26uZYi4XR1sRSr3EsLmYb++KbsTg+V9Raxn630JkmsFQstRXtJ9koraEs85oaD3ZqTTYKK8Lql
	P+9aySQBo6X2+OWyKwxuIivL8WJEgdScN6N1KnsJhmtdYrik8NessFkk5S8pFGhGUoANuh+713CZc
	26jjlvijLyPU6c4CeF3XQxOkL4QE+X4A66tLcngqctCnOH/IHr0bHaBboFFsaBaUHTgCIW++JftBy
	JZfuo+0A==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tL9PZ-0007R7-RF; Wed, 11 Dec 2024 00:13:01 +0100
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
Subject: Re: (subset) [PATCH v5 00/18] VOP Support for rk3576
Date: Wed, 11 Dec 2024 00:12:58 +0100
Message-ID: <173387236508.2374456.8629854054013827389.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241209122943.2781431-1-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_151308_483421_618125F9 
X-CRM114-Status: GOOD (  13.04  )
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


On Mon, 09 Dec 2024 20:29:10 +0800, Andy Yan wrote:
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

[02/18] drm/rockchip: vop2: Fix cluster windows alpha ctrl regsiters offset
        commit: 17b4b10a0df1a1421d5fbdc03bad0bd3799bc966
[03/18] drm/rockchip: vop2: Fix the mixer alpha setup for layer 0
        commit: 6b4dfdcde3573a12b72d2869dabd4ca37ad7e9c7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

