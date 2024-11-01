Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2576BE6B253
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 12:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXxB/F631e/4YxsnfNysSZ/ud2/7a+sdqt3IGXryPxU=; b=4qsO64mlpyGdRpU/47who8ViRA
	X+6HqZqeFQ+NwOUgp/h2f3KM+MZZllqM69KbqpQWrTtO5kuf0ML84169UgPg+RmO8ITMxcvAYR7QL
	LCZFeq3E1GHGkep2l+rsn6T53U35cqSIZFJZ8CzvZYuw1UhXlKpmJxtd/Ty3TksR1AtGX0v7iJeJB
	A0semd+4F2G4YuqHFQnqRMSZKZHSkK62TJFMgNNaAYQ5tcwlEZIig2IRXWajzQgfsS8mKxiI63Jb9
	fwetOJbnscwwDfTRQnwC9hB+qtuLzBA6R0W0aZuwBXeZpKYogc6k94ZL2lxaEWPBRRwIhoR4KG1Tj
	mz4AGHjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6quM-000000074Pp-0jNG;
	Fri, 01 Nov 2024 12:37:42 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qqP-000000072dU-3fjL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 12:33:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 46C1A4346B;
	Fri,  1 Nov 2024 12:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1730464414; bh=tC+M1hH7fork9yJ4VGi51sWAlT5oGLZxXxBuaAYIzeA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lzfjqAC7QS4yk5+91vpLtBSqpyvoMChGk5b35z7ZYw2NAAAgR6QBD5pL+D4TW/1+4
	 JuCBlvOktUM0YUHhICuYn7AgutVf6XCm2Mh2hOXzg1XY3Z7YspQ2r13G0mXlWVFnZ3
	 cNIueyOKLfTFxJotxw6emgqMMFcSDSVEe/3b26aMjH1f/kwfUcikAud7drvnh5dF5o
	 E9uqR9Rg/9hhU4bbQNEd6wvd8xcDW3Z3GtRHmJsnAhfCh/CevZSvaIeylXemsx6zOl
	 ccYNadlHn4cJE8d4jpgyELl4+1L4rhx7CkOSJe92Rp69IY8y39iU81LXSSVweQg1hc
	 6i/fZgl31e1dQ==
Message-ID: <5e0b5238-d781-458a-9285-df54a16232af@marcan.st>
Date: Fri, 1 Nov 2024 21:33:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH asahi-soc/dt 01/10] dt-bindings: arm: apple: apple,pmgr:
 Add A7-A11 compatibles
To: Krzysztof Kozlowski <krzk@kernel.org>, Nick Chan <towinchenmi@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241029010526.42052-1-towinchenmi@gmail.com>
 <20241029010526.42052-2-towinchenmi@gmail.com>
 <wpwa22u5z5hamvme7za7dqe7kjl5bap2a254w32yyqrohz235g@hk3izcckbdqn>
From: Hector Martin <marcan@marcan.st>
Content-Language: en-US
In-Reply-To: <wpwa22u5z5hamvme7za7dqe7kjl5bap2a254w32yyqrohz235g@hk3izcckbdqn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_053338_314531_3D096CEA 
X-CRM114-Status: GOOD (  12.86  )
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

On 2024/10/29 16:41, Krzysztof Kozlowski wrote:
> On Tue, Oct 29, 2024 at 09:03:59AM +0800, Nick Chan wrote:
>> The blocks found on Apple A7-A11 SoCs are compatible with the existing
>> driver so add their per-SoC compatibles.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
>> index 673277a7a224..5001f4d5a0dc 100644
>> --- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
>> +++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
>> @@ -22,6 +22,11 @@ properties:
>>    compatible:
>>      items:
>>        - enum:
>> +          - apple,s5l8960x-pmgr
>> +          - apple,t7000-pmgr
>> +          - apple,s8000-pmgr
>> +          - apple,t8010-pmgr
>> +          - apple,t8015-pmgr
> 
> Assuming you keep the existing order of entries in this file, which is
> different than usually expected: alphanumeric.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Yeah, it's a bit ad-hoc but essentially "by release date" with a fork at
t6000. So:

- First the ancient s5l series
- Then all the t/sXXXX chips up to t8103 (M1) (numeric order, ignoring
prefix letter)
- Then the rest of the "baseline" Ax,Mx chips that continue after M1,
which are all numbered t8xxx (numeric order)
- Finally the t6xxx series (Mx Pro/Mx Max), which forks the timeline and
numbering after t8103/M1 (M1 Pro = t6000).

Unless there's significant objection I'd like to keep this pattern, it
makes sense from the POV of people working on these chips.

- Hector


