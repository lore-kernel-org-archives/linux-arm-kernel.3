Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31E1E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 11:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMI3iDAeAP2ov5Q5Ujy5YD/LwbMC1EAnCHI/eZzqXfg=; b=I7F/f6UnDa8BGH0NXguzWrLxZU
	OEqScxAthP/NpbqWVIFFOMHGpBOrd08uyogx3YmiJF4YdBHMBPeq5nZGa76wNd1AWzaSac3hrPz7U
	lE4QQRfBFvJ6labyP6vGw5AXpKdSZnnHz52S5xtJMwhUQhi69WeJCuJvNQVqXbKgZoKTmYhXnMGWQ
	/tXyPjYga4EugTHWvvcGmL2bTsFcxYOAfBiGMKoV9aApPEgzypvSuYF5jHVk8w2JhVW5ifK4QWw7k
	/r+K0k5NRgRtdmsBbCA/pK9zmMYz3PpgY8DElYT7JIwqjAwPCjemX6NkGxEHTnBm8veSFuTYRExEr
	FXLsD5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQPhA-0000000Djsu-3Inc;
	Wed, 25 Dec 2024 11:36:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQPfx-0000000Djlk-2azr;
	Wed, 25 Dec 2024 11:35:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1451A5C4D9B;
	Wed, 25 Dec 2024 11:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93C3C4CECD;
	Wed, 25 Dec 2024 11:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735126540;
	bh=+C9n8JDIWCsXwlKI2qAt89tsfjxEOZm49dWRgp9c/f8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FV51Z6sv9VwFqGzWb/yRWHRApK/SFKreF5KRaBeyLzPzEHX1GiEbXO/Bthp/A5lkd
	 Nogy4ayudK9mX1VOWGO+Ouuq2ngh4gsP5zs9CcdzrhbTdESwNf8FuwCBzwcXl5NEOn
	 5leBH88OmynDwscFn20MhDLu6e/wfxWjdd2gwSIZZXbJ/6odXMq2B34EzNVZgKomrx
	 +Ye/HTT96t8jXWkycpGt1wFgdh2uRrE0L+IYSfgEYLlNlYod8/9HfmPYF6Xeo+tQaO
	 wDBIg303EysL0RFSk8V4mhPHhses3/uq5GrIE2PF8N+kfwodaCclLE2idDzjCFW8Lh
	 bz6Mj/DdkZG/w==
Message-ID: <fea37c93-7165-4c27-80e6-921ae1c35f77@kernel.org>
Date: Wed, 25 Dec 2024 12:35:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
To: "bo.kong" <bo.kong@mediatek.com>, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org
Cc: conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241225090113.17027-1-bo.kong@mediatek.com>
 <20241225090113.17027-4-bo.kong@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241225090113.17027-4-bo.kong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_033541_758743_AC69A5C8 
X-CRM114-Status: GOOD (  25.51  )
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

On 25/12/2024 10:00, bo.kong wrote:
> From: Bo Kong <Bo.Kong@mediatek.com>
> 
> Add a V4L2 sub-device driver for MT8188 AIE.
> 
> Signed-off-by: Bo Kong <Bo.Kong@mediatek.com>
> ---
> 
> Changes in v3:
> 1. Remove not used include file, include only headers which AIE use
> 2. Remove Makefile some private driver headers
> 
> Changes in v2:
> 1. Fix coding style

Only? Although several of my comments were about coding style, I pointed
out different issues lack totally fake CONFIG symbols, incorrect usage
of singleton approach and more. Are they implemented?

Both of your changelogs are very vague, so I say does not make the
review process easier.

