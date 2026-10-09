Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CA4CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 14:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SZPkRoQGUDE+klT0jysAtuinRd5m5pRffY1ELPRh0w=; b=ofqAy9haD7AW0Qu+UGBjxlH4NQ
	vuomO8LxchlkVB1oFe5vTI4lmdzr/wrWvKsIBHUljt6ohiNoHKnlZiuBDgBrbKKB6rVqpS4/Yl6La
	GtL2I3lG1Ja0UoKyisIqrA2u4lmc/V6PbkanmXkwAuvH8bwcujKHXHpESLY/heVAd5tHFbguw4WhP
	31qnIPSWNlI8+TcfU6NncePT/D8iIUTsV5dqWTw3Uy7HacfFxK17R4oZTIIi+16eXorvjAGXC049N
	vPbiMJUvTZE6ZpXtRxiT0AbWamYtEcNaatLVRYpAkE9dctKBsaeEOfjW4LUi7Kj6HVxxON3O93IAq
	vEx58DCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBmf-00000006TDZ-37qS;
	Fri, 09 Oct 2026 14:41:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBmd-00000006TDL-1yw0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 14:41:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5130760267;
	Fri,  9 Oct 2026 14:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF951F00893;
	Fri,  9 Oct 2026 14:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791556874;
	bh=8SZPkRoQGUDE+klT0jysAtuinRd5m5pRffY1ELPRh0w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VQSRW8ehq/rC8c/u6SI1a3Z5W+9uf0yJ1hWYdIYriwUoMOsxs0+7di+mrEOZqTD53
	 +Vqi72pBIJvCbhQ0MlVK+VZpDttPzN9AYkZx03qgZ7O5dggO8Drvjy0Qn4UWFQAmow
	 aSifDHy/H4Faw4bFuWDl4qIcFRJK39HWiNlurTG33Uv6qLbHSof2+j7oJdxWQjWLT/
	 GUeX7MnfPG4P0TYwtFKbTzaZd5UroX90t2rGRliqRLzAl4/L6jclNCJc+6s+Xw+/T1
	 jE+xBz/kCPufaZ94OZ8g9o6fgzryHGU3P0yQTOBfPga90I/AZvBXN8rjlVbZw7oE99
	 O6uccjkXTJ8oA==
Message-ID: <0a29124e-2c46-4f47-af14-a8b803069d3b@kernel.org>
Date: Fri, 9 Oct 2026 16:41:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] ARM: mvebu: dt for v7.4 (#1)
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-arm-kernel@lists.infradead.org
References: <87o6d96w7w.fsf@BLaptop.bootlin.com>
 <b2e182bc-6707-4147-bc04-fba3c379160f@kernel.org>
 <28ced1ee-b0e0-49a9-a414-0b1e6eeb28fa@kernel.org>
 <87y0c754d8.fsf@BLaptop.bootlin.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <87y0c754d8.fsf@BLaptop.bootlin.com>
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

On 09/10/2026 16:35, Gregory CLEMENT wrote:
> Hello Krzysztof,
> 
>> On 09/10/2026 09:21, Krzysztof Kozlowski wrote:
>>> On 04/10/2026 22:34, Gregory CLEMENT wrote:
>>>> ----------------------------------------------------------------
>>>> Krzysztof Kozlowski (1):
>>>>       ARM: dts: marvell: Replace spaces indentation with tabs
>>>>
>>>> Rosen Penev (10):
>>>>       ARM: dts: helios4: fix lm75 supply name
>>>>       ARM: dts: armada-385-clearfog-gtr: fix vmmc property name
>>>>       ARM: dts: marvell: add missing SDHCI clock-names
>>>>       ARM: dts: armada-395-gp: drop unsupported SDHCI clock-frequency
>>>>       ARM: dts: armada-388-helios4: fix vmmc property name
>>>>       ARM: dts: helios4: fix vbus-supply for USB2 PHY
>>>>       ARM: dts: helios4: fix spi1 location
>>>>       ARM: dts: helios4: use national,lm75 compatible
>>>>       ARM: dts: helios4: add #phy-cells to USB nop phys
>>>>       ARM: dts: marvell: armada-388: use onnn,pca9655 compatible
>>>
>>> Your pull introduces new warnings for undocumented compatibles:
>>>
>>> https://lore.kernel.org/all/202610021617.AlVUa9No-lkp@intel.com/
> 
> Is it OK to resubmitted a PR without the patch introducing the error ?

Yes, sure.

Best regards,
Krzysztof

