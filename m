Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06BBC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 15:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEyGe6QgpUC7na+StO7//7ACAnzzoM7OnXjQ6aF8bAM=; b=WYH7skTDwnTl5+qcGAECuyOV+7
	o1npDUTPcTQzoHSNI5UnJfnxHfScFZ+MgaAQfDxUz/6yjb5pyKHQpFXr/wwVqM7qkSvExVMFhC4bP
	2bKJoz5d7u+chajHkXT0jdlQ1e26jxXS9WKF4E1vA8TpjKHzWjhgcGKvgcKTsMvTLanx2NgEzryXZ
	xYExR2kr7zMf3rqaOWFrelHCud3jKzKPRyQRqllwL+3eSxFngs04a025wwQRJjIv4bPi8al1KuodR
	G3jAfO+jp9zqyHSGbm438kIXKs7CnOr3yLw9hfSGNTX7H98QcWEIPLAdRRQuG3F+TqUgDZnd26OJe
	31//TsIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5RRE-0000000DYqK-05Ue;
	Thu, 17 Apr 2025 15:46:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QZU-0000000DNzj-1OIL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:50:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ABCBFA4B43C;
	Thu, 17 Apr 2025 14:45:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8413DC4CEE4;
	Thu, 17 Apr 2025 14:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744901429;
	bh=ydLwQu78BFvyikLXpxEaVTRiTBaEQwxwQL+LQghN1WU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a6rBNo+21GFbSyFtRSgtRLtdRBEHmGBjkySwyyv8xVXSZB9hXmetX8jJGOr/9lcf7
	 G6088TMvGliHy0mpHsB2NS7yIJtrVHg7067cwIlBMaJNLtbxGhqe/vsNKAktU5NMJT
	 TY28aVCpRZrico48wx8Wy8qERIAQ6XCCkfn+1P8knxStX68c4rSfB8DRArvkGVoRzM
	 h4KSd0FMEkEZvY7dX61dEI8XrzL1Hrd8uw2gSZ0HvZbb+26cdbMgNWys25axYOIxci
	 96r1znetQ1aLdxN0U0pK3PEC1y/O2k9D6vBfQ1h649OFj6KGI9OqrjPgI+gjxJ2BHb
	 la2CzQ+I0BqXA==
Date: Thu, 17 Apr 2025 15:50:23 +0100
From: Srinivas Kandagatla <srini@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: fnkl.kernel@gmail.com, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 2/3] nvmem: Add spmi-nvmem driver
Message-ID: <20250417145023.GA34166@srini-hackbase>
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com>
 <81fb1290-fb39-40b7-9d79-f147fae5b269@kernel.org>
 <20250417143053.GD8400@robin.jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417143053.GD8400@robin.jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_075032_492505_864B8910 
X-CRM114-Status: GOOD (  27.59  )
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

On Thu, Apr 17, 2025 at 04:30:53PM +0200, Janne Grunau wrote:
> On Thu, Apr 17, 2025 at 02:34:37PM +0100, Srinivas Kandagatla wrote:
> > 
> > 
> > On 15/04/2025 22:52, Sasha Finkelstein via B4 Relay wrote:
> > > From: Hector Martin <marcan@marcan.st>
> > > 
> > > This driver exposes a SPMI device as an NVMEM device.
> > > It is intended to be used with e.g. PMUs/PMICs that are used to
> > > hold power management configuration, such as used on Apple Silicon
> > > Macs.
> > > 
> > > Signed-off-by: Hector Martin <marcan@marcan.st>
> > > Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> > > ---
> > >   MAINTAINERS                |  1 +
> > >   drivers/nvmem/Kconfig      | 14 +++++++++++
> > >   drivers/nvmem/Makefile     |  2 ++
> > >   drivers/nvmem/spmi-nvmem.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++
> > >   4 files changed, 79 insertions(+)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index e7b2d0df81b387ba5398957131971588dc7b89dc..63c12f901aed1f3e6de8227d6db34af1bd046fe6 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -2298,6 +2298,7 @@ F:	drivers/iommu/io-pgtable-dart.c
> > >   F:	drivers/irqchip/irq-apple-aic.c
> > >   F:	drivers/nvme/host/apple.c
> > >   F:	drivers/nvmem/apple-efuses.c
> > > +F:	drivers/nvmem/spmi-nvmem.c
> > >   F:	drivers/pinctrl/pinctrl-apple-gpio.c
> > >   F:	drivers/pwm/pwm-apple.c
> > >   F:	drivers/soc/apple/*
> > > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> > > index 8671b7c974b933e147154bb40b5d41b5730518d2..9ec907d8aa6ef7df0ea45cc35e92d8239d2705ee 100644
> > > --- a/drivers/nvmem/Kconfig
> > > +++ b/drivers/nvmem/Kconfig
> > > @@ -310,6 +310,20 @@ config NVMEM_SNVS_LPGPR
> > >   	  This driver can also be built as a module. If so, the module
> > >   	  will be called nvmem-snvs-lpgpr.
> > >   
> > > +config NVMEM_SPMI
> > > +	tristate "Generic SPMI NVMEM"
> > > +	default ARCH_APPLE
> > Why default is set to ARCH_APPLE?
> > 
> > This will endup with y in arm64 defconfig, means increasing the size of 
> > kernel.
> > 
> > should it be:
> > 
> > depends on ARCH_APPLE || COMPILE_TEST
> 
> I don't think it should depend on ARCH_APPLE. There is nothing
> ARCH_APPLE specific in the driver or dt-bindings even apple platforms
> are currently only user.

irrespective of this is generic or not none of the drivers should have
default set to y.


> 
> `default m if ARCH_APPLE` might an alternative but in this specific case
> the driver which will uses the nvmem cells should just select it. So I
> would remove the default.

remove the default, and let it be selected in defconfig as m as
required, like any other drivers.

--srini
> 
> Janne

