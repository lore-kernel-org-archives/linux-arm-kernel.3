Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3135DCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 14:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iue+XSYCya8VUiQZMGubQW6H+Q0XS2fIhg9CPANr+eQ=; b=KiEgD4xA0vIOejbS2v5rXV+tbb
	21wgvnZMOnR5aeKn5Lv99h6fiO0w/DBo7NbJHJXQx8bJjlNaH5UTFXbSKvw6HWctjrGa/Kc/jpzc1
	u1DPCR+f5ta5i1N8n76IzOXRlCzn6TUBKMff6mHRELbYhG4/ml1vk1Q2NNULVaEf+7qIExFctghlM
	DhrZL8YPhSsxbHf1jjQFGGSrOeNgM1RcOSbkBstpdxHcJn8QYb6wRoEYBojx8AgyeEXMrsTKW+/zZ
	6o8PgP8ncXz99Jhqbt/4800pvA6aKks+sDlOiVXDFWhAGwlC3su+BFUfCLMRgh8AHbeSgMu9i9gZ4
	4Cw3ubFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBC5k-00000000k4k-434A;
	Mon, 28 Sep 2026 14:12:28 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBC5h-00000000k4R-3Hds
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 14:12:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63680102F78;
	Mon, 28 Sep 2026 16:12:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790604733;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Iue+XSYCya8VUiQZMGubQW6H+Q0XS2fIhg9CPANr+eQ=;
	b=FqGKF+g92fX11yKaZtVMc6+lKzjTYtzrtTzLOJm0Pt9KUYdT4qvhtwAIGkDy/EG8BzjVMq
	gF/m7/9mYFZZX1YjbA8gQS0vsRputkWh/BvCtkegfFo5T/zUqiECwQx9QrnVB158/wfaix
	uZR2yPMIdNJNJlbWWOwbpJ4Jf8kc7hT5d1ilsNASmTkyS9jMuzQQhppedM6MELgD4e9ocP
	36Cd7aCMArvXGanpZ3GRq0mtCzHinFLMvHsbujAVPubhVUe6WsuRNuF7MX0SAH7HJO8Y3l
	qxxsnOD7gHlcVL8ElsKDAV+m983W6RI1KJMR/Z39ILE1+gNfst0cBWK5ofsyGw==
Message-ID: <b2ad62b4-1858-462c-b249-8c6e87126847@nabladev.com>
Date: Mon, 28 Sep 2026 16:12:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] arm64: dts: st: Add pinmux nodes for DH electronics
 STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260711210131.236025-1-marex@nabladev.com>
 <20260711210131.236025-9-marex@nabladev.com>
 <502b58ee-2421-41d2-bdfa-a870ba8e325c@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <502b58ee-2421-41d2-bdfa-a870ba8e325c@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_071226_065567_82B35538 
X-CRM114-Status: UNSURE (   8.41  )
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

On 9/28/26 11:02 AM, Alexandre TORGUE wrote:

Hello Alexandre,

>> diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/ 
>> arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
>> index 456ece7f8ebc3..1aadbc6b47da9 100644
>> --- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
>> +++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
>> @@ -182,6 +182,30 @@ pins5 {
>>           };
>>       };
>> +    /omit-if-no-ref/
>> +    eth2_mdio_pins_a: eth2-mdio-0 {
>> +        pins1 {
>> +            pinmux = <STM32_PINMUX('G', 4, AF11)>; /* ETH_MDC */
>> +            bias-disable;
>> +            drive-push-pull;
>> +            slew-rate = <3>;
>> +        };
>> +        pins2 {
>> +            pinmux = <STM32_PINMUX('C', 5, AF10)>; /* ETH_MDIO */
>> +            bias-disable;
>> +            drive-push-pull;
>> +            slew-rate = <0>;
>> +        };
>> +    };
>> +
>> +    /omit-if-no-ref/
>> +    eth2_mdio_sleep_pins_a: eth2-mdio-sleep-0 {
>> +        pins {
>> +            pinmux = <STM32_PINMUX('C', 6, ANALOG)>, /* ETH_MDC */
> 
> I assume it is G4 for MDC ? If yes I fix it when I apply.
It is PG4 , thank you.

