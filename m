Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E52BCA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnKB1/Ufaqgg4Uj8GyIwDI8Vao4ATbv9GiVbMHy8WVA=; b=Ih7i9qBrbbXL57NpoNITT9yjOh
	v6rA+3WZKNEglafemBqJ/0pcyTf8eGd3FrFJM/0brUjxi9Ha2ZWGXfTOaeS1sHRmMX47iFbH28E/3
	qXr7p7adXDzrCMKPX5FCVLDoEJitYdGrJPgZPeZ0qqO5ri/mkLIO3sI969/lKIsCc2+2pUCNQtgMI
	knjWXa8AkhXeXX1yGSKw5dSdXEHM/6tEle+OrdVjXwX65DIVf1sUglasJUq5dfXlhh/W8LWOt21CU
	laZE2WbdHTgXOULrE2jd7bDfUjGUgCn+jLAFwOdrn0PawAGcMMvWDsb6IvKeKW6KGY/oKHUhglNR2
	jp1noaIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3hs-000000089a4-1jnZ;
	Mon, 18 Aug 2025 17:31:40 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1IV-00000007rgG-3sF6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 14:57:21 +0000
Message-ID: <0a3b69b8-e868-49c8-a0ca-c448ee3cd488@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755529036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rnKB1/Ufaqgg4Uj8GyIwDI8Vao4ATbv9GiVbMHy8WVA=;
	b=cYEqHqx6zmsFWzI1DlT26wxFXuVBrL8Y04M0JduHYf20UEoKf3C4ZGl/okEeKg2iMlPMzc
	ABfD0lBg/TUR6igtOjna9ThcFbkwt0iWhjWPnuEZ/EY1bdm76sbVYyLvUohMvhjpZ3sybL
	1n9RWwZDZRaAJ1ePZ6MfkhaOa6WOPjU=
Date: Mon, 18 Aug 2025 10:56:50 -0400
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
 <ded7ba99-089b-47a7-95b9-ca6666dc3e29@baylibre.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <ded7ba99-089b-47a7-95b9-ca6666dc3e29@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_075720_153007_C52FE927 
X-CRM114-Status: GOOD (  17.62  )
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

On 8/15/25 11:49, David Lechner wrote:
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
>> Changes in v2:
>> - New
>> 
>>  .../devicetree/bindings/spi/spi-peripheral-props.yaml  | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
>> index 8fc17e16efb2..cfdb55071a08 100644
>> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
>> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
>> @@ -89,6 +89,16 @@ properties:
>>      description:
>>        Delay, in microseconds, after a write transfer.
>>  
>> +  spi-buses:
>> +    description:
>> +      Array of bus numbers that describes which SPI buses of the controller are
>> +      connected to the peripheral. This only applies to peripherals connected
>> +      to specialized SPI controllers that have multiple SPI buses on a single
>> +      controller.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
> 
> Finally have some hardware to test this series with using 2 or 4 buses.
> I found that we also need an absolute max here to make the bindings checker
> happy. 8 seems sensible since I haven't seen more than that on a peripheral.
> We can always increase it if we find hardware that requires more buses.
> 
> 	maxItems: 8

What is the error you get without this?

--Sean