> ---
>  drivers/media/platform/mediatek/Kconfig       |    1 +
>  drivers/media/platform/mediatek/Makefile      |    1 +
>  drivers/media/platform/mediatek/aie/Kconfig   |   41 +
>  drivers/media/platform/mediatek/aie/Makefile  |    8 +
>  drivers/media/platform/mediatek/aie/mtk_aie.h |  950 +++++
>  .../media/platform/mediatek/aie/mtk_aie_53.c  | 1398 +++++++
>  .../media/platform/mediatek/aie/mtk_aie_drv.c | 3545 +++++++++++++++++
>  7 files changed, 5944 insertions(+)
>  create mode 100644 drivers/media/platform/mediatek/aie/Kconfig
>  create mode 100644 drivers/media/platform/mediatek/aie/Makefile
>  create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie.h
>  create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_53.c
>  create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_drv.c
> 
> diff --git a/drivers/media/platform/mediatek/Kconfig b/drivers/media/platform/mediatek/Kconfig
> index 84104e2cd024..cd161272666b 100644
> --- a/drivers/media/platform/mediatek/Kconfig
> +++ b/drivers/media/platform/mediatek/Kconfig
> @@ -2,6 +2,7 @@
>  
>  comment "Mediatek media platform drivers"
>  
> +source "drivers/media/platform/mediatek/aie/Kconfig"
>  source "drivers/media/platform/mediatek/jpeg/Kconfig"
>  source "drivers/media/platform/mediatek/mdp/Kconfig"
>  source "drivers/media/platform/mediatek/vcodec/Kconfig"
> diff --git a/drivers/media/platform/mediatek/Makefile b/drivers/media/platform/mediatek/Makefile
> index 38e6ba917fe5..23a096fdf21c 100644
> --- a/drivers/media/platform/mediatek/Makefile
> +++ b/drivers/media/platform/mediatek/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +obj-y += aie/
>  obj-y += jpeg/
>  obj-y += mdp/
>  obj-y += vcodec/
> diff --git a/drivers/media/platform/mediatek/aie/Kconfig b/drivers/media/platform/mediatek/aie/Kconfig
> new file mode 100644
> index 000000000000..b7925cd69309
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/aie/Kconfig
> @@ -0,0 +1,41 @@
> +config VIDEO_MTK_AIE
> +	tristate "MediaTek AI engine function"
> +	depends on OF
> +	select V4L2_MEM2MEM_DEV
> +	select VIDEOBUF2_DMA_CONTIG
> +	select MEDIA_CONTROLLER_REQUEST_API
> +	help
> +	  Support the AI engine (AIE) feature
> +
> +	  AIE driver is a V4L2 memory-to-memory device driver which
> +	  provides hardware accelerated face detection function,
> +	  it can detect different sizes of faces in a raw image.
> +
> +config VIDEO_MTK_AIE_RESULT_IN_KERNEL
> +	bool "Operate AIE in kernel mode"
> +	depends on VIDEO_MTK_AIE
> +	default y
> +	help
> +	  When this option is enabled, the MediaTek (MTK) AIE driver operates in
> +	  kernel mode, which is the default mode.
> +
> +	  In kernel mode, the AIE driver's results are processed directly within
> +	  the kernel space, enhancing performance and reliability.
> +
> +	  Disabling this option might compromise the AIE driver performance and stability.
> +
> +	  Unless you have specific needs for operating the driver in user mode,
> +	  for example: unit test (UT), this option should remain enabled.
> +
> +config VIDEO_MTK_AIE_RESULT_IN_USER
> +	bool "Operate AIE in user mode"
> +	depends on VIDEO_MTK_AIE
> +	help
> +	  Enabling this option sets the MediaTek (MTK) AIE driver to operate in
> +	  user mode.
> +
> +	  In this mode, AIE driver result values are handled at user level, providing an
> +	  organized manner to store multiple result values.
> +
> +	  Unless you understand the implications of operating in user mode,
> +	  this option is usually recommended to be disabled.
> \ No newline at end of file


Your patches have patch warnings.

> diff --git a/drivers/media/platform/mediatek/aie/Makefile b/drivers/media/platform/mediatek/aie/Makefile
> new file mode 100644
> index 000000000000..15c1638a5064
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/aie/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0
> +mtk-aie-$(CONFIG_VIDEO_MTK_AIE) += mtk_aie_53.o
> +mtk-aie-$(CONFIG_VIDEO_MTK_AIE) += mtk_aie_drv.o
> +
> +obj-$(CONFIG_VIDEO_MTK_AIE) += mtk-aie.o
> +
> +ccflags-$(CONFIG_VIDEO_MTK_AIE) += -I$(srctree)/drivers/misc/mediatek/mtk-interconnect/
> +ccflags-$(CONFIG_VIDEO_MTK_AIE) += -I$(srctree)/drivers/media/platform/mtk-isp/mtk-vmm/

Drop both. You are not supposed to include other drivers private data
structures. Encapsulation and interfaces are there for a purpose.


> \ No newline at end of file


Same here

....

> +
> +#define FLD_BLINK_WEIGHT_FOREST14_SIZE	6416
> +#define FLD_CV_SIZE			19392
> +#define FLD_FP_SIZE			80160
> +#define FLD_LEAFNODE_SIZE		4608000
> +#define FLD_TREE_KM02_SIZE		120000
> +#define FLD_TREE_KM13_SIZE		120000
> +#define FLD_OUTPUT_SIZE			112
> +
> +#define FD_VERSION	1946050
> +#define ATTR_VERSION	1929401

Nothing improved, drop. Drivers do not have versions.

I'll skip the rest.

Best regards,
Krzysztof

