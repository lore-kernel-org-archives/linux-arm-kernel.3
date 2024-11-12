Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D90D597B3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 22:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qr1E10NHWK23nMA2ivVLEsm+o2F/x5CKrKT5ga72x0I=; b=gkdpOOYJ5jzYiX/JApfCAq1/3z
	pyc10ngXMiV33ZhKznTl1Ylkbrn5+iFkPhjaRiWRyK7e7dk7ZKg1MH8KKQGNpl359RQ96ZsYxV2z5
	hHUmUXFh54IOnhPcgEkvNjG1o8NpOdvtMpO23iLqYLuiR8HSim3eSZ16PyDHxhejsgYNjTt0eK28R
	Pms86ZRRnFAxPPYIkRKdlDSZQVhoRNTpJh++iujP28l9cIR0y9QosJ2ler31WIFXWsV8rtSoUU3jI
	w53rC2vp2LmUBi76KP29b1kk0W9nC7Fifdt4mIOBr/aC0O7GoDjLZhYHE1UK9CrIw3dCLkskfeNeq
	ydPx5cSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzXe-00000005ASE-1BWC;
	Tue, 12 Nov 2024 22:39:22 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzVs-00000005AG4-0crD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 22:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1731451040;
 bh=qr1E10NHWK23nMA2ivVLEsm+o2F/x5CKrKT5ga72x0I=;
 b=SjLdnDGx51puzyqQxY55STmDjYKEtmejc/azXDWAyXbU+obv6ECmBz3GG1aWwqhzHZ/XsotDe
 FEKSVvTgnKtC71okD+EhRpGbJuxjjHtBqz/LC3biXoffPrjVIRKvcyOLFaWH0Vi/WuaEZVEzvus
 CyE6gGtiaBju27kydY/BN1SjCCSNdHF4xJLmzeNYCocH7qIuAX/IBb6/WM6Oszmk1yDqxq1p/zX
 t+wmN2FTJcTIFzxBA0FM8nsPdD9stPibg8XIEwtxes3WsTi5BNlJDgIJ1WRqsuZYq9qxKPSxQz3
 9+56pr+4aX2dhpH1OLWTQ5Ca0jptMo94qKBnc9B4IJwg==
Message-ID: <e9ff5387-b3c1-41a7-b251-a12789d25a70@kwiboo.se>
Date: Tue, 12 Nov 2024 23:37:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Add supported UHS-I rates to
 sdmmc0 on rock-3b
To: =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@linux.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 FUKAUMI Naoki <naoki@radxa.com>, Dragan Simic <dsimic@manjaro.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241111181807.13211-1-tszucs@linux.com>
 <20241111181807.13211-2-tszucs@linux.com>
 <c89c2f16-ffb0-4b61-a962-9705f9f1e0e2@kwiboo.se>
 <CA+GksrJzkxffSQbuseGFL0=2PDxV+TRevX0-NOkc6FNYLmNgYA@mail.gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <CA+GksrJzkxffSQbuseGFL0=2PDxV+TRevX0-NOkc6FNYLmNgYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 6733d89e9402f7538d197676
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_143732_238375_E490BDBC 
X-CRM114-Status: GOOD (  29.56  )
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

Hi Tamás,

On 2024-11-12 15:36, Tamás Szűcs wrote:
> Hi Jonas,
> 
> Thank you for pointing this out! I haven't noticed this before. I've
> done some testing and I believe I am able to reproduce the issue you
> described, although I cannot confirm the reason.
> The only occasion I encounter any problems is when a UHS SD card or
> SDIO device is connected to sdmmc0 during bootup. Sometimes the device
> is recognized as HS only. Obviously no tuning value reported. Also,
> sdmmc2 cuts out completely. I'm booting from eMMC and when the SD card
> is removed in this state I lose my rootfs. Certainly, this needs more
> attention but it seems to be unrelated to the changes here.
> 
> I need more time to check but are you sure this SD card during bootup
> issue is gone with UHS-I disabled?

Yes, the issue is that the io voltage domain must be configured to match
the io signal voltage used, and to use uhs the voltage changes from 3v3
to 1v8. Causing a miss-match between io voltage domain config and the
regulator voltage used during initial probe, unless io-domain driver
happens to be fully loaded before mmc devices are probed.

> 
> Also, in every other case, when you connect any device to sdmmc0 after
> bootup, performance and stability is perfect.
> Interestingly I also don't experience this behavior with an eMMC
> device and / or an SDIO device connected to sdmmc2 during bootup. Only
> sdmmc0 is problematic and only during bootup.

Yes, as you have discovered, inserting the sd-card after system has
booted and io-domain driver has been loaded, everything can work as
expected with uhs speeds.

Until this probe race condition has been solved booting with a sd-card
inserted may or may not result in wrong tuning or other related issues.

Because of this I advice not to enable uhs mode for sdmmc0 at this time.

Regards,
Jonas

> 
> Any more thoughts on this are very welcome.
> 
> Kind regards,
> Tamas
> 
> 
> 
> Tamás Szűcs
> tszucs@linux.com
> 
> On Mon, Nov 11, 2024 at 8:00 PM Jonas Karlman <jonas@kwiboo.se> wrote:
>>
>> Hi Tamás,
>>
>> On 2024-11-11 19:17, Tamás Szűcs wrote:
>>> Add all supported UHS-I rates to sdmmc0 and allow 200 MHz maximum clock to
>>> benefit modern SD cards.
>>>
>>> Signed-off-by: Tamás Szűcs <tszucs@linux.com>
>>> ---
>>>  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>>> index 3d0c1ccfaa79..242af5337cdf 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>>> @@ -670,8 +670,14 @@ &sdmmc0 {
>>>       bus-width = <4>;
>>>       cap-sd-highspeed;
>>>       disable-wp;
>>> +     max-frequency = <200000000>;
>>>       pinctrl-names = "default";
>>>       pinctrl-0 = <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_det>;
>>> +     sd-uhs-sdr12;
>>> +     sd-uhs-sdr25;
>>> +     sd-uhs-sdr50;
>>> +     sd-uhs-sdr104;
>>> +     sd-uhs-ddr50;
>>
>> There is an issue with io-domain driver not always being probed before
>> mmc driver, this typically result in io-domain being configured wrong,
>> and mmc tuning happen before io-domain is correctly configured.
>>
>> You can usually observe this by looking at the tuning value during boot
>> and comparing it to the tuning value after removing and re-insering a
>> sd-card.
>>
>> Because of this uhs modes was left out from initial DT submission, some
>> cards will work others wont, sd-uhs-sdr50 is known to be working with
>> most cards even with the probe order issue.
>>
>> Also I thought that lower speeds where implied?
>>
>> Regards,
>> Jonas
>>
>>>       vmmc-supply = <&vcc3v3_sd>;
>>>       vqmmc-supply = <&vccio_sd>;
>>>       status = "okay";
>>


