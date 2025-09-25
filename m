Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFC1CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 05:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15jVDoRkTQI4moI14kL6/HuHLvXXwZlH8CR70zusrGk=; b=NN3oIFcR1RdQOCTsqm2QpS78dJ
	yQemZv0YQoDLL0boAD76LHE44MTtNZQMRrhuvg1gHoLZvIRNJQ6NxTwmh463idpwHDXUFATDMex01
	+A7Bu7SJq8oE5OD0uuNNqHj93HVqCdA+EZQFGvWgC7m+j2k9Q1n4W7jWe7om/QE8OkM9ITsN6CFNx
	5MInQlEgRddIYYab6jhBe6fd43YbniP1qwWFtNdIJ+IMCYKzb2sWpL70+yWe/ACGylm7ZjOWhhs9L
	6uDVPACaKBQhQsAQZl8rp68Zi2TQfx7AMD0cdV4q/Y6B91mPijaTd++InidPooSNb+cVhkjKfvPFB
	t3WyHsQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ecF-00000005uwN-3zuc;
	Thu, 25 Sep 2025 05:34:03 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ecD-00000005utL-2mRS;
	Thu, 25 Sep 2025 05:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1758778235; bh=15jVDoRkTQI4moI14kL6/Hu
	HLvXXwZlH8CR70zusrGk=; b=r+gJW21tDHRnMFA6wikCcWjX1XVKMP+yliQIoP/+sFDwQcjEc+
	c17V+Ls0IvmmBwvXnSn1HooMulkAFfDl5D3q2oAmS8jaN+HsOsMJUaXzFy2NKXL7dVBawT6redO
	qazX5po5MKIGokKocr27/3LBlKGKiZzbf+IFjjYB1/2759M06356juEJC4zJil6SeIWgeV4WkP2
	LFqGk/CERuHyjtHIVLdsuSTuYPyjh05MRy82E3Aqedd9MhvObD6/d7QjqaSuOjlxie/p+XVO30A
	28hLM6fFESkdGY40N0+/rJU06NTKjOQg9MVXxFN1/EdRDz2+RnBvQ9MXTqD2xhakqOg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1758778235; bh=15jVDoRkTQI4moI14kL6/Hu
	HLvXXwZlH8CR70zusrGk=; b=7H/Wq/K/fqu/IRvYGMkd8GhMTFzBbVCPVCga+abr+ROdi4TkbN
	FFw1WO2QYYzw7U9buFGAZExo7VPOfP3/bHDQ==;
Date: Thu, 25 Sep 2025 12:30:26 +0700
From: Dang Huynh <dang.huynh@mainlining.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH 00/10] RDA8810PL SD/MMC support
Message-ID: <hrgwhmzmu5wpggk7aatuaxc5bnxmjvs4jthxicxekniux5jlbm@lre4gzt75wea>
References: <20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org>
 <CAMRc=Mc4hO1LDumxAfkB1W6miTJXR1NUVAKBVarkwiF2yGvSLA@mail.gmail.com>
 <2wwi3ktbcuyp7y7mqplndvawagae5hdhcx3hn375kycoqtows6@xcww2237rxpe>
 <CAMRc=MdhQMR=-ayz+GfigUMVy+j1QNO3LguMoZYa5_+Es3E5Ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdhQMR=-ayz+GfigUMVy+j1QNO3LguMoZYa5_+Es3E5Ow@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_223401_839206_C2BBF17B 
X-CRM114-Status: GOOD (  18.67  )
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

On Tue, Sep 23, 2025 at 09:48:41AM +0200, Bartosz Golaszewski wrote:
> On Tue, Sep 23, 2025 at 5:45 AM Dang Huynh <dang.huynh@mainlining.org> wrote:
> >
> > On Mon, Sep 22, 2025 at 04:17:05PM +0200, Bartosz Golaszewski wrote:
> > > On Thu, Sep 18, 2025 at 8:49 PM Dang Huynh via B4 Relay
> > > <devnull+dang.huynh.mainlining.org@kernel.org> wrote:
> > > >
> > > > This patch series aims to add SDMMC driver and various drivers required
> > > > for SDMMC controller to function.
> > > >
> > > > This also fixed a bug where all the GPIO switched from INPUT to OUTPUT
> > > > after the GPIO driver probed or by reading the GPIO debugfs.
> > > >
> > > > This patch series is a split from [1] to ease the maintainers.
> > > >
> > >
> > > This is still targeting at least 4 subsystems and isn't making the
> > > merging any easier. Are there any build-time dependencies here? If
> > > not, then split it further into small chunks targeting individual
> > > subsystems and the relevant ARM SoC tree.
> > The MMC driver depends on both the clock and the DMA driver.
> >
> 
> But is the dependency a build-time one or does the MMC DT node
> reference clocks and the DMA engine by phandle? I assume it's the
> latter in which case it's fine for them to go into next separately.
Yeah, it's the latter. I'll submit a v3 in the future.
> 
> Bart

