Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C000FCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 13:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=viO8D+Qu2R6riMUQBJZA4lci0O87eiHC/lld0s2EB4A=; b=RTdmxOOzgBARI+OCYxFhnYmV9L
	9/S/LFAl5XLvqrDZtGvTmvunAWf87FjdXOBa+lioBrEbYJeUP3PE39SHddEsB/FAeTuN34mrRJtue
	AtNclssOjtAsUZRsahP/HdnielmtUv0cL8MwlOZpXiZWLAGqHVzY0wGKctOsm3T5k/yMUEe4l2Ndh
	2AeL02GzcOU9qSeN925gDMYgNiXGY/6cZvZ9UHaj5Aopk63pAdZrPn9SR2aD31xzfVdbW7Mweb+0a
	ceeKdMOGMfFICaZkxahWy83AOLScymNwmAIbyMidmdCY6htldRtsBSEXP8mDmVakw7PQ7aFcZTE72
	0TqW1esQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2VH5-0000000A6Pp-3kCL;
	Sat, 27 Sep 2025 13:47:43 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2VH2-0000000A6MA-41Ki;
	Sat, 27 Sep 2025 13:47:42 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1758980856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=viO8D+Qu2R6riMUQBJZA4lci0O87eiHC/lld0s2EB4A=;
	b=k1TkaTrKrNDGCaTdjNAzJ54xvUbwa6oLdyeabtuQche1UzsO4we+X1IcKp6h0zBbBkwPKs
	lri59Pl1DSM0NoDtpcluC29zfICKCZ8lSyFHfOPSamPaUJuROwZ/uGt1nhG3J7J2NOe9Nb
	O/KIgDxmBszhbBzxLZb6JZoBLW48y1WlSML5W0dDdw/K553F4HosjgBSnujXaFdEKlx1fZ
	HJFlk5RI4+khI/ZU0gzIf9FbSwPulObZIkJ/MX7RHhJn3TtSOB7KTxYKH8SJ/hDqtFCi2g
	XriAwvbvt71g5BRuVo2C5ryf4QkHuTqP9tV+zbGNOYzYF2NvKczLJTNBblVimw==
Date: Sat, 27 Sep 2025 15:47:35 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Tianling Shen <cnsztl@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jonas Karlman
 <jonas@kwiboo.se>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add devicetree for the
 FriendlyElec NanoPi R76S
In-Reply-To: <DD3EST9Y5UHF.12FJMDJUSZNYL@cknow.org>
References: <20250922091509.2695565-1-cnsztl@gmail.com>
 <20250922091509.2695565-2-cnsztl@gmail.com>
 <DD2V17FJ29MV.3YDX1VUWGKEH@cknow.org>
 <1bb00ad6-ffe1-4783-909b-032dfb984180@gmail.com>
 <DD3EST9Y5UHF.12FJMDJUSZNYL@cknow.org>
Message-ID: <d0a3d5d4480eac12ba5e2b15bcbc578f@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_064741_222084_7C4AA4E3 
X-CRM114-Status: GOOD (  13.13  )
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

Hello Diederik and Tianling,

On 2025-09-27 09:37, Diederik de Haas wrote:
> On Sat Sep 27, 2025 at 3:19 AM CEST, Tianling Shen wrote:
>> On 2025/9/27 0:07, Diederik de Haas wrote:
>>> It is recommended to use the labels in the schematics to define the
>>> pinctl nodes (and thus their references). In quite a lot of cases 
>>> that's
>>> indeed the case, but not for gpio-keys (USER_BUT) or these gpio-leds
>>> pinctls.
>> 
>> I cannot find any specific naming rules from the gpio-keys[1] and
>> gpio-leds[2] bindings, did I miss any update?
>> 
>> I think this naming matches the current practice at least in 
>> rockchip's
>> dt tree.
> 
> There is an unofficial rule/aim:
> https://lore.kernel.org/linux-rockchip/5360173.ktpJ11cQ8Q@diego/
> But granted, there is 'some' inconsistency.
> 
> And used in f.e.
> https://lore.kernel.org/linux-rockchip/20250727144409.327740-4-jonas@kwiboo.se/
> 
> Where you can just copy the pinctrl labels from the dts[i] and paste
> that in the schematic document and you're instantly at the right place.
> Which is the exact purpose of that rule/aim.

Is the schematic actually publicly available?  I tried searching for
it, but found nothing, unfortunately.

