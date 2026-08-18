Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1790C5DF80
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 09:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCAeP45dNHcS3g9M4gwt3hWaJQOzRtTIoJ9n13+qIfo=; b=dBo5rj1OAYOMxPn4mMfsY3YCQC
	Hj1HsBPZH1P6GSbQ1z4HQYYEX4PHdVnCdU/UPJxt/5AwKOlKoA+Zb3/c2c9uQhPRqlmmq2X6DI++4
	8xJ9bfuY30rHrxmwDrHxZ+WGxSdu2CVOU3WaNrkbTryI5zwd6SImdwVXEtGC+ve6ZTml3WsFQcjZ7
	xZn8cN1rvM4vl2r5XoVMvot/AeHxm0PoggvYgzey+tLVAaTGLIU17CZ16llGJGcD/fBIFgbcfnnaD
	DCR/XR+n2UyR11SjLoQmhbSuVvIigApT4Q6act9gH/l8YZq+eyS7yTwFfNo9vaEauIPRBGUlZrHvr
	/LAkqW2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwG6M-00000007cPY-2FNJ;
	Tue, 18 Aug 2026 09:27:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwG6L-00000007cP0-0kpI;
	Tue, 18 Aug 2026 09:27:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EA5194365B;
	Tue, 18 Aug 2026 09:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 807891F00A3D;
	Tue, 18 Aug 2026 09:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787045240;
	bh=pCAeP45dNHcS3g9M4gwt3hWaJQOzRtTIoJ9n13+qIfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FXKhSwse5JpUIXXbguePgh5Q4+Wjri1Bk6ZOg8YeaYZemFTg1obCHqVZG2uPbI1Ea
	 zi6eiRfzz5dqkwzZpjf4gRxD5f5DD4tKT/8aBvA4zmkDWwV/BbCO6tOlMONcexyKou
	 g0AfU95Db6jL5E0+9H2sBm2hLkTjUPYtCpN2td0tzyqpLwNaB1ECxjqkGFQ5mWelvw
	 Xn4jH5f6IvgGaQt51GRfoklu1XNSBevKtjELBHLNMiK0+s0c8cIBJ83EHhbHk6IPpk
	 RVz8GwpdEeLJfzDAaR/JqoUfwUQwZRHwbqldpRS7P93yPKEivpwLdNxzy9R/QKCC+L
	 oll2GRe8z2ltQ==
Date: Tue, 18 Aug 2026 11:27:07 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
	William Wu <william.wu@rock-chips.com>
Subject: Re: [PATCH v14 00/38] phy: rockchip: usbdp: Clean up the mess
Message-ID: <h54c2hrcsv3zjzzgojzf5sjmu3vtpobz6rwloam5kp7mwqqn3n@bqjnlellvnz6>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
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

On Thu, Aug 13, 2026 at 10:51:43PM +0200, Sebastian Reichel wrote:
> This series does a major overhaul of the Rockchip USBDP driver. The
> initial main goal was to add USB-C DP AltMode support to the RK3576
> and RK3588 and this series still prepares the PHY driver for exactly
> that. But in addition to that I uncovered a huge amount of issues,
> that are fixed along the way. Some of the more interesting ones are:
> 
>  * Currently the driver might trigger a fatal SError on USB-C hotplug,
>    since re-initializing the PHY stops the clocks going to DWC3. If
>    the DWC3 driver tries to access its registers at the same time the
>    system will crash.
>  * The DWC3 hardware can get into a buggy state when the PHY is
>    disabled, which results in the PHY not coming up properly again.
>  * Swithcing the USB-C connector orientation during hotplug breaks
>    USB3 speed, as the PHY is not being re-initialized.
>  * The code always enables DP mode when USB-C is involved.
>  * The driver has some locking issues uncovered by Sashiko.
> 
> In addition to these bigger ones, Sashiko also found a bunch of
> minor problems, which are mostly harmless, but were fixed while
> going at it.
> 

38 patches for a single series is too much to review. Please consider splitting
it up into multiple series not exceeding ~10 patches per series. Thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

