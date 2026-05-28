Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219CBCD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 14:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMSgQFDN59OnpjSybTfSdSUQ8w7FM10W/DqXpKQK7Fs=; b=e1wHqMXjWanE2EnolblF6t3J1s
	Jz7yM3hXaqLCmpU3rAPOcqu9dRDJyWzpsxOSCvz4unGxyNSzgMS5p6WNd60IcFfn2ZNZI7UPUEiPt
	84CXdkFYfWdZ+En84qwjbZbtKYMJqfKMd3c+vVCAOxXeytIr1lAfY0b5kS1vreDKAVEQ6SWbGdMNA
	YUYEj1FSv7qSNbs/1as+o0YaJEofUJJG2FlKf3RXOr/CEBLxsJaudvJUKwyV4l7y/K5ytpoDSYgIi
	NeEa8qFLibY6M8O5ph5A1RpS3RxXDANPq50OPGZGoHwITDF3UiaR/uLFhqFfoUm4awMSCLiObTeW4
	DEmd2PvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbvv-00000005s6Q-09qD;
	Thu, 28 May 2026 14:42:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbvs-00000005s65-120m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 14:42:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DMSgQFDN59OnpjSybTfSdSUQ8w7FM10W/DqXpKQK7Fs=; b=V+DexVSxdBVP2L4GwlIiZvG3/k
	IhZpDotv5a20dhf6BumLCEKwhQN43ZSG8w7xG134ZfI0H0iO+UDIaMWluVI46OZXf85m+/WWg6jh7
	jdUea2eFAD13fxJiCWFim+ZJrWv7KARaZeDqX+5x8WP+XhbO4dHgeXYXiShKO8sR+o8A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wSbvl-004uk4-98; Thu, 28 May 2026 16:41:53 +0200
Date: Thu, 28 May 2026 16:41:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mark Brown <broonie@kernel.org>
Cc: Chancel Liu <chancel.liu@nxp.com>, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shengjiu.wang@nxp.com,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
	Frank.Li@nxp.com, s.hauer@pengutronix.de,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ASoC: imx-rpmsg: Add headphone jack detection and
 driver_name support
Message-ID: <04994ebd-fb13-4d5e-8e1b-f93c504c88ae@lunn.ch>
References: <20260526053815.140008-1-chancel.liu@nxp.com>
 <20260528020725.2265321-1-chancel.liu@nxp.com>
 <37324dcf-5214-432f-9aea-90bcff5fec32@lunn.ch>
 <5314b232-9688-4f59-a57f-4cca044c9e44@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5314b232-9688-4f59-a57f-4cca044c9e44@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_074200_306355_DA3ADD10 
X-CRM114-Status: GOOD (  17.90  )
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

On Thu, May 28, 2026 at 03:18:05PM +0100, Mark Brown wrote:
> On Thu, May 28, 2026 at 04:12:58PM +0200, Andrew Lunn wrote:
> > On Thu, May 28, 2026 at 11:07:22AM +0900, Chancel Liu wrote:
> 
> > > This series adds two features to the i.MX RPMSG ASoC card:
> > > 1. Headphone jack detection via GPIO: Introduce the "hp-det-gpios"
> > >    device tree property and use simple_util_init_jack() to
> > >    register a headphone jack with GPIO-based insertion detection.
> 
> > I'm not familiar with ASoC, but have been in a long discussion about
> > RPMSG and GPIO....
> 
> > I just want to confirm the GPIO you are talking about is a local GPIO?
> > You are not tunnelling the GPIO over RPMSG using some vendor protocol?
> 
> This is a GPIO accessed via gpiolib, the driver is for an audio
> subsystem accessed via rpmsg.

Great, thanks.

When we eventually get GPIO over RPMSG, it should also just look like
a standard gpiolib GPIO. But we are not there yet, defining the one
protocol that all vendors must use, rather than each vendor doing
their own thing.

  Andrew


