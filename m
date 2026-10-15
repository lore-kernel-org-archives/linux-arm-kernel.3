Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D2FCC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ciuww8GYCgeFiClfswF1NrS3AvHuKpWEdFzKRnqbzDI=; b=xaBjPzowDFPTCFU7YAnSi6Fwxf
	vj78cdGg8iIusqfHCGt/Xfi3yhabgX2mWxzj5hfCo+W4CUbjvpfpfyGtYBCbvtQq/b+NnyPcTkbcZ
	UVODJwDizvKUlRRG4zPa/E2zSIcWHkXW3ewBYqgEDwFZz/2uh1CSuB6ieQDvrKiw9TJikZd5PfP1H
	QmIPU04zK5GcF5hPY/+wSVUwEQGS8Y9smK6bPDGs8qdtDKWiNdFeienkhIxmG7Xmj1ceBurPhaBLT
	2U2wO0s27laaKMT8C77NQ/dqYsUWp44yqXYaZPU/ZFiu0W8BPd/MinMv0hax2+v1ZOTpsZNbn18U0
	LxVAk+Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHI7B-0000000HLJd-2Ovd;
	Thu, 15 Oct 2026 09:51:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHI79-0000000HLJD-1jG1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:51:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC48041FFD;
	Thu, 15 Oct 2026 09:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606FD1F000C5;
	Thu, 15 Oct 2026 09:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057866;
	bh=Ciuww8GYCgeFiClfswF1NrS3AvHuKpWEdFzKRnqbzDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FFBPh2JfE21Jgdt4OH9tVMqAkq1OBwBZSephPUkhOVYon3UiAgZXC75JU6kS7tRff
	 U4qNtpQlX6QRDOVP9jI3Uj9iRbO+7Ak/kUUQGu5PNZBk9zWFSgve2ccg+foRTycjhJ
	 De3AZIGx4ZTJXrzHOSPr8wxGuXbk6qApYossAeXG11KepXzm2p/yt2pgYpv8jRsnFU
	 WJAa86akJMQY516mJA0shHroWIRZNuyH1L+qUQmh+avFGg8BQwXMAOd6n8GQ8Pdelz
	 0B9ynpLsWdxny4E5ME+2Eg6KBY6y9hHYUg771eGMc18i1/BtaNJ44fJ7qk+9Ellhls
	 +j06itIJMqfcw==
Date: Thu, 15 Oct 2026 11:51:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org, 
	mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	michal.simek@amd.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, tanmay.shah@amd.com
Subject: Re: [PATCH 6/6] remoteproc: amd_mbv_bram: Add RPMsg support
Message-ID: <20261015-amusing-private-hyena-65b1e8@quoll>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-7-ben.levinsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014213426.2957480-7-ben.levinsky@amd.com>
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

On Wed, Oct 14, 2026 at 02:34:26PM -0700, Ben Levinsky wrote:
> Register named reserved-memory carveouts and expose the firmware
> resource table after it has been loaded into BRAM. This lets remoteproc
> create virtqueues backed by reserved shared DDR without deriving
> carveout roles from DT node names. Map the shared-memory carveouts with
> the common rproc_mem_entry_ioremap_wc() and rproc_mem_entry_iounmap()
> callbacks.
> 
> Use the mailbox framework to send virtqueue notification IDs. Defer
> received notifications to process context before dispatching them to
> the remoteproc virtqueues. Keep mailbox payload storage valid until
> transmit completion and order write-combined vring updates before each
> kick.
> 
> For designs where the mailbox and remote processor share a clock, request
> the mailbox channels only after enabling that clock, while the processor
> is still held in reset. Release the channels before disabling the clock
> during stop.
> 
> The mailboxes are optional. Without them the driver keeps supporting
> load, start, and stop only.
> 
> Select the mailbox framework, the AMD PL Mailbox controller and the
> virtio RPMsg bus, which the driver uses for notifications and RPMsg
> channels. Selecting MAILBOX while depending on GPIOLIB creates a
> Kconfig recursive dependency, because GPIOLIB is selected by drivers
> that are reachable from MAILBOX, so select GPIOLIB as well instead of
> depending on it. The driver always needs GPIO for the reset line.
> Depend on HAS_IOMEM, which the selected mailbox controller and the
> write-combined carveout mappings require.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  drivers/remoteproc/Kconfig              |   6 +-
>  drivers/remoteproc/amd_mbv_bram_rproc.c | 231 +++++++++++++++++++++++-
>  2 files changed, 235 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 5b56b2dcc725..9ebbbf76289f 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -25,7 +25,11 @@ config REMOTEPROC_CDEV
>  
>  config AMD_MBV_BRAM_REMOTEPROC
>  	tristate "AMD MicroBlaze/V BRAM-based remoteproc support"
> -	depends on OF && COMMON_CLK && (GPIOLIB || COMPILE_TEST)
> +	depends on OF && COMMON_CLK && HAS_IOMEM
> +	select GPIOLIB
> +	select MAILBOX
> +	select AMD_PL_MAILBOX

You should not select user-visible symbols.

Best regards,
Krzysztof


