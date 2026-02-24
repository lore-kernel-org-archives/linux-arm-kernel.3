Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC46EFB81A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 08:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Wp2sN5X1+cc6yF7YHXtMGdZZZ1n3UPWfWNRgLMSVCE=; b=JFxOf5V3XuNbqfMBp9VMb3GOFA
	rJmOgSy8UBGxim9MUp1ypvZcnn83eFJJDM0o58cv8rxMprNAlUQguRKJEkks2MwuNc+cW2/XICcNy
	xxm4gPGqcf/AzSl0jEaW5oFyNSKwVcF0G53KyNZnXwGoxDovjjZr5KnFgtQjymfpcaouA59CW31Z2
	eNxDEpqhgGXNa98+dTD3m47Nu+S/8wu+pOmfycMUkoIE8Cp1zNUidwZEOoM/ac980aBfvvETUvxGO
	+wof7Mr2gScFpnPSFWoDl0trWnJ8djZmc5LpajhC4pwpRLOqVKbi90Iu5cZlf4GgJubtAoQf8Z6Fl
	90L8oUfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuo8x-00000001fiu-3E4T;
	Tue, 24 Feb 2026 08:51:47 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuo8u-00000001fhn-1sr5;
	Tue, 24 Feb 2026 08:51:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1771923082;
	bh=1Wp2sN5X1+cc6yF7YHXtMGdZZZ1n3UPWfWNRgLMSVCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=WshvWi6lz5BtC677eJb1Qx6RlkxMxZS85S+13d2jEqbEcRy9T13Jv0XOCbboZ+Jmz
	 yVfRsi/TPlw/d585XI4kZer/8QiqlJZyIYBfB17WlCYOBLL37rvEd07BRWQVqB3gt0
	 m2gn6nxavO/dawgQsQ3/jsmzukbxGtgs+3uTGlIw=
X-QQ-mid: esmtpgz10t1771923077t772720b5
X-QQ-Originating-IP: 4pzF/Gr5w8u1j2szuEhtODcV6z8qlwdIkHfAzN30BzU=
Received: from [127.0.0.1] ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Feb 2026 16:51:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6182285522596309104
Message-ID: <F5A210373581AADF+afcb86f5-1d02-46cb-9bb9-3f5e0e6ace9d@airkyi.com>
Date: Tue, 24 Feb 2026 16:51:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: add node name for
 RK3588_PD_RKVDEC0/1 and RK3588_PD_VENC0/1
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "finley.xiao" <finley.xiao@rock-chips.com>
References: <1770950113-19802-1-git-send-email-shawn.lin@rock-chips.com>
 <B5000B8F1001C1D8+040b217f-8ee1-4f96-95ec-e44d140b589d@airkyi.com>
 <9cc9a3c5-55f0-32f6-f166-acfb3a34f0a3@rock-chips.com>
 <C28FA037F24F3E74+97535c93-cc16-4bd5-b436-db7cdc0bb580@airkyi.com>
 <54ba06df-b9eb-f4de-0254-afc3b8fcb0ab@rock-chips.com>
Content-Language: en-US
From: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <54ba06df-b9eb-f4de-0254-afc3b8fcb0ab@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NvxNySBpH0QlOksNl9p6oeC0uvvmwEm553KMkBG3+sJGo0O9cx5+leed
	mjPQbnMyc09Fg+Q4DfHE7bOGm1CGXt4WO+Dk/ApAQp/rK2+2Gj+SJN9TjDqs55UvV7J932j
	TYX0XDZWEoZ320/Qm3gcm7fzCogn1LIhyas4kp0YXDaqRusVgdSMsiK8QIgJOvoyVNaVO4K
	MLULAxJiqkro43su6CN/3aMJ44CuT7+iacBjK+OiBKM7b820nY5SbXsVgGY2wzctwEVh2YJ
	7jSUouhNqNFGG4yygtooFDnL1IwQ7Ngj/tZUF64bkv6RxhZCfbEBFckbdW+Ic138OhbD5fU
	8G8bQiwYRw2AlCxTxh47vayZZW6ICvN/FJ94o9TOMZqODpMWatDGa7b34r3S+EJfO5sY7/B
	h4ulnDDHsKIOfCTIZpCeuoWw4cnBqbkc0gSD+TKicFOm3BX6+dm3Ro9YynzXIP66FSOocoK
	pX+j5s/R7Kkq7m+VD82XJfjXWP5EzFW73dObIGX4oDjH2QgB8g8CSUbmxCYJC2YQaQTcs6U
	VvzTFuicnJtBVmbOP1F7e5DpzFNJVc9wYlzWcJOoz+9971dxQ1IgtMhKRvQgqe9iwXDCZly
	Zw8Q93PTKxnayzKhUJEjHPL7RlFqP0zVxPcgHQ8KoOiJoT5lkPi/nEbr/Y9pNNmP4H11HlM
	x3F2+3WxfL876nbyvgGVo65kYqiYEWhimZMSQEmlWlVEa9yU0czInfUF5JFSlX2NueLMHta
	DgT/cu4CpEiRyxGD5CGYfvtjVgLGUcE9nAYdiGY9o2aKeJ0MLzYM21RS6VGJIuadguEgoaV
	tH52GrGK31k+fKWV5YWm1E3MTLA6EbVOyBLLs4BMdY5evx9A76jMmM23xoJ1zgrt40+W4bB
	JPU1LYMGscwZdhlcBPkM+cpU15dMA13aGs8cFzCDu4w4IucPpqdNa5WGFArcOBWz0u2FI/p
	07wuF40h+PdvWuFOIIe5CYj48ZJDrPR/xj7iu0Z45zMGendm5JWnT2mzo1Nu7SkseN5uGor
	p7OX9ntxiS4iFCj/yko+1+OPTdOU4E1mvgRMd1zKi0tkm/+RPf
