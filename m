Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28158C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 03:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UalBPFxKWe525mQfd39B3IwwYujzdCNWKW2ZUj1VaBQ=; b=atUjkL9Hk0+raNNwVRfGkpGFUY
	1BlZE4sD5bZXI+D7zY2LovgOHItRu4wvTTaWYQ8Gbpoy4q8NHJbCT2+kp9QqBSBljLuct+DzHf+SP
	RK2wg96Aoyw7ljbVPBduHAlzR4phxGVRWSCujyoBM2yocwwBKUrx7rCiE/8H2UYiyQR1FhUM6D2/g
	L8Qme17Q1A0IkWYaKWxsXEVbBun9MZvQYq2ya6XXCX20BGkZW5je78dB+otE+Z5HmCN6FjBsDPYLH
	nQ/Tb53DG1yLbQl74i1vCURu6B0s+XGynZPSb3EBWSjbaAmFyI50D5NdE5y1JicByCITrs9cCkYyr
	EDT6quLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwX1u-00000008wLM-0BpY;
	Wed, 19 Aug 2026 03:31:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwX1r-00000008wKv-03Of;
	Wed, 19 Aug 2026 03:31:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EF63601FB;
	Wed, 19 Aug 2026 03:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097D61F000E9;
	Wed, 19 Aug 2026 03:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787110309;
	bh=UalBPFxKWe525mQfd39B3IwwYujzdCNWKW2ZUj1VaBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kE6DlpN6ORvE9hBR0WEqXrhVrgorQ880nzjV3Z3gYnB8XnlMLNXIFd/g7/GfeA1Sm
	 gZy+pxK7cgTERy6qykXDEMC4l2+212vdWXco7uEK00f8IQPHWvN9qabtqA7HurZXnc
	 aD5N4kF0fplnVCpbGnQ9oOHgXrRO5i7KuAhNPXRSvmShoEiktLEaOdkDMT/rKZ7+IZ
	 9rRm7o0FdW8HbfzqOkzmj5RuqEkDIOWoAqcIBGWnFTyCV+IsCeZcyUnIcPrBk6zx11
	 GfAh9n4QUNIK2SndUvjiX9RSJccWIZHZ9XJ6Qf5DwH2iXGfjp9pUGK3G2IKaLyp4lT
	 ickEg6i7LUdbw==
Date: Wed, 19 Aug 2026 05:31:37 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Yubing Zhang <yubing.zhang@rock-chips.com>, Alexey Charkov <alchark@flipper.net>, 
	Igor Paunovic <royalnet026@gmail.com>, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, William Wu <william.wu@rock-chips.com>
Subject: Re: [PATCH v14 00/38] phy: rockchip: usbdp: Clean up the mess
Message-ID: <kwncmhsrq6sr56rsgf2ng4pc5fvyyqfryp3s2qfskoxunxx7jp@pdq4kedpw4gq>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <h54c2hrcsv3zjzzgojzf5sjmu3vtpobz6rwloam5kp7mwqqn3n@bqjnlellvnz6>
 <aoTMQtpYYw8O-3cj@venus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aoTMQtpYYw8O-3cj@venus>
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

On Tue, Aug 18, 2026 at 11:42:50PM +0200, Sebastian Reichel wrote:
> Hello Mani,
> 
> On Tue, Aug 18, 2026 at 11:27:07AM +0200, Manivannan Sadhasivam wrote:
> > On Thu, Aug 13, 2026 at 10:51:43PM +0200, Sebastian Reichel wrote:
> > > This series does a major overhaul of the Rockchip USBDP driver. The
> > > initial main goal was to add USB-C DP AltMode support to the RK3576
> > > and RK3588 and this series still prepares the PHY driver for exactly
> > > that. But in addition to that I uncovered a huge amount of issues,
> > > that are fixed along the way. Some of the more interesting ones are:
> > > 
> > >  * Currently the driver might trigger a fatal SError on USB-C hotplug,
> > >    since re-initializing the PHY stops the clocks going to DWC3. If
> > >    the DWC3 driver tries to access its registers at the same time the
> > >    system will crash.
> > >  * The DWC3 hardware can get into a buggy state when the PHY is
> > >    disabled, which results in the PHY not coming up properly again.
> > >  * Swithcing the USB-C connector orientation during hotplug breaks
> > >    USB3 speed, as the PHY is not being re-initialized.
> > >  * The code always enables DP mode when USB-C is involved.
> > >  * The driver has some locking issues uncovered by Sashiko.
> > > 
> > > In addition to these bigger ones, Sashiko also found a bunch of
> > > minor problems, which are mostly harmless, but were fixed while
> > > going at it.
> > 
> > 38 patches for a single series is too much to review. Please
> > consider splitting it up into multiple series not exceeding ~10
> > patches per series. Thanks!
> 
> So let me summarize:
> 
>  - Vinod wants Sashiko feedback to be acted upon

This is fine.

>  - linux-phy does not want series with dependencies ( [0] )

This is not something I expected. I read the reply from Vladimir in [0], and
he seems to be sharing the limitation of the build tool of linux-phy. But I
don't think that's a big deal. Every subsystem allows sending dependent series
as long as the dependency is clearly described in the cover letter and now with
b4. So I don't see why linux-phy should be different. If you combine all patches
in one series, it makes it impossible for a human reviewer to review it
thoroughly.

@vinod: Can you share your view on splitting the series with dependency?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

