Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130D6CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 14:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2HlePpPozTZfJVZxFY5BSarP/C7SUxnyfyvVCip4BIU=; b=IqdoNfxP7rcJ/fY8cEFI4AZ5EX
	aAd9MjZqPOj4cVgLn1TVhgcstnn7Y/xCAbmOWfdEUfYoXEtHzO/TIcsb0CXAvDPzj5jHAhNbefuch
	piMWmtU/FoYHQY6eKjial6pjCs4hmrEmb2L4ut88Vi5beHQ0ZxdmgFi6KgzRvZq4II8HbfhYDzCGj
	ocWHqIt4oenzqr3+JvOKjYCF0dQUdDif6ZZrdHc3aEu9LbzLqX2IhNuBRanOgsr0NZkkgToV4TKVN
	zyYIJ1RN/u+W7IoUJKOzHQxgTEkzmZvyMuVKlcd+PpPue5fR76oP7W9gqb9Aw/YECZD+Yt9LHZzBB
	K5xZGKIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwKg-00000006bOA-3cvM;
	Thu, 23 Oct 2025 14:30:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwKe-00000006bNh-3b6R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 14:30:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D13C1516;
	Thu, 23 Oct 2025 07:30:16 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C11683F59E;
	Thu, 23 Oct 2025 07:30:21 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:30:18 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <aPo7-oQq6RskSZ96@pluto>
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <20251023-able-fervent-tortoise-e7a6df@sudeepholla>
 <066449c8-4bca-41f1-990e-53d7672e3c0a@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <066449c8-4bca-41f1-990e-53d7672e3c0a@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_073025_010980_3556E318 
X-CRM114-Status: GOOD (  25.23  )
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

On Thu, Oct 23, 2025 at 03:42:02PM +0200, Marek Vasut wrote:
> On 10/23/25 3:16 PM, Sudeep Holla wrote:
> 
> Hello Sudeep,

Hi Marek,

> 
> > > +  arm,poll-transport:
> > > +    type: boolean
> > > +    description:
> > > +      An optional property which unconditionally forces polling in all transports.
> > > +      This is mainly mean to work around uncooperative SCP, which does not generate
> > > +      completion interrupts.
> > > +
> > 
> > Could you please clarify which platform and transport this change pertains to?
> 
> Renesas X5H with older SCP firmware , accessible via mailbox.
> 
> > Introducing a property that enforces unconditional polling across all
> > platforms is not ideal - particularly if this is intended as a workaround
> > for a platform- or firmware- specific issue. Such implementations often get
> > replicated across platforms without addressing the root cause, leading to
> > wider inconsistencies.
> 
> The root cause is being addressed already, this is meant to keep the older
> SCP version operable.
> 

If this is the case, at first I would have tempted to say why not use the SCMI
Quirk framework (with needed changes/evolutions), BUT then I realized that being
the Quirk to be applied on the transport there is no way to gather SCMI
Vendor info and versions from the platform, so you would have to match on the
compatible, which is essentially similar approach of having a new DT
prop...just less flexible so I understand the need of your new-prop approach...

...BUT...(maybe a weird idea)...what if we think about enabling:

 - one Quirk EARLY-ON based on the current potentially affected compatibles
   with such a quirk forcing polling ONLY for the BASE Protocol SCMI queries
   so that the SCMI core can gather Vendor Info and versions in any case..
   (this would need the Quirk frmwk to be evolved to support such
    'early-quirks' based on compatibles only)

 - a second regular Quirk, filtered by the just retrieved Vendor INFO and FW
   version to finally decide if the system needs force-polling to be really
   enabled for all the following messages...

... this was you dint even need to ship any new DT

> > It would be preferable to scope this behavior using the platform’s compatible
> > string. This approach ensures the workaround is applied only to the affected
> > platform and prevents it from being inadvertently enabled elsewhere, unless
> > another platform intentionally uses the same compatible string (which seems
> > unlikely).
> 
> This is not platform-specific issue. SCMI provider which fails to generate
> interrupts can appear on any platform, using either transport, that is why I
> made the property generic.
> 

So the deployment scenario would be to update new machines with a fully
working SCP FW with completion-IRQ while updating ONLY the DTBs with the
new force-polling property in the older machines with the older
poll-only SCP fw ? (to understand)

Thanks,
Cristian

