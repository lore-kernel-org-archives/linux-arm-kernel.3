Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001CEC43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 21:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDYzkfD03QCemnZAongM476f9RM73y8sVoEYcrmB+04=; b=MkpPqoNeiHlSPyrEyAvWd0zf03
	NWe5PWnevGlfeBJGI8g7gU8b4ISLGHbqlag8U0BEF6Cxw6vdkYXsFbS+GaZXhQ1B5C6Ce+37o1+eQ
	UbEimUY1s4NAseFxHCbvcTxgWgUKgJfAay2oeAQDEtYE8GVHBwfKyKCmmBBnMjxhW5xqWcOBo3/dT
	UqEVFc8j+AB3FZM7WZSzVw3Xien/7BrHyv1gddt/eLEc4XBHDFXd1DVcUsbjYXS8edrcl/ehLqdWc
	ywlM32/jt/oWJpfbKQYZQCNH1j0fjDkPNikj2XeEvttjWh+xefjmO1qZRwO3Gh4WCVh7VMGukbQgU
	tXfCdbuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf24Y-000000030tW-3AuG;
	Wed, 01 Jul 2026 21:02:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf24Y-000000030tQ-02Kl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 21:02:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CBA4408A9;
	Wed,  1 Jul 2026 21:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C011F000E9;
	Wed,  1 Jul 2026 21:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782939737;
	bh=fDYzkfD03QCemnZAongM476f9RM73y8sVoEYcrmB+04=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VofUYjdWJWrF+6tGCKvfwHMXju9c+U2sGOf5WjZk4Y1Ff8an6PDSNiEOdr4pYJZEq
	 eV6gIfhT25BWm5G8icoxXZR4tFt/Ub7nfZIUJD//tEm265KGI4a/9bu1DsOAqDw6GA
	 zhhmnUjl4Wx9gKs0nXuSo4+MK8cRkAat3rfTS84wVXLsBKa+zp8a08CIt/4JXFp0Hw
	 SAxEVNYiuxJAzk5ZGfbK55kzN0e7PZpFOtvWvMacYCXXONvEeA+SiB2/YsheCFDZF9
	 EajUUmNHO8b1FCMr2lWFeocN2hNHvHrUS/aE0Gm+15upioDbcK9AXXRzs1AYMGxeI9
	 YZDK4yFXdxhiw==
Date: Wed, 1 Jul 2026 22:02:13 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Chi-Wen Weng <cwweng.linux@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nuno.sa@analog.com,
 andy@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
Subject: Re: [PATCH 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
Message-ID: <20260701220213.499ed6da@jic23-huawei>
In-Reply-To: <66ad5723-6589-473a-91da-b13e2ba90aeb@baylibre.com>
References: <20260625110638.38438-1-cwweng.linux@gmail.com>
	<20260625110638.38438-3-cwweng.linux@gmail.com>
	<66ad5723-6589-473a-91da-b13e2ba90aeb@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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




> This field has a new name:
> 
> 	chan->scan_type.format = IIO_SCAN_FORMAT_UNSIGNED_INT;
> 
> > +	chan->scan_type.realbits = 12;
> > +	chan->scan_type.storagebits = 16;
> > +	chan->scan_type.endianness = IIO_CPU;
> > +
> > +	if (differential) {
> > +		chan->differential = 1;
> > +		chan->channel2 = vinn;
> > +		snprintf(name, MA35D1_EADC_CHAN_NAME_LEN, "in%d-in%d", vinp,
> > +			 vinn);
> > +	} else {
> > +		snprintf(name, MA35D1_EADC_CHAN_NAME_LEN, "in%d", vinp);
> > +	}
> > +
> > +	chan->datasheet_name = name;  
> 
> We usually don't use datasheet_name. It would make more sense to implement
> labels and get the label from devicetree.

It is used by the consumer interface to find the right channel if we
are using hardcoded iio_map rather than dt based association.

Given this is a SoC ADC it is possible this will be needed. All depends
on how tightly coupled other components are.

It can come in as part of a later series adding such a consumer rather
than now. 

Thanks,

Jonathan

