Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EA3CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 13:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGebjHKRfzPVk+ecjABgASDoh90W7jcoqL3Vy9FsoVU=; b=Hd07SZm7rsuaHfMVIgOVYostdL
	xUqsH3M0LnEhvYOx6HKS1/FDdRRjnj9+NdKqIlMPSlQQ4R5fO3Oh6LwncLqU1S61OyHrGPeJUnUc8
	jZyyzT8dSWZJXED2MxZJYSj47RH79WFwvN5kWLE3RrSFsDgz87xmxsFC9t/yBfvi8I75gO60WVAYg
	5Nh77F99b31DAke9MqA+HJ3L1nKnbgDPiQGWT9QzcWNKK8W/HrUUKJBIOLE3kzbCkpGXhcF71B/Qh
	iX/QAMy8TMXQ5s8AztnSIKfuvl/p+HWvKUa4g+UqAEb5trhuCMNtJ40MzngY1S4wY9dw8ts6SKidl
	5T1FsGbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvak-00000006SAc-35uM;
	Thu, 23 Oct 2025 13:42:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvai-00000006S9b-217W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 13:42:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B56271516;
	Thu, 23 Oct 2025 06:42:47 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A791E3F63F;
	Thu, 23 Oct 2025 06:42:53 -0700 (PDT)
Date: Thu, 23 Oct 2025 14:42:50 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: <arm-scmi@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <20251023-active-blue-collie-2978ea@sudeepholla>
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <20251023-able-fervent-tortoise-e7a6df@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-able-fervent-tortoise-e7a6df@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_064256_633971_70A202C6 
X-CRM114-Status: GOOD (  25.47  )
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

On Thu, Oct 23, 2025 at 02:16:39PM +0100, Sudeep Holla wrote:
> On Thu, Oct 23, 2025 at 02:35:57PM +0200, Marek Vasut wrote:
> > Document new property arm,poll-transport, which sets all SCMI operation into
> > poll mode. This is meant to work around uncooperative SCP implementations,
> > which do not generate completion interrupts. This applies primarily on mbox
> > based implementations, but does also cover SMC and VirtIO ones.
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
> >  Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > index be817fd9cc34b..b53754a318ea1 100644
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
> > +      This is mainly mean to work around uncooperative SCP, which does not generate
> > +      completion interrupts.
> > +
> 
> Could you please clarify which platform and transport this change pertains to?
> 
> Introducing a property that enforces unconditional polling across all
> platforms is not ideal - particularly if this is intended as a workaround
> for a platform- or firmware- specific issue. Such implementations often get
> replicated across platforms without addressing the root cause, leading to
> wider inconsistencies.
> 

Just to clarify what I mean by "enforces unconditional polling" is with the
added DT property only. I understand this is new property and it much be
present in DT to enforce polling, but it can be misused initially for testing
in absence of interrupt support and forgotten in DT. Hence my concern.

-- 
Regards,
Sudeep

