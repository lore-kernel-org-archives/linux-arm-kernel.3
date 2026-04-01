Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5537D35176
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZlK0l2SQ5n6NAHhyhxOVABRZk0Ta297xVqlhIniAOo=; b=F9WB+XPn4GDIjBPkGJ/j2XDPv8
	QR3W+8tttHD3p7uQ7INNKpO10BL9Z815V4Y4djaaBQEVVLALT7KXD/t0UH1DmtTkQjqfa8VV4jORj
	TAG0sdBQxK6UCkPzmQ+SC4ci/9OnWgjnzKIVE7LOuDBuRa2YWGkwdrTwZEGWsOUcF3Jlq1sxQV9lY
	dmlZ3SrCEnewLE+dxAr3rwi7FRKR/4vZWyA9zsbSMeLxUz4TFcnl03g0avbwYTq3QYU9/DkO9AVZA
	qVYb4mKRr+R8l8j4000nqkgxC5DPr2jRwV+OxncBOAty9XZ2j/lmqq0STPV79Mw5/zrx15bQ9armx
	mvPP7h8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tuO-0000000EfDa-34qa;
	Wed, 01 Apr 2026 11:38:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tuN-0000000EfDT-3zmK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 11:38:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1365F60142;
	Wed,  1 Apr 2026 11:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65000C4CEF7;
	Wed,  1 Apr 2026 11:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775043530;
	bh=vwnSiQZ99mUCmzzXqPBktCwlYG0prAlCiZI4JiplVNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bGi3bXl32jS6aAj8wQqLELCva0RyJe3oApGysu2vvy4MKOmnhuzOReKgG2geCtADl
	 sSSu8CFoh3SJEMn5flLhlSoJlngkewar/8WjmgrNbf6UOsDJrgE3MNsvy2D2YtGbb5
	 e8xe6hOfsyhZze60TlyAFpyvzFEAqZrs7j3EH5vf+RHiL8AIjuteCtzhA1hQAs62ix
	 S0iTLks/UZRSg9im5ctkGUeW7mB469OR6X9BWgSFNiLQw69QOGsNFaa8bm0eIQSHGl
	 geFaPwwd+rQQasVz7H+Mj5pk9/GnJMOGxRUDrjCTqwHcyDocvilnEJ2U/UoRZ+536i
	 YiolfgPQ+DDxA==
Date: Wed, 1 Apr 2026 13:38:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc <soc@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] nuvoton: first batch of arm64 devicetree changes for
 v7.1
Message-ID: <20260401-resourceful-fabulous-marmot-e26db2@quoll>
References: <8d8d5f9f7f8ee803ab14c4b3405d74b305a2ab81.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8d8d5f9f7f8ee803ab14c4b3405d74b305a2ab81.camel@codeconstruct.com.au>
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

On Thu, Mar 26, 2026 at 01:56:03PM +1030, Andrew Jeffery wrote:
> Hello SoC maintainers,
> 
> Just the one Nuvoton devicetree change for v7.1
> 
> Please pull.
> 
> Andrew
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoton-arm64-7.1-devicetree-0
> 
> for you to fetch changes up to 6ee3f20368a4a6198988a54c1a744cbae1354359:
> 
>   arm64: dts: nuvoton: drop unused syscon property from watchdog node (2026-02-23 09:43:36 +1030)
> 
> ----------------------------------------------------------------

Thanks, applied

Best regards,
Krzysztof


