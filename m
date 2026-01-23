Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60EFD778AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 20:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:To:From:References:CC:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9k7W830smXgr5e8HHqIJIuTQyT0nFUdeI8UbwjsPS/A=; b=424Byo74Zn+QC1RTXdiRjk+fir
	ITT9MIV1Bhv/ekcUbjGJzxN4s3YH0Hr2n/lMBGSLx4sF9fllMMXWuRiryA1ie9zYlSeShlJ8lxTyZ
	jlmFtxrjuv1ODLQbA+T0BEN/eJ2KPgSKSXCW7z2f0pINhHU07rjVisVM1ZWBji3+qAjkPs2ds8enO
	oSapl6ujhK7gz34rE0AEYzF6vs3HmWMploh7IDd+GaBddrPru0PXAHPrKzGRiOZDl1Iq7vJxR5Dtq
	oyQPgYCHaZJRKJaSP7arI5gkp+v3SvqLFmZpXNQHWcYpnfE4zaICWgzG4YyJuoTxFT+ig35KOsM48
	bnRiZFuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjNyL-00000009U8M-466F;
	Fri, 23 Jan 2026 20:41:38 +0000
Received: from mx4.sberdevices.ru ([152.89.196.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjNyI-00000009U7F-3GOg;
	Fri, 23 Jan 2026 20:41:36 +0000
Received: from p-antispam-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx4.sberdevices.ru (Postfix) with ESMTP id 8BF0040020;
	Fri, 23 Jan 2026 23:41:20 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx4.sberdevices.ru 8BF0040020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=post; t=1769200880;
	bh=9k7W830smXgr5e8HHqIJIuTQyT0nFUdeI8UbwjsPS/A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type:From;
	b=JSGOdPxcLB1ayij5p97TTAAfzq2uM86eVpbHR7DYcuuwyBHRsylYMjeQoPm9+LRWw
	 PHUVbhi1WGkyrThOgwqV6vy2ciLMAOM48nZBfxjIVLa5D0gYK+IUBbKE68xyPnzPY7
	 yQ11mF+l8T/S034UMSExmD1kHJdeIgQLW+i0D4At8s3qFKHZ/vre4kUCyWIJe5d5ws
	 F7TfnyXpANyIHsHDaZs3VXSgy0PiMekkM2ziD8Vyw8FI1iPUQWwos38QEIa/UG9H0w
	 NfaiJQbg/c5uapNJ81PuQXpHKu2zw0Q0V7pnPY8QfEc/1rGKa6AFFpJVfLjzUPvcN1
	 +Cmb7rdnNJCdg==
Received: from smtp.sberdevices.ru (p-exch-cas-s-m1.sberdevices.ru [172.16.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "sberdevices.ru", Issuer "R12" (verified OK))
	by mx4.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 23 Jan 2026 23:41:19 +0300 (MSK)
Message-ID: <09df45e1-90b5-4618-9197-c724142bd83a@salutedevices.com>
Date: Fri, 23 Jan 2026 23:40:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DMARC error] [PATCH v3 3/3] arm64: dts:
 meson-s4-s905y4-khadas-vim1s: add initial device tree
CC: <robh@kernel.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <neil.armstrong@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<conor+dt@kernel.org>, "kernel@salutedevices.com" <kernel@salutedevices.com>,
	<linux-arm-kernel@lists.infradead.org>, <krzk+dt@kernel.org>,
	<xianwei.zhao@amlogic.com>, <linux-kernel@vger.kernel.org>,
	<nick@xieqinick.com>
References: <20260115030015.1334517-1-nick@khadas.com>
 <20260115030015.1334517-4-nick@khadas.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
To: Nick Xie <nick@khadas.com>
In-Reply-To: <20260115030015.1334517-4-nick@khadas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.28.2.68]
X-ClientProxiedBy: p-exch-cas-a-m1.sberdevices.ru (172.24.201.216) To
 p-exch-cas-s-m1.sberdevices.ru (172.16.210.2)
X-KSMG-AntiPhishing: NotDetected, bases: 2026/01/23 18:51:00
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Info: LuaCore: 86 0.3.86 47cb2a3d3f5c7e795bff2d0998e8c196722872ab, {Tracking_uf_ne_domains}, {Tracking_bl_eng_cat}, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:5.0.1,7.1.1;elixir.bootlin.com:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;lkml.iu.edu:7.1.1;salutedevices.com:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 199802 [Jan 23 2026]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.20
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2026/01/23 17:16:00 #28145625
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-KATA-Status: Not Scanned
X-KSMG-LinksScanning: NotDetected, bases: 2026/01/23 18:51:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_124135_331604_21058BD5 
X-CRM114-Status: GOOD (  14.37  )
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

Hello Nick

On 1/15/26 06:00, Nick Xie wrote:
> The Khadas VIM1S uses the Amlogic S905Y4 SoC, based on the
> Amlogic S4 SoC family, on a board with the same form factor as the
> VIM/VIM2/VIM3/VIM4 models. Serial debug console, ethernet, SD card
> work with this initial device tree.

...

> +	};
> +
> +	/* SY8120B1ABC DC/DC Regulator. */
> +	vddcpu: regulator-vddcpu {
> +		compatible = "pwm-regulator";
> +
> +		regulator-name = "VDDCPU";
> +		regulator-min-microvolt = <689000>;
> +		regulator-max-microvolt = <1049000>;
> +
> +		vin-supply = <&main_5v>;
> +
> +		pwms = <&pwm_ij 1 1500 0>;
> +		pwm-dutycycle-range = <100 0>;
> +
> +		regulator-boot-on;
> +		regulator-always-on;
> +		/* Voltage Duty-Cycle */
> +		voltage-table = <1049000 0>,
> +				<1039000 3>,
> +				<1029000 6>,
> +				<1019000 9>,
> +				<1009000 12>,
> +				<999000 14>,
> +				<989000 17>,
> +				<979000 20>,
> +				<969000 23>,
> +				<959000 26>,
> +				<949000 29>,
> +				<939000 31>,
> +				<929000 34>,
> +				<919000 37>,
> +				<909000 40>,
> +				<899000 43>,
> +				<889000 45>,
> +				<879000 48>,
> +				<869000 51>,
> +				<859000 54>,
> +				<849000 56>,
> +				<839000 59>,
> +				<829000 62>,
> +				<819000 65>,
> +				<809000 68>,
> +				<799000 70>,
> +				<789000 73>,
> +				<779000 76>,
> +				<769000 79>,
> +				<759000 81>,
> +				<749000 84>,
> +				<739000 87>,
> +				<729000 89>,
> +				<719000 92>,
> +				<709000 95>,
> +				<699000 98>,
> +				<689000 100>;
> +	};
> +};

Thanks for the patch. Since you have khadas mail I'm pretty sure you've 
had the possibility to test it on the real vim board and I just don't 
get it how it works with the voltage table above. The problem is that 
pwm is calculated incorrectly in the upstream pwm-meson driver. That 
voltage table appeared to be used in early amlogic bl loader and 
appropriate pwm is initialized from a table's record. Duty cycle value 
is translated to pwm regs correctly. Later when kernel start running 
pwm-regulator driver is probed. It reads the pwm regs, calculates back 
duty-cyle and search it in the table. Since calculation algos are not 
match and the table doesn't contain full range of 0-100% values 
regulator driver doesn't find current voltage. In such case regulator 
core sets the minimum voltage from the table [1] and the SoC may hang 
(depending on board) due to minimum voltage may be too low for the 
current frequency SoC uses.

Or I'm missing something?

There's not-yet-reviewed patch that fixes pwm algo [2]. There's 
calculation example in the cover letter.

[1] 
https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/regulator/core.c#L1227
[2] https://lkml.iu.edu/2412.3/00826.html

-- 
Best regards
George

