Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF2CC9EC99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 16:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KmqMCQ5FHHOXu1tG1grk+l96qjTrtnJqGljFID7xJk=; b=1li6vakzsHgeSs4Dr+7EOZJP49
	87o2LlYDXWdUgdpP9+D7rKzdgxcJGEneJS2blcwXVn3C1LWMb+ntyVa6MSLDERGwoIWFo2DiURiN2
	EHRg/1m9WpHiMKNT5VK0bRd3BN0U9H/XYh9n6pnrqC1eYn+o+9MFhWuZcOUDFHp9CkI/FJ9C/6g1F
	/0bVf7GeQwZvFbq43Db6W/bUZQmw+BobnxDRYXYjl9Eh3JbN/127ZCofD6chX7Dl/XTQ1n9tK1IrP
	8Tnl1L9+ExmqjbEjSU114iG+O7HJzHK0Z/kOUcc5wfLV0KJdwCkUKTqkdNQY4inhLK+8SAxyw/2dQ
	8t11y4lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKNI-00000005grQ-2Wl7;
	Mon, 12 Jan 2026 16:02:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKNG-00000005gqv-1ocz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 16:02:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9745497;
	Mon, 12 Jan 2026 08:02:26 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B4AC3F59E;
	Mon, 12 Jan 2026 08:02:32 -0800 (PST)
Date: Mon, 12 Jan 2026 16:02:29 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <aWUbFb0q2-XuAySm@bogus>
References: <20251231213016.185575-1-marek.vasut+renesas@mailbox.org>
 <20260102-masked-spirited-labrador-33eae0@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102-masked-spirited-labrador-33eae0@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_080234_599180_041AA46C 
X-CRM114-Status: GOOD (  25.57  )
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

On Fri, Jan 02, 2026 at 12:39:12PM +0100, Krzysztof Kozlowski wrote:
> On Wed, Dec 31, 2025 at 10:29:18PM +0100, Marek Vasut wrote:
> > Document new property arm,poll-transport, which sets all SCMI operation into
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> 
> > poll mode. This is meant to work around uncooperative SCP implementations,
> > which do not generate completion interrupts. This applies primarily on mbox
> > shmem based implementations.
> > 
> > With this property set, such implementations which do not generate interrupts
> > can be interacted with, until they are fixed to generate interrupts properly.
> > 
> > Note that, because the original base protocol exchange also requires some
> > sort of completion mechanism, it is not possible to query SCMI itself for
> > this property and it must be described in DT. While this does look a bit
> > like policy, the SCMI provider is part of the hardware, hence DT.
> > 
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > ---
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Cristian Marussi <cristian.marussi@arm.com>
> > Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > Cc: arm-scmi@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-renesas-soc@vger.kernel.org
> > ---
> > V2: s@mean@&t and limit poll transport to mailbox/shmem only
> > ---
> >  .../devicetree/bindings/firmware/arm,scmi.yaml         | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > index be817fd9cc34b..f4bf4173c5c7e 100644
> > --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > @@ -146,6 +146,13 @@ properties:
> >        this platform. If set, the value should be non-zero.
> >      minimum: 1
> >  
> > +  arm,poll-transport:
> > +    type: boolean
> > +    description:
> > +      An optional property which unconditionally forces polling in all transports.
> > +      This is mainly meant to work around uncooperative SCP, which does not generate
> 
> Also not wrapped.
> 
> Anyway, you described the desired Linux feature or behavior, not the
> actual hardware. The bindings are about the latter, so instead you need
> to rephrase the property and its description to match actual hardware
> capabilities/features/configuration etc.
> 

I agree with this assessment. Rephrasing the property to reflect the actual
hardware/firmware characteristics makes more sense. Something along the lines
of `arm,no-completion-interrupt`, or a similar name, would better capture the
underlying reality, namely that the platform or firmware does not generate a
completion interrupt without encoding OS-specific policy or behavior.

-- 
Regards,
Sudeep

