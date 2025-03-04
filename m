Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38203C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 20:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJwNGtEp4XbaHSJ4DCMpAhRX6Xx7TLv6dC2ug10rAwQ=; b=s4OHewTrU/QU5PdooUQPGcjpsz
	UndcuLrfSoI8oiTnVq6MrkD7pe0j2ntDZt2fNkdjKHXiGrkRUShfUIALAuAX29eYYvjsRUD5gbf8H
	7cJdx3PfQVMm6bpwshkDomPhmX3jizY3Os//gVny3LMsDa0UipOBRbMd/bprl9Z1blexD+kKkctuW
	CZr2GXRjgT3AwYMN1NgRlz2XGfa66cRmzMFA02/7T6usoprX+kIJ4Ck8artoMU/LPPqo1bpFOwQ9L
	6oSs+bXMEvUWC2xBGTCMZhciljVfyN1v4hB5GUACkZSK/X+LxyYcoVZdEtEX68MzuZjfR9VLYrb12
	eJtWm0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYUw-0000000692l-0uWr;
	Tue, 04 Mar 2025 20:04:14 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYMo-000000067Y8-35Z2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 19:55:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741118149;
 bh=eJwNGtEp4XbaHSJ4DCMpAhRX6Xx7TLv6dC2ug10rAwQ=;
 b=NA4FNlaYaT+cjgYwNd+mdBXeDzC9s6pp5HTEgWaOjLNeSe35bctO91Yw1HDZYboRKrDAfr/Ji
 efUu4rDRnC0SFKrOhJYS3sRALpFc4uPT/hjKOL8E0RBVqIrTrIeWvHs9GZwS2/8VQsx+WssXt0P
 zhP0AUShifqaxRMaG52hCnr0Csw4oFK14n7Kmxja0Jwng6R1atMCBFjV4T3X79jCkthb13KLfGB
 uHYlNcsItK0zGnA6jvBzeQu6fUwh6vyImuwLjd2Fv58ca95AA8X7TTvxJPI6iRauFf9n1sPicm8
 8lJsU81O53WpSmNA6t/mn2sv6gKcbwjsNlGQaxL4xfJA==
X-Forward-Email-ID: 67c75abd2e5baeec949f8de0
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <5c429552-bdbb-43d9-8e07-bacda57c0fcf@kwiboo.se>
Date: Tue, 4 Mar 2025 20:55:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: rockchip: Enable SD-card interface on
 Radxa E20C
To: Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, cristian.ciocaltea@collabora.com,
 detlev.casanova@collabora.com, devicetree@vger.kernel.org,
 frank.wang@rock-chips.com, heiko@sntech.de, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20250301104835.36439-1-ziyao@disroot.org>
 <20250304121036.1453284-1-amadeus@jmu.edu.cn> <Z8dZWYpABghRHHge@pie.lan>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <Z8dZWYpABghRHHge@pie.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_115550_864698_BE8B70B3 
X-CRM114-Status: GOOD (  23.46  )
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

Hi Yao Zi,

