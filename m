Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A254E77191
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 08:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rinnivx0cBsSyUz91rNHr9cW/t0708LXi8H3vArQWRk=; b=ciN16CzoNRciQAxNdsJdWIFV8e
	ZzEYjcKsYAoAF5qLkwaXP3iZgD1HHUlXwXfciwRw/XWJ37CCT19UJCjt1CHxN+kLmg+7kM2UGtMFr
	zljPDnE14S9wnuum4c0RgF13KocfpyNGPHhWyRL56B0bA2cGzvJHVPcMqPw5iKzIxrie7yCa+hGVm
	sexatN7NRs8YjkPI60GXRM7/CehQ0x8XBOv9XjbsPUO6g+UDxuOw2HDRT6TS8CLQULIK9/A8wwgYH
	7kiGHzeKKec/TR+UpmhxMABfC+pLb/LrNrfVYqdF6nRHMyFF5BubcJrEyXAtSiv0S893XevC+2BqG
	EJWpELIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR68C-0000000HQSY-0iwV;
	Fri, 27 Dec 2024 08:55:40 +0000
Received: from mail-m12796.qiye.163.com ([115.236.127.96])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR66v-0000000HQEr-26Fl;
	Fri, 27 Dec 2024 08:54:23 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6fe3c526;
	Fri, 27 Dec 2024 16:54:10 +0800 (GMT+08:00)
Message-ID: <730ff342-9a9a-4a3f-b93e-0ad3ce414700@rock-chips.com>
Date: Fri, 27 Dec 2024 16:54:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/15] arm64: dts: rockchip: Enable eDP0 display on
 RK3588S EVB1 board
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-15-damon.ding@rock-chips.com>
 <cg7bnhol4gvzji7agxazas7nkxy7zammzy67rjvhp35yqyraju@73daepsbmuae>
 <d2b47813-45fa-4148-8a4a-6cf4a18ee7ca@rock-chips.com>
 <CAA8EJpp0Smtqx7VQ5zdg9x3EhuLpk4u4vGv=rv8DHJ0rhei18w@mail.gmail.com>
 <32c7ef0a-8da6-449a-8f2d-59965aa622ec@rock-chips.com>
 <CAA8EJpqFwQGT=wYWuSf8izw9V=zJJ-YVA40i3f8L7wnZfPjyTA@mail.gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <CAA8EJpqFwQGT=wYWuSf8izw9V=zJJ-YVA40i3f8L7wnZfPjyTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUpCTFZDQ0sZH01PHhkfSR5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a940752bdd303a3kunm6fe3c526
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MTI6Myo*NTITSDgOOgEjAQoX
	CFZPCipVSlVKTEhOSUNCTU5JT0xCVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFOSU1KNwY+
DKIM-Signature: a=rsa-sha256;
	b=cQePi2IUgNwYTRAvP0s2Ymzzy/PJ15VKyduWOhnYn/jq9x4bYEYk/tuFnoGLe1gvw2fjreD2xcxv+ODPCotwJ046bwIH5z5PONQweQYhIRNZWjzXIH9EJLPDIpwzPlERr63pkhKJmYOcju8x1UlLM93FPAE0MWFQ0xOVZoZ8Ack=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=rinnivx0cBsSyUz91rNHr9cW/t0708LXi8H3vArQWRk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_005421_747408_8EAB1034 
X-CRM114-Status: GOOD (  19.20  )
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

Hi Dmitry,

