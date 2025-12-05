Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103DED374AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDdng/YqzoM82XZ+jmRjLCBgT6z8RBqYeaodlccTGfA=; b=w+X5Cg5yPvypH0f5t9Z8kmRfl1
	jzC5xrwwR0J0TmH9wfefmdHDFAPa3npTY4wtnbu8ZSrdrtPVmjU3zdHgncwCf0tJLC4msOCPfjnfu
	ffRxrnPcGoDQsNrBcmG6l7Axm0mgbgwsIHfQj0qZ2sUmOBMm0O/veT4/5zY6/Gv9dJz0N/pQ59gng
	hJmlG4pRHkN5qp4IMFiQw8eDa8SdO96XMzUNZ9qsStWIgCx0ekG80MKJ/guAV7QV7v+80jfWmRag8
	PlGTxNFwvS9qHkE59uwBad7fzOry9AK6/g92W2sbVrBsn+X0vSzg3Yafe7pGXutnfECzRXG8uhEtu
	ZyTMP1iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRePu-0000000A9QI-3SN0;
	Fri, 05 Dec 2025 22:36:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRePt-0000000A9Ot-0MYL;
	Fri, 05 Dec 2025 22:36:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7193760156;
	Fri,  5 Dec 2025 22:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B11C4CEF1;
	Fri,  5 Dec 2025 22:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764974204;
	bh=YKwKJDju/WOgFUPtCz8iIC+0fvKZkTkopd8u6N1ogBs=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=aJ9Q8a9/T+NHHz1RnBONuw0pvNLhFzNgXb3eaITnt00mFHrK72U/u5l1dnBE/DQ6r
	 0vaEQpwFzB47+77fxjaKJ/4o3ld3qjhdX1cNPCXqEqMcn/TbAp9P9KMKQ7VSk8xHtt
	 5KqxkW2k7j6y/lBJFODJcxOHJpVf9YnZLCJZD28ZN+bDRfsEpUU6Z536whKCNkTy/D
	 tYY/w/4sLKG9gbThifYIyC1xKBy0/6PJ9yqnYkSVnjM0qI4Fb83ENNjj/yKPYYlUoL
	 a/hTGnnTq2hduhvHWlbz8ChFoIXY5MVS5et7T5QJ6dQ+SY7klShtJ6KcOfFhhaqWwH
	 bTrGIUNAOasPw==
From: Rob Herring <robh@kernel.org>
Date: Fri, 05 Dec 2025 16:36:42 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, 
 Michael Olbrich <m.olbrich@pengutronix.de>, 
 Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 kernel@pengutronix.de, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Jacob Chen <jacob-chen@iotwrt.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 linux-media@vger.kernel.org
To: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
Message-Id: <176497381501.863435.1795850437776571533.robh@kernel.org>
Subject: Re: [PATCH v2 00/22] media: platform: rga: Add RGA3 support
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


