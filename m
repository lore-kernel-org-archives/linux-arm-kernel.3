Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B32C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 07:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgZ0tWkgjiEUeT5VerSLaz3Hth8Pz9PPnVSIhaTxQI8=; b=dTlJKNyqKmrirx4wmJsW/daDp2
	qU90hzbfw5I4LYB9uGUvJREOqIMqECKAXE37pGtck1jIJoWMPyPm1z5U8d7IYUK4hkSZ27RpTfFXB
	T95KJyAAcni+KQpWn4/sNvBDAygRcggRdS26a6Y7N04w7VFNBpnBxvmGqI+SQhQO8ylC3y/zOQXD9
	tLslqBVYF9pOpjawD2WV3Gc6MTPDB5/wJlrEITz5b34TJWDkNryrH8Bw3RKUPzEUNXJyPbxQqGFri
	vtoPLrb5Ahw8ILwICAb9pVl5AKZ4KnvQKhUx5et/TJDf1SKCx9b5PVVtmR4eQa2jV+h0IJIaJyPbi
	Um7NorSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4CqS-0000000Azz7-3vBd;
	Wed, 09 Sep 2026 07:35:48 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4CpZ-0000000Azw2-3hEn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 07:35:48 +0000
Message-ID: <76d1c5c8-f051-4365-b113-e18be5aaa9a0@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1788939287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RgZ0tWkgjiEUeT5VerSLaz3Hth8Pz9PPnVSIhaTxQI8=;
	b=cHFRKjScczQSvT5fk2vci/k6J/UV5FTWYurvqzFFWVUn1fA2Kh5oWSI+1YO961ZY1/IpSr
	ejRHJtV2AjhqFNRjv/Lni2aKJYWsvSIxKs8f2pplBh2bm7cHSUzzkoOkBcZ/Yi8ScqrgDH
	zcWIzhxf9XQ0eOliYI5xsUMfBiN7f8Q=
Date: Wed, 9 Sep 2026 09:34:43 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 4/6] dt-bindings: interrupt-controller: apple,aic2: Add
 apple,t8140 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, Nick Chan <towinchenmi@gmail.com>
Cc: Yureka Lilian <yureka@cyberchaos.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20260904-apple-a18-pro-initial-devicetrees-v1-0-0c25401d165d@cyberchaos.dev>
 <20260904-apple-a18-pro-initial-devicetrees-v1-4-0c25401d165d@cyberchaos.dev>
 <4e65ef39-cf1b-49d4-a899-da36acb442c2@gmail.com>
 <20260909-advanced-marble-lorikeet-eebeef@quoll>
 <76ad4ffe-82b8-42ec-abbe-a8c35ed8705f@kernel.org>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <76ad4ffe-82b8-42ec-abbe-a8c35ed8705f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_003454_159880_E0E14780 
X-CRM114-Status: GOOD (  13.56  )
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


On 9/9/26 09:32, Krzysztof Kozlowski wrote:
> On 09/09/2026 09:31, Krzysztof Kozlowski wrote:
>> On Sat, Sep 05, 2026 at 04:25:36PM +0800, Nick Chan wrote:
>>> Yureka Lilian 於 2026/9/5 凌晨3:49 寫道:
>>>> The Apple t8140 (A18 Pro) SoC uses an AIC3 as interrupt controller, same as
>>>> the M1-M4 SoCs.
>>>>
>>>> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
>>>> ---
>>>>   Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
>>>> index 1cb886785173..e3cadc5ad39d 100644
>>>> --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
>>>> +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
>>>> @@ -46,6 +46,7 @@ properties:
>>>>                 - apple,t6030-aic3
>>>>                 - apple,t6031-aic3
>>>>                 - apple,t8132-aic3
>>>> +              - apple,t8140-aic3
>>> the title should be "... Add t8140 compatible" describing the hardware corresponding
>>> to the added compatible since the compatible being added is not "apple,t8140".
>> Commit msg is correct, it does exactly what you wrote, no?
>>
>>> (Alternatively, if you mention the compatible in title, say "...Add apple,t8140-aic3" as
>>> "compatible" is already implied)
>> That would be repeating diff, so not really helpful.
>
> Ah, you meant the subject of the patch...
>
>
> Best regards,
> Krzysztof


That's how I parsed it too. Removed the "apple," from the subject, so 
it's just "dt-bindings: interrupt-controller: apple,aic2: Add t8140 
compatible".


- Yureka


