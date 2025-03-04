Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2090C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 21:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rIfnbOrf1l0fsM5aMUO2r8IAn6taUUuSG0I0y1QBiA=; b=IVF8j2+10wBHyq0D6FsSOBaK2r
	l8TjgNS9IBPY+DbkjbLiMs9AheiYslJSfOEymGWqrDSZ72VV9MjBJrerWuZuuU67Nf+dOt5S0yEdN
	FPxBGovqPZsOhNAsWhOYUePM0qoqk+R8fFdoAUiDRsUW8zTGmaXCGCjaza1bR8JSK7QioQoDfCdkP
	xxzFaMrL3RtkKzGU/lv0TXbmUEJ4aZQtNfWj5/25gpLZ1pDCYryMuqTJYnXUmyxeRJQ+8rEfnMJ+d
	q6PRtYslYn6miBHegigXg4UzNnKsmKfL87bYTtP4yrnFSneuNMLaHhtu+H3IhgIUSWAPfVukNrqMw
	wc865zig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpaBL-00000006L0R-3YNW;
	Tue, 04 Mar 2025 21:52:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpa6k-00000006KZv-1vRT;
	Tue, 04 Mar 2025 21:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=0rIfnbOrf1l0fsM5aMUO2r8IAn6taUUuSG0I0y1QBiA=; b=BvBFLKtyhN3WQMjaSU0H/wBwXM
	TbK0zMiZs4UyvmrT5cE6aTkkzoQpJaVslqdOOelmnSUhkfUQB+9PTna/SCsCKhbp0L1uTO+i2X+wD
	C9V7V7SzLUldMRUySiS3RStJdTjDkB1sWLHj/pdIInw0JoYbhECK0YbBkdmoIhtKM/K7ApdZ2pAWM
	2TWhlgKr1dKrgSKBMvSdd90oxaBks+KY7JCrEzJWKFDRvTjEVmuIkvCxAh9mj74uFUMwkFxf6H/En
	uny87W9gvfa3PVvII8YcULXchA72WJd+X8z7cAeSJdiXCgSxauOUmxPxWgFJXyqyeeLexx3KjXGon
	cKtBfbcg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpa6h-000000049T3-213J;
	Tue, 04 Mar 2025 21:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0rIfnbOrf1l0fsM5aMUO2r8IAn6taUUuSG0I0y1QBiA=; b=p++C3az+ikBnh5BzwTYj/7f8ki
	hW7fPGnn2rUPRj4xsGpDFTXIJRR86v3jPX583cyWDlGrRFd8Hs4COTw1tGbYAdWn+sNOGqNBEh3fs
	J+ri/KYCqBaJgOkirKuc5lw00mv57MASyI7IiNYA3vqCiBWA75nr9j91/hvbOLgVlJWvoUFj7IBMf
	frDNmARAVI+LLbWWOgtSVPVXA/oh1fMrQDdS9uP0ealKj7+HXbLdeFbhE3P9I7mPoUDmiJMSsFXny
	llOdGrwkTDNAL1Pi/0PVkp07ZKf6DBgSuvnkYGylWwa0L/bio2EvRyzJduX3N4AlgiptwvVJ4k/g7
	JMwYvPOg==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tpZb9-0006Ex-UJ; Tue, 04 Mar 2025 22:14:44 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	detlev.casanova@collabora.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 0/3] Add display subsystem dt node on rk3576
Date: Tue,  4 Mar 2025 22:14:34 +0100
Message-ID: <174112278794.341367.445088781126200714.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20241231095728.253943-1-andyshrk@163.com>
References: <20241231095728.253943-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_214719_550169_BBAF660E 
X-CRM114-Status: GOOD (  11.55  )
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


On Tue, 31 Dec 2024 17:57:17 +0800, Andy Yan wrote:
> As the VOP[0] and HDMI[1] driver have already been submitted for review.
> This series enable hdmi display on sige5 board.
> 
> [0] https://lore.kernel.org/linux-rockchip/20241231090802.251787-1-andyshrk@163.com/T/#t
> [1] https://lore.kernel.org/linux-rockchip/20241231094425.253398-1-andyshrk@163.com/T/#t
> 
> Changes in v3:
> - Split from https://lore.kernel.org/linux-rockchip/3330586.aeNJFYEL58@diego/T/#t
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: rockchip: Add vop for rk3576
      commit: d74b842cab0860e41a45df0dac41e4e56202c766
[2/3] arm64: dts: rockchip: Add hdmi for rk3576
      commit: ad0ea230ab2a3535b186f7fb863b4bca7050e06f
[3/3] arm64: dts: rockchip: Enable hdmi display on sige5
      commit: 2062b91b9f3c6afe9c2a7d1ddf0f3e6af5f3fa31

I've adapted the patches where needed.
- Moved the grf to it's address-related position
- updated the irq names

With all the driver patches in place, dtbscheck for the sige5 is happy.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

