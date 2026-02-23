Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F62DEC1127
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 20:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhwnfEYf/jsdsSTXrHwV/vr9BHcVPIPlM0acVP9KYq4=; b=NJuR7XDt/6zZJMhZJer3m+0P50
	lSiFO73H9hTWCqS31zzT8ZnX+zQPCCXWGzNsdDeuuaJXV2PA26hpChDT2CSNeabFWFo3Mz87OavV/
	CcoYmsvFwXGex0OXa3zBV04FK/V1ox+Y5xXhxXJghXHxKdznoGLLeZ63uNBYQPqcqOQfurqFh46wN
	zZN8gjLF12yPq2l4WM5nTHcSPyr+t4/tSn8mp6+R8Bk7WuruW3b4vSStE7gH2OA7YawwG5+cWdtaS
	ms3Xus0p78e3zWeBBQHjLuZu7/RGOAUluwxrRNLoWhx5vun6MbRJcFcT0LMHpaGKTVSd8pI8YsL6x
	V2jnlysw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuc8Z-00000000yOp-3MEL;
	Mon, 23 Feb 2026 20:02:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuc8W-00000000yOQ-3Eq9;
	Mon, 23 Feb 2026 20:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771876950;
	bh=g5AaOwZ6430GnKveqeW2Yxjh239E7tqluKKLDlFqEyM=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=AnbE91aJ/Ot5On9xelhK2wPWwn6D9ZiG8NOs5dToMUwOqtFvNL0clajxOGHvpmvSZ
	 9ru2YSNil6K3oVuGfaf13MOtXIUPKMEgU3xooTLntyhBgjvCsqVJvAj7b1VcG/q9fm
	 DyjvbbHG1efuXQz+8Atdjz9ekqj9nt361iM/L52VlFe5o5OIRJPRz+4GfeLk9RBM6L
	 /0Vd/84QCR7dhhLVK8dyOgkm68t0ZKyD0h3lDu4u7JveFuUhHDgLIwkdBI7LPFpF4/
	 xdlIj6wHa+P2AlShoZaas/dePcsU4hI1EWkg9vKPMGYe9g2Nyb1IMY+8rFbIVzQbic
	 +/dkaHFeC4KYQ==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1CC2A17E05B5;
	Mon, 23 Feb 2026 21:02:30 +0100 (CET)
Message-ID: <c6078b0d-cd88-40a8-9cc7-2e7b135be980@collabora.com>
Date: Mon, 23 Feb 2026 22:02:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: Fix vdec register blocks order on
 RK3576
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
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
 <e0d7da4c-e779-43e9-bf0f-c2a0224114df@collabora.com>
Content-Language: en-US
In-Reply-To: <e0d7da4c-e779-43e9-bf0f-c2a0224114df@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_120232_962768_01606478 
X-CRM114-Status: GOOD (  12.41  )
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

On 2/23/26 8:29 PM, Cristian Ciocaltea wrote:
> Hi Sebastian,
> 
> On 2/23/26 8:21 PM, Sebastian Reichel wrote:
>> Hi,
>>
>> On Mon, Feb 23, 2026 at 07:07:42PM +0200, Cristian Ciocaltea wrote:
>>> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
>>> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
>>> @@ -34,10 +34,12 @@ properties:
>>>        - description: The cache configuration registers base
>>>
>>>    reg-names:
>>> -    items:
>>> +    oneOf:
>>>        - const: function
>>> -      - const: link
>>> -      - const: cache
>>> +      - items:
>>> +          - const: link
>>> +          - const: function
>>> +          - const: cache
>>>
>>>    interrupts:
>>>      maxItems: 1
>>>
>>
>> With that change the descriptions in the reg section are wrong.
> 
> Yeah, I assumed it'd be acceptable for the description to document just once all
> possible items, to avoid repeating this for all possible combinations.
> 
> E.g. this is from Documentation/devicetree/bindings/net/snps,dwmac.yaml:
> 
>   resets:
>     minItems: 1
>     items:
>       - description: GMAC stmmaceth reset
>       - description: AHB reset
> 
>   reset-names:
>     oneOf:
>       - items:
>           - enum: [stmmaceth, ahb]
>       - items:
>           - const: stmmaceth
>           - const: ahb

I dropped the descriptions in v2, as we discussed they don't provide much value
anyway:

https://lore.kernel.org/all/20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com/


