Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A115C9831E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 05:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBIWcy1vQsXuPrlyorhunI9NkbUS7DCLeu13z27U1xQ=; b=rX4x5eD5eF2eWiXoOCmrUghPa4
	ui93iotrDKxaks1DVZhwnNuJE4Z/TXl5g9Bq5aF97wttAHzWLBlNyp7RrrEI3ufBtvedySs37OM5c
	hbJzry3/fQ/AhpuwbcvIe9F7wwMDOdRoO75oowxX2n5ze4U4Jy44yStWZl6JIKdU/c4lkbQLhLah3
	eQiWT8Huyd1JryCGRsCoAjAqSeQvZICaKLABTl+WTQYd0O3AAodAIlrdKACXBK7Tq0uWpkD0cfkZW
	AK+VGyT0YDmpUkOl6/ifdhi2tkcTEecpDtOUbLrlgPTXnH41uvWLT3Yw2dgDidSO8X7a3j3QY+tLm
	NWGF5AIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKde-0000000EzXU-2oHy;
	Sat, 26 Sep 2026 05:07:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKdd-0000000EzXH-0uR8;
	Sat, 26 Sep 2026 05:07:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AE17460136;
	Sat, 26 Sep 2026 05:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C1F1F000FF;
	Sat, 26 Sep 2026 05:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790399271;
	bh=uBIWcy1vQsXuPrlyorhunI9NkbUS7DCLeu13z27U1xQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IzsJ9KSPcy59rat2nVUbGyObxX9QWfGKaDnFH0gNG5g7VeLa1pKxsPv8J7E6tzqhU
	 ExufGabs0NSfALHSt8Eh2IgwDT8RDtLJ3kN6GMMYi5QDyqLsxKmH4qJ9MF+FRDtQJD
	 h/DozJzhDvY/3vBjDjO9vKsSkDJB9Q4d4hgBu75pT7r08a21cZEqDCSGw4Yw7az51X
	 8lu1HaHXceMzOWOcMWScUGN4AttB7f8ckAnhRLJxJdCWlOidRdBwEPrSsdzYZmAwSr
	 Ao+RXyzbrE9XfdzNdMMNfOYPPjjDK/IP1kcU6dv3LCO5hsQrnR0zKiQxZYe9WHtbqh
	 kTqXqVkLlnsvQ==
Date: Sat, 26 Sep 2026 07:07:37 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 02/11] phy: rockchip: usbdp: Rename mode_change to
 phy_needs_reinit
Message-ID: <hcvfjkpdmdjwguxuiaskugz57hp5w3srymnixmoak77renx2po@zmrjqrey7yot>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-2-8d507cb1174f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-2-8d507cb1174f@collabora.com>
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

On Tue, Sep 15, 2026 at 05:06:05PM +0200, Sebastian Reichel wrote:
> Right now the mode_change property is set whenever the mode changes
> between USB-only, DP-only and USB-DP. It is needed, because on any
> mode change the PHY needs to be re-initialized. Apparently at least
> DP also requires a re-init when the cable orientation is changed,
> which is currently not being done (except when the orientation switch
> also involves a mode change). Prepare for this by renaming mode_change
> to phy_needs_reinit.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

