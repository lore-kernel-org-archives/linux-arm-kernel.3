Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA25CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VvSwoxSiatVvxEWU9UXOMyAINfanvVCSTpfBdY/SsOE=; b=l2D0ITWbulTkRMCQK+mwpyzKiL
	fog6+rBZmEqeqSF66irqXp8ctUNJ3/3098LVL4IsYP60wysAUsdCenVrPySirO5+5AAiHi40HZYNB
	9N5MyYqPjynQQ22zhyuw1XitIDeB7njXfxMSiVpLXS9orw6MT0L9HMpl9qN7c9WGzGWI3E00ld4oJ
	/0s3JM/IGgA0qVbiYzjlNjAfqOQPFtSMuVDYnmoVxoCD3O+mC7YtVZmLU+j0ys+YE24Rhrp+Ou+5G
	GENNZgLllI9dj556pjFg93M2rSRa01HbsBziFrnR5MydcayaYyX/3PXg04Kkom6KMKYydY/lGtgn4
	AHO8xmHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9m9-00000002mor-10Kr;
	Wed, 13 May 2026 13:37:25 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9m5-00000002mmX-0DZU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:37:23 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gFvdk4Ngdz9vfd;
	Wed, 13 May 2026 15:37:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778679434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VvSwoxSiatVvxEWU9UXOMyAINfanvVCSTpfBdY/SsOE=;
	b=gtigegsRzs/PH4410a+01bUv2j2KyUKcwfaWpppuhLu8m2I1YU6obCyivI5oHmQ8FNhKaL
	m3BVDkT61G0Vc7uCDQDg0aJy+YBZaWKAS9a7QH47YSWoSGQqLkPQq/rQISbz+6ZKnND1wG
	rjloA982IY9Bh+5iWCDDt7SlIVVhmJjgcn3l6z/aOYiwH3gyCCzr0gsb9iyvjMlpvY/TT7
	d/NsBbk1oA9BAX6bN9oUxLurQk1s41uLejxMbzJ/KjHhOCtQpvr1lRJNlvayNHPOWG1Ozx
	X55HErnWj2APUmPCcSW42iBSmhFzQt8tWNJ+LilyZpsZRoo7m8bewF818ApU1g==
Message-ID: <c4e6e48d-9a8f-48f0-8666-22efebf86d8a@mailbox.org>
Date: Wed, 13 May 2026 15:37:10 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] clk: renesas: r8a73a4: Implement ZT/ZTR trace clock
 on R-Mobile APE6
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
 <20260502185557.93061-3-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUXjwyVk2kuGAJOdPHw=qv_iwO2pSR3Rp+5ayoP2QG25w@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUXjwyVk2kuGAJOdPHw=qv_iwO2pSR3Rp+5ayoP2QG25w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: gnir56bo4zqqypyqe9fzb64orawq84oz
X-MBO-RS-ID: c62258f6f52ae9b4f90
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_063721_389008_EB43B539 
X-CRM114-Status: GOOD (  14.65  )
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

On 5/13/26 3:15 PM, Geert Uytterhoeven wrote:

Hello Geert,

> On Sat, 2 May 2026 at 20:56, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Implement ZT trace bus and ZTR trace clock on the R-Mobile APE6.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Thanks for your patch!
> 
> /sys/kernel/debug/clk/clk_summary looks a bit off to me:
> 
>      zt                         0       0        0        208000000
>      ztr                        0       0        0        277333334
> 
>> --- a/drivers/clk/renesas/clk-r8a73a4.c
>> +++ b/drivers/clk/renesas/clk-r8a73a4.c
>> @@ -43,6 +43,8 @@ static struct div4_clk div4_clks[] = {
>>          { "m1", CPG_FRQCRA,  4 },
>>          { "m2", CPG_FRQCRA,  0 },
>>          { "zx", CPG_FRQCRB, 12 },
>> +       { "ztr", CPG_FRQCRB, 16 },
> 
> 20?
> 
>> +       { "zt", CPG_FRQCRB, 12 },
> 
> 16? (12 is zx, cfr. above).
> 
> I.e. the same shifts as on R-Mobile A1.
> 
>>          { "zs", CPG_FRQCRB,  8 },
>>          { "hp", CPG_FRQCRB,  4 },
>>          { NULL, 0, 0 },
> 
> After fixing the shifts, I get:
> 
>      zt                         0       0        0        277333334
>      ztr                        0       0        0        277333334
> 
> which looks much better. If you agree, I can fix this while applying.

Yes please. I can confirm in APE6 RM v0.7 that the ZTFC is at bit offset 
16 and ZTRFC at bit offset 20 . Thank you for spotting this.

-- 
Best regards,
Marek Vasut

