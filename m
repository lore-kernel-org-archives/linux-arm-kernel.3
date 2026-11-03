Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DEF60736FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OxuZkV9D;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=H0AqczOH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/sab2LCSJRJhh9yUv/qU3yP9loQ+y36uJxehXLEAL1k=; b=OxuZkV9DKyWRYh
	tuOYnLAoKxkwzk8grdMoFNPvjmPvf4SZ8LlrQzYcqm/dSpP1TEx4KLxG1e+SsCjL2I1bpsKW7rZ+y
	jIrBR/xZyiDHmHCoNxmhSCzH2PqoJRdm2fVqbYRfwhJj3jc9u5/xO1Ljh6vOspLarBczg2mJpFuwT
	mKtHFNG2wBIjmKgEGpL60qMoppOSn87420gYe1zcn6xSyLKM7A3iZ06VdTWHk8TVOBIG/M2u2cOFL
	xu55tYwMDvS3Cm7cpOpGIWAI4W3SFV43vHd32kafxqBvrARFB1KxCxUvQZEEG/A8o3hoAbeQEbHBx
	OxNuEvhq2f6A8vYrsVWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC59-0000000254K-3oXR;
	Tue, 03 Nov 2026 10:49:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC56-00000002540-2bLZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:49:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E57E153B;
	Tue,  3 Nov 2026 02:49:28 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D61B3F628;
	Tue,  3 Nov 2026 02:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793702971; bh=3fnx5RvirX3cqQpN8evTA0YpxaE0yQIweUETOqhfv4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H0AqczOHrNZMfCjyLJObkt1RSv6zgyUcmD6iIIEWMwUuGRRjUFiWeh5rgOQRm5k2/
	 yD66PDJW6soIRh10C5Hnbz6/6RSAnsOLOPInotps6zRMrhLtaL8Vf11Lr4+Xs60L8N
	 kNAF5qTTw4dgJHhePmqk0N8JWMtonkAkna3ZIGik=
Message-ID: <85dc4135-4684-4e17-95e4-833cf8753b64@arm.com>
Date: Tue, 3 Nov 2026 11:49:27 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: rajanyadav0307@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_024932_942786_122285C5 
X-CRM114-Status: GOOD (  31.53  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Rajan,

many thanks for sending this!

On 11/3/26 10:09, Rajan Yadav via B4 Relay wrote:
> From: Rajan Yadav <rajanyadav0307@gmail.com>
> 
> The CPU thermal zone in sun50i-a100.dtsi has a sensor but no trip
> points, so nothing throttles the CPU as it heats up and nothing shuts
> the system down before it overheats. On a KickPi K5C (A133) without a
> heatsink, the CPU reaches 90 C within minutes of full load.
> 
> Add a passive trip at 90 C that throttles all four cores through
> cpufreq, and a critical trip at 110 C, using the same layout as
> sun50i-h6.dtsi.
> 
> The temperatures come from the Allwinner BSP (sun50iw10p1.dtsi). The
> BSP drives this zone with the power allocator governor: control starts
> at 70 C, the target is 90 C, and 110 C is critical. The power
> allocator needs a power model of the CPUs (dynamic-power-coefficient),
> which the A100 does not have in mainline, so here the 90 C target
> becomes a step_wise passive trip, and the 110 C critical trip is kept.
> 110 C is also the highest working junction temperature in the
> recommended operating conditions of the A133 datasheet (rev 1.5,
> table 5-2). The absolute maximum is 125 C.

Thanks for the explaining where the temperature values come from!

> The GPU and DDR zones are left without trips, as in the BSP.
> 
> Polling stays disabled: the sensor raises an interrupt every 250 ms
> and the driver updates the zone from it, as on the H6.
> 
> Tested on a KickPi K5C (A133, no heatsink):
> - one hour of full load on all cores held the CPU at about 90 C, with
>    short throttling to 1.32 GHz
> - with thermal emulation, a rising temperature lowers the limit one
>    OPP at a time down to 408 MHz, the limit is released below 88 C, and
>    111 C triggers the hardware protection shutdown
> 
> Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>

Looks good to me, compared to what we have in the H6 and H616, and 
confirming the 110C number from the datasheet.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

P.S. Since you have a device and have been looking at this: can you 
check the CPU speed bin selection? I think it's quite wrong for the 
A133. The original contribution was just for the A100, using A100 
specific ID values. I briefly checked and think they don't make too much 
sense on the A133. Also definitely the OPPs are for the A100 only: we 
are surely missing the nominal 1.6GHz OPP for the A133, and I think the 
other parts (A133P) go even higher.
There are several lists and numbers floating around on the net, and I 
think BSP code should have a better way to identify the bins and dies.
I would be grateful if you could dig into this and come up with OPP 
updates. Many thanks!
> ---
> arm64: dts: allwinner: a100: Add CPU thermal trips and cooling maps
> ---
>   arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 29 ++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> index ba6020989..fce91dc2c 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -8,6 +8,7 @@
>   #include <dt-bindings/clock/sun50i-a100-r-ccu.h>
>   #include <dt-bindings/reset/sun50i-a100-ccu.h>
>   #include <dt-bindings/reset/sun50i-a100-r-ccu.h>
> +#include <dt-bindings/thermal/thermal.h>
>   
>   / {
>   	interrupt-parent = <&gic>;
> @@ -24,6 +25,7 @@ cpu0: cpu@0 {
>   			reg = <0x0>;
>   			enable-method = "psci";
>   			clocks = <&ccu CLK_CPUX>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu1: cpu@1 {
> @@ -32,6 +34,7 @@ cpu1: cpu@1 {
>   			reg = <0x1>;
>   			enable-method = "psci";
>   			clocks = <&ccu CLK_CPUX>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu2: cpu@2 {
> @@ -40,6 +43,7 @@ cpu2: cpu@2 {
>   			reg = <0x2>;
>   			enable-method = "psci";
>   			clocks = <&ccu CLK_CPUX>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu3: cpu@3 {
> @@ -48,6 +52,7 @@ cpu3: cpu@3 {
>   			reg = <0x3>;
>   			enable-method = "psci";
>   			clocks = <&ccu CLK_CPUX>;
> +			#cooling-cells = <2>;
>   		};
>   	};
>   
> @@ -659,6 +664,30 @@ cpu-thermal {
>   			polling-delay-passive = <0>;
>   			polling-delay = <0>;
>   			thermal-sensors = <&ths 0>;
> +
> +			trips {
> +				cpu_alert: cpu-alert {
> +					temperature = <90000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cpu-crit {
> +					temperature = <110000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_alert>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>   		};
>   
>   		ddr-thermal {
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261103-a100-thermal-trips-be14e8047b0a
> 
> Best regards,
> --
> Rajan Yadav <rajanyadav0307@gmail.com>


