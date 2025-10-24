Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0EBCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 09:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAbjKjhcDfGtn2/zGatVn9Yy3ReIVrMyjwO7fZd2L1s=; b=3YpEIsBtL+G2zAKhgqgIM9U74R
	GZoqmYAkZuf3PdECniVkaBXxylpECyoQuV3Q9qNLjYEoEMPCDaDrJpBtDavxICTA7u4t1iq2TZbql
	f4NxA0lH21pIQ6K7yZF8Aqx9e1d7WHDKEJaQhlYvf3+yY6afcvom7nG8XGxLRoumMXEqLb2atWVe4
	eAa19WsqgzenMvqMUwTLLIyr0/lanfJdgQohKNO7NNFsXJ0WLuPMScHO6cZelSGF/IdRENcp465xZ
	/vz3Izde4BR5ARpwuZEO2OHcCee8kRQAIi9eCWee8kIoW4gk2gb+VCTXMSBV2Vko8BM/TPTHtxs5r
	8Bg0+IwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDnP-00000008pMY-0nPl;
	Fri, 24 Oct 2025 09:09:15 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDnJ-00000008pFZ-3XIX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 09:09:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C25C81A163A;
	Fri, 24 Oct 2025 09:09:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96E7B60703;
	Fri, 24 Oct 2025 09:09:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 876B8102F2465;
	Fri, 24 Oct 2025 11:08:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761296945; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=tAbjKjhcDfGtn2/zGatVn9Yy3ReIVrMyjwO7fZd2L1s=;
	b=ggefOGsgpiVYyF0A3GE6TACY+UYwP2pgRZuAOmS8vR4gYC0oJOS70Lt46N5pEU86oQOzsw
	zxshp2tqPIobCsAoLCPJfm7PDjpY19gXfPrtq0zS33GwSX/LM/6uoAKMTH0tYrZfkFVyZQ
	nY2RQw3SxggVF9teOpRRtGVLP5evJ4UkjhqR6E/1E1sqVYw5A2xojF1Tu7ZW5kLXQsuVzF
	exs2+bOMNrk3HAEwDEazo40qEFbyaXQicieeCuWJzzO4NeN0VeCiSGJCWgF0iU+aAnu93K
	YJsetl3/TxCCaUdeycGVB/cCbWMzCowcUwhc574+swKaMU/mav9s09Qk0Pvd1A==
Message-ID: <a231f2a4-1cc4-4e40-8560-f0cb72b21f1a@bootlin.com>
Date: Fri, 24 Oct 2025 11:08:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/15] dt-bindings: mtd: sunxi: Add H616 compatible
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
 <20251020101311.256819-15-richard.genoud@bootlin.com>
 <878qh3thqo.fsf@bootlin.com>
Content-Language: en-US, fr
From: Richard GENOUD <richard.genoud@bootlin.com>
Organization: Bootlin
In-Reply-To: <878qh3thqo.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_020910_035892_19EDC574 
X-CRM114-Status: GOOD (  12.80  )
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

Le 22/10/2025 à 11:20, Miquel Raynal a écrit :
> Hi Richard,
> 
> On 20/10/2025 at 12:13:10 +02, Richard Genoud <richard.genoud@bootlin.com> wrote:
> 
>> The H616 NAND controller is quite different from the A10 and A23 ones,
>> some registers offset changed, and some new one are introduced.
>> Also, the DMA handling is different (it uses chained descriptors)
>>
>> So, introduce a new compatible to represent this version of the IP.
>>
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>> ---
>>   .../mtd/allwinner,sun4i-a10-nand.yaml         | 41 +++++++++++++++++--
>>   1 file changed, 38 insertions(+), 3 deletions(-)
> 
> Please move the binding patch first in your series (binding then driver
> changes aligned with the introduced binding and then DT changes using
> it).
Yes, sorry, it took time but now I got it :)

> 
> Thanks,
> Miquèl
> 

Thanks!

-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

