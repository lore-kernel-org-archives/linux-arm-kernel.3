Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BC4D6ACE2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 10:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAfqh3tryZsL7bk4EO/IchLBlHkI/yv2iAw4kjviLco=; b=xpJePwwsF4E/bnh2F+gew2ij8z
	MChHWYxaTnGkgBZuLFQTFVrVHujXRMM1BhaaY29VWc1IGE+gq0aqTZzxPk8rgOJbq6difa6TlJDaz
	IbKeO1fx36cppOaO5LZBb1QZ7G6ArEetKkIk9rHbeTT0dsxNkQGymKYzxEbp/DxiAIp0IO214Kt9/
	rYWsTyVAWMrIowAN5oHm7NCYYNsFsYM3kRSlhxlpdZNB5z+xGuOqJ5Jvy9vBoHvPsp2ClPlHW1VKz
	q1jNZUJpRKNHqk1QcWHwp83yNAGDMt3j63QzQMV5mnMEThA/XpqUjIVyC2sSjwIlobd1BTNgxBZbn
	2ir5F0/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBRx-00000008FQt-3cc2;
	Thu, 18 Dec 2025 10:41:37 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBRv-00000008FPq-0jvT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 10:41:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9DD381A22C5;
	Thu, 18 Dec 2025 10:41:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70034606B6;
	Thu, 18 Dec 2025 10:41:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CEC92102F0B4B;
	Thu, 18 Dec 2025 11:41:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766054488; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xAfqh3tryZsL7bk4EO/IchLBlHkI/yv2iAw4kjviLco=;
	b=YUCSxJdQfdTcB0M4Q9Hv6tJl6AQ1ImSO1TotM5jebpSsyOmRI2hKSuoTBpv+XERXFCat9P
	n1ZC4D6kAiDsuwP+sSU4iL0N/PBYQ2W74Hcjw8C5wHYazjxsz431nDHeqWKpiLyv6JfoDp
	uTy8LbrFnw+KMg0mWXzaZ8p4DF4dTcm5PAAFTNM+6aVQaIjgkPROu1N18Au7yqiwBX9GxY
	TSe+HFDYkx+U5WuFvUisV+ob2uM0tds5w50w6SvmmJo5uKu/Iyu9JXIAb7binHgpYhC8CG
	SkPc2TIJlSRohX2eDt9Mv7Zno5ODadXcXCNQl8rCd4YAVvG/E2qfoG4bARvung==
Message-ID: <2a0f82e9-0a8b-45ec-9d8f-d4842ce120ad@bootlin.com>
Date: Thu, 18 Dec 2025 11:41:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: pwm: allwinner: add h616 pwm
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251217082504.80226-1-richard.genoud@bootlin.com>
 <20251217082504.80226-2-richard.genoud@bootlin.com>
 <52ac76fc-4362-4b5a-ae28-29b874f78399@kernel.org>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <52ac76fc-4362-4b5a-ae28-29b874f78399@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_024135_342659_77D6B90C 
X-CRM114-Status: GOOD (  10.13  )
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

Le 18/12/2025 à 11:15, Krzysztof Kozlowski a écrit :
> On 17/12/2025 09:25, Richard Genoud wrote:
>> Allwinner H616 PWM block is quite different from the A10 or H6, but at
>> the end, it uses the same clocks as the H6; so the sun4i pwm binding can
>> be used.
>> It has 6 channels than can generate PWM waveforms or clocks if bypass is
>> enabled.
>>
>> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Hm? Where did I suggest anything about adding clock cells or documenting
> this allwinner device?
Hum, indeed.
The suggestion, as I understood it, was to re-use the sun4i PWM binding, 
which is why this patch exists now. But I agree, the suggestion wasn't 
on the content itself.
Sorry if it's misleading.

> 
> 
> Best regards,
> Krzysztof

Regards,
Richard

