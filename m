Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351B7C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 19:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxI79bcrUCAFJsDq8avkEkefGVZa5/cLpguSSOm81mo=; b=I7fMXmbtDAR+zAc1/b+jNRCR75
	er94K/6smemG4GJ0uiTLMZMh4jmST3TcKYVZGIo40GhxTVwoLm3lzEWFrgl6AkttCS7Yryu80zlzP
	u1nPEN3K5WBeWMXtQUPe8l4lVGrezgD/ub6OzJmmlbMfUOuqhm7850C3okAHgA1jLyYudif6ilebh
	4FZM3+tJcG1nNhA34Nnc0PMrQirsNA/IfyXtGtVekwFULFSyQvvo2XjyDNF8t8dFNZwLdvcCYwbI+
	pxUQ5V3WC3/UwpD5v2imcE+0Vazxxux8/++n3oDDqodC/p06YcsvQmrs6WkAv61s0YFKTU4OkOkcR
	zS3auT7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41jZ-0000000A62N-2VcF;
	Tue, 08 Sep 2026 19:43:57 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41jW-0000000A60x-1p5u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 19:43:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 655C71018AA;
	Tue, 08 Sep 2026 21:43:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788896625;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=jxI79bcrUCAFJsDq8avkEkefGVZa5/cLpguSSOm81mo=;
	b=iLstf5vl2QHgwbl1SXbP3HTDvslti1e7t5hkcQWzdBS4xk2nUtTGvzVYbXTGH3Fbn/ju9f
	6gJkZy5jDK6IGDf1EB4TW3wTO8qW8OKSerkNZAUVHDvbdyZEuTb4r/jbMALuJftfMSlAOY
	aE5CVG8WIoB7rQ+wWz9H0XLL4mEWSkdeciLqpjPVJA7dciw/H7s3DUtiaHgNBdZzAhxJ0d
	lY2wHTiHMnYJ3m/gNw1DnmpmNTre2jgTvs/s9/JX5kUtFjmpcRm0H5PFubT2nLA4acPF8E
	8NKRjRwY4DNzDajnIZSxOGtdqpftugjBRra/yFMOMAkFRJaWaFcqZm03/O75Fg==
Message-ID: <4980c91a-fa3e-4508-b929-a4b1af1ead41@nabladev.com>
Date: Tue, 8 Sep 2026 21:43:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] arm64: dts: st: Add support for DH electronics
 STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org,
 Alexandre TORGUE <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260711210131.236025-1-marex@nabladev.com>
 <d20ef29a-c27b-484f-98ba-77c85ec2b587@nabladev.com>
Content-Language: en-US
In-Reply-To: <d20ef29a-c27b-484f-98ba-77c85ec2b587@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_124354_700540_05CBFBA1 
X-CRM114-Status: UNSURE (   9.28  )
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

Hello one more time,

On 8/25/26 7:56 PM, Marek Vasut wrote:
> Hello Alexandre,
> 
> On 7/11/26 10:59 PM, Marek Vasut wrote:
>> This stm32mp25xx-dhcos-bb board is a stack of DHCOS SoM based on
>> STM32MP25xx SoC (1200MHz / crypto capabilities) populated on SoM
>> Breakout Board, the stm32mp255c-dhcos-dhsbc is the SoM populated
>> on DHSBC carrier board. The stm32mp23xx-dhcos-bb is a stack with
>> STM32MP23xx SoC.
>>
>> The SoM contains the following peripherals:
>> - STPMIC (power delivery)
>> - 4GiB LPDDR4 memory
>> - eMMC and SDIO WiFi module
> Have you had a chance to look at this series ?

I would like to be sure this series does not slip through the cracks.

Thank you for your help !

-- 
Best regards,
Marek Vasut

