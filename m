Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4959C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 16:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAafNvBOoBqFNHA52xBWNRgKage9FNdyIdPTvz9ryLQ=; b=H6S4YhJT+/4zagY6vgUWGQxcRX
	heamwI6WPom4PP9NTWBFHHuwhHVoZjIamE2VUgm0QXpo5tAmQa2NRAFeTW4OWHvIeYHxkS1ULf8ut
	wNAEZzPNj7HHnqKoliV16xNgqO7Z3ugPkm2t7JzQgA9xif1/qkAShQf1SA8H1sXwHSvK2K7KXtDbs
	LWesN7/BHfqs2VKD0NqnYBAXPk2bqPVqmkgSm3GDUxp7Omih1Rg2s7DiukP4hG3xi3tq0wLrWmx2O
	qJ+Y4PIX0D9jsgFV7XeO22YE7X466S5/HCfw2BX8aTl+bLZJ+Chs29gMY+5yE07v9QasYqBj3Uh9+
	fAlMcxQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoyf-00000000kMg-2gmR;
	Fri, 17 Jan 2025 16:13:45 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoxO-00000000k0x-0b6k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 16:12:27 +0000
Message-ID: <b8e63009-13fb-493f-adf6-4d30adbe9b1b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737130341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LAafNvBOoBqFNHA52xBWNRgKage9FNdyIdPTvz9ryLQ=;
	b=Qbnb/+5+g3FPDnxiXhWamAP1eU9Ei23rwSWRcBCjFbUjaG9MDZITUKaTTkjGI6RbUUBEwv
	a6MN3mwUINhnKgBWgzZ8TGSVl9K7f62rK72h2PdpJ1FlgOqA477tFoqZMAzSFqJUCMEVLx
	ZWD6r4AVCfIxnkSdmMoPdbwvwocyQPQ=
Date: Fri, 17 Jan 2025 11:12:15 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] dt-bindings: spi: zynqmp-qspi: Add reset
To: Michal Simek <michal.simek@amd.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-arm-kernel@lists.infradead.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20250116225521.2688224-1-sean.anderson@linux.dev>
 <20250116225521.2688224-2-sean.anderson@linux.dev>
 <8a0d8789-7a0d-42b7-9aff-e867c14db3c9@amd.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <8a0d8789-7a0d-42b7-9aff-e867c14db3c9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_081226_322985_3A401123 
X-CRM114-Status: GOOD (  10.73  )
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

On 1/17/25 02:14, Michal Simek wrote:
> 
> 
> On 1/16/25 23:55, Sean Anderson wrote:
>> Add a reset to help recover from cancelled operations.
>>
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>>
>>   Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
>> index 04d4d3b4916d..901e15fcce2d 100644
>> --- a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
>> @@ -36,12 +36,16 @@ properties:
>>     power-domains:
>>       maxItems: 1
>>   +  resets:
>> +    maxItems: 1
>> +
>>   required:
>>     - compatible
>>     - reg
>>     - interrupts
>>     - clock-names
>>     - clocks
>> +  - resets
> 
> In 2/5 you are calling devm_reset_control_get_optional_exclusive() that's why I expect reset is not really required property.

It's optional for the driver for backwards compatibility. But for the
devicetree we make it mandatory since it should be included in all new
devicetrees.

--Sean

