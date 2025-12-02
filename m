Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4A1CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 14:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQkZeOctDCpQqXf+mxK8rShUyZIHh/01n1lcPG5Z7q4=; b=F8qEU9JkfKWna1M38z6ImuJZXh
	LQgQl87f/TBlI3sda2xq5a1k8bP12p8i5S5D/4IyyB9AHLBBJZpscCErfzwozeJo1Pa27sIrEnRFZ
	WQXTg2RmRR0HeqGsWelbrHeIAGpet/+xGveU5jXtiQW6mx85QHkm5MuQkwFxqUKepyQ4ve6NDbHp9
	pX30/O/6ZrK9RpLOSzMXYQxLwCJwNqKoXsz4TsF4Om1ECTPtdRSE0LuggQeFbhKQVtGXh/H708WE7
	0AwxVW039/cUctWhC0cRFs69/dYS4H712IwpO6c1WA09E0EofTQX7BHGVsv2sKpQBcUVQbZDiN6au
	qNe8rZvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQRkH-00000005WR3-0fDI;
	Tue, 02 Dec 2025 14:52:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQRkE-00000005WPq-0M9Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 14:52:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24A211477;
	Tue,  2 Dec 2025 06:52:37 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A91C3F66E;
	Tue,  2 Dec 2025 06:52:42 -0800 (PST)
Date: Tue, 2 Dec 2025 14:52:39 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, <arm-scmi@vger.kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <20251202-evasive-neon-rhino-d2745e@sudeepholla>
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <aPoxfH_TLrsMxMVQ@pluto>
 <70554674-7020-4582-a4e7-dbee34907096@mailbox.org>
 <5ae0a793-d3e7-45d1-bf5c-3c46593d1824@mailbox.org>
 <aRW7BZimWdpq4TyX@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRW7BZimWdpq4TyX@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_065246_269109_48A1A9CF 
X-CRM114-Status: GOOD (  37.99  )
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

On Thu, Nov 13, 2025 at 11:03:33AM +0000, Cristian Marussi wrote:
> On Thu, Oct 30, 2025 at 01:52:42AM +0100, Marek Vasut wrote:
> > On 10/23/25 4:00 PM, Marek Vasut wrote:
> > 
> > Hello again,
> > 
> 
> Hi,
> 
> bit of a late reply...
> 
> > > > On Thu, Oct 23, 2025 at 02:35:57PM +0200, Marek Vasut wrote:
> > > > > Document new property arm,poll-transport, which sets all SCMI
> > > > > operation into
> > > > > poll mode. This is meant to work around uncooperative SCP
> > > > > implementations,
> > > > > which do not generate completion interrupts. This applies
> > > > > primarily on mbox
> > > > > based implementations, but does also cover SMC and VirtIO ones.
> > > > 
> > > > Hi,
> > > > 
> > > > ..indeed I was thinking a while ago about exposing the existing
> > > > force- polling
> > > > switch but in my case it was purely a testing-scenario
> > > > configuration, so a
> > > > no-no for the DT, things are different if you have to describe an HW
> > > > that has
> > > > no completion IRQ also on the a2p channel...
> > > 
> > > Correct, at least until the SCP on this hardware is updated.
> > > 
> > > > ...having said that, though, usually polling-mode is reserved to a few
> > > > selected commands in a few chosen scenarios (as you may have seen),
> > > > 'carpet-polling' non-for-testing for all the commands on A2P seems a lot
> > > > inefficient and heavy...is it really a viable solution ? or these
> > > > systems use such a low rate of SCMI messages that polling after each and
> > > > every message is negligible ?
> > > > 
> > > > ..just to understand the context...
> > > 
> > > These systems are early in development and it is likely that the SCP
> > > will be updated to generate interrupts properly. Currently, this is not
> > > the case, hence the carpet-polling, until this is resolved.
> > 
> > While I was going through the SCMI spec, DEN0056F , page 209 , section "4.1
> > Shared memory based transport" , bullet • Completion interrupts, I found it
> > explicitly states:
> > 
> > "
> > This transport supports polling or interrupt driven modes of communication.
> > In interrupt mode, when the callee completes processing a message, it raises
> > an interrupt to the caller. Hardware support for completion interrupts is
> > optional.
> > "
> 
> Oh, yes...I knew that...it is just that till now, no systems were really
> ever developed that lacked the completion IRQ as a whole, it was, till now,
> more of a case of having the capability NOT to use it selectively at runtime
> and instead use polling when wanted (like for clock ops in ISR context)
> 

Indeed.

> I am not sure what is the reason why this only-polling scenario was never
> supported in the HW description, this indeed pre-dates my work on SCMI....
> ...I would/will check with Sudeep, when he's back, what are the reasons for
> this (if any)...
> 

As you mentioned earlier, no platform has required this before. I’m fine with
adding it, but we need to be more explicit about what it implies for SCMI. The
transport may be shared with other system components, and enforcing polling
for SCMI while the same transport generates interrupts for another user could
lead to issues.

Clearly defining these constraints would be helpful. It may also be useful to
note that this is primarily intended for mailbox transports, if that’s
accurate. Alternatively, we could keep the DT binding definition broader but
emit warnings when a transport other than mailbox is used. That approach might
make it easier to move forward.

-- 
Regards,
Sudeep

