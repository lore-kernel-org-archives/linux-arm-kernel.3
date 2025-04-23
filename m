Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BFAC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0GMMIZoKStwFakjmexDJm/EpJcq9e3hrkLkn9R4KwE=; b=n55eQ+/c+yAc0tgAiluVNZUrc/
	nxer+XsOMKovhwYcv2Ngibn408Ny8I6GPTuq0ms4pOdYnUUQvp3XSQTbYGayaquIisNiFdg3LR6Wf
	OZR/9L7MbmPw76awOZn7m/cA0h7pkQAuwJYH1BffP9tFslQCWN6plTxJt7h72fYXv58MCjfoDClqD
	nwh6rIlcOWeiLy2FjP112yNmhtv6cyNLa+K//U3/kG1RchHBRWc2skkzaCSISKseLeRtiSHMINMr8
	xVkR7rfoXwCRRaslz4WXXZTn9Hy6SghNZP7gD1RroZLK2hoFJs+hfTheaji9uF7Q6a7JkHf0/7kle
	3AYPPi1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Znf-0000000AXvo-0An7;
	Wed, 23 Apr 2025 13:06:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7YaW-0000000AOFQ-0zcV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 11:48:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C991944E5D;
	Wed, 23 Apr 2025 11:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CF1C4CEE2;
	Wed, 23 Apr 2025 11:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745408903;
	bh=VUjQSnbpe34n4H4pjsG/e0RneYGeJ6IEAMI0EPffIbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jvq0XRxNhZoppgh9qzCZg1srPngC2jUPOMRakVSq2EoT7uduMeaby5L0NsSFTWXjh
	 T5EOWw0+GZGGdk/8ODO1S8mnRehBulTYEveU1NMgbv5I3gU1oJ29AaQRQak4c0laDa
	 C+iU/HwHxE7hHF8Ag3QYOOMzjiqnFhwuvJgVdnj874lxUj50fFXPH0jn4eFBJrm3HH
	 Cx/aYWyGZ3apZJ77pkOLCLJGWwG/duC31tlj5MxyC76I6+MW7KTGntLz0WuwEqJwJ/
	 H5VSo3Ay1JB0kIoE6DhWucSDtaalvlCpA3M1lR2gcyJYbOPJ98xko8GevrUPc258yt
	 1VwgdxFTHNiZQ==
Date: Wed, 23 Apr 2025 17:18:19 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Robin Murphy <robin.murphy@arm.com>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: ARM_DMA350 should depend on ARM/ARM64
Message-ID: <aAjTg8dgvxqLQOwQ@vaman>
References: <50dbaf4ce962fa7ed0208150ca987e3083da39ec.1745345400.git.geert+renesas@glider.be>
 <b1f19b31-3535-4bb5-bcef-6f17ad2a0ee6@arm.com>
 <CAMuHMdVJKA8zYETKJTRAwg6=+EuTq4YqbFO32K4+py9YNsD1Gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVJKA8zYETKJTRAwg6=+EuTq4YqbFO32K4+py9YNsD1Gw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_044824_300069_8627539F 
X-CRM114-Status: GOOD (  15.35  )
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

On 23-04-25, 13:11, Geert Uytterhoeven wrote:
> Hi Robin,
> 
> On Wed, 23 Apr 2025 at 12:59, Robin Murphy <robin.murphy@arm.com> wrote:
> > On 2025-04-22 7:11 pm, Geert Uytterhoeven wrote:
> > > The Arm DMA-350 controller is only present on Arm-based SoCs.
> >
> > Do you know that for sure? I certainly don't. This is a licensable,
> > self-contained DMA controller IP with no relationship whatsoever to any
> > particular CPU ISA - our other system IP products have turned up in the
> > wild paired with non-Arm CPUs, so I don't see any reason that DMA-350
> > wouldn't either.
> 
> The dependency can always be relaxed later, when the need arises.
> Note that currently there are no users at all...

True, but do we have any warnings generated as a result, if there are no
dependency should we still limit a driver to an arch?

-- 
~Vinod

