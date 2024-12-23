Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EE3E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 15:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oO75zzClOedMIyyFqnWR3wbQVdx/KvUDQvjyRdguY58=; b=rcSkObZnElRrH561GFmAFu8Wd+
	UO2NcjuUmY0ff1SDE8WIuAM4NzuCKUkmqutN+mKBCrr5IJXRsM1cNq/HCptrX/pPR6f+GLucrBgxl
	b+5sIihdZ+BoHnBPNwri3dHaJfZ9F9TcE9IHTDio50PSNyUEbcwVp4OkmOVuWnfLGKttv0LQdDaVg
	6hJkiuSVi2tFITpeZ7A+P7s02PpRrjJ160w7iiw9gXJEAFcx0EbLQCVWuMivDRV68quhn+hXqs7Vt
	Aj7h8wy6PRyFW+FrwhO2Zyht8q1eCO+LY5AfEppdX185VhDCau2CQqOnI9kSbyFlGly5ahzvtlGkv
	kVSnJIMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPkXj-0000000AJ59-24PJ;
	Mon, 23 Dec 2024 15:40:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPkWX-0000000AIw1-1fsM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 15:39:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3DF12A40FA1;
	Mon, 23 Dec 2024 15:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A46BC4CED3;
	Mon, 23 Dec 2024 15:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734968352;
	bh=0Taij8MIxZuV8S4fYto05hx2QPubdpKJ5+ANOqpbJEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NU0KU4v5ehZPFxeFFzUVVFoYEuoxA/XZ+Neiv5QSp59O00MxrFbSzThJDdiafdAGr
	 lzGrNtnUabYVSPhHLlsZkX5GAAdadYhyaevaAQyAFOI/D+MbIRm8EbHzZAg5MgAvCG
	 4XdinBxLTM1xxuhP/gmOdm5SGL1qEe5GtOwGGwgO7W2rQwtbjgaCcZKEWZRJ855Ff/
	 zNPCi7bTtIXnhnGrB9yBhsRtzjiiTA2EKy59o2ZcEU1RZLcag735u15EpkDjkgKaoO
	 gecr79rLtER0SaEFzbie6wpwMLrqee3/KrvtdZnEC0vceaNOye9pB5N2TWU4YLRJWv
	 aWb+nx0u+8+EQ==
Message-ID: <c2efb6c7-4a0b-4078-b0df-6e646eb88906@kernel.org>
Date: Mon, 23 Dec 2024 16:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: google: add gs101-raven and
 generic gs101-pixel
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
 <20241220-gs101-simplefb-v2-1-c10a8f9e490b@linaro.org>
 <d0c1511f-b052-4690-aefb-3fb41e1e5875@kernel.org>
 <cfdc5b1b03140e3d2ce3fb58e8b342dc2ac06d04.camel@linaro.org>
 <d960e22e-01ad-406d-9616-d45edbef0232@kernel.org>
 <9507951f9ce4ee9d8c553d8964f00ef217f8ed1d.camel@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <9507951f9ce4ee9d8c553d8964f00ef217f8ed1d.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_073913_569682_29FCE870 
X-CRM114-Status: GOOD (  28.81  )
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

