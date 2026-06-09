Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EBDCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 11:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Kq9pjIGs4k5XRIg8S2MPS7in6Zvm8dz813etexEqlE=; b=hJIXkILJGFer1Qv+kXE/Y7xo7f
	22rj4ld0mzPGmctnCJPBYTep2Gy5eb9+SUL4/+kZNE/K9x+x8c9D3HEe2yBBxM5u0SfNfplcdnK78
	EH1BfF4uuanrpCgJK4KhL5/fN7qKBiQwcDVTDwR03SP9BTqoyzNtznxmfzgswOHEy/MO5OIw24qFS
	cunToP5GYqM6AJp+Rj8/V2xA/1gwLt49aaYjti4I6CvDnjkXOzQktV5JC8wYA5zAE7a2MDpwsm0am
	jZy/IOb/Tok7RJUtk6RZR+iSScCPF4zd8J0nNEjyrYZoBXuM8vK8k8ns7N1palwXifTBb54p5e68M
	iHurwZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWun7-00000005SAQ-3glf;
	Tue, 09 Jun 2026 11:38:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWun6-00000005SAD-267q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 11:38:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A1952601D6;
	Tue,  9 Jun 2026 11:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14111F00893;
	Tue,  9 Jun 2026 11:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781005123;
	bh=8Kq9pjIGs4k5XRIg8S2MPS7in6Zvm8dz813etexEqlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zhb8Ij8T8ArBH7SDGoyhQpRzEkfu8n+prIpwV14sOpuYTah5F5worInEqZIu2tGim
	 lMziWyx3GFhQhyPmu2G4h1oUZSIfzV7br9w8uaoeglhGGt677dUNDgLhFjXL6dadGU
	 wyJgzgX3vKpT5F6pKmLo+ffpohejn6raoXz0c8if1APUowHTok0M2qQGEFzkNgT954
	 yUw6YfBTxUs/802RoHOvqfAiPcWOXxZgX2c5CF+SWwCjyEXKIncYvvpFTlXJBlJVT7
	 gzlTe8vUQURw28EpN6OoccewGnZkEHiwJtNoC1+gJNgQTxoKa7MWB+Kuayp5Ne58wS
	 3Uz7YXBfzwH/g==
Date: Tue, 9 Jun 2026 13:38:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Allwinner Driver Changes for 7.2
Message-ID: <20260609-woodoo-tremendous-beagle-15cf3a@quoll>
References: <ah3YkTZAR2GXlC3x@home.wens.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ah3YkTZAR2GXlC3x@home.wens.tw>
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

On Tue, Jun 02, 2026 at 03:08:01AM +0800, Chen-Yu Tsai wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-drivers-for-7.2
> 
> for you to fetch changes up to 61192938a5870ac36edae81e4775b680dcf02c61:
> 
>   bus: sunxi-rsb: Always check register address validity (2026-05-25 06:37:11 +0800)
> 

Thanks, applied

Best regards,
Krzysztof


