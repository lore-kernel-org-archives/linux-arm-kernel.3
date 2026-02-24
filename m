Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC85EFB7EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 03:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oY/aVs2MBsqFBnrxFsG7MMgaG2m19nI2+4Sd2HfxOD4=; b=gRfanKsAgDmuA/2a+lYk5t7/he
	DKbmR6EMRoAv+law9Fg/BC5+7snEais5XMYQUeRKNQY2w2j+ryvQ/np8jmgN8ggSneytjalJy0IcO
	OiU5r3sNpRqRA3tnwO7on/N4yIJAJhiYqDJ9s/lwbDiZVPoBiJYjHUQWui2SBOlXVSJaHNfuAmsPl
	n8MHvyApADRsx6rOdv5vam+HHtN60zDxiSzbvHT5j8imKCKQHUgOe1D88fjau5CUCqbM3tPYcLQxc
	6mr8UFhfOZlAQFECridDrIV6JE59WtX1BPIWOyY93n2+yB8Cs8RLCJkfYqH3ouYn3a920CgHYWHpW
	0kDOQbVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuisH-00000001OEK-2QgN;
	Tue, 24 Feb 2026 03:14:13 +0000
Received: from mail-m1973190.qiye.163.com ([220.197.31.90])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuisE-00000001ODp-1qKM;
	Tue, 24 Feb 2026 03:14:12 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 34bf77547;
	Tue, 24 Feb 2026 11:14:01 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, Heiko Stuebner <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "finley.xiao" <finley.xiao@rock-chips.com>
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: add node name for
 RK3588_PD_RKVDEC0/1 and RK3588_PD_VENC0/1
To: Chaoyi Chen <kernel@airkyi.com>
References: <1770950113-19802-1-git-send-email-shawn.lin@rock-chips.com>
 <B5000B8F1001C1D8+040b217f-8ee1-4f96-95ec-e44d140b589d@airkyi.com>
 <9cc9a3c5-55f0-32f6-f166-acfb3a34f0a3@rock-chips.com>
 <C28FA037F24F3E74+97535c93-cc16-4bd5-b436-db7cdc0bb580@airkyi.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <54ba06df-b9eb-f4de-0254-afc3b8fcb0ab@rock-chips.com>
Date: Tue, 24 Feb 2026 11:14:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <C28FA037F24F3E74+97535c93-cc16-4bd5-b436-db7cdc0bb580@airkyi.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c8da3b33509cckunm4fd9e8659c9d03
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkwaSlYdTkwYQ0JOQxpPTUNWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUJCSU5LVU
	pLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=kOWA5HPKq1t2S4LMXPzcHbvRfwGsQn6q4o1yVtjCJa1zZ1coXy1w0YYRyLDQTmW/wNIM2Jia9ETpK+7jIHFJXreFLw2rx9bu4qBKGx9sTwl3Dm4NGTpz1e8IT1vSJJcNX709xjEGiUXyBMkaUEmaGlvjnzEmhT5XZibzT0Qj2VY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=oY/aVs2MBsqFBnrxFsG7MMgaG2m19nI2+4Sd2HfxOD4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_191410_668914_83628F1C 
X-CRM114-Status: GOOD (  23.07  )
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



在 2026/02/24 星期二 9:42, Chaoyi Chen 写道:
> On 2/13/2026 7:11 PM, Shawn Lin wrote:
>> Hi Chaoyi
>>
>> 在 2026/02/13 星期五 18:32, Chaoyi Chen 写道:
>>> Hello Shawn,
>>>
>>> On 2/13/2026 10:35 AM, Shawn Lin wrote:
>>>> Thus the board dts files could add property for these nodes.
>>>>
>>>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>>>> ---
>>> You should also add pmdomain driver.
>>>
>>> I've encountered a similar issue before.
>>> Finley told me to use the new PMIC, and that would solve the problem.
>>> Maybe you're using the same old PMIC as I did :)
>>>
>>
>> I don't know what does new PMIC mean? New RK806 driver or new RK806
>> hardware?
> 
> It is new RK806 hardware. According to Finley, end users are currently using
> this new type of PMIC.
> 
> 
>>
>> The problem is these power domains rely on voltage supply which could
>> be probed late after pmdomain driver, then the system enables the PD and
>> access the IP without PD actually enabled(even w/o voltage supply
>> enabled).
>>
> 
> If I'm not mistaken, the new hardware will automatically powers up the supply
> corresponding to VDEC/VNEC.
> 

Thanks for the clarification on the hardware update.

I'm currently using the EVB board for SoC bring-up and post-silicon
validation, which I believe carries the old RK806 hardware. It's also
apparent that many developers (as opposed to end users) are still
relying on the old hardware in the field.

Generally speaking, upstream code has no way to distinguish between the 
old and new PMIC variants solely from the DTS, correct? Given this, I
think we should aim to keep both hardware versions workable in the
upstream code.

> 
>>
>>
>>>
>>>>
>>>>    arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 8 ++++----
>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
>>>> index 7fe9593..4fb8888 100644
>>>> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
>>>> @@ -907,7 +907,7 @@
>>>>                    #size-cells = <0>;
>>>>                    #power-domain-cells = <0>;
>>>>    -                power-domain@RK3588_PD_RKVDEC0 {
>>>> +                pd_rkvdec0: power-domain@RK3588_PD_RKVDEC0 {
>>>>                        reg = <RK3588_PD_RKVDEC0>;
>>>>                        clocks = <&cru HCLK_RKVDEC0>,
>>>>                             <&cru HCLK_VDPU_ROOT>,
>>>> @@ -917,7 +917,7 @@
>>>>                        pm_qos = <&qos_rkvdec0>;
>>>>                        #power-domain-cells = <0>;
>>>>                    };
>>>> -                power-domain@RK3588_PD_RKVDEC1 {
>>>> +                pd_rkvdec1: power-domain@RK3588_PD_RKVDEC1 {
>>>>                        reg = <RK3588_PD_RKVDEC1>;
>>>>                        clocks = <&cru HCLK_RKVDEC1>,
>>>>                             <&cru HCLK_VDPU_ROOT>,
>>>> @@ -926,7 +926,7 @@
>>>>                        pm_qos = <&qos_rkvdec1>;
>>>>                        #power-domain-cells = <0>;
>>>>                    };
>>>> -                power-domain@RK3588_PD_VENC0 {
>>>> +                pd_venc0: power-domain@RK3588_PD_VENC0 {
>>>>                        reg = <RK3588_PD_VENC0>;
>>>>                        clocks = <&cru HCLK_RKVENC0>,
>>>>                             <&cru ACLK_RKVENC0>;
>>>> @@ -937,7 +937,7 @@
>>>>                        #size-cells = <0>;
>>>>                        #power-domain-cells = <0>;
>>>>    -                    power-domain@RK3588_PD_VENC1 {
>>>> +                pd_venc1: power-domain@RK3588_PD_VENC1 {
>>>>                            reg = <RK3588_PD_VENC1>;
>>>>                            clocks = <&cru HCLK_RKVENC1>,
>>>>                                 <&cru HCLK_RKVENC0>,
>>>
>>
>>
>>
> 

