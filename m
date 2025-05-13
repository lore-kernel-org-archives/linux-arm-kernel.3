Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19768C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 17:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3RmsUoVFfhErGzULegHVv5wzNa2dBf2pdywnDlm+t8=; b=xhOzQqp8QJHihHGv4CPZ2cvXwj
	QjhInydoRNtIA8EVai7wrqHe1KBE2xScUhinnYpTDaoU0m21cbyIroTQ8MJdfMTmawJ57SF1r641N
	ZeLfDl1VqSpfSnzqSAJchFpq2Drley1swmqrKftlbdFE0SqGX95dA1FHxFtnWwkav9vG7yvg8I9zp
	iFpHWaex7sTD7Vyc6/3h9MegJh4VwJ5ZowSCZmRJNJJybDsg6F8OzVgA7g679MdluaKTwiCD0n2s5
	fiMled8RCaORPUypXykPM0qg/0AssVQEaIicaDFXPRMj1P0pJWDU3oDPdM2QxbXv6ZBuZpeVTTAnd
	J4ilIOKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtPu-0000000D5SS-0mwD;
	Tue, 13 May 2025 17:27:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtNm-0000000D590-2Rpd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 17:25:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E6562247;
	Tue, 13 May 2025 10:25:21 -0700 (PDT)
Received: from bogus (unknown [10.57.45.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFBB13F63F;
	Tue, 13 May 2025 10:25:29 -0700 (PDT)
Date: Tue, 13 May 2025 18:25:28 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: firmware: imx95-scmi: Allow linux,
 code for protocol@81
Message-ID: <20250513-whimsical-almond-quoll-e3ad5b@sudeepholla>
References: <20241104085622.177781-1-alexander.stein@ew.tq-group.com>
 <20250409-heavenly-sceptical-ara-bceeb9@sudeepholla>
 <20250409160029.GE27988@nxa18884-linux>
 <2804473.mvXUDI8C0e@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2804473.mvXUDI8C0e@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_102534_669932_2FCD699E 
X-CRM114-Status: GOOD (  24.47  )
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

On Tue, May 13, 2025 at 05:37:36PM +0200, Alexander Stein wrote:
> Hi Sudeep,
> 
> Am Mittwoch, 9. April 2025, 18:00:29 CEST schrieb Peng Fan:
> > Hi Sudeep,
> > 
> > On Wed, Apr 09, 2025 at 01:31:58PM +0100, Sudeep Holla wrote:
> > >On Wed, Apr 09, 2025 at 08:18:29PM +0800, Peng Fan wrote:
> > >> + SCMI maintainer, Sudeep and Cristian
> > >> 
> > >> On Wed, Apr 09, 2025 at 12:59:50PM +0200, Alexander Stein wrote:
> > >> >Hi,
> > >> >
> > >> >Am Montag, 4. November 2024, 09:56:21 CEST schrieb Alexander Stein:
> > >> >> BBM protocol supports a single power button, supported by driver
> > >> >> imx-sm-bbm-key.c. By default this is KEY_POWER, but can also be overwritten
> > >> >> using linux,code. Add a reference to this schema and add linux,code as a
> > >> >> supported property.
> > >> >> 
> > >> >> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > >> >
> > >> >Is there any other feedback or things to do here?
> > >> 
> > >> I see Rob already gave R-b.
> > >> 
> > >> Not sure this should go through Shawn's or Sudeep's tree.
> > >> 
> > >
> > >I am fine either way. Peng, just let me know if you want to pick this up.
> > 
> > Not my patch :)
> > 
> > Since scmi driver changes go through your tree, the binding changes
> > should follow same.
> > 
> > It would be good that if you could pick it up. 
> 
> A gentle ping.
> 

Sorry I missed Peng's response. I have already sent my PR for v6.16
Since there is no driver changes, I thought it would be routed elsewhere.
See if Rob or Shawn can pick it up for v6.16, else I can pick it up for
v6.17, sorry for that.

-- 
Regards,
Sudeep