On 2024/12/27 4:26, Dmitry Baryshkov wrote:
> On Wed, 25 Dec 2024 at 11:34, Damon Ding <damon.ding@rock-chips.com> wrote:
>>
>> Hi Dmitry,
>>
>> On 2024/12/20 13:38, Dmitry Baryshkov wrote:
>>> On Fri, 20 Dec 2024 at 04:38, Damon Ding <damon.ding@rock-chips.com> wrote:
>>>>
>>>> Hi Dmitry,
>>>>
>>>> On 2024/12/20 8:20, Dmitry Baryshkov wrote:
>>>>> On Thu, Dec 19, 2024 at 04:06:03PM +0800, Damon Ding wrote:
>>>>>> Add the necessary DT changes to enable eDP0 on RK3588S EVB1 board:
>>>>>> - Add edp-panel node
>>>>>> - Set pinctrl of pwm12 for backlight
>>>>>> - Enable edp0/hdptxphy0/vp2
>>>>>>
>>>>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>>>>>
>>>>>> ---
>>>>>>
>>>>>> Changes in v2:
>>>>>> - Remove brightness-levels and default-brightness-level properties in
>>>>>>      backlight node.
>>>>>> - Add the detail DT changes to commit message.
>>>>>>
>>>>>> Changes in v3:
>>>>>> - Use aux-bus instead of platform bus for edp-panel.
>>>>>> ---
>>>>>>     .../boot/dts/rockchip/rk3588s-evb1-v10.dts    | 52 +++++++++++++++++++
>>>>>>     1 file changed, 52 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
>>>>>> index bc4077575beb..9547ab18e596 100644
>>>>>> --- a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
>>>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
>>>>>> @@ -9,6 +9,7 @@
>>>>>>     #include <dt-bindings/gpio/gpio.h>
>>>>>>     #include <dt-bindings/input/input.h>
>>>>>>     #include <dt-bindings/pinctrl/rockchip.h>
>>>>>> +#include <dt-bindings/soc/rockchip,vop2.h>
>>>>>>     #include <dt-bindings/usb/pd.h>
>>>>>>     #include "rk3588s.dtsi"
>>>>>>
>>>>>> @@ -238,6 +239,41 @@ &combphy2_psu {
>>>>>>        status = "okay";
>>>>>>     };
>>>>>>
>>>>>> +&edp0 {
>>>>>> +    force-hpd;
>>>>>> +    status = "okay";
>>>>>> +
>>>>>> +    aux-bus {
>>>>>> +            panel {
>>>>>> +                    compatible = "lg,lp079qx1-sp0v";
>>>>>
>>>>> Why do you need the particular compat string here? Can you use the
>>>>> generic "edp-panel" instead? What if the user swaps the panel?
>>>>>
>>>>
>>>> The eDP panels used in conjunction with the RK3588S EVB1 have broken
>>>> identification, which is one of the valid reasons for using a particular
>>>> compat string. So the generic_edp_panel_probe() can not return success
>>>> when using the "edp-panel".
>>>
>>> Broken how? I don't see such info in the commit message.
>>>
>>
>> The log related to the broken identification may be like:
>>
>> [    0.623793] panel-simple-dp-aux aux-fdec0000.edp: Unknown panel ETC
>> 0x0000, using conservative timings
> 
> According to [1] the ETC / 0x0000 is a correct identification for that
> panel. I'd suggest adding the timings to the driver instead.
> 
> [1]  https://www.elecok.com/data_sheet/107657/LP079QX1-SP0V_7.9%22_a-Si_TFT-LCD%2CPanel_for_LG_Display(EN).pdf?download=true
> 

Do you mean adding the LP079QX1-SP0V to the struct edp_panel_entry 
edp_panels[]?

While verifying the 'edp-panel'compatible, I have found some bugs 
related to the process of getting edp panel from the DP AUX bus in PATCH 
v4 series. Consequently, the commits concerning the analogix dp drivers 
are not good.

I will fix the unexpected bugs in the next version(v5).

>>
>> The eDP panel used in RK3588S EVB1 is indeed the LP079QX1_SP0V model, it
>> should be also reasonable to use the "lg,lp079qx1-sp0v".
>>
>> And I will mention all of the above in the commit message for the next
>> version.
>>
>>>>
>>>>>> +                    backlight = <&backlight>;
>>>>>> +                    power-supply = <&vcc3v3_lcd_edp>;
>>>>>> +
>>>>>> +                    port {
>>>>>> +                            panel_in_edp: endpoint {
>>>>>> +                                    remote-endpoint = <&edp_out_panel>;
>>>>>> +                            };
>>>>>> +                    };
>>>>>> +            };
>>>>>> +    };
>>>>>> +};
>>>>>> +
>>>>>> +&edp0_in {
>>>>>> +    edp0_in_vp2: endpoint {
>>>>>> +            remote-endpoint = <&vp2_out_edp0>;
>>>>>> +    };
>>>>>> +};
>>>>>> +
>>>>>> +&edp0_out {
>>>>>> +    edp_out_panel: endpoint {
>>>>>> +            remote-endpoint = <&panel_in_edp>;
>>>>>> +    };
>>>>>> +};
>>>>>> +
>>>>>> +&hdptxphy0 {
>>>>>> +    status = "okay";
>>>>>> +};
>>>>>> +
>>>>>>     &i2c3 {
>>>>>>        status = "okay";
>>>>>>
>>>>>> @@ -399,6 +435,7 @@ usbc0_int: usbc0-int {
>>>>>>     };
>>>>>>
>>>>>>     &pwm12 {
>>>>>> +    pinctrl-0 = <&pwm12m1_pins>;
>>>>>>        status = "okay";
>>>>>>     };
>>>>>>
>>>>>> @@ -1168,3 +1205,18 @@ usbdp_phy0_dp_altmode_mux: endpoint@1 {
>>>>>>                };
>>>>>>        };
>>>>>>     };
>>>>>> +
>>>>>> +&vop_mmu {
>>>>>> +    status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&vop {
>>>>>> +    status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&vp2 {
>>>>>> +    vp2_out_edp0: endpoint@ROCKCHIP_VOP2_EP_EDP0 {
>>>>>> +            reg = <ROCKCHIP_VOP2_EP_EDP0>;
>>>>>> +            remote-endpoint = <&edp0_in_vp2>;
>>>>>> +    };
>>>>>> +};
>>>>>> --
>>>>>> 2.34.1
>>>>>>

Best regards
Damon

