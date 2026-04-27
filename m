Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FD6FF8862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 12:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RjXFmT2LqXRSu8h06jxFJOxb0tD8HtyilotvWU2F69k=; b=xhg8XtQconw3X0GlQuklsEgxj9
	5ilSHSax3Ns/kfELIEgYg3P4Flqb2EGCUpwX85T9EViJDIik8F/EJAbA7oBprYY1/4OEW6nbGKdih
	/R6w791hgav16jOq1NLc/5HOJKmboayOtLedtXTl1QLzkuPfCV4tA1koteP3DlkZP2yi5lcge2oAs
	AknxspTYssqIs7hAhsx7a0/z6YQyEla0pmsi2BcMOozYvYqwL5XyafjnzdpgBkhelgP6j+scqoZQk
	C5H7TU9sAykwkFRza3MjIh5Tz4XH2R7Q6nlBHFyxPsab2MnGInZY91YmLFRBEBEWNwRDpepSSCwx3
	PGxfn5JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHL0A-0000000GtDO-3HzL;
	Mon, 27 Apr 2026 12:23:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKzt-0000000Gt5k-1gc4;
	Mon, 27 Apr 2026 12:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=RjXFmT2LqXRSu8h06jxFJOxb0tD8HtyilotvWU2F69k=; b=PCkOgY/gwufn3qjLO1D90peSt0
	gqH66VKYUFG1kRIfD4mPs5SIk5I9GchSQFz2LuwPWA9V76H6QGLyZ4ASY2Hq0OERD10PesisBcRLK
	WoIYOAoAewPm8p4X1W0RqPXZYCvhFnMdvdSM+hrYYK3FeZVAMsdFPLm8G9QRBNGJ9O0Atx+jCiOIC
	kUOlDRgwBqFNSeFaUpriuJdOi3/TTCaLnwIlsH12BkPz3u9FsrIO8f0K1ZrcCkrglZo1LqkmPf9PR
	NE1QfvRXrsN+mEp+dMLPL9j1dO+ebJ1pxYyGghSYILk49XYedfq8r3YJYS5KLUTBzzpRVYWHw8vej
	aLauU2lg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: Add Rockchip keyword matching
Date: Mon, 27 Apr 2026 14:23:23 +0200
Message-ID: <177729258235.1866089.9356706006852644824.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327-maintainers-rockchip-keyword-v1-1-7f4634f761a6@collabora.com>
References: <20260327-maintainers-rockchip-keyword-v1-1-7f4634f761a6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_052333_442933_A936B594 
X-CRM114-Status: GOOD (  11.54  )
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


On Fri, 27 Mar 2026 15:21:06 +0100, Sebastian Reichel wrote:
> Add keyword based matching for 'ARM/Rockchip SoC support'. This will
> match rockchip, Rockchip, RockChip and ROCKCHIP separated by any
> whitespace character or underscores.
> 
> The goal is to match arm64 defconfig patches, which should go through
> the Rockchip tree as they right now only match the LKML and thus are
> easily lost. The keyword matching is quite good for this, since it
> also applies to the commit message and the config options itself might
> not give any hint about being relevant for Rockchip.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: Add Rockchip keyword matching
      commit: 803d2de23a9703705c1ed73b0c9f57e8db2c9c75

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

