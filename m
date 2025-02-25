Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44E7C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 07:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSAID7cNQATBlfBRl5Ti0HdrOXWuCuOwIPKWOIOvz/E=; b=1eTgFzSiNQlMjz+Xq7tpL91pqm
	PgC17Vk0TtOhiHfU9SZImZoD6dYHYUwIessl96F1Jsce7S2ICs+Cqg6CcIXX6fXjo3mHK1wE4/dKJ
	BGFVF9EzY/G8wKs3kfH52LVjSqdhDO7kMvs4roWzWwhsYEk15qY67l9ee9k7pJvpzzgt6I+WFiyN3
	+dg1m4VFZ6w+hXbOSU75BmdD+00qXZ38UCio6y+jpBha6AW0QNZWQa0cgqT3FoNJN7NEgcKkBYab6
	ioWbEQ5uGwhmF1reSKL21Gr75aVXMj6ES+N3jaP7nip1XSV5qs8tVEP/6qTfKvE0joKSLzMgdfEhh
	+2Fv3TYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmpnP-0000000GHco-31Ni;
	Tue, 25 Feb 2025 07:56:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmplr-0000000GHNj-1UNo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 07:54:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46DA261230;
	Tue, 25 Feb 2025 07:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12E1C4CEE2;
	Tue, 25 Feb 2025 07:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740470066;
	bh=NGk1qE7yXYQeTLoTmP1HbZudPoB9xCFk42t5aOZVRhM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=CRYofVAHxDFI6ppXko1J4AAfQLmKIj84eSLvfQOyLz6X4scFN+BepQpZtrjFcfCcV
	 AFdPdeXvyeq30G6UqfHvVBuc5/gV5Iw8fb2697xvsLhnwXQeipusx5HTyLvPxaGREd
	 MZ8krS8Ba/v8TRhoRR2QSCuyKz0OjYXS3nN1Hlp6bb4MD0sum8F0EyG2gGdvDk0wgk
	 Ayzg4NBgvJ0j40BA03jTe2eIrgJfSj61mF/7soowqQYcNOk2jB8JrwF3NRTUChyCk1
	 X4302vrmBPT/JEk9OkamR12eI8E10SkpKOkDgw350XVUHAkVCEAWOEX0zb3Okp8Arg
	 jz0Z6EMW+0iRQ==
Message-ID: <2b64a9d7-7048-4842-9cc1-fe23f5abdd00@kernel.org>
Date: Tue, 25 Feb 2025 08:54:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/3] dt-binding: clock: ast2700: modify soc0/1 clock
 define
To: Ryan Chen <ryan_chen@aspeedtech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250224095506.2047064-1-ryan_chen@aspeedtech.com>
 <20250224095506.2047064-2-ryan_chen@aspeedtech.com>
 <f810b8a2-4261-4b68-b59b-4efa0219b5db@kernel.org>
 <OS8PR06MB7541D685A626D300AC730A5BF2C32@OS8PR06MB7541.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <OS8PR06MB7541D685A626D300AC730A5BF2C32@OS8PR06MB7541.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 25/02/2025 01:41, Ryan Chen wrote:
>> Subject: Re: [PATCH v9 1/3] dt-binding: clock: ast2700: modify soc0/1 clock
>> define
>>
>> On 24/02/2025 10:55, Ryan Chen wrote:
>>> -remove redundant SOC0_CLK_UART_DIV13:
>>> SOC0_CLK_UART_DIV13 is not use at clk-ast2700.c, the clock source tree
>>> is uart clk src -> uart_div_table -> uart clk.
>>>
>>> -Change SOC0_CLK_HPLL_DIV_AHB to SOC0_CLK_AHBMUX:
>>> modify clock tree implement.
>>> older CLK_AHB use mpll_div_ahb/hpll_div_ahb to be ahb clock source.
>>> mpll->mpll_div_ahb
>>>                   -> clk_ahb
>>> hpll->hpll_div_ahb
>>
>>
>> I can barely understand it and from the pieces I got, it does not explain need
>> for ABI break.
>>
> 
> #1. SCU0_CLK_UART_DIV13 is redundant, it does not impact ABI break

You did not explain how it does not impact. Clock was exported, there
was a user and now there is no clock. User stops working. ABI break.

> #2. Change SOC0_CLK_HPLL_DIV_AHB to SOC0_CLK_AHBMUX
> Older implement where `mpll_div_ahb` and `hpll_div_ahb` were **hardcoded dividers** for AHB.
> In **the new approach (v8)**, I refactored the clock tree to clock tree.

I still cannot parse sentences like "refactoring A to A". It's
meaningless to me.

> It should be ABI-safe change

No, you do not understand the ABI. You removed a clock ID, that's the
ABI change.

Otherwise explain how this is not changing ABI.


> 
> Or you want to keep original SOC0_CLK_HPLL_DIV_AHB define and then add SOC0_CLK_AHBMUX.
> To be 1st patch, then 2n patch remove redundant SOC0_CLK_HPLL_DIV_AHB?

If you break the ABI you need to clearly explain why. We have long
conversations and you still did not say why.


Best regards,
Krzysztof

