Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FEBD47CAD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 00:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5UXOxPjPA+QX/q5RVny3Kc1OeIaWZcna4FhGLRLNu8=; b=xIEpDoJVk4gOCnDimW5e8McVmA
	7lk2xgwP4Ot+1eJfcjleaYq9G6jECEG/71PiVCWzLjhD9X/0LktqXXbAbQFdhZJR77pMJm/ohWhp5
	aEc5zqfoNYFNkXT9JDuvdlxHVR7veVfRIvEBEuWD9xBti01u6SK6R134fCvEG8WZ9qZiUrwTZb+j8
	laLw+FYRYegp5XR8x+A15vgu2lDkmGQyP9cEjkw3LFLfXXVvc9zd+YJOEghHl+GxOuXg5cA03XvYU
	r4gToC1NJ3/sI2o+ngsH3I+8CNqXv2p8OP8Bpx0XfURXvgaT/NSd+PYeGz0qOtG6RHJbehvbg92+n
	ZTzlYucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgXkx-0000000DN1Y-1JOZ;
	Fri, 16 Jan 2026 00:32:03 +0000
Received: from mail-m128115.netease.com ([103.209.128.115])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgXkt-0000000DN14-1J2k;
	Fri, 16 Jan 2026 00:32:01 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 30d4f9429;
	Fri, 16 Jan 2026 08:31:47 +0800 (GMT+08:00)
Message-ID: <e686c919-74b3-4607-ac7d-09c57effb466@rock-chips.com>
Date: Fri, 16 Jan 2026 08:31:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-rockchip@lists.infradead.org,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, heiko@sntech.de, ulf.hansson@linaro.org
Subject: Re: [PATCH v1 0/3] mmc: dw_mmc-rockchip: Add stability quirk for
 NanoPi R76S
To: Marco Schirrmeister <mschirrmeister@gmail.com>
References: <20260110010715.1610159-1-mschirrmeister@gmail.com>
 <67ccb8f6-f9bd-4266-b79a-b688bd6d030b@rock-chips.com>
 <8536413c-8687-4d75-befb-8f25e54838bf@rock-chips.com>
 <6934ae0d-16c5-436f-97f6-c11d304ca51d@rock-chips.com>
 <CAGJh8eDXT43_PfmUbShL4Hysfkd21R=sCerRNe_AGQANbwvSPA@mail.gmail.com>
 <b49b223e-e728-4ce9-b972-242ed9b5fa4a@rock-chips.com>
 <CAGJh8eB0i5UYN=05SfNGQc4dMA5_ffktErY8GjX85JWjDna3Dw@mail.gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <CAGJh8eB0i5UYN=05SfNGQc4dMA5_ffktErY8GjX85JWjDna3Dw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bc437256e09cckunm3f0c5a6b68da5e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR9PSFYfGk1OTUpJSkoaTxpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=GHOn1G6MfV1Xs1M+BErAj1YADRFid3RBFb8kV0b2MJROtI9/ZSogWy2otX46eeIPfNtNYaYHvN1S+47yEf+He2bp+4jxB/NQFQhW+8Nu1eIMekSiu8YYduMK7FCnbRYZVSlb+0ZF7YH4ubv8qs4ciReofgTyt5uDX7HuhEXgqKY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=M5UXOxPjPA+QX/q5RVny3Kc1OeIaWZcna4FhGLRLNu8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_163159_897737_FF31B99D 
X-CRM114-Status: GOOD (  22.48  )
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

在 2026/01/16 星期五 3:39, Marco Schirrmeister 写道:
> Hello Shawn,
> 
> On Thu, Jan 15, 2026 at 1:25 AM Shawn Lin <shawn.lin@rock-chips.com> wrote:
>>>
>>> Based on this, it makes me believe that power to the sd card is completely cut
>>> and when it wakes up and knows how to continue, it still must go through the
>>> retraining phase.
>>>
>>
>> This is another mistake for your NanoPi R76S board. Before sent this
>> patch, I already checked the dts and saw sdmmc uses vmmc-supply =
>> <&vcc_3v3_s3> which is marked as regulator-always-on, but it's *NOT*
>> actually per the shcematic[1][2]. So need another fix for your board
>> to make it actually gpio-based power controller instaed of function
>> IO based, as when powering off the power domain, the power control bit
>> will not be able to maintain.
>>
>> [1]
>> https://wiki.friendlyelec.com/wiki/images/6/60/NanoPi_R76S_LP4X_2411_SCH.pdf
>> [2]
>> https://wiki.friendlyelec.com/wiki/images/9/90/NanoPi_R76S_LP5_2411_SCH.pdf
>>
>> Except for the patches you have tested, please append the blow patch as
>> well to test.
> 
> Bingo. These DTS additions fixed the power stability for the SD card.
> I have verified that the card now wakes up instantly with no errors and
> no retraining delay.
> 

Thanks, I will fold these two patches into my thread of V4 to fix all
these problems.

