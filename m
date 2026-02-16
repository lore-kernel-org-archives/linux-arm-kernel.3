Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76378E81A3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 15:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2BJzKFN3TXnDiAg3JuDeYsaL1KqNrKZQU3UI0BA6Zw=; b=stvb6+MJ8aMGPxFvs4/DGxHha8
	xLZtu34Lab7EgmUmOknamSwuEnrFHpDA1dsrpBrzwwGe5h1m099tkb+4txFdirSkySxRyk+rSm6z7
	EX/c/MV6bg0pCmTkRO1oHnDJJoLB6xPnymKnWS7aAhKpj5sYU7CRq7ch344fB2Rx/ayGa3rPPBmDD
	+x31hdRXAtZHmLDFfmadwlg9zg4T1iXXsY5IYzk+YCWVR0J+BCt0k+mLqx2+nq3xIGSFATAKpYUeX
	Ke2Zt/rDdx1Kh3AdXLiqAxESHAJwxsoZYsUIjA0Mx/907CBX5IM65WcHLV/4zt+Ex+zTIcOEJP1fK
	hlUJ+9aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0QY-00000006shJ-0NWU;
	Mon, 16 Feb 2026 15:22:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0QV-00000006sfR-01Zb;
	Mon, 16 Feb 2026 15:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771255334;
	bh=rO5pvMpoFmL8Fx9NoSnLv4h+94kVFJV6QpMLCSMKBYY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=VGp0ddLiK3M75iH7slbP42Pf/2drvgeo7I2GaYWx/+Myyou9z+e7TCwWnvR7CzAGf
	 EY51OJSso1SO642glioZJgYN+GTdR4PtW+OvdpHVPJecniKapCxvtZRDSYbS/RJLLU
	 WZmPL0Wx37NdMhvuN0EU17NMgPGG0DypPlvmZtQSP3FI6q4EUVvjwfinuOvE3MLpSV
	 5eLPr6my7g1iyVfEeuTmtgH+9hVOOFGLQREN+6S21DwbVGbjKQZ0R5B9J3FGZB67yM
	 S76+lNXDz2EGmNuGCdt1yWO1C7zFamE414YxxtoMy0ySguT8eQjunWNWALdtQCCdHh
	 MVfgifyFu4OYQ==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DADEB17E01E7;
	Mon, 16 Feb 2026 16:22:13 +0100 (CET)
Message-ID: <e06feb9d-47cd-40e6-8c43-b24ff8a3e800@collabora.com>
Date: Mon, 16 Feb 2026 16:22:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] media: dt-bindings: add NXP i.MX93 compatible
 string
From: Michael Riesch <michael.riesch@collabora.com>
To: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com>
 <20260213-imx93-dw-csi2-v2-5-8be6039f44c6@nxp.com>
 <50a82e17-1666-4ef6-ab6e-c0be3c780a0d@collabora.com>
Content-Language: en-US
In-Reply-To: <50a82e17-1666-4ef6-ab6e-c0be3c780a0d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_072219_221299_9F5A1641 
X-CRM114-Status: GOOD (  16.64  )
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

Hi Frank,

On 2/16/26 09:31, Michael Riesch wrote:
> Hi Frank,
> 
> On 2/13/26 21:25, Frank Li wrote:
>> The i.MX93 uses the DW CSI-2 RX controller, which is similar to the
>> Rockchip RK3568 implementation.
>>
>> The i.MX93 variant provides one IRQ, two clocks, and no resets. Add the
>> "fsl,imx93-mipi-csi2" compatible string and keep the same constraints for
>> rk3568.
> 
> RK3568.
> 
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> With that cosmetic fix,
> 
> Acked-by: Michael Riesch <michael.riesch@collabora.com>

I just recalled a conversation with Heiko we had off-list a while ago,
and back then we kind of decided against a snps binding document and
compatible, since the integration in the respective SoC (family) varies.
Thus, we went for a Rockchip document (which shall be extended with the
RK3588 variant of this block, for example) and thought that any other
variant (e.g., the one of the imx93) could be documented in a separate
document fsl,somethingsomething.

Seeing that interrupts, clocks, and resets are different, I would
recommend that you add a new fsl,... document.

What do you think?

Best regards,
Michael


> 
> Best regards,
> Michael
> 
> 
>> ---
>>  .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 47 +++++++++++++++++++++-
>>  1 file changed, 45 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
>> index 2c2bd87582eb8bfdd13720edd62a5f00dda958ba..4ac4a3b6f406408b9524c795e6cdeb117d3353da 100644
>> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
>> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
>> @@ -17,6 +17,7 @@ description:
>>  properties:
>>    compatible:
>>      enum:
>> +      - fsl,imx93-mipi-csi2
>>        - rockchip,rk3568-mipi-csi2
>>  
>>    reg:
>> @@ -26,14 +27,23 @@ properties:
>>      items:
>>        - description: Interrupt that signals changes in CSI2HOST_ERR1.
>>        - description: Interrupt that signals changes in CSI2HOST_ERR2.
>> +    minItems: 1
>>  
>>    interrupt-names:
>>      items:
>>        - const: err1
>>        - const: err2
>> +    minItems: 1
>>  
>>    clocks:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: per
>> +      - const: pixel
>> +    minItems: 1
>>  
>>    phys:
>>      maxItems: 1
>> @@ -88,10 +98,43 @@ required:
>>    - phys
>>    - ports
>>    - power-domains
>> -  - resets
>>  
>>  additionalProperties: false
>>  
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: rockchip,rk3568-mipi-csi2
>> +    then:
>> +      properties:
>> +        interrupts:
>> +          minItems: 2
>> +        interrupt-names:
>> +          minItems: 2
>> +        clocks:
>> +          maxItems: 1
>> +        clock-names:
>> +          maxItems: 1
>> +      required:
>> +        - resets
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: fsl,imx93-mipi-csi2
>> +    then:
>> +      properties:
>> +        interrupts:
>> +          maxItems: 1
>> +        interrupt-names: false
>> +        clocks:
>> +          minItems: 2
>> +        clock-names:
>> +          minItems: 2
>> +
>>  examples:
>>    - |
>>      #include <dt-bindings/clock/rk3568-cru.h>
>>
> 


