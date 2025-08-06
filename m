Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2A0C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 15:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQO6ySpnmliEHDNrL7orpCcA+2eSbb2tYIf1yBgwkbs=; b=CXZtkmWnK3pVC0e39QhZSzmJJe
	PhiXzgyo5mEBm1RVhkAs+8ZPVuMoWy7hokLnjBwVNBtBymrq9mwOmSEvRD/lSwg184CSb0D9Hhj6f
	9CYT7+POzpWzg7Ei49Klq0erElZ/5h7U62VhXy0WIaOsyD7STw7xAdIHBBF6l2mjlyeaNKq24UCzR
	hkE0ZGVrC3V5WZ3rq4xcIszSInIOqzeO3sGGWMF/NK/5lgK7VBr4DI9+CewBYV8nDZCdn2qepGXrH
	vv/xbPzEUyclfbGms8B8m2lTPZB8aL/1fdTbD+VBnXa9qPdaeFI7hB3hMRaiWmO2JpCq9Yo1xLCx4
	Qp1rnu4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujg5S-0000000Fbxj-3Qzu;
	Wed, 06 Aug 2025 15:29:54 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfiU-0000000FXfE-0X5V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 15:06:11 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bxtsN6dXtz9tHh;
	Wed,  6 Aug 2025 17:06:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754492760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GQO6ySpnmliEHDNrL7orpCcA+2eSbb2tYIf1yBgwkbs=;
	b=aCcgdxbcq4FXFPqjUr2V78k98ujSvMq9KFrv8E854HxYoiGBQslUtmf0h36Sa957UhWP5Z
	6Kl7f5E7Pt81GS4nUyrbcVQbBTC0k9x4lM0wm4tob6AlnMsGKQt6P3MEZAipk5hKzmh7eM
	hLvZZYff3i5yJyBXa5gYQWpTv2GuUFWFIElnClzXPcOLO6wIvjPVjnVTdSERQgPBkpM5Dt
	np3aD8ONW6gGPn5M+UrSxMG2ZLhXzx6M0hl4Fo8kVd9ff/tTDPYkq/487I5cZ3ACIIFeYD
	ZV+v71pgLgl4i+hcKqVHJhfSSnd1HsaIdQqF4+5CWx/IBqLFGocddMBjOesowg==
Message-ID: <99ffa8fd-d2b5-402f-8a59-59d60ab49afd@mailbox.org>
Date: Wed, 6 Aug 2025 17:05:59 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] ARM: dts: renesas: Add boot phase tags marking to Renesas
 RZ/A1
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250629220502.935717-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVUscsQEOiVUdwszM8LsiSx4FScHC+MY8hH7B_xtQHcUA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVUscsQEOiVUdwszM8LsiSx4FScHC+MY8hH7B_xtQHcUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: aa2979c094764a98d83
X-MBO-RS-META: me3a4r7yx991w8qs44b7t17kbe3z99yx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_080610_309981_A9466530 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
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

On 8/6/25 11:11 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

>> @@ -639,6 +643,7 @@ ostm0: timer@fcfec000 {
>>                          interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
>>                          clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;
>>                          power-domains = <&cpg_clocks>;
>> +                       bootph-all;
> 
> Please move this to the board-specific .dts files, where this node
> is enabled.
Shouldn't we rather enable OSTM0 by default , it is enabled in all RZA1 
upstream board DTs it seems.