X-QQ-XMRINFO: OWPUhxQsoeAVr0nlVs/uubuJpL/3SLbnIQ==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_005144_869434_8E0BC2CE 
X-CRM114-Status: GOOD (  22.07  )
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

On 2/24/2026 11:14 AM, Shawn Lin wrote:
> 
> 
> 在 2026/02/24 星期二 9:42, Chaoyi Chen 写道:
>> On 2/13/2026 7:11 PM, Shawn Lin wrote:
>>> Hi Chaoyi
>>>
>>> 在 2026/02/13 星期五 18:32, Chaoyi Chen 写道:
>>>> Hello Shawn,
>>>>
>>>> On 2/13/2026 10:35 AM, Shawn Lin wrote:
>>>>> Thus the board dts files could add property for these nodes.
>>>>>
>>>>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>>>>> ---
>>>> You should also add pmdomain driver.
>>>>
>>>> I've encountered a similar issue before.
>>>> Finley told me to use the new PMIC, and that would solve the problem.
>>>> Maybe you're using the same old PMIC as I did :)
>>>>
>>>
>>> I don't know what does new PMIC mean? New RK806 driver or new RK806
>>> hardware?
>>
>> It is new RK806 hardware. According to Finley, end users are currently using
>> this new type of PMIC.
>>
>>
>>>
>>> The problem is these power domains rely on voltage supply which could
>>> be probed late after pmdomain driver, then the system enables the PD and
>>> access the IP without PD actually enabled(even w/o voltage supply
>>> enabled).
>>>
>>
>> If I'm not mistaken, the new hardware will automatically powers up the supply
>> corresponding to VDEC/VNEC.
>>
> 
> Thanks for the clarification on the hardware update.
> 
> I'm currently using the EVB board for SoC bring-up and post-silicon
> validation, which I believe carries the old RK806 hardware. It's also
> apparent that many developers (as opposed to end users) are still
> relying on the old hardware in the field.
> 
> Generally speaking, upstream code has no way to distinguish between the old and new PMIC variants solely from the DTS, correct? Given this, I
> think we should aim to keep both hardware versions workable in the
> upstream code.
>

As far as I know, only early EVBs internal to Rockchip used them.
I think your approach also makes sense :)

>>
>>>
>>>
>>>>
>>>>>
>>>>>    arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 8 ++++----
>>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
>>>>> index 7fe9593..4fb8888 100644
>>>>> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
>>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
>>>>> @@ -907,7 +907,7 @@
>>>>>                    #size-cells = <0>;
>>>>>                    #power-domain-cells = <0>;
>>>>>    -                power-domain@RK3588_PD_RKVDEC0 {
>>>>> +                pd_rkvdec0: power-domain@RK3588_PD_RKVDEC0 {
>>>>>                        reg = <RK3588_PD_RKVDEC0>;
>>>>>                        clocks = <&cru HCLK_RKVDEC0>,
>>>>>                             <&cru HCLK_VDPU_ROOT>,
>>>>> @@ -917,7 +917,7 @@
>>>>>                        pm_qos = <&qos_rkvdec0>;
>>>>>                        #power-domain-cells = <0>;
>>>>>                    };
>>>>> -                power-domain@RK3588_PD_RKVDEC1 {
>>>>> +                pd_rkvdec1: power-domain@RK3588_PD_RKVDEC1 {
>>>>>                        reg = <RK3588_PD_RKVDEC1>;
>>>>>                        clocks = <&cru HCLK_RKVDEC1>,
>>>>>                             <&cru HCLK_VDPU_ROOT>,
>>>>> @@ -926,7 +926,7 @@
>>>>>                        pm_qos = <&qos_rkvdec1>;
>>>>>                        #power-domain-cells = <0>;
>>>>>                    };
>>>>> -                power-domain@RK3588_PD_VENC0 {
>>>>> +                pd_venc0: power-domain@RK3588_PD_VENC0 {
>>>>>                        reg = <RK3588_PD_VENC0>;
>>>>>                        clocks = <&cru HCLK_RKVENC0>,
>>>>>                             <&cru ACLK_RKVENC0>;
>>>>> @@ -937,7 +937,7 @@
>>>>>                        #size-cells = <0>;
>>>>>                        #power-domain-cells = <0>;
>>>>>    -                    power-domain@RK3588_PD_VENC1 {
>>>>> +                pd_venc1: power-domain@RK3588_PD_VENC1 {
>>>>>                            reg = <RK3588_PD_VENC1>;
>>>>>                            clocks = <&cru HCLK_RKVENC1>,
>>>>>                                 <&cru HCLK_RKVENC0>,
>>>>
>>>
>>>
>>>
>>
> 

-- 
Best, 
Chaoyi