On 2025-03-04 20:49, Yao Zi wrote:
> On Tue, Mar 04, 2025 at 08:10:36PM +0800, Chukun Pan wrote:
>> Hi,
>>
>>> +	aliases {
>>> +		mmc0 = &sdmmc;
>>
>> s/mmc0/mmc1
> 
> Will take it and add the missing pinctrl, as Jonas already pointed out.
> 
>>> +&sdmmc {
>>> +	bus-width = <4>;
>>> +	cap-mmc-highspeed;
>>> +	cap-sd-highspeed;
>>
>> I think for sdcard, only cap-sd-highspeed
>> is needed, not cap-mmc-highspeed?
> 
> This makes sense, will remove it in the next version.

Please do not remove the cap-mmc-highspeed prop, I tested the controller
with a microSD to eMMC adapter and MMC HS speed is supported:

  mmc1: card 59b4 removed
  mmc_host mmc1: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, actual 400000HZ div = 0)
  mmc_host mmc1: Bus speed (slot 0) = 49800000Hz (slot req 52000000Hz, actual 49800000HZ div = 0)
  mmc1: new high speed MMC card at address 0001
  mmcblk1: mmc1:0001 DG4008 7.28 GiB
   mmcblk1: p1 p2
  mmcblk1boot0: mmc1:0001 DG4008 4.00 MiB
  mmcblk1boot1: mmc1:0001 DG4008 4.00 MiB
  mmcblk1rpmb: mmc1:0001 DG4008 4.00 MiB, chardev (499:0)

  ~ # cat /sys/kernel/debug/mmc1/ios
  clock:          52000000 Hz
  vdd:            21 (3.3 ~ 3.4 V)
  bus mode:       2 (push-pull)
  chip select:    0 (don't care)
  power mode:     2 (on)
  bus width:      2 (4 bits)
  timing spec:    1 (mmc high-speed)
  signal voltage: 0 (3.30 V)
  driver type:    0 (driver type B)

Regards,
Jonas

> 
>>> +	disable-wp;
>>
>> Missing pinctrl.
>>
>>> +	rockchip,default-sample-phase = <90>;
>>
>> It seems that all rk3528 devices need to set this
>> default phase, so maybe this can be placed in dtsi?
> 
> Yes, since the tuned phase offset is a SoC-specific value, as pointed
> out by comment in the driver,
> 
> 	this is _not_ a value that is dynamically tuned and is also
> 	_not_ a value that will vary from board to board.  It is a value
> 	that could vary between different SoC models.
> 
> Will take it in the next version, thanks for finding it!
> 
>>> +	sd-uhs-sdr104;
>>
>> The rk3528 devices uses gpio to switch IO voltage, maybe
>> more modes should be added here like vendor kernel?
> 
> I cannot get the relationship between things you mentioned. For the
> regulator, yes, here vqmmc-supply is missing, as already pointed out by
> Jonas.
> 
>> And these devices use 3.3V IO voltage by default.
>>
>> 	sd-uhs-sdr12;
>> 	sd-uhs-sdr25;
>> 	sd-uhs-sdr50;
>> 	sd-uhs-sdr104;
> 
> But I don't think it's necessary to lay out these slower modes
> explicitly, since SDR104 seems to imply them, see
> sd_update_bus_speed_mode() in drivers/mmc/core/sd.c[1],
> 
>         if ((card->host->caps & MMC_CAP_UHS_SDR104) &&
>             (card->sw_caps.sd3_bus_mode & SD_MODE_UHS_SDR104)) {
>                         card->sd_bus_speed = UHS_SDR104_BUS_SPEED;
>         } else if ((card->host->caps & MMC_CAP_UHS_DDR50) &&
>                    (card->sw_caps.sd3_bus_mode & SD_MODE_UHS_DDR50)) {
>                         card->sd_bus_speed = UHS_DDR50_BUS_SPEED;
>         } else if ((card->host->caps & (MMC_CAP_UHS_SDR104 |
>                     MMC_CAP_UHS_SDR50)) && (card->sw_caps.sd3_bus_mode &
>                     SD_MODE_UHS_SDR50)) {
>                         card->sd_bus_speed = UHS_SDR50_BUS_SPEED;
>         } else if ((card->host->caps & (MMC_CAP_UHS_SDR104 |
>                     MMC_CAP_UHS_SDR50 | MMC_CAP_UHS_SDR25)) &&
>                    (card->sw_caps.sd3_bus_mode & SD_MODE_UHS_SDR25)) {
>                         card->sd_bus_speed = UHS_SDR25_BUS_SPEED;
>         } else if ((card->host->caps & (MMC_CAP_UHS_SDR104 |
>                     MMC_CAP_UHS_SDR50 | MMC_CAP_UHS_SDR25 |
>                     MMC_CAP_UHS_SDR12)) && (card->sw_caps.sd3_bus_mode &
>                     SD_MODE_UHS_SDR12)) {
>                         card->sd_bus_speed = UHS_SDR12_BUS_SPEED;
>         }
> 
>> Thanks,
>> Chukun
>>
>> -- 
>> 2.25.1
>>
> 
> Regards,
> Yao Zi
> 
> [1]: https://elixir.bootlin.com/linux/v6.13.5/source/drivers/mmc/core/sd.c#L448-L479


