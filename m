Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2899C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 13:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqGzq89IULFygGCh+fzzyQWKC6RyF8OgVpSG2yI+pcc=; b=Ag9jTH3vrKDAZ5PYtkkaH5ZHh6
	OO8cwhzQqGnuUZHvapxPoRsUyIaV+4pn81etO27A3t1dAzRKtQBO6En/R6EqXl/B8LX7L1SF+d5T8
	54g4Oza2DUfs4NuCk7g9w5E5ysJc1PLA5WvR1IFh0+1jM6PJx0jlaIPBFv7IUYLWwuqtZNZ9WIVUJ
	4uKrhlMDnrOLcrcpy1iuFX61Dq8MdTZmHHcFZoHLS+Xeb61aAj3Mq4wBdVk9TQzVbTkGM71utR2CC
	+mVB9tEiBrKi5Ty8rZlMEzegnXKL+6peSgo6rEdHR0oxSpH1PSU3R0goHwHtbLjJ89+bxJkCAM/Ue
	KZGVbVxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Plf-0000000DEM3-34Vt;
	Thu, 17 Apr 2025 13:59:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Pjp-0000000DE5y-1aUq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 13:57:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BCDD168457;
	Thu, 17 Apr 2025 13:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D18DC4CEEA;
	Thu, 17 Apr 2025 13:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744898228;
	bh=mO8e5Rhkif4H9wdgoBkn/zjw5CfO9Vgmvdy3dOH39So=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AmSZCyssOdstwXHGeEVJDT92GEUBsvus4C957V+PkqkZGkPALnth2iV9sPXM1/Yc0
	 aw6PyzVm0QTvU39vAFgdnlhiuHLqubvPrCRhshmsR1DHypzxJda8DNnrriJIAy6vGS
	 SY2GfpXHwvVMLIQZgUX3OjaYWu4Fbk29TNxUpHOhcCzDjHjoHOwsWLol/DORSFqPiu
	 W2U0DqpO6kGCqAUyP3YG1Dn8Ll19772e2DBseaEk+nrSjBYaq5d2FMcfmgt5d55Hn9
	 sPP1ig+HDrLf6R0X6lF5aBJsCOD1KHhrjfwc69SuF/slzKr54cn0T+fWxSsWZbGmF/
	 cjU1bSLD0tymQ==
Date: Thu, 17 Apr 2025 14:57:02 +0100
From: Srinivas Kandagatla <srini@kernel.org>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: fnkl.kernel@gmail.com, Sven Peter <sven@svenpeter.dev>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 2/3] nvmem: Add spmi-nvmem driver
Message-ID: <20250417135702.GA30334@srini-hackbase>
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com>
 <81fb1290-fb39-40b7-9d79-f147fae5b269@kernel.org>
 <aAEG6D2hjtVOlhS4@blossom>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAEG6D2hjtVOlhS4@blossom>
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

On Thu, Apr 17, 2025 at 09:49:28AM -0400, Alyssa Rosenzweig wrote:
> > > +config NVMEM_SPMI
> > > +	tristate "Generic SPMI NVMEM"
> > > +	default ARCH_APPLE
> > Why default is set to ARCH_APPLE?
> > 
> > This will endup with y in arm64 defconfig, means increasing the size of
> > kernel.
> 
> I mean, eventually I think we /do/ want M1 properly supported in the
> arm64 defconfig, no? I'm not sure what the criteria is for any other
> driver to be defconfig or not, though.
cat arch/arm64/configs/defconfig  | grep APPLE
CONFIG_ARCH_APPLE=y

Criteria for other drivers default should be not selected, 
and should be module if they are part of defconfig, rather than
inbuilt. Not sure how most of the ARCH_APPLE drivers ended up using
default ARCH_APPLE.

--srini

