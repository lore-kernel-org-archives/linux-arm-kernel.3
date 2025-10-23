Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777C1CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 14:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gf2MsFdV29WQd9GdqcjCMTNSOwUcFGqIqq/f8B0YRXU=; b=ltSAyWDrxkgfrKZvMWZXORZMO7
	XfX5lyDZFyOyIvvh3qA7Tt4Lv2cnHr+kcMX6NQ5EmRI3yd/mmDHoJaQGHfc9b008eafgsiTUJxc2e
	YH7KpxmrEW8SH5deJDLQLmHge9yK0SprKPJamdYWaMY9PJlVpW/3eC1/fFmFCcoaaQop79D1kT6ee
	hrKnc06cl+xYYuw+jtNBCKDWqfZVDFeahg/s+FvdCjYILh4DZW5K4bwMckBjKD5ygZ4YkIA2VOWZn
	BCTNu77f3tH+cv+UGnIqAVaw7n4GDrwhh8GQCYAmIDlrhsTmFNdPyEQsH3NijS0kL7VaeBJgI6Cwv
	M6IJ38OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwQv-00000006cIV-0cww;
	Thu, 23 Oct 2025 14:36:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwQo-00000006cEy-0WrF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 14:36:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 943321516;
	Thu, 23 Oct 2025 07:36:37 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 654893F59E;
	Thu, 23 Oct 2025 07:36:43 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:36:40 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, arm-scmi@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <20251023-illustrious-almond-catfish-5010eb@sudeepholla>
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <20251023-able-fervent-tortoise-e7a6df@sudeepholla>
 <066449c8-4bca-41f1-990e-53d7672e3c0a@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <066449c8-4bca-41f1-990e-53d7672e3c0a@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_073646_202845_99A4F038 
X-CRM114-Status: GOOD (  20.89  )
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

So mailbox transport it is. Thanks for the info.

> > Introducing a property that enforces unconditional polling across all
> > platforms is not ideal - particularly if this is intended as a workaround
> > for a platform- or firmware- specific issue. Such implementations often get
> > replicated across platforms without addressing the root cause, leading to
> > wider inconsistencies.
> 
> The root cause is being addressed already, this is meant to keep the older
> SCP version operable.
> 

Good to know.

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

Good point, but ideally this is property of the transport itself. For example,
what does this "arm,poll-transport" can possibly mean for SMC/Optee transport ?

I understand this is a valid request, just not sure if this is the right way
to solve( i.e. Adding this property in the SCMI node in the proposed form).

Let me think and give others a chance to express their opinion.

-- 
Regards,
Sudeep