> I tested this both with and without your driver patch (the save/restore
> phases logic).
> 
> This confirms the issue was indeed the power rail being cut during
> idle periods. Great find on the schematic!
> 
>> --- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
>> @@ -192,6 +192,18 @@
>>                   regulator-name = "vcc_3v3_s0";
>>                   vin-supply = <&vcc_3v3_s3>;
>>           };
>> +
>> +       vcc3v3_sd: regulator-vcc-3v3-sd {
>> +               compatible = "regulator-fixed";
>> +               enable-active-high;
>> +               gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&sdmmc_pwren>;
>> +               regulator-name = "vcc3v3_sd";
>> +               regulator-min-microvolt = <3300000>;
>> +               regulator-max-microvolt = <3300000>;
>> +               vin-supply = <&vcc_3v3_s0>;
>> +       };
>>    };
>>
>>    &combphy0_ps {
>> @@ -726,6 +738,12 @@
>>                   };
>>           };
>>
>> +       sdmmc {
>> +               sdmmc_pwren: sdmmc-pwren {
>> +                       rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO
>> &pcfg_pull_none>;
>> +               };
>> +       };
>> +
>>           usb {
>>                   usb_otg0_pwren_h: usb-otg0-pwren-h {
>>                           rockchip,pins = <0 RK_PD1 RK_FUNC_GPIO
>> &pcfg_pull_none>;
>> @@ -751,11 +769,14 @@
>>           bus-width = <4>;
>>           cap-mmc-highspeed;
>>           cap-sd-highspeed;
>> +       cd-gpios = <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
>>           disable-wp;
>>           no-mmc;
>>           no-sdio;
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&sdmmc0_clk &sdmmc0_cmd &sdmmc0_det &sdmmc0_bus4>;
>>           sd-uhs-sdr104;
>> -       vmmc-supply = <&vcc_3v3_s3>;
>> +       vmmc-supply = <&vcc3v3_sd>;
>>           vqmmc-supply = <&vccio_sd_s0>;
>>           status = "okay";
>>
>>
>>
>>
>>>> --- a/drivers/mmc/host/dw_mmc-rockchip.c
>>>> +++ b/drivers/mmc/host/dw_mmc-rockchip.c
>>>> @@ -36,6 +36,8 @@ struct dw_mci_rockchip_priv_data {
>>>>            int                     default_sample_phase;
>>>>            int                     num_phases;
>>>>            bool                    internal_phase;
>>>> +       int                     sample_phase;
>>>> +       int                     drv_phase;
>>>>     };
>>>>
>>>>     /*
>>>> @@ -573,9 +575,43 @@ static void dw_mci_rockchip_remove(struct
>>>> platform_device *pdev)
>>>>            dw_mci_pltfm_remove(pdev);
>>>>     }
>>>>
>>>> +static int dw_mci_rockchip_runtime_suspend(struct device *dev)
>>>> +{
>>>> +       struct platform_device *pdev = to_platform_device(dev);
>>>> +       struct dw_mci *host = platform_get_drvdata(pdev);
>>>> +       struct dw_mci_rockchip_priv_data *priv = host->priv;
>>>> +
>>>> +       if (priv->internal_phase) {
>>>> +               priv->sample_phase = rockchip_mmc_get_phase(host, true);
>>>> +               priv->drv_phase = rockchip_mmc_get_phase(host, false);
>>>> +       }
>>>> +
>>>> +       return dw_mci_runtime_suspend(dev);
>>>> +}
>>>> +
>>>> +static int dw_mci_rockchip_runtime_resume(struct device *dev)
>>>> +{
>>>> +       struct platform_device *pdev = to_platform_device(dev);
>>>> +       struct dw_mci *host = platform_get_drvdata(pdev);
>>>> +       struct dw_mci_rockchip_priv_data *priv = host->priv;
>>>> +       int ret;
>>>> +
>>>> +       ret = dw_mci_runtime_resume(dev);
>>>> +       if (ret)
>>>> +               return ret;
>>>> +
>>>> +       if (priv->internal_phase) {
>>>> +               rockchip_mmc_set_phase(host, true, priv->sample_phase);
>>>> +               rockchip_mmc_set_phase(host, false, priv->drv_phase);
>>>> +               mci_writel(host, MISC_CON, MEM_CLK_AUTOGATE_ENABLE);
>>>> +       }
>>>> +
>>>> +       return ret;
>>>> +}
>>>> +
>>>>     static const struct dev_pm_ops dw_mci_rockchip_dev_pm_ops = {
>>>>            SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>>>> pm_runtime_force_resume)
>>>> -       RUNTIME_PM_OPS(dw_mci_runtime_suspend, dw_mci_runtime_resume, NULL)
>>>> +       RUNTIME_PM_OPS(dw_mci_rockchip_runtime_suspend,
>>>> dw_mci_rockchip_runtime_resume, NULL)
>>>>     };
>>>>
>>>>     static struct platform_driver dw_mci_rockchip_pltfm_driver = {
>>>
>>
> 


