Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9928DD767D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 14:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KqPX4vcUNnFX3kkrMFUaOeK4qrtKFVafhMHGWRVlv48=; b=uQVWId6EDivnkJH1S1MyLIb784
	B6+AN1MST6Xdyt4h5t+SDqWhWN5dSXmG9pl4PTmkLLFu3wtv5iWWdmvq5H+QleZ0Qm0tqtSECAwsY
	iXqajWEFdm65H6pn6QjnxYEnm/exgHFUkjGRMt/xomW/oT23CL4CZCEgKwvtuAxEl1m2V0WkYacgE
	hjOMv66VbT3Q8jAfkTxvvAxYxT9L4XR0vdaoehkqnfp9JOtC01PiC121uBqAQSkixn5QaMyz6tvqP
	Gq/eXJmMzgbVewVqgztl1SkC9pn9aBQjVfxauBPOPzqTzqqJ0NQ8I9FbI+EnHSTfXNlK5amO/46GN
	5bbj9mBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WRz-00000003rRF-0a9Z;
	Thu, 31 Oct 2024 14:47:03 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WGe-00000003pSv-2h67;
	Thu, 31 Oct 2024 14:35:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1730385317;
	bh=6n3NaF0whd9qg4xGC826BnFf5iZrFxIuvNVTdKeKwyM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hwRJQmwrFYT6ykY/ekESOcjW3v6tFj2bE6QIxkApk2LVsQ51qNSthzZqb8dSJ+z5G
	 H/GcYPVNWoY/Ej3t9YBiWx1xYdWb6RL8h3g+EnMpb88MPsfadobQIrk//LevFeQxl6
	 hNOunhUXMtH5rxkINUbaIcrHxGjbEMtDQGnEZEyuYd01qaN9o9Cqx6Ti8krK3Meunw
	 9F/H9rU1hJV/NBS1di/pFs0U/A1DD0qHYUupljp46SIEe010i+rQ4JXVEeh+TudFQ9
	 22NmFJ45YBztNlsIUaMUnCzw52CxxEToVHsQjof6SdjVhDQteeKKOCaTpM+9Z8Wjdf
	 Nb2hnr4GwfkRw==
X-Virus-Scanned: by epochal.quest
MIME-Version: 1.0
Date: Thu, 31 Oct 2024 11:35:14 -0300
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Turquette
 <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar
 <vireshk@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Yangtao Li
 <tiny.windzz@gmail.com>, Parthiban <parthiban@linumiz.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/13] dt-bindings: phy: sun50i-a64: add a100
 compatible
In-Reply-To: <20241031113651.4ab4f8c7@donnerap.manchester.arm.com>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-4-masterr3c0rd@epochal.quest>
 <20241031113651.4ab4f8c7@donnerap.manchester.arm.com>
Message-ID: <f33a995dc08e03af06f3f78864d77503@epochal.quest>
X-Sender: masterr3c0rd@epochal.quest
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_073520_799119_88C0F4D2 
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

On 2024/10/31 8:36 am, Andre Przywara wrote:
> On Thu, 31 Oct 2024 04:02:16 -0300
> Cody Eksal <masterr3c0rd@epochal.quest> wrote:
> 
>> The USB PHY found in the A100 is similar to that found in the D1. Add 
>> a
>> compatible for the A100.
>> 
>> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> 
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 
> Careful with that: you made quite some changes compared to v1, which 
> Rob
> ACKed, so I wouldn't carry over his tag here.
I had made a note of this a few days ago, but it slipped through my 
pre-submission review. I'm terribly sorry; won't make this mistake in 
the future.

- Cody

> Cheers,
> Andre
> 
>> ---
>> Changes in V2:
>>  - Update binding to allow using the D1 as a compatible.
>> 
>>  .../bindings/phy/allwinner,sun50i-a64-usb-phy.yaml     | 10 
>> +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml 
>> b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
>> index f557feca9763..21209126ed00 100644
>> --- 
>> a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
>> @@ -15,9 +15,13 @@ properties:
>>      const: 1
>> 
>>    compatible:
>> -    enum:
>> -      - allwinner,sun20i-d1-usb-phy
>> -      - allwinner,sun50i-a64-usb-phy
>> +    oneOf:
>> +      - enum:
>> +          - allwinner,sun20i-d1-usb-phy
>> +          - allwinner,sun50i-a64-usb-phy
>> +      - items:
>> +          - const: allwinner,sun50i-a100-usb-phy
>> +          - const: allwinner,sun20i-d1-usb-phy
>> 
>>    reg:
>>      items:

