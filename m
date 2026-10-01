Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F755CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 11:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZYiPvtNcrffY7Ay63KQhcl5bvMLOR7QVe2mHkSjCNY=; b=uKR20PkmBD0NUDO+WPVcVYnpdb
	8GtzaowhJRy6YRjCiWqh4IPjqvT3mXA0pe54vY4XKIuof7/BpKgJvXqx5vSe+bf/fObIR+mblq/9J
	j7WD2YbbZvEA+G68nItqnN1aPoLAXFSW31+NHUfHhBd/IpLjLSlokHvP3Nn3579y/I6f9/Q83F+St
	jYYsgbyZ+Z6f3uzqNc3aQMVc6XlxkfN+es7W/zp9QUwiT8jVXnoiP/7kSpKF5U39fLzruv2Ho3kgo
	MDEAzHlOD2rf131v7FALAz4MCtY4fnZN8bD5ksnUwSVgEKN0V4IDVFw160uhvxD5pqOS5bE8RlUQb
	VbneviBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFJQ-00000008geu-0Oft;
	Thu, 01 Oct 2026 11:50:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFJP-00000008gef-2kQ7;
	Thu, 01 Oct 2026 11:50:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2990744021;
	Thu,  1 Oct 2026 11:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44D71F00899;
	Thu,  1 Oct 2026 11:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790855455;
	bh=rZYiPvtNcrffY7Ay63KQhcl5bvMLOR7QVe2mHkSjCNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hs0AK4OZmuEBYLvLfJJltebCbczCtGNT7ZlMgjJiptd89xDI97/NcJZQSkSIrZaix
	 Be5R5sZUuN/h7+rNflp+QleaQi7e9p6fkQ1Geg4N3MIQYneYPLvZHMLNCdeRt7jyZl
	 jZIfvCwbcSge59pDGXHCRUScwE53ze/147sZnljgaTLMn8nj/mRxsgejCqLlKpN0lS
	 uH6bjaVj/mxRnHT/T631DwSp9pgm4Q5AsvIsqoLvPE2x+ZEewiWYXVqpIwmhwbtoge
	 u0cmNa9JN0JRUeRTtyxYFv2gE924XJ9i7SHnpFIlDNaJIHLIhXFbd4Twf8l1e6Dpk+
	 w4y5jQFU9on/w==
Date: Thu, 1 Oct 2026 13:50:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts64 changes for 7.4 #1
Message-ID: <20261001-amusing-fat-parrot-a0c726@quoll>
References: <1940582.atdPhlSkOF@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1940582.atdPhlSkOF@phil>
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

On Mon, Sep 21, 2026 at 11:44:31PM +0200, Heiko Stuebner wrote:
> Hi soc maintainers,
> 
> please find below some initial Rockchip DT64 changes for the merge-window
> for 7.4 .
> 
> 
> Please pull.
> Thanks
> Heiko
> 
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.4-rockchip-dts64-1
> 
> for you to fetch changes up to 7aa165b62ccaf340da22c517074e7c6853db55cd:
> 
>   arm64: dts: rockchip: support CAN1-CAN2-UART4 adapter for RK3588 Jaguar (2026-09-02 13:07:56 +0200)
> 

Thanks, applied

Best regards,
Krzysztof


