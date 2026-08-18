Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B152C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 16:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9v8GxHoF0StEQNyJKE2bkpAPrVfKbBQPYDkMVPC55o=; b=Wv2CxWJFf40lDP4maGJnBK3vXD
	xx1qIMw/VsQGTXshThbvmW5CPdcw/yoikKV4XsvnD+Eoz67LYtjXb7jmvu/Sh7nWyg09bSCtPprn4
	FqXjfw2rDaLDLgfbvc4QDSRdxZKTsXnQ5WhKHEKEWJ7E9RqxLkBNl6G/f/he174UIRObqL7alk9Qp
	mX5m45BwE7J9G/R/FHJ9W1rV3CKgLO6o524Vd5z6KYH4UJKOZ3/0P+QJsmf++dQCerj+gg/LkcWoF
	POUPVB/8B00pKnTSRTNArrW0MVpsR/X1wKv6JrWM0XjAX7bukl6NGf1kqB8ifi88b8JPpcr6U3yly
	ZgAHcxNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwMmd-00000008MiD-1DKk;
	Tue, 18 Aug 2026 16:35:27 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwMmY-00000008MhC-15jf;
	Tue, 18 Aug 2026 16:35:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD10A11C32A;
	Tue, 18 Aug 2026 18:35:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787070915;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Q9v8GxHoF0StEQNyJKE2bkpAPrVfKbBQPYDkMVPC55o=;
	b=MnfX7ENvYLsquDvBDCL9P3OXOr3jnFJr7USPuU2Hs+kf4GAZjcFgqvsnDMgCDxTaOk3UtX
	VVxDi3GEFP2Hh56dXxIfbqI8z3zhSaWYwzgGN0cbHYyKjXHc9CMhricENuvCHedS75f8Ml
	IR0LRlF8PXlYTPqkx5nhp5c+4fs5/RJ68E8oBVIRErRx1CeiRRMMOJqPy9UiR8r7vs4Bdd
	8U/e8LYxcYmTrs5/ynA/h3LkM7GE/EkDz1LhdYVLFqOKVc0TCNSZMfKIITQkSQuPzAtw8K
	cqSVgVUqLldBb56IFffMOTdPsYlCZs7MqIj5dIKFpW3Erl88H7uOmErly04hwQ==
Message-ID: <d6064380-2368-4131-8cde-44734f67028f@nabladev.com>
Date: Tue, 18 Aug 2026 18:35:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] arm64: dts: phy: st: usb: Add STM32MP2 USB support
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-usb@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
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
References: <20260816213849.1044073-1-marex@nabladev.com>
 <61dc785c-bea1-4674-918d-0f38ea253a29@foss.st.com>
 <41e7978b-933d-4813-9158-00474f531476@nabladev.com>
 <6c900e6b-2f50-4ec2-aca4-3093479bba53@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <6c900e6b-2f50-4ec2-aca4-3093479bba53@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_093522_543315_65DFA43A 
X-CRM114-Status: GOOD (  24.16  )
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

On 8/18/26 6:07 PM, Fabrice Gasnier wrote:

Hello Fabrice,

>>> - On coming MP21 (not supported here), there's address translation
>>> control
>>
>> What kind of address translation ? IOMMU ?
> 
> This is much more "basic". The controller can address 4G of memory, e.g.
> it's 32bits. That feature is only for STM32MP21 that can address 4G of
> DDR which starts at 2G offset. So basically there's a SYSCFG bit
> (SYSCFG_USBHARCR AREN), that adds a 2G offset so the controller 'DMA'
> addresses directly the 4G of the DDR (instead of 2G lower memory map,
> that's not necessarily useful, and 2G of the 4G DDR, requiring swiotlb
> with perf penalty).
> 
> Current downstream glue driver checks the 'dma_range_map', (e.g. DT prop
> dma-ranges = <0x0 0x0 0x80000000 0x1 0x0>;) that represent this, to
> enable the syscon bit that adds offset in hardware (so 4G of DDR can be
> accessed by the controller, without swiotlb).
> For USBH, there's nothing mode: set it at probe time, based on
> dma_range_map, restore it after resume from low power.

Maybe the DT syscfg node shouldn't be a plain syscon , but rather there 
should be an actual driver which binds to the syscfg DT node and 
configures all these hardware details early on boot ? The USB controller 
drivers will start only later, when the syscfg configuration is already 
set in the hardware by this (future) driver, since they depend on the 
syscfg node and the PHY subnodes. Maybe that is the way to fix the MP21 
without having USB controller glue ?

>>> - Common dedicated interrupt to manage wakeup
>>
>> This is EXTI configuration, is it not ?
>>
>>> Using generic controller drivers, I don't see how to manage it, without
>>> describing it in the DT.
>>>
>>> For sure, generic ehci/ochi drivers and bindings can/must be used. What
>>> would be the proper place for this glue to leave ? Why not adding the
>>> glue driver from the downstream ? That's supposed to address this.
>>>
>>> Do you wish I send it upstream, so it can be properly reviewed, amended ?
>>
>> I would very much prefer to avoid the glue if that is at all possible.
>> Thus far, it seems this could be done (interrupts are generic interrupts
>> managed by EXTI, Vbus detection polarity is likely a PHY thing since
>> this is managed by SYSCFG anyway) ?
> 
> I better see your point, thanks for your explanation.
> This makes sense! For this part, the approach can be the same on all
> STM32MP2 SoCs (21/23/25).
> 
> Still for STM32MP21 address remapping feature (out of scope here) I
> think there will be not much choice to keep a minimal glue DT & driver
> (and parent to generic ehci/ohci). It seems totally out of the PHY
> driver purpose.
> Maybe you have some thoughts about this ?
Please see above.

