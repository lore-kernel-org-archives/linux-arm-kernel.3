Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7412CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 11:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGz3IVSoM57QukalTGo0rAWooDoMXd9KPbrk9PNRqBs=; b=4LnFrmPpcJBQ2izvyvrAY/AlwA
	245U0ubER6UHTrMWjptFzDmuiBYWECutDn46kNRrQAP7d05XScaEmsBjTUA+LJ5JvCYY+4QBwYdrj
	CKNYOEiMDNeeItWPP3qK/7ikm2Oi2APcju9MvF41G2taWr8KWooRMfZbOYcrMCwvBIVggNF19AyF/
	c32hWFmrA2FLfm3zE8fY7cp28P4Oy+HJK7Xd4f1Mu5LCYM+7qO2LU8CXu6KiksEiKJvEUUJ6n28oS
	H9lzTcMGammrrSO8knoRcwiFdcZq/vHgmYMSxmizQQKHYhPXGO55zfTpooEbkQ24gwMEiPBipK9aS
	xHM1jCeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKbGV-0000000Eaj1-2V99;
	Sun, 16 Nov 2025 11:49:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKbGS-0000000EaiZ-3KyF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 11:49:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 19D5941A3C;
	Sun, 16 Nov 2025 11:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F3FC4CEF1;
	Sun, 16 Nov 2025 11:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763293792;
	bh=7SoHWV77IlawC1vgrQw6Zu4imRYOIq6YXQ8/H4h0aw8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FlJPB4P8dfjp31aXBa+9z9f2y6aVBr1j5aUz9ymo+09oi7Rb2nlsXSMUkyqgiT1Pt
	 dbSnKgnHxNM9V4C4YcTveo587p9SznfLVoutGSiMfWuFh55b8Zvm3f8lXfh1EBhueJ
	 PROlTLWwHZvned7L/noPjrsoJtZBP3xFrpg64+bcm9f7zGcLZmyX8ilfB26Ovp+ba6
	 /RFLdXyqmzsYI+KAMJ/qBGVy5MvsFMKHFJit/00+91W+t04Gga0AioRwCpp+SfzN9E
	 FihYUtknRgF8FoM6hA2sRVxCuka5SgGA0EElLfJTIhONTpfkrW80qU44o5IBXLzVqN
	 zvs3bGn61nwAg==
Message-ID: <f8979d59-0f71-438f-92ec-bf1077279dce@kernel.org>
Date: Sun, 16 Nov 2025 12:49:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] dt-bindings: display: allwinner: Add DE33 planes
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: wens@csie.org, samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-5-jernej.skrabec@gmail.com>
 <20251116-humongous-ant-from-betelgeuse-c0c416@kuoka>
 <4691137.LvFx2qVVIh@jernej-laptop>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <4691137.LvFx2qVVIh@jernej-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_034952_896264_A577E6C9 
X-CRM114-Status: GOOD (  13.83  )
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

On 16/11/2025 12:44, Jernej Škrabec wrote:
> Hi!
> 
> Dne nedelja, 16. november 2025 ob 12:29:27 Srednjeevropski standardni čas je Krzysztof Kozlowski napisal(a):
>> On Sat, Nov 15, 2025 at 03:13:44PM +0100, Jernej Skrabec wrote:
>>> Allwinner Display Engine 3.3 contains planes, which are shared resources
>>> between all mixers present in SoC. They can be assigned to specific
>>> mixer by using registers which reside in display clocks MMIO.
>>>
>>> Add a binding for them.
>>>
>>> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>>> ---
>>>  .../allwinner,sun50i-h616-de33-planes.yaml    | 44 +++++++++++++++++++
>>>  1 file changed, 44 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
>>> new file mode 100644
>>> index 000000000000..801e5068a6b5
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
>>> @@ -0,0 +1,44 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de33-planes.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Allwinner H616 Display Engine 3.3 planes
>>> +
>>> +maintainers:
>>> +  - Jernej Skrabec <jernej.skrabec@gmail.com>
>>> +
>>> +description: |
>>
>> Do not need '|' unless you need to preserve formatting.
>>
>>> +  Display Engine 3.3 planes are independent of mixers, contrary to
>>> +  previous generations of Display Engine. Planes can be assigned to
>>> +  mixers independently and even dynamically during runtime.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - allwinner,sun50i-h616-de33-planes
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  allwinner,plane-mapping:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: Phandle of Display Engine clock node
>>
>> You description is almost duplicating property name. You need to explain
>> here how this device uses them.
> 
> So I guess I can copy commit description here? It is needed to
> access registers from different core, so it can assign (map)
> planes between mixers at runtime.


"to assign (map) planes between mixers." is enough.

But it looks unfortunately like a spaghetti.

Your mixer binding references via phandle this planes. These planes
reference via phandle some other region to configure planes between mixers.

Isn't this the job of this device?


Best regards,
Krzysztof

