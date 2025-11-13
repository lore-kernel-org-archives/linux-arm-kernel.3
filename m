Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07702CD5BC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 11:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MD5uXzVGGApG7p8HRtAp+gA1hKTXj4ZXoGDhCs//GoQ=; b=2p9JFt0FKxcgn+0a7DC/Q3olHV
	Tc85lx6eJ7wABtLbi9Q2rfvic1jIRJGamxwph3qAcnaYCdvo7U6Jod6uqg/wtocXb4/rvzXMHXr4f
	PI4vC90BQlkA3V0FQQ4XWqR++zTSqSOFQzsaYWyeqx2BszHEWW7m5Ft1DBMdjm6PQct9zm3NDjNRF
	FZV9SQ4EEvSmcPsfDoSePllNsFDA8ZN7o9P3JBu9zXGojY2EZNoYSt9lOOY4zi8sxc7UtGcU7n3p/
	QHu8pol4cueLM63wViKjKKA/+4lwe5JZkYDDanZkvW9fSuhC+q4bRvZJDq1iPGTdreG3s5Vnr33ZY
	SKk7qy2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJV75-0000000AMGD-44jC;
	Thu, 13 Nov 2025 11:03:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJV74-0000000AMFB-0wMD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 11:03:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9CDC12FC;
	Thu, 13 Nov 2025 03:03:29 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11CCA3F66E;
	Thu, 13 Nov 2025 03:03:35 -0800 (PST)
Date: Thu, 13 Nov 2025 11:03:33 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <aRW7BZimWdpq4TyX@pluto>
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <aPoxfH_TLrsMxMVQ@pluto>
 <70554674-7020-4582-a4e7-dbee34907096@mailbox.org>
 <5ae0a793-d3e7-45d1-bf5c-3c46593d1824@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ae0a793-d3e7-45d1-bf5c-3c46593d1824@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_030338_393199_0E816965 
X-CRM114-Status: GOOD (  29.33  )
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

On Thu, Oct 30, 2025 at 01:52:42AM +0100, Marek Vasut wrote:
> On 10/23/25 4:00 PM, Marek Vasut wrote:
> 
> Hello again,
> 

Hi,

bit of a late reply...

> > > On Thu, Oct 23, 2025 at 02:35:57PM +0200, Marek Vasut wrote:
> > > > Document new property arm,poll-transport, which sets all SCMI
> > > > operation into
> > > > poll mode. This is meant to work around uncooperative SCP
> > > > implementations,
> > > > which do not generate completion interrupts. This applies
> > > > primarily on mbox
> > > > based implementations, but does also cover SMC and VirtIO ones.
> > > 
> > > Hi,
> > > 
> > > ..indeed I was thinking a while ago about exposing the existing
> > > force- polling
> > > switch but in my case it was purely a testing-scenario
> > > configuration, so a
> > > no-no for the DT, things are different if you have to describe an HW
> > > that has
> > > no completion IRQ also on the a2p channel...
> > 
> > Correct, at least until the SCP on this hardware is updated.
> > 
> > > ...having said that, though, usually polling-mode is reserved to a few
> > > selected commands in a few chosen scenarios (as you may have seen),
> > > 'carpet-polling' non-for-testing for all the commands on A2P seems a lot
> > > inefficient and heavy...is it really a viable solution ? or these
> > > systems use such a low rate of SCMI messages that polling after each and
> > > every message is negligible ?
> > > 
> > > ..just to understand the context...
> > 
> > These systems are early in development and it is likely that the SCP
> > will be updated to generate interrupts properly. Currently, this is not
> > the case, hence the carpet-polling, until this is resolved.
> 
> While I was going through the SCMI spec, DEN0056F , page 209 , section "4.1
> Shared memory based transport" , bullet • Completion interrupts, I found it
> explicitly states:
> 
> "
> This transport supports polling or interrupt driven modes of communication.
> In interrupt mode, when the callee completes processing a message, it raises
> an interrupt to the caller. Hardware support for completion interrupts is
> optional.
> "

Oh, yes...I knew that...it is just that till now, no systems were really
ever developed that lacked the completion IRQ as a whole, it was, till now,
more of a case of having the capability NOT to use it selectively at runtime
and instead use polling when wanted (like for clock ops in ISR context)

I am not sure what is the reason why this only-polling scenario was never
supported in the HW description, this indeed pre-dates my work on SCMI....
...I would/will check with Sudeep, when he's back, what are the reasons for
this (if any)...

Thanks,
Cristian

