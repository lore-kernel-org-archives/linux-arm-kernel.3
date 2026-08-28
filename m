Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F4AC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 01:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmYwe1UVmG+P6y8XZ0jgJInhQsv9JOJ7agmlWn6XZjI=; b=sd1FYCKtiYFb4sw5iJlkta43BK
	EqtWdXgobAm8H1w/VKlBvLprFdtTSmhlpNJsEVVe21bReb2DFE4sJfczpf222KjNDf85fdJ0GGhdZ
	Oj65aPdQDo7o3XtIvtF0RX6/sAJ7XVyYpRmegsu8oPFmLc8gpcjsKYyOs/dbkKZ+hyR1zgKaih/zR
	Omw1J+DKSUf8TolL/3X9m83ohV8nsWdqWzbGfZu2lgefkN+3j7XfIC52Kfc/GOcg+CJXrEGUW65Ln
	7KCPwwhj73Ujl9+T9VIsW3GCrPyw3uRw0M5lRwVzYkDLzOjC/sh6rfem0VL+3554T3oMDxUFYGhg/
	M3TRKNGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzlHt-00000004zEI-1HZO;
	Fri, 28 Aug 2026 01:21:45 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzlHq-00000004zDt-2j0T;
	Fri, 28 Aug 2026 01:21:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D07811D0C5;
	Fri, 28 Aug 2026 03:21:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787880096;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=cmYwe1UVmG+P6y8XZ0jgJInhQsv9JOJ7agmlWn6XZjI=;
	b=UO87sDGL3sBebpYqbD84s1YbNO4v7eideJxNY6dAzQ6IOvkH76bWtZG9ZkbU/+bUSwVzNt
	Jko19H/EExvQs6ppzLw0S0m0jmTbw4d1Cye00HzCjVIUJL36mQGcX7aZuKts88CMXbyn5s
	MpFmTPw2O9lWMM9KPFJHdcMR9GwDleVcEofgmGINwuD4uDVbUnrnnbp5ZYGGU+EF6zc8O2
	1tFLtU1LP/xwfHIuDWc56Pe4jsYycG8BWnh5IMszwMWREgXFFKhWimYSytyHGNF73OUNWo
	rGRuxTcenwER1IUlcXJ4bsjZ1++zCCDNR9D5qvNZkn8Y+J7gOtV0IcZuxtZGrw==
Message-ID: <202b1b0d-5ccd-4fcf-bc7b-bc013dd84774@nabladev.com>
Date: Fri, 28 Aug 2026 03:03:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] dt-bindings: arm: stm32: Switch
 st,stm32mp23/25-syscfg into simple-mfd
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>,
 Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-8-marex@nabladev.com>
 <20260827-skilled-optimal-shellfish-c548e5@quoll>
 <9b197208-dbb4-44dd-b0c0-b4dcaa57c403@nabladev.com>
 <3264c2d2-4c53-44c0-8164-d2d83f75c175@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <3264c2d2-4c53-44c0-8164-d2d83f75c175@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_182142_951759_8557F643 
X-CRM114-Status: UNSURE (   8.21  )
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

On 8/27/26 11:35 PM, Krzysztof Kozlowski wrote:
> On 27/08/2026 17:04, Marek Vasut wrote:
>> On 8/27/26 3:07 PM, Krzysztof Kozlowski wrote:
>>>
>>> OTOH2, you have now patchset dependency which is nowwhere explained.
>>> Merging constraints are the most important part of cover letter so must
>>> be clearly stated. IMO, should be stated also here, because many
>>> maintainers do not read cover letters. Or just decouple dependencies
>>> with using 'compatibles' pattern (see Qualcomm msm/mdss display
>>> bindings).
>> I wonder, wouldn't it be better to write a driver which binds to
>> st,stm32mp25-syscfg , handles the SYSCFG clock, and does some
>> of_platform_populate() to bring up the PHYs (DT subnodes) ?
>>
>> I think that would resolve the ABI break problem, since we wouldn't need
>> the simple-mfd compatible anymore. And it would also correctly handle
>> the SYSCFG clock.
>>
>> What do you think ?
> 
> Yes, it is better and more flexible approach. Solves ABI impact.
All right, let's do that.

