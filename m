Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5C5C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hcaIb1XQkoNXnOuonrofeflYJgby32wLs0sCPZLdcY=; b=EajgryPbw1F3w8ovzhusg85CTu
	hb8W5IJ/FZoXh8jTZJB1bytAnptup9zhtxydkL4Y6kceuw2wWNr169jwCnHT76OOIpz+MVuO8V3E8
	DE6hVFg2EIXV05KcxzEsKPnl9tG02SkpoXqr6xeKORLZatvWvHvrEddp7ZFuaJgcXPxPLEa5gC0Jb
	Wa8tNWGoeUfTi4LyfD6hy1VviP6BEtab3HeQ3KbEdnlvxqzTAILN9f8q6N+74G3xiQy5GokzBnmHZ
	yjWGTRH7Ps+9v7M8t7FBB9dfeuP7vaIwtu+Y14ffmhR+1W6plJ9g6yyZ+sAt593ibVbwL5uVJXtjF
	D0SAti/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Of3-00000008e4m-1i0w;
	Wed, 23 Sep 2026 15:13:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Oez-00000008e4O-31jn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:13:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2367F1A32;
	Wed, 23 Sep 2026 08:13:20 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E9DE43F86F;
	Wed, 23 Sep 2026 08:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790176403; bh=phoCjmKpgbmmjwB/TcyzDXeAvmM89UaYWapuOmD6GO4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lT0HrR7dE1KrdfZA5B71p57+NqXyZadFCb7ajyLoJVdE7kZMh3rZ3Jd0t7uUp8jnW
	 fLqDM7jtOQPyRFFDJI03lMKNhDcWBWt6MltdUDqXOiaZKTfjhdEkEyRFSF66Rbvbq/
	 Yjv8PK7Ahg6Cgu2DicOgJTx/pdIes/7CME0K6SuM=
Message-ID: <37174cd4-95c0-4350-aeb2-b1b6abaccbff@arm.com>
Date: Wed, 23 Sep 2026 16:13:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/12] remoteproc: add support for any virtio device
To: Francesco Valla <francesco@valla.it>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown
 <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, virtualization@lists.linux.dev,
 imx@lists.linux.dev, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_081325_914172_F1C078F3 
X-CRM114-Status: GOOD (  50.09  )
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

On 16/09/2026 10:10 pm, Francesco Valla wrote:
> Hello,
> 
> this patch series introduces the possibility to support generic virtio
> devices over the remotepoc transport, whereas today only rpmsg and
> virtio-console are supported.
> 
> == Introduction ==
> 
> Support for devices other than rpmsg was originally planned [1] and is
> declared inside the documentation [2], but is in practice not there for
> the majority of (if not all) the platforms that provide remoteproc
> capabilities due to memory allocation.
> 
> While vrings are pre-allocated in an area that is reachable by both the
> local (i.e.; Linux) and remote processors, buffers produced by virtio
> drivers aren't, since they typically get allocated through kmalloc.
> The aforementioned rpmsg and virtio-console drivers instead use a trick
> to overcome this limitation and allocate these buffers directly from
> the remoteproc device's coherent memory area, somewhat breaking the
> separation between the driver and the underlying transport.

This sounds very much like needlessly reinventing restricted-dma-pool, 
with even the same underlying motivation, more or less...

Thanks,
Robin.

