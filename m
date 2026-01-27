Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9E2D2FED9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 19:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1dnhRLMtu5/XnmCGlow67PwZlHIqJ0tA39/W+z0sa4=; b=b9v3cRFAvmTEVEiPQrfsj++vl2
	TSnX1/CVlWyRNDutHZb4mPYThPdV/y7aTOGugWSSY9NlSBbZxjAVlqvwWeYt/MSi+iG4e8e7LjowH
	XR6vVZEp5Od3rFq0iicdZpFHU3bnXYV4Memoifr2FfoxgjZu+2dWuQuaEW3stWt3fJm1EG347yZMJ
	pfO6qOITmLY/u8O2726tqEZN7YiFKY0qiHcH81i4BjrtH5OI3zH0JXJTDMO2inAdB8o1zj7qtunxM
	xTx34kIXAxQFZldlPXcT8LciZu6apqjW8Npw9HKBIhJ0Q1bswUMp37WfEBuY64J0dmjuOiVKJsR7C
	bLLx+m0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoX3-0000000Etml-1Io9;
	Tue, 27 Jan 2026 19:15:21 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoX1-0000000EtmN-2ijV;
	Tue, 27 Jan 2026 19:15:19 +0000
Message-ID: <d46a7e44-cddf-425c-a233-911c2d949b9b@infradead.org>
Date: Tue, 27 Jan 2026 11:15:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] stm class: Fix Kconfig symbols
To: Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Clark <james.clark@linaro.org>
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20260127-fix_stm_kconfig-v2-1-3c067e00f82e@arm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260127-fix_stm_kconfig-v2-1-3c067e00f82e@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 1/27/26 10:14 AM, Leo Yan wrote:
> Kconfig symbols must not include the CONFIG_ prefix.  Remove the CONFIG_
> prefix for default values to work.
> 
> The STM_PROTO_SYS_T config is selected by default when STM is enabled.
> However, its description currently says "If you don't know what this is,
> say N," which contradicts the default behavior.  Update the description
> to say "Y" to align with the default setting.
> 
> Fixes: a02509f301c6 ("stm class: Factor out default framing protocol")
> Fixes: d69d5e83110f ("stm class: Add MIPI SyS-T protocol support")
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Greg has already merged a patch to fix the symbols:
https://patch.msgid.link/20251228190502.2480758-1-rdunlap@infradead.org


> ---
> Changes in v2:
> - Updated STM_PROTO_BASIC description to align with default selection
>   (James).
> - Link to v1: https://lore.kernel.org/r/20251217-fix_stm_kconfig-v1-1-531fb3674549@arm.com
> ---
>  drivers/hwtracing/stm/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/stm/Kconfig b/drivers/hwtracing/stm/Kconfig
> index eda6b11d40a1f9ab49a1ec1e6faae8ee178c5ed3..8ab079785189052945521e9b0a93a0d458de37e0 100644
> --- a/drivers/hwtracing/stm/Kconfig
> +++ b/drivers/hwtracing/stm/Kconfig
> @@ -13,7 +13,7 @@ if STM
>  
>  config STM_PROTO_BASIC
>  	tristate "Basic STM framing protocol driver"
> -	default CONFIG_STM
> +	default STM
>  	help
>  	  This is a simple framing protocol for sending data over STM
>  	  devices. This was the protocol that the STM framework used
> @@ -28,7 +28,7 @@ config STM_PROTO_BASIC
>  
>  config STM_PROTO_SYS_T
>  	tristate "MIPI SyS-T STM framing protocol driver"
> -	default CONFIG_STM
> +	default STM
>  	help
>  	  This is an implementation of MIPI SyS-T protocol to be used
>  	  over the STP transport. In addition to the data payload, it
> @@ -38,7 +38,7 @@ config STM_PROTO_SYS_T
>  	  The receiving side must be able to decode this protocol in
>  	  addition to the MIPI STP, in order to extract the data.
>  
> -	  If you don't know what this is, say N.
> +	  If you don't know what this is, say Y.
>  
>  config STM_DUMMY
>  	tristate "Dummy STM driver"
> 
> ---
> base-commit: fcb70a56f4d81450114034b2c61f48ce7444a0e2
> change-id: 20251216-fix_stm_kconfig-a72f40c7612c
> 
> Best regards,


