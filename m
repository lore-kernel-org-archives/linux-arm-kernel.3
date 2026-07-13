Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7B3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 23:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JowGsrG8z0J8jTyRk7ZCwK3WilZ3WJBqoqWeGUbFbzM=; b=KnuO+gT7gB0jBuqDJkAmZSgam1
	5cNyx9RdZbsBqikHD0KwQUuAAkpMtWpTphExzgIm8JUG9P8NrT3JwIiY26BXG4DcsyL4pzVe0E7jz
	4JJsQMKVpnjOrjBzqh+sXupD69NQFcA2YnlJufGm5yTbYaZb3diiCSYCN5qYzGSe66f+5SCeaD35n
	5BytkK1n1s6Zz805/p/gp8S805JJA1iEw35//3ISY+v7UTeBE1mKZ2UbA8ZUzPa8mymuCEIjtFiaj
	/TtTTE18KVAWrBTC1DwZ2eB0nqLnFMPmlTTbDiPuNW2Xgt1iUQw7aMtti/Dv24ado1p+xvDbPVdgl
	OkDm+i5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQ3L-0000000AYFS-3YL3;
	Mon, 13 Jul 2026 23:27:11 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQ3J-0000000AYEp-1hYV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 23:27:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FB051199A0;
	Tue, 14 Jul 2026 01:27:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783985226;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=JowGsrG8z0J8jTyRk7ZCwK3WilZ3WJBqoqWeGUbFbzM=;
	b=W8l29cdxgY05YqP1GtSfJ8UlIT5AER7bcgVfWzicUtwCuoVuQi/SpoT6zzQjtEa1V6v0En
	lFoBzsTBi+e7+2gjNzK2bu4NPA2Qb/1XytMW/SYLnUjOWE8Yg4fdJchvRN/88BpZ0HVhG6
	/vd0/rBi8wNX9L1wOGYsAbofIvCrZBiMT7tmux2S9CQZYofF9F6bY4qSFc/nVeJwAJceCs
	EXTtqAsvXXaFi2l+GcreIwj2GbZgO49EbSurOPTnt1Vc2GdNnzjmiYIPB0RCvxL4NO8O4E
	A8JH9oxsnCBlwPyZFmzLuTjcavv6zJPRvVw6a/MetVKlntTe8vkRABPzKbmvSg==
Message-ID: <0819d213-ce3f-4887-9374-ef0ae08055fa@nabladev.com>
Date: Mon, 13 Jul 2026 12:31:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] dt-bindings: arm: stm32: Document
 STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260711210131.236025-1-marex@nabladev.com>
 <20260711210131.236025-2-marex@nabladev.com>
 <20260713-tireless-sly-squirrel-04c7e5@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260713-tireless-sly-squirrel-04c7e5@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_162709_601584_622A7E9A 
X-CRM114-Status: UNSURE (   8.65  )
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

On 7/13/26 9:48 AM, Krzysztof Kozlowski wrote:
> On Sat, Jul 11, 2026 at 10:59:30PM +0200, Marek Vasut wrote:
>>         - description: ST STM32MP257 based Boards
>>           items:
>>             - enum:
>> @@ -203,6 +215,12 @@ properties:
>>                 - st,stm32mp257f-ev1
>>             - const: st,stm32mp257
>>   
>> +      - description: DH STM32MP231 DHCOS SoM based Boards
>> +        items:
>> +          - const: dh,stm32mp231a-dhcos-bb
>> +          - const: dh,stm32mp231a-dhcos-som
>> +          - const: st,stm32mp231
> 
> This should be after st,stm32mp157 group and before st,stm32mp251 to be
> sorted by fallback compatible.
> 
> Anyway, not a big deal, so:
I'll send a sort patch for this schema file shortly and then a V2 of 
this series once I get a bit more feedback.