On Wed, 03 Dec 2025 16:52:22 +0100, Sven Püschel wrote:
> This series adds support for the Raster Graphic Acceleration 3 (RGA3)
> peripheral, which is included in the RK3588 SoC. The RK3588
> contains one RGA2 core (which is already implemented by the rockchip rga
> driver) and two independent RGA3 cores. RGA2 and RGA3 feature
> a similar functionality of scaling, cropping and rotating of up to two input
> images into one output image. Key differences of the RGA3 are:
> 
> - supports 10bit YUV output formats
> - supports 8x8 tiles and FBCD as inputs and outputs
> - supports BT2020 color space conversion
> - max output resolution of (8192-64)x(8192-64)
> - MMU can map up to 32G DDR RAM
> - fully planar formats (3 planes) are not supported
> - max scale up/down factor of 8
> 
> This patch set adds support for one RGA3 core in the existing
> rga m2m driver. The feature set of the PR is limited to scaling and
> format conversions between common 8bit RGB/YUV formats.
> Also the color space conversion is fixed to BT601F.
> This already allows a practical usage of the RGA3.
> 
> This was tested on a Radxa Rock 5T. Around 80 fps were measured when
> scaling and converting from RGBA 480x360 to NV12 3840x2160 in a single
> gstreamer pipeline. Format conversions were tested with a single
> gstreamer pipeline converting a fixed input to a given input format.
> Afterwards it's piped through the RGA3 and the result is converted back
> to rgba and compared against a given hash value (generated after
> comparing the output manually to the input).
> 
> The v4l2-compliance tests still complain about
> the failing colorspace propagation for the RGA2.
> For the RGA3 they complain about the ycbcr_enc
> not being adopted with S_FMT, which is by design,
> as the RGA3 currently has the BT601 full range
> transfer hard coded:
> 
>   v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
>   ...
>   	Card type        : rga2
>   ...
>   		fail: v4l2-test-formats.cpp(923): fmt_cap.g_colorspace() != col
>   	test VIDIOC_S_FMT: FAIL
>   ...
>   Total for rockchip-rga device /dev/video0: 47, Succeeded: 46, Failed: 1, Warnings: 0
> 
>   v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
>   ...
>   	Card type        : rga3
>   ...
>   		fail: v4l2-test-formats.cpp(920): fmt_out.g_ycbcr_enc() != ycbcr_enc
>   	test VIDIOC_S_FMT: FAIL
>   ...
>   Total for rockchip-rga device /dev/video1: 47, Succeeded: 46, Failed: 1, Warnings: 0
> 
> To distinguish the RGA2 core from the RGA3 cores the Card type is set
> accordingly. Scheduling operations between both RGA3 cores to double
> the possible frame rate might be a future improvement. Until then
> additional RGA3 cores are disabled to only provide one video device to
> the user space. This prevents a potential ABI breakage when multi core
> support is implemented.
> 
> The DTS change at the end is just as a preview, as this series targets
> media/next. After it's merged the DTS change will be sent as a new
> patch not targeting media.
> 
> Patch 1 documments the RGA3 compatible value
> Patch 2-3 extend v4l2 common functionality
> Patch 4-6 are general cleanups
> Patch 7-20 prepare the rga driver for the RGA3
> Patch 21 adds RGA3 support to the rga driver
> Patch 22 dtsi additions for the RGA3
> 
> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
> ---
> Changes in v2:
> - Removed overclocking (assigning higher clock speeds in the dts)
> - Disable the second RGA3 core
> - Improved RGA3 feature documentation and code comments
> - Don't write the whole command buffer in each frame
> - Don't announce CIDs for the RGA3 and error out on s_selection
> - Check the max scaling factor of 16 (RGA2) and 8 (RGA3)
> - Move stride alignment and alpha checking to v4l2 common
> - Register the interrupt as shared for an external IOMMU
> - Add IOMMU patch as dependency to fix sporadic hangups
> - Link to v1: https://lore.kernel.org/r/20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de
> 
> ---
> Michael Olbrich (1):
>       media: rockchip: rga: share the interrupt when an external iommu is used
> 
> Sven Püschel (21):
>       media: dt-bindings: media: rockchip-rga: add rockchip,rk3588-rga3
>       media: v4l2-common: add has_alpha to v4l2_format_info
>       media: v4l2-common: add v4l2_fill_pixfmt_mp_aligned helper
>       media: rockchip: rga: use clk_bulk api
>       media: rockchip: rga: use stride for offset calculation
>       media: rockchip: rga: remove redundant rga_frame variables
>       media: rockchip: rga: move hw specific parts to a dedicated struct
>       media: rockchip: rga: move cmdbuf to rga_ctx
>       media: rockchip: rga: align stride to 4 bytes
>       media: rockchip: rga: prepare cmdbuf on streamon
>       media: rockchip: rga: check scaling factor
>       media: rockchip: rga: use card type to specify rga type
>       media: rockchip: rga: change offset to dma_addresses
>       media: rockchip: rga: support external iommus
>       media: rockchip: rga: remove size from rga_frame
>       media: rockchip: rga: remove stride from rga_frame
>       media: rockchip: rga: move rga_fmt to rga-hw.h
>       media: rockchip: rga: add feature flags
>       media: rockchip: rga: disable multi-core support
>       media: rockchip: rga: add rga3 support
>       arm64: dts: rockchip: add rga3 dt nodes
> 
>  .../devicetree/bindings/media/rockchip-rga.yaml    |   5 +-
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  46 ++
>  drivers/media/platform/rockchip/rga/Makefile       |   2 +-
>  drivers/media/platform/rockchip/rga/rga-buf.c      |  78 ++--
>  drivers/media/platform/rockchip/rga/rga-hw.c       | 404 ++++++++++++----
>  drivers/media/platform/rockchip/rga/rga-hw.h       |  18 +-
>  drivers/media/platform/rockchip/rga/rga.c          | 518 ++++++++-------------
>  drivers/media/platform/rockchip/rga/rga.h          |  82 ++--
>  drivers/media/platform/rockchip/rga/rga3-hw.c      | 471 +++++++++++++++++++
>  drivers/media/platform/rockchip/rga/rga3-hw.h      | 190 ++++++++
>  drivers/media/v4l2-core/v4l2-common.c              |  48 +-
>  include/media/v4l2-common.h                        |   6 +
>  12 files changed, 1375 insertions(+), 493 deletions(-)
> ---
> base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
> change-id: 20251001-spu-rga3-8a00e018b120
> prerequisite-change-id: 20251126-spu-iommudtefix-cd0c5244c74a:v1
> prerequisite-patch-id: 10c6c977c0f71400931941b42da73adcaf63e810
> 
> Best regards,
> --
> Sven Püschel <s.pueschel@pengutronix.de>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Deps: looking for dependencies matching 1 patch-ids
 Deps: Applying prerequisite patch: [PATCH] iommu/rockchip: disable fetch dte time limit
 Base: 1f2353f5a1af995efbf7bea44341aa0d03460b28 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de:

arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml
arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml






