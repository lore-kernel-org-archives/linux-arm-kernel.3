Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C742F105F7AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9JLHEfOQTk5oJxWb7oSnUKcGYtFdOeNyi38Daap76Q=; b=GSUCx82jmuHQGkzhVBPvDQTsjM
	cSm/PSSd8F6uafa/J3NaIFTDVti+bPk8b8HyHiRt0GkVwu1+lomjizBmP9QYozC9Nuh5/Py/O65qj
	3s8TFaOPW9kq6NVs6VJqpR1CWyVIx2i6v4GxuA09k4sOrSCBHRLPhp3Q0OA0n764WPtcrh1XsaWjK
	06EPbp3lM+NNgpr5zF3IxGESnzdJTZ7ZSrHNCCW6PiTVQZgjgxWUOp4E5MiOzyCmKw87+r3Al9yNr
	/IOXgRNHAA4YFPHUX/Uo6YcfctB3MwnR/x3R2VuwAn+Nms+jSUO8Vv6TiyMj0mKpvGcy953NLEN6v
	GumejI0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13xF-00000000U8Q-0qUi;
	Fri, 13 Mar 2026 14:57:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13xD-00000000U7w-0Kpt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:57:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00920165C;
	Fri, 13 Mar 2026 07:57:23 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3912C3F7BD;
	Fri, 13 Mar 2026 07:57:27 -0700 (PDT)
Message-ID: <29ea4774-ba12-4338-9245-096a02293921@arm.com>
Date: Fri, 13 Mar 2026 15:57:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: zena: Refactor Devicetree nodes
To: Debbie Horsfall <debbie.horsfall@arm.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, liviu.dudau@arm.com,
 sudeep.holla@kernel.org, lpieralisi@kernel.org, linusw@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260311173948.3478931-1-debbie.horsfall@arm.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260311173948.3478931-1-debbie.horsfall@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_075731_243900_B9E0370B 
X-CRM114-Status: GOOD (  14.41  )
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

Hi,

On 3/11/26 18:39, Debbie Horsfall wrote:
> Move the SRAM node into the SoC node. Move the memory node out of
> the include to make it customizable for each platform variant.

Looks good to me, indeed just moving the nodes around.

> Signed-off-by: Debbie Horsfall <debbie.horsfall@arm.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
> This targets for-next/juno/updates in response to
> https://lore.kernel.org/linux-arm-kernel/20260309-manipulative-inescapable-labradoodle-7a76e4@sudeepholla/
>   arch/arm64/boot/dts/arm/zena-css-fvp.dts |  8 +++++
>   arch/arm64/boot/dts/arm/zena-css.dtsi    | 44 ++++++++++--------------
>   2 files changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/arm/zena-css-fvp.dts b/arch/arm64/boot/dts/arm/zena-css-fvp.dts
> index b75204a91882..53c5412d92b2 100644
> --- a/arch/arm64/boot/dts/arm/zena-css-fvp.dts
> +++ b/arch/arm64/boot/dts/arm/zena-css-fvp.dts
> @@ -14,6 +14,14 @@ / {
>   	chosen {
>   		stdout-path = &soc_serial0;
>   	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +
> +		/* ~2GB mapped at 2GB, another 2GB at 2TB */
> +		reg = <0x00000000 0x80000000 0x00000000 0x7f000000>,
> +		      <0x00000200 0x00000000 0x00000000 0x80000000>;
> +	};
>   };
>   
>   &soc {
> diff --git a/arch/arm64/boot/dts/arm/zena-css.dtsi b/arch/arm64/boot/dts/arm/zena-css.dtsi
> index 9899d2883337..0b41ee4bf4c6 100644
> --- a/arch/arm64/boot/dts/arm/zena-css.dtsi
> +++ b/arch/arm64/boot/dts/arm/zena-css.dtsi
> @@ -634,6 +634,24 @@ soc: soc {
>   		#size-cells = <2>;
>   		ranges;
>   
> +		sram: sram@104000 {
> +			compatible = "mmio-sram";
> +			reg = <0x0 0x00104000 0x0 0x00001000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0x0 0x00104000 0x00001000>;
> +
> +			scmi_shmem_tx: scpshmem-sram-section@0 {
> +				compatible = "arm,scmi-shmem";
> +				reg = <0x0 0x100>;
> +			};
> +
> +			scmi_shmem_rx: scpshmem-sram-section@100 {
> +				compatible = "arm,scmi-shmem";
> +				reg = <0x100 0x100>;
> +			};
> +		};
> +
>   		timer@1a810000 {
>   			compatible = "arm,armv7-timer-mem";
>   			reg = <0x0 0x1a810000 0x0 0x10000>;
> @@ -748,30 +766,4 @@ timer {
>   			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
>   			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
>   	};
> -
> -	sram: sram@104000 {
> -		compatible = "mmio-sram";
> -		reg = <0x0 0x00104000 0x0 0x00001000>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		ranges = <0 0x0 0x00104000 0x00001000>;
> -
> -		scmi_shmem_tx: scpshmem-sram-section@0 {
> -			compatible = "arm,scmi-shmem";
> -			reg = <0x0 0x100>;
> -		};
> -
> -		scmi_shmem_rx: scpshmem-sram-section@100 {
> -			compatible = "arm,scmi-shmem";
> -			reg = <0x100 0x100>;
> -		};
> -	};
> -
> -	memory@80000000 {
> -		device_type = "memory";
> -
> -		/* ~2GB mapped at 2GB, another 2GB at 2TB */
> -		reg = <0x00000000 0x80000000 0x00000000 0x7f000000>,
> -		      <0x00000200 0x00000000 0x00000000 0x80000000>;
> -	};
>   };


