Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0289D58D5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 15:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEVCA8Ix6s/DdhGgW/3oFSALAwo5Hm6QybQxy/FlbSw=; b=RwN14wHHTLkXqt+i5FdQjso8W8
	I/fiI5BC+T610ofcIBPJvw5PNXs2+t4t6RPgPhbVPWfM2ko2osRquaFGfQzjxBZmzFI9mv45c1PvQ
	rtBcbkxfloBewm/yydK4BaXlCduGqfwzacqDX0SpfTCeu5nYlr3D37ABUaMElKVNsM6nGQ0bJJOL6
	St8+ROJ0ImFysovkOO5qKeLOhAQ/ZBGSzSbZY2M5ldJOPopVQa3dIvEvLou0ErFsG2I8AMPMgiLVg
	nmFcy/ggn4BhSPm3E83TkehXxySqQjzHwYysdk5lqdwJ5M525j4lScxUxaTRpfEBdQX/JkWqs5DsJ
	UYpFg16w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFb5M-00000008VM7-24FK;
	Mon, 25 Nov 2024 15:33:12 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFb1n-00000008UGf-3ozK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 15:29:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 498E641A48;
	Mon, 25 Nov 2024 15:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1732548567; bh=mvds+Ny0lTliJWUMz64CS0VuR5pei/dhaTjax1anOBc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dJ+nWxZGjxwcoLlWhkuPEQg/dDouRwFC78lnhdBZQnWhTG0+DEb29pZuEkPVatXAO
	 B17tvlgEtOkPmf7FMEDBpGaDTCmu8s8Jba3RhjHX8UpaJint1QbDKH8Oj02dGK4Ke/
	 7FsioU8y5MGI/h7P5eYFGL8GHYy+n1vQq42CEKb0GClQBN1i8EzbDlqOQO6Hw4A9qr
	 cDKGp00yGAhdHLJtpZ9cRs8o1xIAJsmqxSxzHdluE2hLonH7xksXilHLQwK6u//oqV
	 86s9/TdAUe09WziXe9mmDqPLYZ49vffCGw8Leo9QCCcgAlaBDLc6n/ct1MdXJ1uLyo
	 DwYijr47s0TAQ==
Message-ID: <7fee8838-a365-4f33-a40f-26abab17d605@marcan.st>
Date: Tue, 26 Nov 2024 00:29:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindgins: display: Add Apple pre-DCP display
 controller bindings
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-1-3191d8e6e49a@gmail.com>
 <ksdp54qj55v7igvvcshl6y2cxpmqy7rlsh4xsixpptjn7s7wlu@76ejtq6ytvbp>
 <a9d1568e-6240-49a4-b6a0-dcc0d9229eb1@marcan.st>
 <0dc16c95-6849-41c8-86da-d1c0c74cb3e4@kernel.org>
From: Hector Martin <marcan@marcan.st>
Content-Language: en-US
In-Reply-To: <0dc16c95-6849-41c8-86da-d1c0c74cb3e4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_072932_267682_C439CC4D 
X-CRM114-Status: GOOD (  13.99  )
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



On 2024/11/25 23:53, Krzysztof Kozlowski wrote:
> On 25/11/2024 15:14, Hector Martin wrote:
>>>> +
>>>> +  "#address-cells":
>>>> +    const: 1
>>>> +
>>>> +  "#size-cells":
>>>> +    const: 0
>>>> +
>>>> +additionalProperties: true
>>>
>>> This cannot be true. Must be false.
>>>
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - interrupts
>>>
>>> This goes before additionalProperties.
>>>
>>> Missing example: that's a strong NAK and prove that this could not be
>>> even tested.
>>>
>>> Do you see any device schema without example? No. Do not develop things
>>> differently, Apple is not unique, special or exceptional.
>>
>> Krzysztof, it is entirely possible to express this same feedback without
>> being condescending and rude. I'm pretty sure you can do better than this.
> 
> Please kindly trim the replies from unnecessary context. It makes it
> much easier to find new content.

Noted.
 > Instead of patronizing, note that this was just pure observation - this
> was done entirely than other bindings, which should be taken as an
> example. Or example-schema should be taken as example... Pointing out
> issues and inconsistencies is not rude or condescending. Basically now
> you are condescending people's feedback which further restricts review
> process allowing comments which you approve.
> 

No, that was certainly not pure observation. The observation is that the
schema was inconsistent with other schemas, and was missing an example.
The way you *expressed* that observation was unnecessarily rude and
condescending, both in tone and message. Usage of "NAK" is strongly
confrontational and discouraging to newcomers, and completely
inappropriate here because the intent of the patch is clearly fine and
it just needs some style and procedural issues fixed. "Do you ...? No."
wording is condescending, like you're talking down to a child. The
gratuitous Apple reference is completely unnecessary, implying we're
attempting to be a special snowflake in any (non-technically-justified)
way, never mind that none of us works nor has any professional
relationship with Apple.

Your observation and feedback could have been conveyed much more
appropriately, kindly, and effectively, such as:

==
The schema is missing an example. Examples are required for schemas, as
they are part of how the schema is tested by the automated tooling.
Please see other schemas and `example-schema.yaml` for examples on how
to do this, and `writing-schema.rst` for more information and how to run
the checks.
==

- Hector


