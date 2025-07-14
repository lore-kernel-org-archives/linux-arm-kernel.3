Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25F7C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 21:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qggdjPd0uCxL6yB0E8Ml7RKhraXV+K7ax0wriGHEiGQ=; b=mV2Rx3VV8LJxt58dmCc4jgODCA
	NWzHIc4dHIs1jFXUpalCm0ud7PWr/wRl8fovbGLvBwGDKblqNfMQux3afreHVDeMa/V07L4X3jLMM
	/3XhKs7pcUOPgQBa/BzIbm4gc/HFTKtibD3lKH+73w++ceoIZ7bIwX3FOPwLVDvia9VGpy+jjy+Ov
	3uUdzYPsuetfk5HoCt33CfR7+kb8EODbcFHMWBe4HYWCfuOg3+OOdtMMuO+UWWVj4N9a4OQBoV2TM
	xrGckhDxz/yuRJs3CpWOrYmcCcAHH+JDbZuI4KIlkIRfVY5iyylyFtkKvtSImkLz4U8XWJ+sFxvde
	nq+CU/8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubQi7-00000003JEk-2HgC;
	Mon, 14 Jul 2025 21:27:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubQfg-00000003IsY-0Uxl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 21:25:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C835744543;
	Mon, 14 Jul 2025 21:25:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8367EC4CEED;
	Mon, 14 Jul 2025 21:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752528311;
	bh=b9BS5SuhpnpfhpBqkFecFWoYS4AXrJnOWQBm51fbwPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DrCtW2o+Cg3AuKLuivXpz0UEOzfwogaMgn7S68rRCsQlX91c2avHcF1JrOgrv8K3u
	 7lIAEMPSBknsrpvrS7ekAEwSanvLX++uC6606gbo274AndqbjXFM8NXSvFlPFKZRgL
	 DfiVARwSFHEWyOadeF89Eb6DHAK1U2zl+fKVshYLjQhfXWXFd6zpKKHPHPryl061wg
	 WXzNDzDmSXlsv92BLtmZOM5a2R65b2MO17gC1clN6RdPPV2tZraahe7ueS+O+mL9A1
	 VvrcQJenJWeQvxFz6vkfmfcJsUyfe+81U0vokSzWuBIBmo0BKiGxdX4izDNJPUaRLA
	 2CFNOOIQTQXuQ==
Date: Mon, 14 Jul 2025 16:25:10 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
	mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v11 07/19] dt-bindings: media: Add bindings for ARM
 mali-c55
Message-ID: <20250714212510.GA3193902-robh@kernel.org>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
 <20250714-c55-v11-7-bc20e460e42a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714-c55-v11-7-bc20e460e42a@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_142512_174126_F63AAA37 
X-CRM114-Status: GOOD (  12.64  )
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

On Mon, Jul 14, 2025 at 04:06:33PM +0100, Daniel Scally wrote:
> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v11:
> 
> 	- Dropped in arm,inline_mode property. This is now identical to the
> 	  reviewed version 8, so I have kept the tags on there.

[...]

> +  arm,inline_mode:
> +    description:
> +      The ISP can be either electrically connected to sensor and CSI-2 receiver
> +      or driven through a DMA input device. This property declares the ISP as
> +      being electrically connected to the source of image data.
> +    type: boolean

Except you didn't drop it.

Rob


