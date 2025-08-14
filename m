Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1127CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 21:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKQKCKdoQNfp6rtU1TUv2GGPhoix0PV4K5iXj8bqWVM=; b=nwFT4tpJI47FR0z/1zPtV2N0w8
	2S7YtOnkJUnYpD7/3E5E1o9FHFoxq2OA7N0KtukrxpKzAHUFoM0t06jQWAZ8vgJLwzqjRZFnNNq89
	5xftMSkWC5NOFyD9D9/TiNRqNF9IA+e85ir+hAoxcHagFQRiv5vUdQJnOok963Uqyi42vT1sdLluJ
	yiV3tlQ8WwBqB9yTxWxAWd3dpnQ+AJ9a6BT8qaiArMh+ixBbWXR3hmUezDxwLZYH6/tZL7FgjAg3v
	DqLNZCy7uw1UL79n9jMZuywd7RSReSqQED+Lz+HWOzi5R7Zhc46Dgt96Vjsg5P7XoO8xvmH7DGnkv
	4/olGHNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umfMv-00000000a7B-3TW9;
	Thu, 14 Aug 2025 21:20:17 +0000
Received: from out-188.mta1.migadu.com ([2001:41d0:203:375::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umfIO-00000000Zbd-1i1d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 21:15:38 +0000
Message-ID: <5b02293b-9c86-441b-9344-2d0263eb1659@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755206120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rKQKCKdoQNfp6rtU1TUv2GGPhoix0PV4K5iXj8bqWVM=;
	b=bMAF2nsjqddUD0FSYINQ4+GBoC9IZeWo495h5DH87tu6YK7wtPoGD8Wb/rPZluT9MZy6b1
	xn/uaQvYYVjtIi+72cpFNweM+3Lczt/G9OtQsx3HvzytEBPbXUZjbpxmGGfz+CAa0GSVR9
	BvlDAAiqioSHtDAYeNhhpiDQ0/Y45Qk=
Date: Thu, 14 Aug 2025 17:15:14 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/9] dt-bindings: spi: Add spi-buses property
To: David Lechner <dlechner@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
 <20250616220054.3968946-2-sean.anderson@linux.dev>
 <1a87f436-317b-40e0-a655-cd82f969f22e@baylibre.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <1a87f436-317b-40e0-a655-cd82f969f22e@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_141536_655422_9EAAD8C1 
X-CRM114-Status: UNSURE (   9.69  )
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

On 8/14/25 16:55, David Lechner wrote:
> On 6/16/25 5:00 PM, Sean Anderson wrote:
>> From: David Lechner <dlechner@baylibre.com>
>> 
>> Add a spi-buses property to the spi-peripheral-props binding to allow
>> specifying the SPI bus or buses that a peripheral is connected to in
>> cases where the SPI controller has more than one physical SPI bus.
>> 
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>> 
> FYI, Mark's filters won't pick up `dt-bindings: spi:`, we need to change
> the subject line to `spi: dt-bindings:` on the next revision.
> 

Sounds like he should fix his filter then.

--Sean

