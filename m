Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAF0E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 02:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZzb2ZQ3hoZVRBl4yIEiLAbS1Ry1GkYmH+p0gvL9IqE=; b=Zjcd0QuxmFndMSSWXv96XnneLl
	MCNFX2hYzCHRA5g4xtsg8e39k0rXHTBIcHvvMwe08NUB9dh+id75Q9/apEgdy7hLsBFLyLKHJyi2+
	uxxT0D3OELmvcZuzSe+f12tVvz/PBE9VydWj2pMlVVFqSD4q6NRZ91rjvmZaan9WVdmvcuUTshmdx
	Ttb8x/XqiErsHNgCdlO21YT+0K53n3f/3RflUa74PaA+6fV+vxKNO8KxeRsH5qpzA1HKPoFP67RdI
	CJXhS4ZAovskj3Gt+X8ZP/wDlsJJH47uNihtTjO7doBbxhuSgSdKpxhvwcqUiwm287HweJHQX30Yl
	H21SauzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQdLy-0000000Ex3O-2S5W;
	Thu, 26 Dec 2024 02:11:58 +0000
Received: from mail-m12758.qiye.163.com ([115.236.127.58])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQdKm-0000000EwxL-1Py6;
	Thu, 26 Dec 2024 02:10:46 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6d43afb9;
	Thu, 26 Dec 2024 10:10:37 +0800 (GMT+08:00)
Message-ID: <573e04c0-6f41-4117-9b04-d2628266a34b@rock-chips.com>
Date: Thu, 26 Dec 2024 10:10:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/15] dt-bindings: display: rockchip: analogix-dp: Add
 support for RK3588
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-3-damon.ding@rock-chips.com>
 <tdhs45ac2ivdke7idrzxrhlgsqlnswkb2maorau3guzrrwpce3@emdq7xx6cpwz>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <tdhs45ac2ivdke7idrzxrhlgsqlnswkb2maorau3guzrrwpce3@emdq7xx6cpwz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkNCSlZNTR5OGklCGRhOGRpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a9400baec2b03a3kunm6d43afb9
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OT46NDo*ATIPDE0IIRUaEj4p
	EU8wC0NVSlVKTEhOSkxCS0hCSE9JVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFIS0xCNwY+
DKIM-Signature: a=rsa-sha256;
	b=AjwRRWxW2Lo9PBQrMB93fBRqQgmHVgRneeSxy1NxFuTPTplCxu8M1n6NHtCxIimsfW+zqimpyP+daoPBlzbBkrRD8AvpGH2CTSccCW74+ixNRnAbQApAMZW8u5SU/BIAn6146qlaGNtb6h3dvOIdYhq5ImgOX22F79eENRu6ztg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=IZzb2ZQ3hoZVRBl4yIEiLAbS1Ry1GkYmH+p0gvL9IqE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_181044_935796_62079323 
X-CRM114-Status: GOOD (  19.34  )
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

On 2024/12/19 16:28, Krzysztof Kozlowski wrote:
> On Thu, Dec 19, 2024 at 04:05:51PM +0800, Damon Ding wrote:
>> Compared with RK3288/RK3399, the HBR2 link rate support is the main
>> improvement of RK3588 eDP TX controller, and there are also two
>> independent eDP display interfaces on RK3588 Soc.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Drop, patch was very different.
> 
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
>>
>> Changes in v2:
>> - Add the main defferences of the RK3588 eDP and the previous versions
>>    in commit message
>>
>> Changes in v3:
>> - expand the property clock-names, resets and reset-names
> 
> Adding new properties invalidates reviews. The patch is entirely, really
> significantly different so keeping the review is not acceptable.
> 
>> ---
>>   .../display/rockchip/rockchip,analogix-dp.yaml     | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> index 60dedf9b2be7..4f84e8849876 100644
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
>> @@ -25,16 +26,23 @@ properties:
>>       items:
>>         - const: dp
>>         - const: pclk
>> -      - const: grf
>> +      - enum:
>> +          - grf
>> +          - spdif
> 
> No, this cannot be flexible for existing variants.

I will drop the 'spdif' because the audio feature has not been added to 
the analogix-dp driver in this patch series.

> 
>>   
>>     power-domains:
>>       maxItems: 1
>>   
>>     resets:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
> 
> No, you must list the items.
> 
>>   
>>     reset-names:
>> -    const: dp
>> +    minItems: 1
>> +    items:
>> +      - const: dp
>> +      - enum:
>> +          - apb
> 
> I don't understand what happened here but all this is NAK. Why suddenly
> existing variants became different/changed? Nothing in commit msg
> explains this.

The newly added 'apb' reset is to ensure the APB bus of eDP controller 
works well on the RK3588 SoC. I will mention it in commit message in the 
next version.

The fixed patch will be like:

@@ -31,10 +32,12 @@ properties:
      maxItems: 1

    resets:
-    maxItems: 1
+    maxItems: 2

    reset-names:
-    const: dp
+    items:
+      - const: dp
+      - const: apb

    rockchip,grf:
      $ref: /schemas/types.yaml#/definitions/phandle

And I will add the APB reset operation in Rockchip analogix-dp driver, 
which was forgotten in the [PATCH v3 03/15].

Best regards,
Damon


