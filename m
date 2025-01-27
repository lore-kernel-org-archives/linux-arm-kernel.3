Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060FFC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 18:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8Ru8ILQt5YFwEkLQVtu+jlM11XhzHTarqvoBjmEMYo=; b=BjmGkdI69asebezeQYh3X4RezK
	idY4imT7J8cOcHkqnLWxbqpM2+HN9evPgLklzqpKmhBt0SBRsV+KBr8DwshKZJvNRbfgQu+FVds1z
	H5j+qz3YOOm5GNp7pqduo/N91xVhQbYHixxgnpvlkF53OOdlgzjpIES2EDyni2JFRGnS2+LbKTLTG
	bgLXioSPVU7IlOaxmTvmwuQrRNUQecCV3HK4SuWZPdzmqvUsFgI9OnQxhXwkNKbWIkgb+XXhrbUjL
	grkV4t+bliG0sLUJdPIVC7353CeaNHnWT5rY/NrS6C8UZT7wNaa/qani/fwNe4rQi8iL2912yWTJO
	jpFS4czQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTRP-00000002yyy-3XYU;
	Mon, 27 Jan 2025 18:02:31 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTPT-00000002yDA-1OdA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 18:00:32 +0000
Message-ID: <50370a62-2e5e-45de-888f-ef3d1bfbb482@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738000818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w8Ru8ILQt5YFwEkLQVtu+jlM11XhzHTarqvoBjmEMYo=;
	b=vMhuLTt9/XtylOqFAAaifb88drjAdXo0hXinvRFeza0t+LZYsthkZP9Gb987JhA+1/3api
	N+YiH+hc9iA6eLVCqENqySAKqYDLQq6lTvoE8ewlD//CoW5xnrJIEy/3eMcU5dDeQQ/DEz
	cbHLRoq6oM+7OWLqg2B1EfwpNuF+UBA=
Date: Mon, 27 Jan 2025 13:00:14 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] dt-bindings: spi: zynqmp-qspi: Add reset
To: Rob Herring <robh@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org
References: <20250116225521.2688224-1-sean.anderson@linux.dev>
 <20250116225521.2688224-2-sean.anderson@linux.dev>
 <8a0d8789-7a0d-42b7-9aff-e867c14db3c9@amd.com>
 <b8e63009-13fb-493f-adf6-4d30adbe9b1b@linux.dev>
 <20250123224520.GA456390-robh@kernel.org>
 <34e84bd2-381b-4f3e-99e1-92f7a878ed15@linux.dev>
 <20250127175752.GA511180-robh@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250127175752.GA511180-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_100031_591754_2955473F 
X-CRM114-Status: GOOD (  21.52  )
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

On 1/27/25 12:57, Rob Herring wrote:
> On Thu, Jan 23, 2025 at 05:57:41PM -0500, Sean Anderson wrote:
>> On 1/23/25 17:45, Rob Herring wrote:
>> > On Fri, Jan 17, 2025 at 11:12:15AM -0500, Sean Anderson wrote:
>> >> On 1/17/25 02:14, Michal Simek wrote:
>> >> > 
>> >> > 
>> >> > On 1/16/25 23:55, Sean Anderson wrote:
>> >> >> Add a reset to help recover from cancelled operations.
>> >> >>
>> >> >> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> >> >> ---
>> >> >>
>> >> >>   Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml | 6 ++++++
>> >> >>   1 file changed, 6 insertions(+)
>> >> >>
>> >> >> diff --git a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
>> >> >> index 04d4d3b4916d..901e15fcce2d 100644
>> >> >> --- a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
>> >> >> +++ b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
>> >> >> @@ -36,12 +36,16 @@ properties:
>> >> >>     power-domains:
>> >> >>       maxItems: 1
>> >> >>   +  resets:
>> >> >> +    maxItems: 1
>> >> >> +
>> >> >>   required:
>> >> >>     - compatible
>> >> >>     - reg
>> >> >>     - interrupts
>> >> >>     - clock-names
>> >> >>     - clocks
>> >> >> +  - resets
>> >> > 
>> >> > In 2/5 you are calling devm_reset_control_get_optional_exclusive() that's why I expect reset is not really required property.
>> >> 
>> >> It's optional for the driver for backwards compatibility. But for the
>> >> devicetree we make it mandatory since it should be included in all new
>> >> devicetrees.
>> > 
>> > Generally, we discourage new required properties as that's an ABI 
>> > change. The exception is really when optional was a mistake. That's 
>> > arguably the case here if the h/w always has a reset.
>> 
>> This device has a reset on ZynqMP and Versal.
>> 
>> The driver still considers this property optional, so it's not an ABI break.
>> But I made it required in the schema to help out the folks at AMD when they
>> get around to upstreaming the Versal devicetree :)
> 
> Not 'the driver', but 'a driver'. You can't say what *all* drivers do. 
> If I write a new driver and read the schema, then I can say 'resets is 
> required so I'll make it required in my new driver'. But then my new 
> driver doesn't work with an older DT that didn't have resets which was 
> valid at the time.

OK, I'll add a description to this effect. The humans can read that, and
the machines won't care.

--Sean

