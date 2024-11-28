Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817E3D70DFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 23:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrQpDYmT5XJKVhAhoTC1IRRFoIvigLLUx5e3SBv2XLY=; b=LxyWwPqc1qs8E25TpEEgtBPeXn
	PyJgE3bCuG+knxDaqk2LLtfzPP4Pgz8Fo5L53UxfnslV8TwMlOgKSKvrnfAFMZqAU4cRIDyiJvJaf
	PsfUm/5y+/I9ixHVtH6smGVQTR71Kv64yp610nSP3qzRraEcHCIinUO8NVK6oHTPKW/Y20P05fh7j
	rTQwV2BPIFNMA3Kl1B7UDdgQor2olaiegpRvVGGWHvrVijU3LrH4a7SMLWO+d1JrHQbgkcHAk7xdz
	Ni42mi0+vFV85xUIVpMQjQKXirDLIgs0dYf2H6gFSeGb4anD3pm+O0f0j1IVAxZ6NC8NzBn3Xflup
	DI1MnwqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGnsG-0000000GZHl-3ftH;
	Thu, 28 Nov 2024 23:24:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGnrH-0000000GZBl-2BeH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 23:23:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C5391474;
	Thu, 28 Nov 2024 15:24:06 -0800 (PST)
Received: from [192.168.178.92] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B5F83F66E;
	Thu, 28 Nov 2024 15:23:33 -0800 (PST)
Message-ID: <5b07cd47-868d-46a3-b365-ccac2a68b792@arm.com>
Date: Thu, 28 Nov 2024 23:23:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Update H700 opp values
To: Philippe Simons <simons.philippe@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
References: <20241128154556.2743839-1-simons.philippe@gmail.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
Cc: Chris Morgan <macromorgan@hotmail.com>, Ryan Walklin <ryan@testtoast.com>
In-Reply-To: <20241128154556.2743839-1-simons.philippe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_152339_657535_5D362850 
X-CRM114-Status: GOOD (  16.41  )
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

Hi Philippe,

thanks for taking care of sending a patch!
You would need prefixes on the subject line to point to the right 
subsystem. A "git log path/to/changed_file" would give you the prefix of 
previous patches, for you to copy from. In this case it would be:
arm64: dts: allwinner: h616: update H700 OPP values

On 28/11/2024 15:45, Philippe Simons wrote:
> My H700 (RG35XX-H, RG40XX-V and RG CubeXX) devices are very unstable,
> especially with some OPPs.
> Crashes were fairly easy to reproduce with any dynamic cpufreq governor
> and some load on CPU, usually in matter of minutes.
> Crashes manifested randomly as simply hanging or various kernel oops
> 
> Manufacturer (Anbernic) is using more conservative mircrovolt values,
> so let's use these.
> While using performance gov seems stables at 1.5Ghz, it still crashes
> using a dynamic gov (even with Andre reparenting patch), so let's drop
> it for now, like manufacturer does.
> 
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com

The change itself looks alright, bumping the OPP voltages by 50mV looks 
reasonable, and is a no-brainer if it stops the issues you have seen.

The loss of the 1.5GHz top OPP is a bummer, but stability comes 
definitely first, otherwise we will just fail faster ;-)

I would like to hear opinions from Ryan and Chris (both CC:ed). Did you 
see similar issues with say the ondemand governor?

The patch itself looks correct, so for that:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>   .../dts/allwinner/sun50i-h616-cpu-opp.dtsi    | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
> index dd10aaf47..ac13fe169 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
> @@ -50,24 +50,21 @@ opp-1008000000 {
>   			opp-microvolt-speed2 = <950000>;
>   			opp-microvolt-speed3 = <950000>;
>   			opp-microvolt-speed4 = <1020000>;
> -			opp-microvolt-speed5 = <900000>;
> +			opp-microvolt-speed5 = <950000>;
>   			clock-latency-ns = <244144>; /* 8 32k periods */
>   			opp-supported-hw = <0x3f>;
>   		};
>   
>   		opp-1032000000 {
>   			opp-hz = /bits/ 64 <1032000000>;
> -			opp-microvolt = <900000>;
> +			opp-microvolt = <950000>;
>   			clock-latency-ns = <244144>; /* 8 32k periods */
>   			opp-supported-hw = <0x20>;
>   		};
>   
>   		opp-1104000000 {
>   			opp-hz = /bits/ 64 <1104000000>;
> -			opp-microvolt-speed0 = <1000000>;
> -			opp-microvolt-speed2 = <1000000>;
> -			opp-microvolt-speed3 = <1000000>;
> -			opp-microvolt-speed5 = <950000>;
> +			opp-microvolt = <1000000>;			
>   			clock-latency-ns = <244144>; /* 8 32k periods */
>   			opp-supported-hw = <0x2d>;
>   		};
> @@ -79,7 +76,7 @@ opp-1200000000 {
>   			opp-microvolt-speed2 = <1050000>;
>   			opp-microvolt-speed3 = <1050000>;
>   			opp-microvolt-speed4 = <1100000>;
> -			opp-microvolt-speed5 = <1020000>;
> +			opp-microvolt-speed5 = <1050000>;
>   			clock-latency-ns = <244144>; /* 8 32k periods */
>   			opp-supported-hw = <0x3f>;
>   		};
> @@ -93,7 +90,10 @@ opp-1320000000 {
>   
>   		opp-1416000000 {
>   			opp-hz = /bits/ 64 <1416000000>;
> -			opp-microvolt = <1100000>;
> +			opp-microvolt-speed0 = <1100000>;
> +			opp-microvolt-speed2 = <1100000>;
> +			opp-microvolt-speed3 = <1100000>;
> +			opp-microvolt-speed5 = <1160000>;
>   			clock-latency-ns = <244144>; /* 8 32k periods */
>   			opp-supported-hw = <0x2d>;
>   		};
> @@ -102,9 +102,8 @@ opp-1512000000 {
>   			opp-hz = /bits/ 64 <1512000000>;
>   			opp-microvolt-speed1 = <1100000>;
>   			opp-microvolt-speed3 = <1100000>;
> -			opp-microvolt-speed5 = <1160000>;
>   			clock-latency-ns = <244144>; /* 8 32k periods */
> -			opp-supported-hw = <0x2a>;
> +			opp-supported-hw = <0x0a>;
>   		};
>   	};
>   };

