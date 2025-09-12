Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC121CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 10:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qty+MO628pqGd+oMpNkXWNDL80iYmGOcmoukPvb4gHw=; b=aAOSCQvM5pwQagFhXxwzK6Hv4/
	2sDxkR+h5XN/joJmwewkYpIW7jujLMlvFOkxZaVgcD1ImJ0YhLYScCNa75hdnfWfZateVhz58CEFX
	gwLQPufCoxAbYfNVDnWmdtkFvsraZBGnqdtDh3Z7lcY0EZgfGQFKc+eoINGZueRQc/iu4r97gWmDs
	tF03PgcfVaqFWF0v4ohTJkyPNB9g2SDZc78StXNlRaEu3zbmpPKK+aQZX0gVFZtoCSkRTwLLd7cCM
	fi4q+HiBOXR2QCabHAddWybOeoa7QDgIf6LAm2U5hpoMHK0/z+sD3zWytPsSCILNPMpGEqgYeMbP5
	qcGIsQSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux10o-00000008afo-3rUD;
	Fri, 12 Sep 2025 10:28:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux10m-00000008af2-2jRP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 10:28:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5287616A3;
	Fri, 12 Sep 2025 03:28:03 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 923FE3F66E;
	Fri, 12 Sep 2025 03:28:09 -0700 (PDT)
Date: Fri, 12 Sep 2025 11:28:06 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/6] firmware: arm_scmi: imx: Support getting syslog
 of MISC protocol
Message-ID: <20250912-rampant-lemming-of-champagne-54ca7a@sudeepholla>
References: <20250904-sm-misc-api-v1-v4-0-0bf10eaabdf1@nxp.com>
 <20250904-sm-misc-api-v1-v4-5-0bf10eaabdf1@nxp.com>
 <20250908-sparkling-owl-of-judgment-f17eeb@sudeepholla>
 <PAXPR04MB845929E7106141E785A32387880CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250909040159.GC20475@nxa18884-linux.ap.freescale.net>
 <20250909-excellent-unbiased-seriema-8d619f@sudeepholla>
 <PAXPR04MB8459B7B9A42DB387368629608809A@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB8459B7B9A42DB387368629608809A@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_032812_731388_4D996823 
X-CRM114-Status: GOOD (  18.37  )
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

On Thu, Sep 11, 2025 at 11:15:37AM +0000, Peng Fan wrote:
> Hi Sudeep,
> 
> > Subject: Re: [PATCH v4 5/6] firmware: arm_scmi: imx: Support getting
> > syslog of MISC protocol
> > 
> > >
> > > I checked with firmware owner, this should be using raw dump.
> > > The layout would be changed for new platforms.
> > >
> > > Since this is raw dump, I think debugfs might be preferred.
> > >
> > 
> > It can be sysfs, but it can be just one single 4K dump, no more details
> > from the kernel than just raw bytes.
> 
> Thanks for approving the use of sysfs. However, I've already developed
> a patchset based on debugfs, and following a recent internal discussion,
> the consensus is to keep this functionality for debugging purposes.
> Given that, I'm inclined to continue using debugfs unless there are
> any objections.
> 

No objections if this is for debug purposes only and you do understand
CONFIG_DEBUG_FS is disabled always in production images. Basically you
can't ask customers to share the info from there as it doesn't exist 😉.

-- 
Regards,
Sudeep

