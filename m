Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19A1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 20:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AA21xBD9Q5Qe5hVx+FxIwd0X/SmbnFEGy+/VQWU77zE=; b=tnlOsY9in0D84+utlpQ900neB1
	jr+XM83dOBhE1++Fw33oT0aTdu/F5E8u0jfalicVYo/A5ZOnlnMYgWkSZZSRUUDmZaI1GcAQtKCJl
	1RZUbi2gUZ9WdskgD4Rh4QmmkiLzIjxG6xDHRnMaYDxAIt5mErLPxRKwERMbCUJjd+bKGlGS4rUMT
	0oBkXcIfWgr3Q9j8eHELJ1rXdJF9V7f3rcFkjRmXdc5Xwk04iYBYEB5QSVEHhKxIdPtzMPo3lcUJh
	DtNOY0++JDo+8unqUch7ZEChSoRWxpwQRejBZ/a8SFV3pUoMnsbLLwo3Muj0aJZH32rnqTFedGCbo
	ybdKV/tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjjZB-0000000DD8x-3b9m;
	Tue, 14 Jul 2026 20:17:21 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjjZ9-0000000DD8E-2WRL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 20:17:21 +0000
Message-ID: <aa4836dd-2550-40cb-b0ee-c5df1ad54ece@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1784060236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AA21xBD9Q5Qe5hVx+FxIwd0X/SmbnFEGy+/VQWU77zE=;
	b=tjN/8m7LbLXhnzZ2y4b1CDHAMtDhQ108OPUAmno49iH2axmfZYlweKYwcgWu7M0Sv/H8rF
	Fh4aGmxaUT5TJIjqUR8piJQmCuLnwhWAC3EDXHdGpecHs+j/ZHwu8xYHKrk/kQGBHxT7t6
	YB7rzvEsnVADMFnxr+P2upd8RgsgnQo=
Date: Tue, 14 Jul 2026 22:17:10 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 09/10] dt-bindings: arm: apple: Add M4 based devices
To: Sven Peter <sven@kernel.org>, Yureka Lilian <yureka@cyberchaos.dev>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Thomas Gleixner <tglx@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Hector Martin <marcan@marcan.st>,
 Linus Walleij <linusw@kernel.org>, Mark Kettenis <kettenis@openbsd.org>,
 Andi Shyti <andi.shyti@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20260705-apple-m4-initial-devicetrees-v1-0-e5655ee56523@cyberchaos.dev>
 <20260705-apple-m4-initial-devicetrees-v1-9-e5655ee56523@cyberchaos.dev>
 <cd9da9aa-6e91-4534-a86c-a4421aafbd38@kernel.org>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <cd9da9aa-6e91-4534-a86c-a4421aafbd38@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_131719_874624_F7861A38 
X-CRM114-Status: GOOD (  14.47  )
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

On 7/14/26 21:50, Sven Peter wrote:
>
>
> On 7/5/26 15:17, Yureka Lilian wrote:
>> The Apple devices with the t8132 SoC (M4) are very similar to their M3
>> predecessors.
>>
>> In addition to the MacBook Pro and the various MacBook Air and iMac
>> variants, a Mac mini is offered again with the M4.
>>
>> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
>> ---
>>   Documentation/devicetree/bindings/arm/apple.yaml | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/apple.yaml 
>> b/Documentation/devicetree/bindings/arm/apple.yaml
>> index e49403c73f9d..3262292252d2 100644
>> --- a/Documentation/devicetree/bindings/arm/apple.yaml
>> +++ b/Documentation/devicetree/bindings/arm/apple.yaml
>> @@ -315,6 +315,18 @@ properties:
>>             - const: apple,t8122
>>             - const: apple,arm-platform
>
> Please also add M4 to the top of the binding in the description.
Ack
>>   +      - description: Apple M4 SoC based platforms
>> +        items:
>> +          - enum:
>> +              - apple,j604  # MacBook Pro (14-inch, M4, 2024)
>> +              - apple,j623  # iMac (24-inch, 2x USB-C, M4, 2024)
>> +              - apple,j624  # iMac (24-inch, 4x USB-C, M4, 2024)
>> +              - apple,j713  # MacBook Air (13-inch, M3, 2025)
>> +              - apple,j715  # MacBook Air (15-inch, M3, 2025)
> Copy/paste errors: these two should be M4 as well and I think the ones 
> at the top should be 2025 instead of 2024, shouldn't they?
I have the M3->M4 typo fixes queued locally. Only the MacBook Air was 
released in 2025, the others in 2024 (according to Wikipedia at least).
>
>
> Best,
>
> Sven


My intention is to rebase and send out v2 with the fixes I've 
accumulated locally once the M3 Pro/Max device trees have been merged 
into apple-soc.



Thanks,

— Yureka


