Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F43E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MmHKOegUCAzoPx5EkMu41F32NHwcGnKPOxcKrUxVd5c=; b=5GjJdg9xbXz9CpTMDPhm7KRBv2
	z6uWTPA6Lf/Z15VOEkjLf6GNYppWssCeB3IO3pzXisx0MjRZj2XCDQ1t26txFQ906xQjB1a9R61wc
	dOJaiRKBpu9a2EglPhTfLaXthH+0nLLf2+mrD6nivphUOnBN5SwwaV/rYRDCfZh9U+1hqra2Fn/p/
	YdzypMWo0b2lGgFyVKQrxza81e792rSdawk8ml1XRj6v94jxiROTU9egzjhSNl9Sv/vZ1q+pE0uUf
	eQ3BVotvdQN+00LkvcO89sqC71IvqgWM3m4LLhkuAjJpY6X62qqKEszwIr2DHGBCfsPlGKgVlXmoR
	9pmotiDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ81i-0000000FLBB-3Nw0;
	Thu, 05 Dec 2024 09:20:02 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ80M-0000000FKt6-32qe;
	Thu, 05 Dec 2024 09:18:40 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 1E598616B6;
	Thu,  5 Dec 2024 09:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733390315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MmHKOegUCAzoPx5EkMu41F32NHwcGnKPOxcKrUxVd5c=;
	b=ktA/SVxy29czMtiMwoNkO0otnKMqpmC2qOUufS7HEFUT1mYbgADtOkMSt72qLdvCi+POZX
	OB/5NETolms6U2ObIGquvlnOH6bkGwM62Igmr539l8N7geOb1SNS9nZvi9cses7AfFP2Ml
	/CJAZbhdHzk3IHeLTdH5g35lQ++m+kU=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 545051002C7;
	Thu,  5 Dec 2024 09:18:34 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 05 Dec 2024 10:18:34 +0100
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: frank-w@public-files.de, Linus Walleij <linus.walleij@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean
 Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 3/5] dt-bindings: pinctrl: add binding for MT7988 SoC
In-Reply-To: <6ebd58fd-8461-476c-9266-a21455d5e819@kernel.org>
References: <20241202110045.22084-1-linux@fw-web.de>
 <20241202110045.22084-4-linux@fw-web.de>
 <iwmnxlqpaijvr4kmzwk3elacqj5ukqlchfs67ca6c6gxrycpbb@pc6a6scqkdi5>
 <1DBA844B-4DB2-4AA2-BF04-B3CC39B3C3F8@public-files.de>
 <6ebd58fd-8461-476c-9266-a21455d5e819@kernel.org>
Message-ID: <6926509bd56cbb32125a978c939b28ab@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: ac2b3ffa-74bd-41dc-bc2b-b3b7e5131251
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_011838_931135_C688AECE 
X-CRM114-Status: GOOD (  19.26  )
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

Am 2024-12-05 08:35, schrieb Krzysztof Kozlowski:
> On 04/12/2024 08:41, Frank Wunderlich wrote:
>> Am 4. Dezember 2024 08:35:37 MEZ schrieb Krzysztof Kozlowski 
>> <krzk@kernel.org>:
>>> On Mon, Dec 02, 2024 at 12:00:37PM +0100, Frank Wunderlich wrote:
>>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>> 
>>>> This adds bindings for MT7988 pinctrl driver.
>>>> 
>>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>>> ---
>>>> changes in v5 (so not adding RB from Rob given in v4):
>>>> - do not use MTK_DRIVE_8mA in example
>>>> - add _0 functions for pwm
>>>> 
>>> 
>>> <form letter>
>>> This is a friendly reminder during the review process.
>>> 
>>> It looks like you received a tag and forgot to add it.
>>> 
>>> If you do not know the process, here is a short explanation: Please 
>>> add
>>> Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
>>> or above your Signed-off-by tag. Tag is "received", when provided
>>> in a message replied to you on the mailing list. Tools like b4 can 
>>> help
>>> here. However, there's no need to repost patches *only* to add the 
>>> tags.
>>> The upstream maintainer will do that for tags received on the version
>>> they apply.
>>> 
>>> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
>>> 
>>> If a tag was not added on purpose, please state why and what changed.
>>> </form letter>
>> 
>> Is this an automatic message? I guess yes...
>> 
>> I have not added it (robs reviewed-by) from v4 due to changes and 
>> explained why in changelog. If i'm wrong please let me know.
> 
> Where did you explain the reason of dropping review tag? This has to be
> *EXPLICIT* but I only see:
> 
> - rebased to 6.13-rc1
> - moved dt nodes with mutliple options to BPI-R4 board
> - changes suggested by angelo in v4
> - changed example in binding and dt node to not using const 
> MTK_DRIVE_8mA
> 
> 
> Nothing here suggests even remotely that review tag was dropped. 
> Nothing
> suggests that it should be dropped!

here:
>>>> changes in v5 (so not adding RB from Rob given in v4):


> Best regards,
> Krzysztof