> 
> == Well, nice, but why? ==
> 
> Main usecase is sharing/virtualization of devices in hypervisor-less
> mixed-criticality contexts, where a subset of peripherals are controlled
> by a "safety" real-time processor but still need to be used by the Linux
> world. Several solutions have been / are being proposed [3] [4], but
> none of them re-uses the existing, standardized virtio specifications.
> 
> == The proposal ==
> 
> The proposed approach is to introduce a bounce buffering mechanism that
> is transparent to the drivers and can expose to remoteproc devices only
> memory areas they can access. This is obtained by defining the .map
> memeber of each registered vdev and use the map() and unmap() callback
> to bounce data to and from the remote processor, just like the swiotlb
> framework is doing in other contexts, using the device's coherent memory
> area and the associated functions to allocate the bounce buffers.
> 
> During the map() callback the address of the incoming buffer is compared
> against the coherent memory address base and size, to pass through
> buffers already suitable for remoteproc usage (e.g.: the ones allocated
> by the rpmsg framework).
> 
> == Status and open points ==
> 
> The series was tested against a custom Zephyr application [5] running on
> the Cortex-M33 processor of an i.MX93 and exposing six different virtio
> devices:
> 
>    - rpmsg
>    - entropy (rng)
>    - gpio
>    - i2c
>    - spi
>    - can
> 
> On top of three of them (unsurprisingly: i2c, spi, and gpio) several
> devices where declared inside Linux devicetree and successfully used
> (well, technically I'm still experiencing difficulties with gpio
> interrupts not firing on the M33, but that's not really related to the
> series).
> 
> Several open points are still present, and needs to be either
> investigated or discussed:
> 
>    - for each bounce buffer an entire page is allocated from the coherent
>      memory pool; this is a waste for most of the allocations, which take
>      on average 32 to 64 bytes. An option can be to initialize a DMA pool
>      on one page and allocate small buffers from it?
> 
>    - the support in its current form allocates more memory than before
>      (for bounce buffer tracking) also for existing usecases (i.e.,
>      mainly rpmsg).
> 
>    - an additional issue still exist - and is not solved by this series -
>      for a subset of virtio devices: communication through the device's
>      config space. The remoteproc transport expects this config space to
>      be somewhat constant, and there is no provision to sync changes made
>      by the driver with the remote device. This prevents e.g.
>      virtio-input to work.
> 
>    - device de-registration on remoteproc stop is causing oopses (under
>      investigation - might no be strictly tied to the series)
> 
> == Patches breakdown ==
> 
> Patches 1 and 2 are cleanups to the remoteproc-virtio driver and could
> be applied independently of this series.
> 
> Patch 3 was submitted a couple of months ago [6] and paves the road for
> the actual support of generic virtio devices, removing the fixed number
> of 2 for the vrings associated to a vdev.
> 
> Patch 4 introduces two new APIs for coherent memory areas associated to
> devices that are used later.
> 
> Patch 5 might somewhat be controversial, as it unconditionally defines
> the VIRTIO_F_VERSION_1 feature for all vdevs. This is required to
> support some virtio device types, and there is no other mean of
> defining it, since the field reserved for features inside the resource
> table is limited to 32 bits. Given that the 1.x virtio specifications
> are ~10 years old this still seems reasonable.
> 
> Patch 6 is were the bounce buffering mechanism is introduced; another
> feature (VIRTIO_F_ACCESS_PLATFORM) is there unconditionally defined to
> force the virtio framework to use the new map APIs.
> 
> Patches 7 and 8 are new devicetree bindings, the first for spi-virtio
> (modelled against the existing ones for gpio-virtio and i2c-virtio) and
> the second for declaring virtio device inside a devicetree. This is not
> required for some devices (e.g.: can, net, gpu), but for others is
> necessary to declare child devices and link them.
> 
> Patch 9 is used to convince the remoteproc-virtio transport to parse the
> bindings just defined; it is worth noting that the virtio framework
> already has the support for devicetree declarations and this adds only
> the glue between the existing support and remoteproc.
> 
> Patches 10 and 11 are i.MX-specific and enable the usage of the newly
> introduced support on this family of platforms. The first one might
> probably be sumbitted as-is independently of the series, as it aligns
> the behavior of imx-rproc to the other platforms in relation to mailbox
> usage.
> 
> Finally, patch 12 is the PoC that has been used to develop and test the
> series and shall not be merged.
> 
> ======
> 
> Thank you in advance for any comment you may want to leave.
> 
> Regards,
> Francesco
> 
> [1] https://lore.kernel.org/all/1330589497-4139-1-git-send-email-ohad@wizery.com/
> [2] https://elixir.bootlin.com/linux/v7.2.5/source/Documentation/staging/remoteproc.rst#L26
> [3] https://lore.kernel.org/linux-remoteproc/20260721204704.400781-1-shenwei.wang@oss.nxp.com/
> [4] https://cfp.embedded-recipes.org/er2026/talk/PCYPJP/
> [5] https://github.com/WallaceIT/zephyr/tree/multi_vdev
> [6] https://lore.kernel.org/all/20260621-vring_flex-v1-1-c6c582fbe94b@valla.it/
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
> Francesco Valla (12):
>        remoteproc: virtio: cleanup rproc_add_virtio_dev error path
>        remoteproc: virtio: replace commas with semicolons
>        remoteproc: virtio: support dynamic number of vrings
>        dma-coherent: add base and size APIs
>        remoteproc: always report VIRTIO_F_VERSION_1 feature
>        remoteproc: virtio: add bounce buffering for data buffers
>        dt-bindings: spi: add bindings for spi-virtio
>        dt-bindings: remoteproc: add remoteproc-virtio
>        remoteproc: search for a fwnode during vdev registration
>        remoteproc: imx_rproc: always use non-blocking mailboxes
>        dt-bindings: remoteproc: imx-rproc: support virtio
>        PoC: arm64: dts: imx93-11x11-frdm: add multiple vdevs
> 
>   .../bindings/remoteproc/fsl,imx-rproc.yaml         |   3 +-
>   .../bindings/remoteproc/remoteproc-virtio.yaml     |  89 +++++++++
>   .../devicetree/bindings/spi/spi-virtio.yaml        |  52 +++++
>   arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 128 +++++++++++-
>   drivers/remoteproc/imx_rproc.c                     |  49 +----
>   drivers/remoteproc/imx_rproc.h                     |   1 -
>   drivers/remoteproc/remoteproc_core.c               |  43 +++-
>   drivers/remoteproc/remoteproc_virtio.c             | 222 ++++++++++++++++++---
>   include/linux/dma-map-ops.h                        |  10 +
>   include/linux/remoteproc.h                         |  24 ++-
>   kernel/dma/coherent.c                              |  34 ++++
>   11 files changed, 562 insertions(+), 93 deletions(-)
> ---
> base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
> change-id: 20260915-remoteproc_virtio_map-bcf32a5fab54
> 
> Best regards,
> --
> Francesco Valla <francesco@valla.it>
> 


