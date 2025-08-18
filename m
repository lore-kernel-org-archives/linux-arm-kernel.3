Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09027CA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=It6WsGpfjWI4leoXs05vkzx9/2tYzuPt+sPubFhfa+0=; b=Oo4Dx7vR3xO7GJV0jzLa8YNob/
	EJrhm467QhFPWNj/Cdvn91UNOs3WkZ8Hmq1wRYnn1tPi2dvEt4o3mjcVtw1Tmofy/HOdl93gueyuD
	StEc0HFWEtST9tuFQSeNI/L5XvAojcMG3WzXPOhQ8lc9vgPpTNrt+lvv3lx1YJlkH0K3PXPeAn+SX
	wb5HZCcvbiOJ49oRkj1Ke7BblnrMtdjiUL2Fzag06WeOdcMdWBkKvCWlIMkhcFnQ1CXbg9ERyXEyV
	JuYoYm+9NOpNxMJr29LuJXEKl5kPohOjIwr23TBsDbJuC//QiEClU/2Gqy0HyrcO6gdmTywV+wwaN
	Ktk1hpaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3i0-000000089n8-1ZbC;
	Mon, 18 Aug 2025 17:31:48 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1X9-00000007tCO-0doZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 15:12:28 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4c5G7b537qz9t7s;
	Mon, 18 Aug 2025 16:58:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755529131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=It6WsGpfjWI4leoXs05vkzx9/2tYzuPt+sPubFhfa+0=;
	b=ZohjIzNQt2wCVmQYGFKOP73CFbd6Ia0/eaGon8+3QyJWF1qEjO3Ww3UY5k/frrG/RiYlHC
	Gr/S+lyczLT2Knd0qczhXn2tzrfObKvXItL8eQzz7O9RPyaQPSIUX7KqRjmRAiS8+ojZVD
	ZoWeeH3G1LHZgkLl4EMyUwrAnIXGI7B7xOJovQFn/i87Jqfbt2iUsSGfvI3M/CKVSe7Xbn
	TntQ2bHdqBtkddu2hZyQh9+9v0E5mC2zqzqyc1zXrro52VjACsNYWZdaQ6tlahOzvvTLJQ
	dJsvfcKTHPaAo5ex3L0T6ZMJjiunz6u30bzxbdbIfeZeyGk72zL0/3jinC4YeA==
Message-ID: <d1510b98-5094-4eec-b81b-55d0ba3e1b4a@mailbox.org>
Date: Mon, 18 Aug 2025 16:58:47 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] arm: dts: stm32: Drop redundant status=okay
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com
References: <20250818143730.244379-2-krzysztof.kozlowski@linaro.org>
 <388e6f81-383b-4b39-9b75-8d2cdbf95d37@mailbox.org>
 <259e72c0-b69a-42d4-aec5-ad8a6e03d416@kernel.org>
 <651df530-797a-45e1-b199-917deda33222@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <651df530-797a-45e1-b199-917deda33222@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 6nsdwhcsnfm3nimas3f6jx49wjpdyxzm
X-MBO-RS-ID: e1973190b65b1be2432
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_081227_330934_F3B5E58E 
X-CRM114-Status: GOOD (  10.31  )
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

On 8/18/25 4:56 PM, Krzysztof Kozlowski wrote:
> On 18/08/2025 16:51, Krzysztof Kozlowski wrote:
>> On 18/08/2025 16:45, Marek Vasut wrote:
>>> On 8/18/25 4:37 PM, Krzysztof Kozlowski wrote:
>>>> Device nodes are enabled by default, so remove confusing or duplicated
>>>> enabling of few nodes.  No practical impact, verified with dtx_diff.
>>> I assume the "no practical impact" means DTs are identical before/after
>>> this patch ? If yes,
>>
>>
>> No, DTS cannot be identical in this case because one had status, new one
>> does not have. Practical impact means... visible impact in practice. How
>> to say it more clearly?
> To illustrate: this is "no practical impact":
> 
> 
> --- dts-old/st/stm32mp157c-dhcom-picoitx.dtb
> +++ dts-new/st/stm32mp157c-dhcom-picoitx.dtb
> @@ -691,14 +691,12 @@
>   					interrupt-controller;
>   					interrupts-extended = <0x49 0x00
>   					reg = <0x33>;
> -					status = "okay";
Sorry, yes, this ^ is what I meant and obviously wrote too fast and too 
inaccurately. My RB still stands. Thanks

