Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4142C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27fXVhxsftq5EDoqBWvyXb7dA+Q8HBVNKfdnJWl2xe0=; b=1yv2BRvk6BFsrdz6eDKTqJDD6B
	8qxx0SFvxuRXyqEpgUzBJLcfZxlF5lU2gLEmbEUlzAQcKgF53Zt/ucwR1ke4lZa+w+Ymjy8Nfn8yW
	MKXoSfwgNJGwm0lUnleAlvPCRMcGwmyqkoaAChuZE5T3RBUHp6m/r+/veCxQoxXq5R7xOjAiIvF5w
	B4bWTFziHVQOQKU/WsB6Q7nWs/exVwfkZmHUZKlq36+3e9WkHd+lDQ9Y8Gg1a+e0vpNmQv0HZyOLz
	z8JguECiYPFWqMjEfdxORvF+pyvUhj7K1zdUqtEpna/vur8eDFZDs1w0pRF+GU/EKd0qgY3W98vb0
	XxuCcIKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8xe-0000000HGQR-2yAC;
	Fri, 13 Jun 2025 18:17:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6mx-0000000Gyk2-0q5k
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Jun 2025 15:57:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=27fXVhxsftq5EDoqBWvyXb7dA+Q8HBVNKfdnJWl2xe0=; b=l3PHMxJxsI2qlYf4GgWhU3nL9y
	jkAVeN5aDoZIx4FUYtiW4N6b4HvJpLznh9rphM7AQvQPVdVQYxLc+ISk/qNIPtjPlpXxgTNEaXQql
	1NGNjwDTDQthEgP2AmxlWofKke3i7ZZV+qdB8pS0i+GfEsP+LJ4s002lwq25ArSPq0DgYZLjgHKQN
	6XaOfHpANLY/7tb11TRrL+1PD9BDrYvDqwcbEJux4dMHt2tpk684tIOdolTy021rKiLjJkUj3HMGv
	8fty/UCdDkeJVbNX2runoUKzKaIkeTbfaLl86HwYP1+Cc1vIFJRew638dgpVoydim/5UN2h2PMP/z
	i6oTsCAA==;
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6mu-000000032GC-2wOk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 15:57:54 +0000
Message-ID: <f3160819-f6f4-4079-9562-802caa2fef20@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749830260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27fXVhxsftq5EDoqBWvyXb7dA+Q8HBVNKfdnJWl2xe0=;
	b=IRz3QDl5Oaf6RGCCivGPUThJ0GToGh3KlZtALUtgQYMqrgWJ+JZK2lZPIfeLG4Ne09vrs6
	lRM43ovdJrUzgRco9Z9lLR3THckDkWE8OTIG/rXRKwdY6iCB/+Ag2fwNwNI9qKOi2VjhoH
	+ByATj80xnUHOoEN2OPUX3JxHEPLOXU=
Date: Fri, 13 Jun 2025 11:57:34 -0400
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] dt-bindings: spi: zynqmp-qspi: Split the bus
To: David Lechner <dlechner@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-arm-kernel@lists.infradead.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>
References: <20250116232118.2694169-1-sean.anderson@linux.dev>
 <20250116232118.2694169-2-sean.anderson@linux.dev>
 <9f40295b-484a-48e8-b053-ff8550e589d7@baylibre.com>
 <46a7eba6-a705-4543-b967-e83ccc89e7d4@linux.dev>
 <6afc379a-2f9f-4462-ae30-ef6945a83236@baylibre.com>
 <dbe26b36-a10c-4afb-88ad-a6f7f9bff440@linux.dev>
 <4923f49f-273f-4166-94bc-afe39618672c@baylibre.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <4923f49f-273f-4166-94bc-afe39618672c@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_165752_908976_18B0039D 
X-CRM114-Status: GOOD (  23.98  )
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

On 6/13/25 10:20, David Lechner wrote:
> On 6/12/25 6:44 PM, Sean Anderson wrote:
>> Hi David,
>> 
>> I am (finally!) getting around to doing v2 of this series, and I ran
>> into a small problem with your proposed solution.
>> 
>> On 1/23/25 16:59, David Lechner wrote:
>>> ---
>>> From: David Lechner <dlechner@baylibre.com>
>>> Date: Thu, 23 Jan 2025 15:35:19 -0600
>>> Subject: [PATCH 2/2] spi: add support for multi-bus controllers
>>>
>>> Add support for SPI controllers with multiple physical SPI buses.
>>>
>>> This is common in the type of controller that can be used with parallel
>>> flash memories, but can be used for general purpose SPI as well.
>>>
>>> To indicate support, a controller just needs to set ctlr->num_buses to
>>> something greater than 1. Peripherals indicate which bus they are
>>> connected to via device tree (ACPI support can be added if needed).
>>>
>>> In the future, this can be extended to support peripherals that also
>>> have multiple SPI buses to use those buses at the same time by adding
>>> a similar bus flags field to struct spi_transfer.
>>>
>>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>>> ---
>>>  drivers/spi/spi.c       | 26 +++++++++++++++++++++++++-
>>>  include/linux/spi/spi.h | 13 +++++++++++++
>>>  2 files changed, 38 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
>>> index 10c365e9100a..f7722e5e906d 100644
>>> --- a/drivers/spi/spi.c
>>> +++ b/drivers/spi/spi.c
>>> @@ -2364,7 +2364,7 @@ static void of_spi_parse_dt_cs_delay(struct device_node *nc,
>>>  static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
>>>  			   struct device_node *nc)
>>>  {
>>> -	u32 value, cs[SPI_CS_CNT_MAX];
>>> +	u32 value, buses[8], cs[SPI_CS_CNT_MAX];
>>>  	int rc, idx;
>>>  
>>>  	/* Mode (clock phase/polarity/etc.) */
>>> @@ -2379,6 +2379,29 @@ static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
>>>  	if (of_property_read_bool(nc, "spi-cs-high"))
>>>  		spi->mode |= SPI_CS_HIGH;
>>>  
>>> +	rc = of_property_read_variable_u32_array(nc, "spi-buses", buses, 1,
>>> +						 ARRAY_SIZE(buses));
>>> +	if (rc < 0 && rc != -EINVAL) {
>>> +		dev_err(&ctlr->dev, "%pOF has invalid 'spi-buses' property (%d)\n",
>>> +			nc, rc);
>>> +		return rc;
>>> +	}
>>> +
>>> +	if (rc == -EINVAL) {
>>> +		/* Default when property is omitted. */
>>> +		spi->buses = BIT(0);
>> 
>> For backwards compatibility, the default bus for CS 1 on gqspi must be 1
>> and not 0. Ideally there would be some hook for the master to fix things
>> up when the slaves are probed, but that doesn't seem to exist. I was
>> thinking about doing this with OF changesets. Do you have any better
>> ideas?
>> 
> 
> Does this work? 
> 
> 		spi->buses = BIT(cs[0]);
> 
> (would have to move all the new code after cs[0] is assigned of course)

Yeah, but do we really want to make this the default for all drivers?
This is really a quirk of the existing gqspi binding and I don't think
it makes sense in general.

--Sean

