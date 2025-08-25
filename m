Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4641CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 15:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJFxtHMr+IEWCbU3kDWbNrZrzHBOBdYsbosDBeVJv0Y=; b=bwDWcfz1kGnDRfwdrYs+D3sYxc
	9yNpgPOzpRpYASW/WD7mJR/OFiEJ7g6D4I8+QiTrKZrUZJX2nxpnfijSNuFiccAjEQc8W6u2ltWWS
	1ergmSrPg/4N00OADxPnWqTf+tAeJ1k+zlLGmzZwVTMjS+/3mDyggYnEgX57itjBSGQ/d1CBifDat
	NrtOLGNsHoUw0bzVPW27f8Bt7owAk/WL8K5nqppXtsa6Cvp65dxAEb5sToeY7EKnwmgKFfD0OInCh
	OyOC3SutcyGzzMdnK8m6arXmWbFdo5yCOUV9rnfUDvM4Hlgl20SvueiU61L+nBYuijvpY90DcjCTQ
	MYIzr+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZEm-00000008XOs-2lxD;
	Mon, 25 Aug 2025 15:36:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYH8-00000008H7o-0wpE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 14:34:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A29E95C5D4F;
	Mon, 25 Aug 2025 14:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C37EC4CEF4;
	Mon, 25 Aug 2025 14:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756132451;
	bh=HB6pULNDXxeh1etg0zy/YFv/qO0C+90ihk/cMS1ozcE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=fovoz/VpGa+QTUk+5KXZSXNiPVdjQP1Zg9pQ6OSV/sR/cNir2T17xgdhzhpl4dATv
	 FgKyFIUtP4I/NPn4n2Ubw45486K/QKUsbVwI9rE5BzSbBxXJvtTSZx+I8To1Iy6ybB
	 CeH5AETuwZlmdlGZuFiV9JRSawjcO8AY9w7np8CxVci4tbCDAlcwc50gVRzLwRHSPu
	 4Raca3x0eeu1xyFA9Bhjyt6oN83dWRr+Jxlu2skfJU3JMrE8tiRwDWthM4rujNhAE5
	 zukA2KCJHa4/XZYPtvh5aD+SiPZNkjmWvmjt9p6ZKJr/tl+avzp5uHKCgo5B0VBDlX
	 /TuZJBBWf3UEQ==
Message-ID: <ea673976-49a6-44f6-8e6c-8d11abe46620@kernel.org>
Date: Mon, 25 Aug 2025 16:34:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH V2 0/4] Add support for VIP
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux@armlinux.org.uk, ardb@kernel.org, ebiggers@kernel.org,
 geert+renesas@glider.be, claudiu.beznea@tuxon.dev, bparrot@ti.com,
 andre.draszik@linaro.org, kuninori.morimoto.gx@renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, heikki.krogerus@linux.intel.com,
 kory.maincent@bootlin.com, florian.fainelli@broadcom.com, lumag@kernel.org,
 dale@farnsworth.org, sbellary@baylibre.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dagriego@biglakesoftware.com,
 u-kumar1@ti.com
References: <20250716111912.235157-1-y-abhilashchandra@ti.com>
Content-Language: en-US, nl
In-Reply-To: <20250716111912.235157-1-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_073422_348728_DD09F4C3 
X-CRM114-Status: GOOD (  24.42  )
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

Hi Yemike,

On 16/07/2025 13:19, Yemike Abhilash Chandra wrote:
> This patch series add support for the TI VIP video capture engine.
> VIP stands for Video Input Port, it can be found on devices such as
> DRA7xx and provides a parallel interface to a video source such as
> a sensor or TV decoder. 
> 
> Each VIP can support two inputs (slices) and a SoC can be configured
> with a variable number of VIP's. Each slice can support two ports
> each connected to its own sub-device.
> 
> The first patch in this series updates the outdated MAINTAINERS entry
> for the TI VPE and CAL drivers. The subsequent three patches introduce
> support for the TI VIP (Video Input Port) driver.

I'll pick up the MAINTAINERS patch, but the others need more work, so
v3 is needed for that.

> 
> Link for v1: https://lore.kernel.org/all/20200522225412.29440-1-bparrot@ti.com/
> The v1 patch series was posted in the year 2020. This v2 series resumes the
> effort to upstream VIP support by addressing all previous review comments
> 
> Changelog:
> Changes in v2:
> - Remove array and just use hsync: true in bindings (Patch 3/5)
> - Remove array and use enum for bus width in bindings (Patch 3/5)
> - Use pattern properties since properties across ports are same (Patch 3/5)
> - Remove vip_dbg, vip_info, vip_err aliases and just use v4l2_dbg, v4l2_info
>   and v4l2_err instead (Patch 4/5)
> - Remove color space information from vip_formats struct (Patch 4/5)
> - Use g_std instead of g_std_output (Patch 4/5)
> - Do not touch pix.priv (Patch 4/5)
> - Remove all comments with just register values (Patch 4/5)
> - Remove support for vidioc_default ioctl (Patch 4/5)
> - In case of any error while streaming, push all pending buffers to vb2 (Patch 4/5)
> - Address some minor comments made by Hans throughout the driver (Patch 4/5)
> - Update copyright year at various places
> 
> v4l2-compliance output: https://gist.github.com/Yemike-Abhilash-Chandra/b0791cb465fadc11d4c995197cb22f29

Also run v4l2-compliance with the -s option to check compliance while streaming.

Regards,

	Hans

> 
> v4l2-compliance cropping and composing tests are failing likely
> due to OV10635 sensor supporting several discrete frame sizes,
> fail: v4l2-test-formats.cpp(1560): node->frmsizes_count[pixfmt] > 1
> 
> Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/98504ab56416aef38b851036aef5eeb1
> 
> Dale Farnsworth (2):
>   dt-bindings: media: ti: vpe: Add bindings for Video Input Port
>   media: ti-vpe: Add the VIP driver
> 
> Yemike Abhilash Chandra (2):
>   MAINTAINERS: Update maintainers of TI VPE and CAL
>   Revert "media: platform: ti: Remove unused vpdma_update_dma_addr"
> 
>  .../devicetree/bindings/media/ti,vip.yaml     |  211 +
>  MAINTAINERS                                   |    3 +-
>  drivers/media/platform/ti/Kconfig             |   13 +
>  drivers/media/platform/ti/vpe/Makefile        |    2 +
>  drivers/media/platform/ti/vpe/vip.c           | 3824 +++++++++++++++++
>  drivers/media/platform/ti/vpe/vip.h           |  719 ++++
>  drivers/media/platform/ti/vpe/vpdma.c         |   32 +
>  drivers/media/platform/ti/vpe/vpdma.h         |    3 +
>  8 files changed, 4806 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
>  create mode 100644 drivers/media/platform/ti/vpe/vip.c
>  create mode 100644 drivers/media/platform/ti/vpe/vip.h
> 


