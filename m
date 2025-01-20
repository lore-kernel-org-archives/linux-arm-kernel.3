Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54557C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 07:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9x5PVUE1JktG04GVLVpq/qvvHEgshZnb4IAcFz1hy0=; b=ei0FJb1YdWmhcf/pS4dTp4UwEV
	qVdM2zX0mOF5w3JZw4WgH3xV+QkfBQTBgcPlkkx8Xfk52RXagvuwiatN+zKt+++04dAuo/a26fYvU
	BcdeDEt0P/WLIcZMPUH4hdmnTvf4/6qAcsmjBCcdvYHhQiXGVA/QLC5QYXWel8YlR5HNIcQSCtRCR
	SSHYBj9dPn7HKsgb1vuFRq1GXb2pdH9NmKYYCfXy6yh3if1arHMPomQHg96eHd2yryuVWymelaDOU
	JHvTMWbpdDysVE63alQAc7hQfZo0Nplnu7H8CeiPI07qGw7r6DettQmGgM0N5WcaZJMDXHBj3oirC
	UeR6euBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZlup-00000004sgx-0cYy;
	Mon, 20 Jan 2025 07:09:43 +0000
Received: from mail-m1973186.qiye.163.com ([220.197.31.86])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZltT-00000004sXz-2bBP;
	Mon, 20 Jan 2025 07:08:21 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 92ac8289;
	Mon, 20 Jan 2025 15:08:08 +0800 (GMT+08:00)
Message-ID: <d6211c5e-a38d-46aa-8d33-6dba2a71e018@rock-chips.com>
Date: Mon, 20 Jan 2025 15:08:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v5 13/20] dt-bindings: display: rockchip: analogix-dp: Add
 support for RK3588
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, dmitry.baryshkov@linaro.org,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-14-damon.ding@rock-chips.com>
 <gmwmnjc4pzyzzstyozlfcdaw2ntfxg6ixofio2j746hmixhblc@sjbcvwcgitmy>
Content-Language: en-US
In-Reply-To: <gmwmnjc4pzyzzstyozlfcdaw2ntfxg6ixofio2j746hmixhblc@sjbcvwcgitmy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkhCHlYaHhkfTRlOQ0gaHU5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a94828a484603a3kunm92ac8289
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PTI6Hgw*ITIVSzcfAx8VFAgj
	OD5PChBVSlVKTEhMSE5NQ0NCQ0xNVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFIT0tPNwY+
DKIM-Signature: a=rsa-sha256;
	b=hvLcnqb6GgruYOfRwgMuBJZ5apTXhXgbcphlrkpMcxbPR5AkNTHTqVs27FdGFp2qS4UbOwsMJtceiuvVU3BYIcVm87yzf0e7mntk7p3YiHcAdCM+LrQ54/L6zU9oFUg93nqycd1I8fukZYoTuqCY5ssqkZGmSlzKRMo0UPBECpc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=d9x5PVUE1JktG04GVLVpq/qvvHEgshZnb4IAcFz1hy0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_230819_841448_B804FF97 
X-CRM114-Status: GOOD (  14.32  )
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

Hi Krzysztof,

On 2025/1/9 16:54, Krzysztof Kozlowski wrote:
> On Thu, Jan 09, 2025 at 11:27:18AM +0800, Damon Ding wrote:
>> Compared with RK3288/RK3399, the HBR2 link rate support is the main
>> improvement of RK3588 eDP TX controller, and there are also two
>> independent eDP display interfaces on RK3588 Soc.
>>
>> The newly added 'apb' reset is to ensure the APB bus of eDP controller
>> works well on the RK3588 SoC.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
>>
>> Changes in v2:
>> - Add the main defferences of the RK3588 eDP and the previous versions
>>    in commit message
>>
>> Changes in v3:
>> - Expand the property clock-names, resets and reset-names
>>
>> Changes in v4:
>> - Remove 'spdif' clock which added in v3
>> - Add the comment of newly added 'apb' reset in commit message
>>
>> Changes in v5:
>> - Put the differences between RK3288/RK3399 and RK3588 into 'allOf'
>> ---
>>   .../rockchip/rockchip,analogix-dp.yaml        | 37 ++++++++++++++++---
>>   1 file changed, 31 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> index eaf4e67e232e..3cdea9e63522 100644
>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> @@ -15,6 +15,7 @@ properties:
>>       enum:
>>         - rockchip,rk3288-dp
>>         - rockchip,rk3399-edp
>> +      - rockchip,rk3588-edp
>>   
>>     clocks:
>>       minItems: 2
>> @@ -30,12 +31,6 @@ properties:
>>     power-domains:
>>       maxItems: 1
>>   
>> -  resets:
>> -    maxItems: 1
>> -
>> -  reset-names:
>> -    const: dp
> 
> Widest constraints are always here. You only needed to add allOf.
> 
> https://elixir.bootlin.com/linux/v6.11-rc6/source/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> 
> 

I see. I will keep the widest constraints of 'resets' and 'reset-names', 
and only add RK3588 related constraints in allOf.

And I may also need to add the 'minItems' and 'maxItems' for 'resets' 
and 'reset-names' like the 'qcom,ufs.yaml':

diff --git 
a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml 
b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index a4c0c3a5de5a..baee021314e7 100644
--- 
a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ 
b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -32,9 +32,12 @@ properties:
      maxItems: 1

    resets:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2

    reset-names:
+    minItems: 1
+    maxItems: 2
      const: dp

    rockchip,grf:

If not, the CHECK_DTBS will failed with the logs:

/linux/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fdec0000: 
resets: [[31, 469], [31, 468]] is too long
         from schema $id: 
http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
/linux/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fdec0000: 
reset-names: ['dp', 'apb'] is too long
         from schema $id: 
http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#


Best regards
Damon



