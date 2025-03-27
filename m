Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5A0C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 08:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QtJKq+OsWpHhYsRUPr9FSDRdjBhO4gzujqqenof5Gw=; b=hWN/hF7t8l4Me/DVYwfn+ffqu2
	RYTdl0VSqnhJko6ZJ4FL36a1zxlgwXr33mq0Twqmo6mZoM6FF7KtRpPs9+T3tgNly29czeVU5rQc5
	lsFCtdtDfqeTHTegXtDgI0yUoiQNbH8rDk22RYOksSoWXguCzj3M2pvTpp7uK/FX0Ey2ogmbLpoDI
	PjnrG/Cfs8E+3B9iuEtvTYCYlnBqfFEoW3FrkCRS92YAp6yN+voz0pdXDItNti9mH1nIw1EA35U3/
	sw3Z5VBYYlqNAyAMknCDA/SKSkvKbw3etruY2eWLBTiv48UwescDA8mwaLHtDePLAaNTFc9A2rZPW
	OOosGhdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txiHk-0000000APXE-2Qba;
	Thu, 27 Mar 2025 08:08:20 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txiEt-0000000AP4X-2wGF;
	Thu, 27 Mar 2025 08:05:25 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1743062719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7QtJKq+OsWpHhYsRUPr9FSDRdjBhO4gzujqqenof5Gw=;
	b=aQIty+8T2fPR116eQzueuqp4MJQLLFL/toTBOr+3/IiJoMiyAFxARk7fZhBkLVYkNqIo4y
	bb3gBpbrc4YRESUr9dGs8XiXt9c4FFpU2ILsuwLPDpQAhb1zVoMutS9C8mVk4qDkyAftnj
	VAmFu2UlBCYBMdnVz6LYK4UAZVzLfoWW/n/EwcDbuDO8hUES5wGlBdbFQnZ5f2wnglx3YH
	nrG1rJk/QQBrAvE7ojzUInZ1K9DrjLOkeHgdJ686L8IR4fLyAKf2eiUgtuOpfPg+QhZi1s
	hxBO4zlVTBBncPGd3raWKJeWlQxF9p6Q0Fv+qeg3f0hcOb7KmKtrdsyCtpZOpw==
Date: Thu, 27 Mar 2025 09:05:17 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-rockchip@lists.infradead.org, heiko@sntech.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, stable@vger.kernel.org, Alexey Charkov
 <alchark@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Remove overdrive-mode OPPs from
 RK3588J SoC dtsi
In-Reply-To: <f73743cb-fdea-4b53-9665-4cc303498171@cherry.de>
References: <eeec0d30d79b019d111b3f0aa2456e69896b2caa.1742813866.git.dsimic@manjaro.org>
 <f73743cb-fdea-4b53-9665-4cc303498171@cherry.de>
Message-ID: <5f39aa155b2ef6e6b355b7f9f9a6ce6b@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_010524_083689_89639D68 
X-CRM114-Status: GOOD (  22.76  )
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

Hello Quentin,

On 2025-03-26 11:07, Quentin Schulz wrote:
> On 3/24/25 12:00 PM, Dragan Simic wrote:
>> The differences in the vendor-approved CPU and GPU OPPs for the 
>> standard
>> Rockchip RK3588 variant [1] and the industrial Rockchip RK3588J 
>> variant [2]
>> come from the latter, presumably, supporting an extended temperature 
>> range
>> that's usually associated with industrial applications, despite the 
>> two SoC
>> variant datasheets specifying the same upper limit for the allowed 
>> ambient
>> temperature for both variants.  However, the lower temperature limit 
>> is
>> specified much lower for the RK3588J variant. [1][2]
>> 
>> To be on the safe side and to ensure maximum longevity of the RK3588J 
>> SoCs,
>> only the CPU and GPU OPPs that are declared by the vendor to be always 
>> safe
>> for this SoC variant may be provided.  As explained by the vendor [3] 
>> and
>> according to the RK3588J datasheet, [2] 
>> higher-frequency/higher-voltage
>> CPU and GPU OPPs can be used as well, but at the risk of reducing the 
>> SoC
>> lifetime expectancy.  Presumably, using the higher OPPs may be safe 
>> only
>> when not enjoying the assumed extended temperature range that the 
>> RK3588J,
>> as an SoC variant targeted specifically at higher-temperature, 
>> industrial
>> applications, is made (or binned) for.
>> 
>> Anyone able to keep their RK3588J-based board outside the 
>> above-presumed
>> extended temperature range at all times, and willing to take the 
>> associated
>> risk of possibly reducing the SoC lifetime expectancy, is free to 
>> apply
>> a DT overlay that adds the higher CPU and GPU OPPs.
>> 
>> With all this and the downstream RK3588(J) DT definitions [4][5] in 
>> mind,
>> let's delete the RK3588J CPU and GPU OPPs that are not considered 
>> belonging
>> to the normal operation mode for this SoC variant.  To quote the 
>> RK3588J
>> datasheet [2], "normal mode means the chipset works under safety 
>> voltage
>> and frequency;  for the industrial environment, highly recommend to 
>> keep in
> 
> FYI, the answer from Rockchip support about what "industrial
> environment" means is:
> 
> """
> Industrial environments encompass a wide range of settings, from
> manufacturing plants to chemical processing facilities. These
> environments are characterized by the use of complex machinery,
> stringent safety protocols, and the need for continuous operations.
> """
> 
> which is not really helping me understand when we should be able to
> use the overdrive mode.

Thanks for forwarding this!  I really can't escape comparing the
response from Rockchip support to the old funny story in which
a passenger on a plane asks a flight attendant where they are,
and the attendant responds that they're on a plane. :D

In other words, that's perfectly valid information that describes
what an industrial environment looks like, but it has nothing to
do with describing the specifics of the applications of RK3588J
in such environments.

> Why would you buy an RK3588J variant if you don't plan on using them
> on the -40 - -20°C range that isn't supported by the RK3588 variant,
> which seems to me to be the only advertised difference?

Yes, AFAICT that's the only directly related difference in the
hard numbers provided by the RK3588 and RK3588J datasheets.

> It also seems like the RK3588M supports the same operating range as
> the RK3588J but at faster speeds? c.f.
> https://en.t-firefly.com/product/industry/aio3588mq#spec and
> https://download.t-firefly.com/%E4%BA%A7%E5%93%81%E8%A7%84%E6%A0%BC%E6%96%87%E6%A1%A3/%E6%A0%B8%E5%BF%83%E6%9D%BF/iCore-3588MQ%20-%20Automotive-Grade%20AI%20Core%20Board.pdf
> 
> Couldn't find a datasheet though.

There's also the following document:
https://download.t-firefly.com/Spec/CoreBorads/iCore-3588Q_Specification_EN.pdf?v=1743061914

I've also been unable to find the RK3588M datasheet.  Regarding
the Firefly SoMs with different RK3588 variants, it does seem
that the RK3588M, i.e. the automotive variant, is capable of
reaching 2.0 GHz throughout its entire operating range.

Maybe the RK3588M datasheet will become publicly available at
some point, allowing us to learn a bit more about it.

> Talk about confusing specs...
> 
> I'll stop caring from now about this very topic :)

We've exhausted all the available resources, so there actually
isn't much more to do anyway.