On 23/12/2024 16:31, André Draszik wrote:
> On Mon, 2024-12-23 at 15:14 +0100, Krzysztof Kozlowski wrote:
>> On 23/12/2024 08:45, André Draszik wrote:
>>> Hi Krzysztof,
>>>
>>> On Sun, 2024-12-22 at 12:38 +0100, Krzysztof Kozlowski wrote:
>>>> On 20/12/2024 12:27, André Draszik wrote:
>>>>> Raven is Google's code name for Pixel 6 Pro. Since there are
>>>>> differences compared to Pixel 6 (Oriole), we need to add a separate
>>>>> compatible for it.
>>>>>
>>>>> We also want to support a generic DT, which can work on any type of
>>>>
>>>> There are no such generic DT devices upstream, so we cannot add bindings
>>>> for them.
>>>
>>> Do you have a better suggestion for the wording?
>>> How about 'gs101-based Pixel base board'?
>>
>> It's not exactly about the wording but the concept. We don't have
>> generic devices, thus no generic DT (DTS). Period. Thus you cannot have
>> such schema.
> 
> There is a Pixel base board, with different additions to it, e.g.
> different displays. The boot loader can pick the right one.
> 
> Let's discuss that in the other thread to have things in one place :-)
>>
> 
>>>>> gs101-based Pixel device, e.g. Pixel 6, or Pixel 6 Pro, or Pixel 6a (as
>>>>> a future addition). Such a DT will have certain nodes disabled / not
>>>>> added. To facilitate such a generic gs101-based Pixel device, also add
>>>>> a more generic gs101-pixel compatible. We can not just use the existing
>>>>> google,gs101 for that, as it refers to the SoC, not a board.
>>>>>
>>>>> Signed-off-by: André Draszik <andre.draszik@linaro.org>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/arm/google.yaml | 18 ++++++++++++++----
>>>>>  1 file changed, 14 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
>>>>> index e20b5c9b16bc..a8faf2256242 100644
>>>>> --- a/Documentation/devicetree/bindings/arm/google.yaml
>>>>> +++ b/Documentation/devicetree/bindings/arm/google.yaml
>>>>> @@ -34,11 +34,21 @@ properties:
>>>>>      const: '/'
>>>>>    compatible:
>>>>>      oneOf:
>>>>> -      - description: Google Pixel 6 / Oriole
>>>>> +      - description: Google GS101 Pixel devices, as generic Pixel, or Pixel 6
>>>>> +          (Oriole), or 6 Pro (Raven)
>>>>> +        minItems: 2
>>>>> +        maxItems: 3
>>>>>          items:
>>>>> -          - enum:
>>>>> -              - google,gs101-oriole
>>>>> -          - const: google,gs101
>>>>> +          enum:
>>>>> +            - google,gs101-oriole
>>>>> +            - google,gs101-raven
>>>>> +            - google,gs101-pixel
>>>>> +            - google,gs101
>>>>
>>>> SoC cannot be a board in the same time.
>>>
>>> Can you please expand? google,gs101 is the SoC, the other ones are boards.
>>> Is the commit message unclear?
>>
>> You now say that these are valid boards:
>>
>> compatible = "google,gs101", "google,gs101";
> 
> Sorry, I don't see how (apart from the fact that dtbs_check flags
> non-unique elements anyway). The result of the patch is:
> 
>         minItems: 2
>         maxItems: 3
>         items:
>           enum:
>             - google,gs101-oriole
>             - google,gs101-raven
>             - google,gs101-pixel
>             - google,gs101

The problem is this line. Although entire concept of flexible list is
neither need nor ever recommended.

>         allOf:
>           - contains:
>               const: google,gs101-pixel
>           - contains:
>               const: google,gs101
> 
> So one can not have 'google,gs101' twice. And if I only add

Still can be, but indeed not with my example but:

"google,gs101", "google,gs101", "google,gs101-pixel";

>     compatible = "google,gs101", "google,gs101";
> to the .dts, then dtbs_check complains indeed.
> 
>> (although compatibles
>>
>> compatible = "google,gs101", "google,gs101-pixel";
> 
> OK, the schema doesn't flag incorrect ordering indeed.
> 
>> Both are wrong. SoC should not be before the board and SoC cannot be
>> used alone. Your schema allows that and that's not good.
>>
>> I did not get what you want to achieve here, so tricky to advice.
> 
> The intention is to enforce either of the following three:
> 
>     compatible = "google,gs101-raven", "google,gs101-pixel", "google,gs101";
>     compatible = "google,gs101-oriole", "google,gs101-pixel", "google,gs101";

These two are standard - list of three: enum + const + const

>     compatible = "google,gs101-pixel", "google,gs101";

And that's a separate entry.

> 
> I think this works (but I was aiming for something shorter,
> possibly involving minItems):
> 
>   compatible:
>     oneOf:
>       - description: Google GS101 Pixel base board

What is a base board in terms of phone? This can be only final product,
you cannot use/have a baseboard. This is not an evalkit.

>         items:
>           - const: google,gs101-pixel
>           - const: google,gs101



Best regards,
Krzysztof

