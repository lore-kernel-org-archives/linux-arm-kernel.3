Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FB8E81BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 13:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0Vs3CepAoW7NtQP5h6fcv75QVlYCjWaD6tnDhXSW7M=; b=zOqm9uuxa/6ku6ENrseU1Trj1w
	PeHdrMvBZN3rSWQEUm79P40QO1tcTBy6nHCj7AOjDFbEzJoLSLP9zb4/i9dUl2SRKQ4QM1fnCG3rO
	+uz6SdHwp6MX55x+YuQUkYbPeXXdghvX4jbhl0hI0wAIvai7/yD405EFTpFPxqnuHHGLjdLXWtL57
	84bmUWk1/sDNv/1PpJTHI03e8f8jCzQZghzzcAzt6yAg+b3wDOynrj1hMIgawWVIkvCyRGuMjqtto
	/3kkcaH+Go4dMZhr0K+UgjZWoOZTDJZpRyml7/a6Oy0wYrwgf6HPYbTc/7qmfGAKje0ZDO8xEsOKM
	IrQe2WKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQsY-0000000FOpD-2NJQ;
	Mon, 09 Feb 2026 13:00:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQsW-0000000FOor-2lWv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 13:00:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AB09339;
	Mon,  9 Feb 2026 05:00:26 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCACE3F740;
	Mon,  9 Feb 2026 05:00:30 -0800 (PST)
Date: Mon, 9 Feb 2026 13:00:23 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] firmware: arm_scmi: Implement
 arm,no-completion-irq property
Message-ID: <aYnaZ_SrH55LumeH@pluto>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
 <20260117010241.186685-2-marek.vasut+renesas@mailbox.org>
 <aW5ifVcxVf6uux3m@pluto>
 <9175b8aa-18c6-4dc1-8904-c26fa1dc7428@mailbox.org>
 <aYm9Waibey1yG1o4@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYm9Waibey1yG1o4@ninjato>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_050036_805902_D253D405 
X-CRM114-Status: GOOD (  18.40  )
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

On Mon, Feb 09, 2026 at 11:56:25AM +0100, Wolfram Sang wrote:
> Hi all,
> 
> > > > Implement new property arm,no-completion-irq, which sets all SCMI
> > > > operation into poll mode. This is meant to work around uncooperative
> > > > SCP implementations, which do not generate completion interrupts.
> > > > This applies to mbox/shmem based implementations.
> > > > 
> > > > With this property set, such implementations which do not generate
> > > > interrupts can be interacted with, until they are fixed to generate
> > > > interrupts properly.
> > > > 
> > > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > > ---
> 
> ...
> 
> > > 
> > > LGTM.
> > > 
> > > Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> > 
> > Is there anything left to do with these patches, or can this now be picked
> > up ?
> 
> Would love to see this going in. I also work with the firmware which
> needs this functionality.

I have not seen anymore push back around this, but I think it was late
anyway to be picked up as an update for this cycle given that it was
already -rc6 when the last series landed...so I guess it could picked up
now for the next cycle ...but I have not checked with Sudeep..

Thanks,
Cristian

