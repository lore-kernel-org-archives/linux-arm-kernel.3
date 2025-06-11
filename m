Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D122C71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 21:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1X+FiBBM2xyMLhItIAh4LmcSLnrNJz4rjHinXk6p5eE=; b=vdy1W8w0zqMxLQk/jZnBDRMiKk
	x1CzwSaBi7iusSnsXZNGijiZTm8TPe5+vHyBUmmiSW07iQhuxuJpDiP5vvzcXmYpE0uRNQ47VgRyN
	nm6NKAVgX7A/kAgxX+EcN+0HnpYBLTrPQkKTEZK2SFeoup/dPjSD5MA+x5vP8372rPNZBkgJvq6UV
	W/Ts7mFtsoEgtiRXx2RyoB2AZMUuDjZtlYJJiivxfZHnrAlWhWpdb8wOTPFfD4B4tXrMsuRD9nR8n
	bds3bCS4uR0pXEPABAl8FDwIyxnLnABSQJc2kkQvqbJJFhSbESJ6BM2Yo8zYJfO+xDCHYdoD+/WC/
	X21htf3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPT0r-0000000BKvC-1Dsl;
	Wed, 11 Jun 2025 21:29:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPQsO-0000000Aweg-3gX6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 19:12:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 59E7EA51A10;
	Wed, 11 Jun 2025 19:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775F2C4CEEA;
	Wed, 11 Jun 2025 19:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749669161;
	bh=MnB19TOfh+7ykleBocTv6CizHYIdFED5uoDIM0y6n9k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XqIX/i3fZR55ETgbwAWPhI0j5uEDBeW4vjrvwLkM2E1Tge9X2zRXHpj0sAFMSHd3J
	 Kkaz0/TEmOasYiFG6a4lG6VJsLZh4glznnYUrsgP7/in94ur0D9faWikDPXyDPOtZK
	 6eLG0cWS1X9i1+v2+HAqVhQ0ihjAqK1UhfCwqqk1WlEAYkrUQ9eDx8f8cdO+KXqGis
	 vghYhn3FjVleOrD4smgdM/CfM/Rjyx8WEMuFquUBQ+S+C+A6UlXlNB6u/lurJ7LUMF
	 xPWVRUpsHPIvTm42xXMaue+X3TKer3G2M+8nbet7moPc/V3VqZ5mSJzSmrmenLVt+9
	 LteSgWdVkHlqQ==
Message-ID: <47bcce06-9c08-40ee-a22a-bc168952b74a@kernel.org>
Date: Wed, 11 Jun 2025 21:12:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: Add Apple SoC GPU
To: fnkl.kernel@gmail.com
Cc: asahi@lists.linux.dev,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Janne Grunau <j@jannau.net>, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
 <20250611-sgx-dt-v1-2-7a11f3885c60@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250611-sgx-dt-v1-2-7a11f3885c60@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_121245_055262_ACF024B7 
X-CRM114-Status: GOOD (  14.76  )
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

On 11.06.25 19:32, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add device tree entries for GPUs in M-series SoCs
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>   arch/arm64/boot/dts/apple/t6000.dtsi        |  4 ++++
>   arch/arm64/boot/dts/apple/t6001.dtsi        |  4 ++++
>   arch/arm64/boot/dts/apple/t6002.dtsi        |  4 ++++
>   arch/arm64/boot/dts/apple/t600x-common.dtsi | 34 ++++++++++++++++++++++++++++++++++
>   arch/arm64/boot/dts/apple/t600x-die0.dtsi   | 28 ++++++++++++++++++++++++++++
>   arch/arm64/boot/dts/apple/t8103.dtsi        | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   arch/arm64/boot/dts/apple/t8112.dtsi        | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   7 files changed, 198 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t6000.dtsi b/arch/arm64/boot/dts/apple/t6000.dtsi
> index 89c3b211b116e96ee0a5ea0c923c3ab824008307..3b60842045d4c3277e9530a13ef2811774209697 100644
> --- a/arch/arm64/boot/dts/apple/t6000.dtsi
> +++ b/arch/arm64/boot/dts/apple/t6000.dtsi
> @@ -16,3 +16,7 @@ / {
>   };
>   

[....]

>   	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		gpu_globals: globals {
> +			reg = <0x0 0 0 0>;
> +		};
> +
> +		gpu_hw_cal_a: hw-cal-a {
> +			reg = <0x0 0 0 0>;
> +		};
> +
> +		gpu_hw_cal_b: hw-cal-b {
> +			reg = <0x0 0 0 0>;
> +		};
> +
> +		uat_handoff: uat-handoff {
> +			reg = <0x0 0 0 0>;
> +		};
> +
> +		uat_pagetables: uat-pagetables {
> +			reg = <0x0 0 0 0>;
> +		};
> +
> +		uat_ttbs: uat-ttbs {
> +			reg = <0x0 0 0 0>;
> +		};

With W=1 this results in a bunch of new warnings like

arch/arm64/boot/dts/apple/t600x-common.dtsi:391.24-394.5: Warning
(unit_address_vs_reg): /reserved-memory/globals: node has a reg or
ranges property, but no unit name

but I'm not sure it's possible to fix that without making up fake
addresses that then get overwritten here. Would be nice to fix this some
other way but I'm not sure how and so far we don't enforce "no
additional W=1 warnings", so:


Reviewed-by: Sven Peter <sven@kernel.org>



Best,


Sven




