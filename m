Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6728EC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 21:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e76LF6aEcRNEARMGNURIVQyVQToNTotfPN3MrqTtWjs=; b=I53hlagZONzIxfZ4Zo4bNH1L4N
	k3qHlbxTnVtAMpwjqTQG62GlsqTtgVJxI+c2oG9loiquGncwYGbrP8Z+jCH/R7e5i0mI7MiwapNtK
	FPBiWPg/T5xZei3jT7jYGvR4mRQGfpG5fkwmdpEZTdkTFJmtnNZOyVtVGm/J8hmHZ743z21i/1eXj
	u5a30JFNH1HH4Hz85m3es9WJLVzgNEqphl+UcMwPthrQ515Znf+MaXlvg89m7gLIg7AKKmDXiUzEu
	EnQtHGg6Qjnnjbc3NLrL0AZKy0IFzCr2zgY8Qfq0wSHQnxUBL40JpGI+ebxvWacX/dIWN+XLE183u
	U0B1P7uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugria-0000000072K-3uOH;
	Tue, 29 Jul 2025 21:18:40 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrg3-000000006qJ-2IK8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 21:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1753823762;
 bh=e76LF6aEcRNEARMGNURIVQyVQToNTotfPN3MrqTtWjs=;
 b=fCd4wtJf/CjpclsjDkr1C14Wr7l/o7bz45ikC9e6R+LWRI/4JhxUCxmZy5oiAolFkGa/MF0CS
 0MrK6L0xzrr/UZT6t3RZgm1UEWdnXioTr+lvVkbGn9wXgsKlMMSClSsOpfI6PEQG3VSqICADuoM
 HaV0T0y+KqmhrCo6k1uXF09ugOuMMGHiNdqqNagplb7pdLb6/7+A1RktNE91S9eH2Uo27+KyvO0
 5rjdFPxYy8m8djA8st9s7p4efFqTK4bWUuiMEWFTBrU1P+k1FJmyo6WZ1HlnWwcjJw4I5CscU6g
 v8iklTjTiAE/tg/dNc+dGZ94IscQLMWagvVTB03oxTpw==
X-Forward-Email-ID: 688939dd5983c8a2f4b4c57a
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.1.8
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <dcbc1c43-748b-479a-878f-569428e09f45@kwiboo.se>
Date: Tue, 29 Jul 2025 23:15:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add Radxa E24C
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 ziyao@disroot.org
References: <e2fd11db-543a-43eb-b118-9f246ff149b5@kwiboo.se>
 <20250729132025.2359761-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250729132025.2359761-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_141603_688428_454C6414 
X-CRM114-Status: GOOD (  24.76  )
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

On 7/29/2025 3:20 PM, Chukun Pan wrote:
> Hi,
> 
>> Both avddl_1v1 and avddh_3v3 are controlled by the same gpio, I do not
>> remember if using two regulators with same gpios is supported, can only
>> remember it being an issue in the past, so I opted to just describe it
>> as a single regulator and gave it a new name and added labels for the
>> name used in schematic.
>>
>> Would calling it vdd_8367 (after gpio_8367_en) be better or do you have
>> any other suggestion on how to describe these?
> 
> Would it be better to just call it avddh_3v3 and add a comment?
> This makes it easier to find in the schematics and match phy-supply.

It already had a label for avddh_3v3, I am currently thinking something
like following, includes the names from schematic and a name for humans:

	/* Common enable line for the avdd rails mentioned in the labels */
	vdd_switch: avddl_1v1: avddh_3v3: regulator-vdd-switch {
		compatible = "regulator-fixed";
		enable-active-high;
		gpios = <&gpio1 RK_PC3 GPIO_ACTIVE_HIGH>;
		pinctrl-names = "default";
		pinctrl-0 = <&gpio_8367_en>;
		regulator-name = "vdd_switch";
		startup-delay-us = <10000>;
		vin-supply = <&vcc5v0_sys>;
	};

> 
>> See above, I had issues using the reset-gpios of the switch, because the
>> switch was probed twice, once deferred by gmac, and by the second probe
>> failed with -BUSY because of the reset-gpios still being claimd by the
>> first probe.
>>
>> I can change to describe the reset pin in the switch, however that will
>> likely mean Ethernet is unusable until the issue in devres/gpiolib is
>> tracked down and fixed by someone.
> 
> I don't think it's a devres/gpiolib issue.
> It looks like these two resets are competing:
> 
>   priv->reset_ctl = devm_reset_control_get_optional(dev, NULL);
>   priv->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> 
> reset-gpios works if reset-names is specified:
> 
> -	priv->reset_ctl = devm_reset_control_get_optional(dev, NULL);
> +	priv->reset_ctl = devm_reset_control_get_optional(dev, "switch");
> 
> Or just remove the reset controller, I'm not sure if it's really needed:
> 
> -	priv->reset_ctl = devm_reset_control_get_optional(dev, NULL);
> -	if (IS_ERR(priv->reset_ctl))
> -		return dev_err_cast_probe(dev, priv->reset_ctl,
> -					  "failed to get reset control\n");

Very interesting, my initial testing was to include a call to
devm_gpiod_put() in rtl83xx_remove() but was afraid it could result in a
WARN_ON in case driver was properly unloaded/removed.

  void rtl83xx_remove(struct realtek_priv *priv)
  {
	if (priv->reset)
		devm_gpiod_put(priv-dev, priv->reset);
  }

With reset_control_get using a gpio fallback, this complicates things a
little bit, will run some more tests and probably include a driver patch
for v2, thanks for finding this!

Regards,
Jonas

> 
> Thanks,
> Chukun
> 
> --
> 2.25.1
> 
> 


