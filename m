Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B98EC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 22:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5vETblkns4myv0L36tnPYvQDxGkuxSXvQ+u+++b6uc=; b=2wdKtyx6hYY6RzeruKDVeerZGA
	718gMWp/it/zFfKpvZzE2HT86c//dMTG2Zdd1gqVIYxyWBFQ6zItykJtioUTErKu5sW1jsNMwMjj7
	kF2RZiJMLHigEz6NDJQh8757s3ZCvyh2nY5dk9uGHuUMI3DTvk5zkI/A8+U6te3n8fHbYyVqxizW7
	R3z4wqXeEzMl+VuxcnJawx4ej3k0/dWujdOI+bclyRdBkjtVVLLlIMY3hUCeyLFOhtj6bVrMzs7ih
	joi0DLxNox+sY40VhwGkNArw68ujfa+tCJP/3hsdPdWdszpH4VzuBOhLGLkpSJT8xFWPB3ebd4HV0
	5U3X+MGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb6AI-0000000DSPb-3MZF;
	Thu, 23 Jan 2025 22:59:10 +0000
Received: from out-173.mta1.migadu.com ([2001:41d0:203:375::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb68z-0000000DSHe-1L8N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 22:57:51 +0000
Message-ID: <34e84bd2-381b-4f3e-99e1-92f7a878ed15@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737673066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q5vETblkns4myv0L36tnPYvQDxGkuxSXvQ+u+++b6uc=;
	b=UWMHVbsVeOqCg1tbtZ5magJB5bC76eSbbvBnvaJ0k5mWY3C/RUdQPQcisluKOJMIWkuiru
	QgzUcrPMpwhCrCi1seyFemiz6RO+s43G4LiZS0elucLnEDAu1i8WqdtYaW22T5ucw+KTGU
	bAF8FjTxdUqOh6VtYsckqRjXlUI104w=
Date: Thu, 23 Jan 2025 17:57:41 -0500
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250123224520.GA456390-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_145749_566614_EBC240A9 
X-CRM114-Status: GOOD (  17.36  )
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

On 1/23/25 17:45, Rob Herring wrote:
> On Fri, Jan 17, 2025 at 11:12:15AM -0500, Sean Anderson wrote:
>> On 1/17/25 02:14, Michal Simek wrote:
>> > 
>> > 
>> > On 1/16/25 23:55, Sean Anderson wrote:
>> >> Add a reset to help recover from cancelled operations.
>> >>
>> >> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> >> ---
>> >>
>> >>   Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml | 6 ++++++
>> >>   1 file changed, 6 insertions(+)
>> >>
>> >> diff --git a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
>> >> index 04d4d3b4916d..901e15fcce2d 100644
>> >> --- a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
>> >> +++ b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
>> >> @@ -36,12 +36,16 @@ properties:
>> >>     power-domains:
>> >>       maxItems: 1
>> >>   +  resets:
>> >> +    maxItems: 1
>> >> +
>> >>   required:
>> >>     - compatible
>> >>     - reg
>> >>     - interrupts
>> >>     - clock-names
>> >>     - clocks
>> >> +  - resets
>> > 
>> > In 2/5 you are calling devm_reset_control_get_optional_exclusive() that's why I expect reset is not really required property.
>> 
>> It's optional for the driver for backwards compatibility. But for the
>> devicetree we make it mandatory since it should be included in all new
>> devicetrees.
> 
> Generally, we discourage new required properties as that's an ABI 
> change. The exception is really when optional was a mistake. That's 
> arguably the case here if the h/w always has a reset.

This device has a reset on ZynqMP and Versal.

The driver still considers this property optional, so it's not an ABI break.
But I made it required in the schema to help out the folks at AMD when they
get around to upstreaming the Versal devicetree :)

> Unfortunately, there's not a way to distinguish 'required' from 
> 'required for new users'.

I will add a note to the commit message about this situation.

--Sean


