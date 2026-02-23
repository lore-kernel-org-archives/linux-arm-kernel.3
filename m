Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0443FEC111A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 18:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zgw/I4+jxyToKHouYVyvXCIXngBwgWxaNw5BiZhNKW0=; b=O2fSbNX0S7fDsjZx1Jme6dCBIw
	YggtAFHS55Ceci8f3qXdKLZxzUfX7BXwdrmDtWP8qdJZkDQIPigT456mr8+ngsv7YQuy44ZvuEVNA
	hru2AqnSu4dP3bHZ8fCwOJ8fPJeBNNGAQVIKpNxNR6NfNOFU2YOvO/ogFfJNl33OD9qOTCWytGaU1
	OdbcxPGHyIrWUbjC6lr2qpp9Y/2FAcJ8EhPWgX9L6KYWBDNlQMAfVQbrnajhTt0Xxrp+D1t9MHTu1
	NRWcXxDFRBGJHNMgrGFVVCiyI+1KtiJagumSS1Zaax7omMajKjoaaY1UGRSv9kFM3TMmy+2SQ/C4A
	o6cqgnig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuagT-00000000s3v-1z0M;
	Mon, 23 Feb 2026 18:29:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuagR-00000000s3T-0nUH;
	Mon, 23 Feb 2026 18:29:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771871364;
	bh=f8Y9T7jUIRJHt52mwSlo+OZGMV3OmtVt1CFMimMKfhk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D+ZEZns8k6dR0nXRDqaipPSO0rIkEfbGuUR4zYwNKoBDA2u71/+fwR0FcCn6cZBR0
	 G+NiNTIP+KZvtw+frCTb2F4TRxkJ7FYobhJalUWzUPrh/l7x3tlt2ZF9XlHK+glzAN
	 fsyBke84OLf5/KutIll9hq6Q89kpj/xenVBre5nnYx6QkeKKCTD0myMMP2fAxn11N3
	 +XhDfmf14+T84ZN2FRn1cB5cVFpygQyGRPKJMxx34y2+BOItmho/C/yzzgJMZ5n82W
	 7abWKLVv2LHgGKT8VXiD2GpPhWUkDwme217BFdcPd+OT6gVPeGMJLmcsK9TejLOqir
	 3r8fNnypcMfFw==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 48DE117E003F;
	Mon, 23 Feb 2026 19:29:24 +0100 (CET)
Message-ID: <e0d7da4c-e779-43e9-bf0f-c2a0224114df@collabora.com>
Date: Mon, 23 Feb 2026 20:29:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: Fix vdec register blocks order on
 RK3576
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Diederik de Haas <diederik@cknow-tech.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260223-vdec-reg-order-rk3576-v1-1-560976566bd3@collabora.com>
 <aZxkDGzEQCCLKR-M@venus> <DGMF3IX3J3BP.1XT41P0G8P5OD@cknow-tech.com>
 <b4eb3031-69e8-4a73-b4f1-91dd4192bb21@collabora.com> <aZyaLG0lYao6_xxb@venus>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <aZyaLG0lYao6_xxb@venus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_102927_411180_6170A85E 
X-CRM114-Status: GOOD (  10.48  )
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

Hi Sebastian,

On 2/23/26 8:21 PM, Sebastian Reichel wrote:
> Hi,
> 
> On Mon, Feb 23, 2026 at 07:07:42PM +0200, Cristian Ciocaltea wrote:
>> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
>> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
>> @@ -34,10 +34,12 @@ properties:
>>        - description: The cache configuration registers base
>>
>>    reg-names:
>> -    items:
>> +    oneOf:
>>        - const: function
>> -      - const: link
>> -      - const: cache
>> +      - items:
>> +          - const: link
>> +          - const: function
>> +          - const: cache
>>
>>    interrupts:
>>      maxItems: 1
>>
> 
> With that change the descriptions in the reg section are wrong.

Yeah, I assumed it'd be acceptable for the description to document just once all
possible items, to avoid repeating this for all possible combinations.

E.g. this is from Documentation/devicetree/bindings/net/snps,dwmac.yaml:

  resets:
    minItems: 1
    items:
      - description: GMAC stmmaceth reset
      - description: AHB reset

  reset-names:
    oneOf:
      - items:
          - enum: [stmmaceth, ahb]
      - items:
          - const: stmmaceth
          - const: ahb

Thanks,
Cristian


