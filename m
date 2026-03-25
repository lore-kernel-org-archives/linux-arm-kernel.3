Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E538109C05D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 21:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQoNueK7Bih1JQJxX+sljZmhizS9OE+yMpwSWEJhbGw=; b=49CMbpEVaLyTdAeGNyoxrfEhrk
	z+x8QpMsnhPm1wlX413+xGcoHtf3AFORwg/MUKhHTBmjjqs+hsrzEalVvgpaYIAGOMLwTtFpAZzpW
	HgFirgPBqpGsTXAMrOv0CdGDqKQ7XtZMXqlO8qCngy0NXZlO4O1zuOEL2KSvs8XleQzd94YQvM3P4
	mudbPtUuPMedgwacuSSo15TUJjmJiU3WVPpKu2n68vAOxK7T1v7jNRCRSYstk2NY4OC8V7M+zcGZX
	T9mqruArDUC7veJqBhW9RmrCxrBSjmYuZe2vVyigTqYJaceU+Zs2+OWPIKrD1nUvSRjRpJfk5zec4
	HVJ1Vx2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5VsK-00000004Hmd-3lV8;
	Wed, 25 Mar 2026 21:34:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5VsI-00000004HmE-2WTs;
	Wed, 25 Mar 2026 21:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774474486;
	bh=E1WXPXz+/NlfRML46gDMJ4qfQn90FVfE9nYP5/MLyMg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e+rDolsHY8954s81Mp/fexI2cypjxrLKc6/hIUuDpERQFz1AgsSs/k6BYU7Sz3rrK
	 SKImsKhlljGJuH+3OZEcXhJm8xoMTeiGsUijKm3BS/mgp70vScwP8BV9+qVzxuvmEZ
	 DuPp1sLsSP5GFzOb1vQ5olRjkHik0XMRcwT0HYkhplYrTTbuR8Nxo1v/pkKOgam9JW
	 ri0RroBwrfAP0fO00F15ZhuveO6PSW7Xrw113u8hOFw5ed3Tp3BjNUVj/4tQPDm/Ai
	 DRHPVnmKm5oX5xuT2zWvxywDxOlEpkJxPzMXwaZDwAApkA2FgZvIH8T8iNAKH8VUza
	 xjVE2rrtnyEGw==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B3FF117E5B52;
	Wed, 25 Mar 2026 22:34:45 +0100 (CET)
Message-ID: <703bcf13-ab45-4e9a-b80c-80911d85d819@collabora.com>
Date: Wed, 25 Mar 2026 22:34:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3588 compatible
To: Rob Herring <robh@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Frank Li <Frank.li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Collabora Kernel Team <kernel@collabora.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260305-rk3588-csi2rx-v3-0-754473981f39@collabora.com>
 <20260305-rk3588-csi2rx-v3-1-754473981f39@collabora.com>
 <20260325210634.GA3963190-robh@kernel.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260325210634.GA3963190-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_143450_821192_6D27B9DA 
X-CRM114-Status: GOOD (  16.16  )
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

Hi Rob,

On 3/25/26 22:06, Rob Herring wrote:
> On Wed, Mar 25, 2026 at 11:25:34AM +0100, Michael Riesch wrote:
>> The RK3588 MIPI CSI-2 receivers are compatible to the ones found in
>> the RK3568.
>> Introduce a list of compatible variants and add the RK3588 variant to
>> it.
>>
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>

First of all, apologies for applying your Acked-by tag. I figured
resolving the merged conflict was trivial and impossible to screw up, but...

>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>> ---
>>  .../devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml   | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
>> index 4ac4a3b6f406..3d3b3cd78884 100644
>> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
>> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
>> @@ -16,9 +16,13 @@ description:
>>  
>>  properties:
>>    compatible:
>> -    enum:
>> -      - fsl,imx93-mipi-csi2
>> -      - rockchip,rk3568-mipi-csi2
>> +    oneOf:
>> +      - const: fsl,imx93-mipi-csi2
>> +      - const: rockchip,rk3568-mipi-csi2
> 
> These 2 should be a single enum as they were before.

... hm. Well.

First, do you mean

properties:
  compatible:
    oneOf:
      - enum:
         - fsl,imx93-mipi-csi2
         - rockchip,rk3568-mipi-csi2
      - items:
         - enum:
            - rockchip,rk3588-mipi-csi2
         - const: rockchip,rk3568-mipi-csi2
?

If so, what is the practical difference?

Thanks and best regards,
Michael


> 
>> +      - items:
>> +          - enum:
>> +              - rockchip,rk3588-mipi-csi2
>> +          - const: rockchip,rk3568-mipi-csi2
>>  
>>    reg:
>>      maxItems: 1
>>
>> -- 
>> 2.39.5
>>


