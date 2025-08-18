Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507B5CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9v146V+CMDfR4H9bDDpfH4hxL2fknmgBAsXNipVc58=; b=n8lLJRovYDGCUx0SPCZrGw1P9l
	NVWdkgFlo5yJZiGp/jj4Htiho468ZuiCEEs28AEaW41ZGn/9YZtK6mJE0AwtWYQ9qpGQcEoJwGl+t
	eieD0E77h1dtpNIE+3POw2mejygfy3kCeb+DAIYHMwm/jZqi0E634gK/MmIkP0ax3agwWAoP9KMuF
	OKCFfh1ZEa+ppeksgsuI6LCQ8ut/zDqHty73dh/TS7JUVvvgX/7hr21NtJuBip51bYdDrKb8vzwKS
	uvmwvXKdeMn8ZlBeKTcX/1O4VByONFY7RUO3WMobQmbRhLBkhC1VqGuIRWMocDIVpXeB0b+fkzpoY
	b2oBndWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3hm-000000089RU-2J0B;
	Mon, 18 Aug 2025 17:31:34 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1H1-00000007rQA-1DIC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 14:55:48 +0000
Message-ID: <b3b15c31-2e54-409e-86f3-3102c6ab95ba@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755528942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z9v146V+CMDfR4H9bDDpfH4hxL2fknmgBAsXNipVc58=;
	b=Sp1xRRHpO2uHHYpxy7a2QHA4CWQyU4JH0x9iTAYVJo7c4t6B3ruN2a0SjuceXAE/NolL+U
	eAtREJZcTLT0bJTYgax9eVnAGVw3FlskO+Q/ZjZ9V6DZ3NnmAwtMRdbwIuj0KXG5nwLy0O
	vzrCGTEvbvF7jxl4CWxjJyOs/dt+usQ=
Date: Mon, 18 Aug 2025 10:55:38 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/9] dt-bindings: spi: Add spi-buses property
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 David Lechner <dlechner@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@amd.com>,
 linux-spi@vger.kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
 <20250616220054.3968946-2-sean.anderson@linux.dev>
 <ded7ba99-089b-47a7-95b9-ca6666dc3e29@baylibre.com>
 <87frdp119x.fsf@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <87frdp119x.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_075547_544997_5D548081 
X-CRM114-Status: GOOD (  13.65  )
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

On 8/18/25 04:28, Miquel Raynal wrote:
> Hello,
> 
>>> +  spi-buses:
>>> +    description:
>>> +      Array of bus numbers that describes which SPI buses of the controller are
>>> +      connected to the peripheral. This only applies to peripherals connected
>>> +      to specialized SPI controllers that have multiple SPI buses on a single
>>> +      controller.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    minItems: 1
> 
>>
>> Finally have some hardware to test this series with using 2 or 4 buses.
> 
> Out of curiosity, what is the practical use case and intended benefit?
> Maybe an example of such device and an explanation of how useful this is
> would be welcome, as it does not seem to fit the initial spi idea
> (which has been greatly "improved", not saying it is bad, just unusual).

The idea is to model the case where there are several tightly-integrated
busses on a single controller. e.g. sharing registers and maybe even
clocks. Some of these allow you to drive both busses at once, reading
e.g. the high nibble from one bus and the low nibble from the other.
These sorts of things require coordination from the controller, hence a
spi-buses property instead of two separate buses. This also makes
compatibility easier, since new devicetrees remain more-or-less
compatible with old kernels.

--Sean

