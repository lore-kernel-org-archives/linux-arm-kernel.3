Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268AEC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 09:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COdPtwS8QwqUzQLrq2HiLnQlQGjwzK2ydg7fmTJeyKg=; b=CcEfwlTJsRs7g1dKD8RxQdZiy8
	gEjfQJpbPd2WIoOKSc8nBgldHzatHl5SCDPG7J2YSIbuqltodi/v52Qy3SDx7XSHMwWs/JgH3qXFp
	oiVIAa+W6s2e91986973KNo5mSTy9TKBDBzn4B6IlZlHWFcIYUJHKntjkSPKUS3sa27Xkib7MhF+i
	VXQaEwfbUp2kseEAju0xO+Vs1EH658FaTBqs1XW2D9Z43OpEoXi9U2fKVtPiAclBnm+F6K09Rio2G
	ALXmElN3YullxQkkGLNWB9Q7c2HGEBaxswGjmxPh900g2CK4wRDIvI2K4ODh5ftjQtYX2tJrNCiBh
	cKRBhCSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnE22-000000039RB-44hA;
	Wed, 26 Feb 2025 09:48:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDzR-0000000392R-0zfo;
	Wed, 26 Feb 2025 09:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740563163;
	bh=4JZL08t7KG0UOC6HcBU5zxjetitwgkZ1Di1DC2VPPN8=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=k5n6OxUv508uzhg0BzGhZ+WDRVvHmEiNyP6gg4N460Q909yqbnMxMDKv3F76dybTx
	 91fj04sQwP4hcEIEibt5qS2aAPyEAM9kHjsRocnfL2uKAtzMN2SN/7jQgFK2CQpzXO
	 zu6B7X7CLTJ4f/6vIJPpwAypYz+ARL15ci/Kzk0bb7Wpf8X/XToW+CAWqEdEVwWDJQ
	 2Z9pvusDBUfiUx7KwJasmBwOTJ0pW59Hl+2hqFt4KJjBC7DNlsmqRz7CxJPeUl8Q8Z
	 wwzPx2ni5VhdrsiBYY55gCK2kaqVHkqtPfvtv8A5UrKeFn2W/ql1YJfmSLlhkEab/y
	 iMIhdoGRy44Tg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0C6A217E0663;
	Wed, 26 Feb 2025 10:46:03 +0100 (CET)
Message-ID: <618b3cdb-0fef-4194-aeb0-4111c011904d@collabora.com>
Date: Wed, 26 Feb 2025 10:46:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND][PATCH] arm64: dts: mediatek: mt7986: fix pwn fan
 settings for sinovoip bpi-r3 board
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>
References: <20250226050132.547353-1-mikhail.kshevetskiy@iopsys.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
In-Reply-To: <20250226050132.547353-1-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_014605_491193_94514CFE 
X-CRM114-Status: GOOD (  31.49  )
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

Il 26/02/25 06:01, Mikhail Kshevetskiy ha scritto:

Please reformat the title...

arm64: dts: mediatek: mt7986-bpi-r3: Change fan PWM value for mid speed

> Popular bpi-r3 pwm fans like this one
> 
>    https://www.amazon.com/youyeetoo-Barebone-Fan-BPI-R3-Integrated/dp/B0CCCTY8PS

Such links to products do expire over time, so this commit will eventually have
missing info in the future.

"Popular cheap PWM fans for this machine, like the ones coming in heatsink+fan
combos will not work properly at the currently defined medium speed"

> 
> will not work properly. Trying different pwm setting using a command
> 
>    echo $value > /sys/devices/platform/pwm-fan/hwmon/hwmon1/pwm1
> 
> I found:
> 
>    pwm1 value     fan rotation speed   cpu temperature     notes
>    -----------------------------------------------------------------
>      0            maximal              31.5 Celsius        too noisy
>     40            optimal              35.2 Celsius        no noise hearable
>     95            minimal
>     above 95      does not rotate      55.5 Celsius
>    -----------------------------------------------------------------
> 
> At the moment we have following cooling levels defined:
> 
>    cooling-levels = <255 96 0>;

Yes, we can see that in the actual DT, not necessary to repeat in the description.

"The current cooling levels define a PWM value of 96 for the cpu-active-medium
step..."

> 
> for cpu-active-low, cpu-active-medium and cpu-active-high modes
> correspondingly. Thus only cpu-active-high and cpu-active-low are usable.
> I think this is wrong.
> 
> This patch fixes cpu-active-medium settings for bpi-r3 board.
> 
> PS: I know, the patch is not ideal as it can break pwm fan for some users.
>      There are some peoples that use handmade cooling solutions, but:
>        * discussed cooler is the only 'official' pwm cooler for bpi-r3
>          available on the market.
>        * most peoples will use passive cooling available on the market or
>          the discussed cooler.
>        * the pwm-fan dts section was added before the official cooler
>          appears on the market.
>      Thus it should not be a lot of harm from this fix.

I get that the cheapest fans you can get are not working correctly with the current
mid pwm setting, but you can't break things.

This devicetree should, at this point, hold default values that would generally
make the vast majority of fans to actually spin, because it's impossible to have
something perfectly (or vaguely, sometimes) optimized for each fan on the market.

Of course this means that you need to properly configure your fans in userspace
if you want to reach the sweet spot.

I added Frank and Daniel to this thread, as they are the ones who originally did
upstream this device.

Frank, Daniel, any suggestion regarding the PWM values here?

P.S.: Remember that the fan will still spin to HIGH when temperature gets high,
so the SoC is still thermally protected until users start tuning their fan speed
in userspace.

> 
> This patch may not be enough. Users may wants to tweak their thermal_zone0
> trip points, thus tuning fan rotation speed depending on cpu temperature.
> That can be done on the base of the folloving example:

P.P.S.: Fix typos please.

Thanks,
Angelo


> 
>    === example =========
>    # cpu temterature below 25 Celsius degrees, no rotation
>    echo 25000 > /sys/class/thermal/thermal_zone0/trip_point_4_temp
>    # cpu temperature in [25..32] Celsius degrees, normal rotation speed
>    echo 32000 > /sys/class/thermal/thermal_zone0/trip_point_3_temp
>    # cpu temperature above 50 Celsius degrees, max rotation speed
>    echo 50000 > /sys/class/thermal/thermal_zone0/trip_point_2_temp
>    =====================
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> index ed79ad1ae871..b0cc0cbdff0f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> @@ -42,7 +42,7 @@ fan: pwm-fan {
>   		compatible = "pwm-fan";
>   		#cooling-cells = <2>;
>   		/* cooling level (0, 1, 2) - pwm inverted */
> -		cooling-levels = <255 96 0>;
> +		cooling-levels = <255 40 0>;
>   		pwms = <&pwm 0 10000>;
>   		status = "okay";
>   	};



