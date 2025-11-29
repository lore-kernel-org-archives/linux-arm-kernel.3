Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3362D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 20:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+SALvQ1WKQOKgbvkBCd0ESc4r0VDqVsLEMufbJYstbA=; b=CTO/03GxUMjDiyW0BtZXjoBTD4
	0wpgKy8gqNmhnWMnmqd6ACQ2B4BtSzUnF2w3yVVExwXhkOND3sXZ3MzHhRT/t/Gk79SNNGGXpcYDa
	oGTxbi0L1CDjnkvlV+70MXp2wF4mtmyIhRiRNQ5aYZJvLvf0GL+ciQS5Az5+h5eChRXsY0qDFX1+K
	AyczY2hgRWSbP5MtkTh/uYiPwBuA81fph8xNo9FQeKUt0UvAMD75OGL9QuIyrqwg4OMuqJ6olCazU
	VgSlHfJdWHToRAGqslGaev6nUH22gAVpVtfR4nNjzrGEEkzlQIeG8TNyTkIVu7y0lXcDRqWpEGdBo
	NzaB8qKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPRcR-00000001mrO-1z2u;
	Sat, 29 Nov 2025 20:32:35 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPRcN-00000001mqt-2oh3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 20:32:34 +0000
DKIM-Signature: a=rsa-sha256; bh=+SALvQ1WKQOKgbvkBCd0ESc4r0VDqVsLEMufbJYstbA=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1764448341; v=1; x=1764880341;
 b=BFQ4nHE/cRtmTK4QTadzvMvUYDcy1sN9LBYXR7rMfNn9g0Ck1y0jTP1nGtacQiJ0LjR2j1zQ
 OmPYKsRjlUlz2L5yHCuWXGyljP2DISwTJgc8a+H7nvZ4MP6PGeebRLHcTzWnU/5gu5oj1VymaI3
 vpV126SghH1z3Ot6k6tt4GRYEergXPH+vAohULkckXwmpBFIODqCyLR9J0+7xNK0J4TzRflLenT
 kFl7Jz1FxWAG1ySAeFshMQPCRmQ3aOpZVdJxsUlm/OhhnV1Wail6bcNpW1QF7ocKCppkWUa1SoD
 SeXyM3JI6iGpaINSgQ+Ly8Ao0gz90+shfT1NSBZexAXrA==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 045234a5; Sat, 29 Nov 2025 21:32:21 +0100
Message-ID: <4b22283d-3553-4e7f-9a50-a5b6e6d20155@dujemihanovic.xyz>
Date: Sat, 29 Nov 2025 21:32:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pmdomain: add audio power island for Marvell PXA1908
 SoC
To: Karel Balej <balejk@matfyz.cz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251127190237.745-1-balejk@matfyz.cz>
 <20251127190237.745-2-balejk@matfyz.cz>
 <51c9408e-45e7-4ce7-9e95-6e0a45bcc8fa@dujemihanovic.xyz>
 <DELFWFLO1M8G.1AMPX0VKEOJND@matfyz.cz>
Content-Language: en-US
From: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
In-Reply-To: <DELFWFLO1M8G.1AMPX0VKEOJND@matfyz.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_123232_745641_5A70C283 
X-CRM114-Status: GOOD (  15.44  )
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

On 11/29/25 20:53, Karel Balej wrote:
> Duje Mihanović, 2025-11-28T22:30:55+01:00:
>>> -#define NR_DOMAINS	5
>>> +#define APMU_AUD_CLK		0x80
>>> +#define AUDIO_ULCX_ENABLE	0x0d
>>
>> I would group these with the other register definitions.
>>
>> Also, it's probably better to be more consistent with the naming, so I'd
>> prefer APMU_AUDIO_CLK.
> 
> So would I, but this is how the downstream code calls it so my idea was
> that it possibly matches the datasheet and it would seem preferable to
> me to match that even though we don't have it available.

AUDIO is indeed nicer, and IMO it doesn't matter if the names are 
perfectly matched with downstream. Matching with the datasheet would be 
a stronger argument, but it indeed isn't available so the whole point is 
moot.

> I could then do the reverse of what you say and call the other
> definition AUD_ULCX_ENABLE but AUDIO seems nicer to me too and this one
> is not defined in the downstream code.
> 
> What do you think?

I'd still prefer AUDIO, but don't care about it that much, so up to you.

Regards,
--
Duje

