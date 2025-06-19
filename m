Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E2DC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 19:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gkIvAdIcknw7YGYgEy5AX0Ny3blQrj6I2SRgxFMhm0A=; b=p+Pns9PpIBJWWqFlNYP5AASHHm
	BBn5e/ergpnsMJgj39EsgBUJSuCgdbWOW3hed5WpAWbTcl9pkjvWSBeygsYdsn/kU8wbI85QB6T67
	b+SQaevqvErf71Gf1XJjyvxOPsW+x90cQRt/hLUFvbrJTu2eq/HQaeggbNNYpHwFC5nkUuvkcnZuQ
	tB+eo+eVejykKHqHa2Ms0jEqXcha4PCUBoDZMm3qI2CNQbI86QS3UVlMHCu2LdUdWZQJ3Y3rR2kDb
	q5G1jf27AyRHms/+p6revqhN0XSCw3Q1O70IWnmxexsAV+m3PCn2tn5FSAxShapIOc3o3/o1GMPxY
	Amup7knA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLH8-0000000E8bf-3uxZ;
	Thu, 19 Jun 2025 19:50:19 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSI0c-0000000Dc0J-0iwt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 16:21:03 +0000
Message-ID: <cdeb54e8-0624-42de-bac2-25b151c37872@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750350057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gkIvAdIcknw7YGYgEy5AX0Ny3blQrj6I2SRgxFMhm0A=;
	b=o1oiWiCkmefm2k4pQhom1x13NN1mCxQEtwKqsY3LCg6R4zNo35wUI0HWjTuwvq/8KnittX
	DeTTv5QzBnpQWEuCfN2xouE7HmqFtOhD6r12vrIIG4x2pDVOLkYtApUapK6vkLJaKzNzr5
	tcf1+D5gXnfFpQwHkNsoRBOyjU+nZYc=
Date: Thu, 19 Jun 2025 12:20:53 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/9] dt-bindings: spi: zynqmp-qspi: Add example dual
 upper/lower bus
To: David Lechner <dlechner@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
 <20250616220054.3968946-3-sean.anderson@linux.dev>
 <2588bb7f-2a3a-4001-ab1b-6d9bd57b545b@baylibre.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <2588bb7f-2a3a-4001-ab1b-6d9bd57b545b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_092102_368478_015B5D86 
X-CRM114-Status: GOOD (  23.35  )
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

On 6/18/25 14:27, David Lechner wrote:
> On 6/16/25 5:00 PM, Sean Anderson wrote:
>> Add an example of the spi-buses property showcasing how to have devices
>> on both the upper and lower buses.
>> 
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>> 
>> Changes in v2:
>> - New
>> 
>>  .../bindings/spi/spi-zynqmp-qspi.yaml         | 22 ++++++++++++++++++-
>>  1 file changed, 21 insertions(+), 1 deletion(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
>> index 02cf1314367b..c6a57fbb9dcf 100644
>> --- a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
> 
> 
> In addition to changing the example, we could also extend the
> spi-buses property for this controller since we know this controller
> has 2 buses.
> 
>   properties:
>     ...
> 

OK, but this property is for the slaves not the master. I'm not sure what the right incantation is.

>     spi-buses:
>       description: 0 is the "lower" bus, 1 is the "upper" bus
>       maxItems: 2
>       items:
>         enum: [0, 1]
> 
> Not sure what to do about the default though since as discussed elsewhere,
> this controller needs the default bus number to be the CS number for
> backwards compatibility rather than `default: [0]` as is specified in the
> previous patch.
> 
> I suppose we could leave default out of the generic binding and leave it
> up to each individual controller to decide how to handle that.
> 
>> @@ -69,7 +69,7 @@ examples:
>>        #address-cells = <2>;
>>        #size-cells = <2>;
>>  
>> -      qspi: spi@ff0f0000 {
>> +      qspi: spi-controller@ff0f0000 {
> 
> It seems more common to have spi@ rather than spi-controller@.
> Is there a push to change this in general?

iirc I got a warning when running dt_binding_check. I can re-test this...

--Sean

