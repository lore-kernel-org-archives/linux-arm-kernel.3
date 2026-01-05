Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61BFC2A072
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 08:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ikrHxT9pUrA6wm1OxlVXDTRPK+tK4E4/92u7aJC5YAE=; b=HuvfPVdu2KS/FE2kdvhnBn2IKL
	mTjk4geO5bcz5NWvQNf+liCZam15aj5Ds0s+ajnvV9rTHCsFsGJBkedaDgkEhBQYGig9a31F4RCVU
	HLL44S92sPS1vCsEkkN+XR9vqrXdUmMmWV5JkoqmTQesU6nZBj18/5e128D2bWE6/jsz1oYCcZB/t
	E86Ii64YG3JFwLCXSqL+tX3C5lSi5zmlkCHsSrGLlQt7qEK2zu6OLZQJeh/6mG9RkmELma+jma1yE
	ybCi76uuj4t3ZG+Bfvfmehgy5DLai4N7dIEUSR1oDaQ5USbhVW0z8NIHCSOGWOrUpn/sry1pTNT+f
	Kes9uxVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfhY-0000000Axlj-0Yhb;
	Mon, 05 Jan 2026 08:12:32 +0000
Received: from mail-m155110.qiye.163.com ([101.71.155.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfhT-0000000Axkq-0jUX;
	Mon, 05 Jan 2026 08:12:30 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2f85b6843;
	Mon, 5 Jan 2026 16:12:02 +0800 (GMT+08:00)
Message-ID: <010a23e0-4f55-431f-ba34-7b28ff5df43a@rock-chips.com>
Date: Mon, 5 Jan 2026 16:12:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: Fix wrong register range of rk3576
 gpu
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Frank Wang <frank.wang@rock-chips.com>, Alexey Charkov <alchark@gmail.com>,
 Liang Chen <cl@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251230090246.46-1-kernel@airkyi.com>
 <5954009.DvuYhMxLoT@workhorse>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <5954009.DvuYhMxLoT@workhorse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9b8d3690b503abkunm84df8d5db563df
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ01NSlZKGkxMTE5DGBpPH0xWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=enURKuAzDCspfYoP69oVPxdRg+jQE/N4K0O5oUwC8JsuzSPSMk/75yvunlOkc0RrOlf92yWB3oNur4OGAGh9FutPaIwoGsefCz5sx7XMUUIEBIRz/t+NmnbQFb3NkFvovoLQvR5YhCusedIlBwsweF4+sQ5uwAEUudnKvWvsDow=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=ikrHxT9pUrA6wm1OxlVXDTRPK+tK4E4/92u7aJC5YAE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_001229_381574_498924C4 
X-CRM114-Status: GOOD (  16.23  )
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

Hello Nicolas,

On 1/5/2026 3:55 PM, Nicolas Frattaroli wrote:
> On Tuesday, 30 December 2025 10:02:46 Central European Standard Time Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> According to RK3576 TRM part1 page13, the size of the GPU registers
>> is 128 KB.
>>
>> Fixes: 57b1ce903966 ("arm64: dts: rockchip: Add rk3576 SoC base DT")
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>> index 6284e7bdc442..b375015f0662 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>> @@ -1271,7 +1271,7 @@ power-domain@RK3576_PD_VO1 {
>>  
>>  		gpu: gpu@27800000 {
>>  			compatible = "rockchip,rk3576-mali", "arm,mali-bifrost";
>> -			reg = <0x0 0x27800000 0x0 0x200000>;
>> +			reg = <0x0 0x27800000 0x0 0x20000>;
>>  			assigned-clocks = <&scmi_clk SCMI_CLK_GPU>;
>>  			assigned-clock-rates = <198000000>;
>>  			clocks = <&cru CLK_GPU>;
>>
> 
> This is only true if you only consider the GPU_CONTROL and
> JOB_CONTROL register ranges, and leave out the MMU_STAGE1
> and MMU_STAGE2 ranges. I don't know if those need to be
> mapped, since the MMU control registers are < 0x2000.
> 
> What do other bifrost devices do?
> 

I don't quite understand your point. And this size is 0x20000,
not 0x2000. Before the change it was 0x200000, which overlaps the
address space of some hardware that comes after it like JPEG. 

Could you explain it again? Thank you.

> Kind regards,
> Nicolas Frattaroli
> 
> 
> 

-- 
Best, 
Chaoyi

-- 
Best, 
Chaoyi

