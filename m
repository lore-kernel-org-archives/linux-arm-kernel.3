Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768FDCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yynEbxXKLUAVQAnHfu3RWqNgiNiS9M9W37sLEp4Bu9o=; b=d4ZlsXdLphe0QAKr13HjJGE1bd
	J4VJ4iOT+53lBBrCiwT9Je0+phB1X+QAfgzQ8oRfbsHlqJADpZRgkInPI47OQ17KMK6l9U0UpDURv
	DxBynIwNyjEaAMSomESmoadUBmuThBvvfShrr4icq1GXnwL3Zl4L+eh77BBsRjHNWT6U8oC+7HvAc
	qcGLpFpfZb0/cfqMUhope0N4wmGx72foM/OmKm4Tgz4fUKBLs5zIO8rtT3eR8cj8WUPhM9yOzNKMR
	xyrddmpWpFqW4JJph2uTJoCw8goQqp3DkDSpdjem4D+WDj06IKnnnDeafl6BQi2LNYWQ2qIAsw2FQ
	lAXeOS4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHZB-0000000BwMb-3QFm;
	Tue, 04 Nov 2025 13:59:21 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHZ9-0000000BwLt-0DQB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:59:20 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d196q2BCMz9v6w;
	Tue,  4 Nov 2025 14:59:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762264755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yynEbxXKLUAVQAnHfu3RWqNgiNiS9M9W37sLEp4Bu9o=;
	b=VKZjUXmdJh+KxN3MM9Ebsvt+7cDhjh0+IOrwOtdxrP6cNYxysBBux1bDw+/pHnA3aZtA4r
	gMRQPjaSiI3vm08y/q34UmIW1oVhcl5hFtSbWYI0i/6OmulEnKPsHGC2LZdGYZ55pWWzWT
	CXkI7T9gBzX1wv54B/T4yh3XoIFrxwjnYDfSbID9vaYpsU7RkGQJ+ObeIWvQRzTdeg14lj
	Ff+dTgKgyw1N/W+MfZDgR2OrTGNDi0ygwwyJcQoyzjKHqEf2r3aETUzcLUWxEswbHqNBBS
	FzdrW+pZEuAQs+aubnKaDzrMd0/ZiS5zIz+iYhOA2WVlq9jj5ce9wX6uKxYPGg==
Message-ID: <773b410d-26ad-4581-9de5-a2559891a3f7@mailbox.org>
Date: Tue, 4 Nov 2025 14:59:10 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE7800
 GPU in Renesas R-Car M3-N
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
 <10e39887-02b2-41bd-9ed1-f54481a3578c@imgtec.com>
 <1353f904-aa15-4e24-9e43-7b91185bba17@mailbox.org>
 <32d2db33-8477-45ea-ba41-5150ed750a59@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <32d2db33-8477-45ea-ba41-5150ed750a59@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: th9rrbeotgywfqmkigguauhk4jiu4488
X-MBO-RS-ID: 43d16fc3659e66fc9c0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_055919_235414_FB3967B3 
X-CRM114-Status: GOOD (  13.77  )
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

On 11/4/25 1:36 PM, Matt Coster wrote:

Hello Matt,

>>>> @@ -105,6 +109,7 @@ allOf:
>>>>            compatible:
>>>>              contains:
>>>>                enum:
>>>> +              - img,img-ge7800
>>>>                  - img,img-gx6250
>>>
>>> Can you put these in the same order they're declared above? The way I
>>> read it, the order is img,xxx in generational order followed by
>>> soc-specific entries in alphabetical order (which is why we have
>>> img,img-gx6250 before img,img-bxs-4-64 below).
>>
>> In this enum, the entries are (should be) sorted alphabetically .
>>
>> Do you want to sort them generationally instead ?
> 
> If we have it wrong and the correct way is that these should always be
> alphabetical, can you please fix up the existing enum below (with gx6250
> before bxs-4-64) to match the constraint too?
Fixed in V2, thanks !

