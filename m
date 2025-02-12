Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77799C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghKY6+G+XoIcUxyLEgYDXYnnLDCaox4Xls+5mgr98Nc=; b=2FTdQylfN+9WEu/2DAi5wkoxC7
	6HXgY40G+IvMrEJb/1OhMxk1pIU8CQDXOqyxEJ5I5TCUAJS1rNxDeTWfUm3IBGhGlO57Y7X3u0Obv
	G3wv2OldphEexPzfuCka1hdw8vlb/I0PUnuytsfOgO1lBZ5+GCRi6qLzSPwyc/YDeQ8qwUdqQsg6Y
	6xMXDA6cF5DozN1tQzrWD9RNfMnXUwDQXGa5rmxi6+DH9CC3G8GJxC5hNz7HT7SV0gCAxY/RFPfVO
	EiZhAd/zVp7wZQbNVr+gl77Z1BsrnXDZv2KRVYZJ8JRlpVmqWimSIX2B1evtMbq2k5ixj2r62vihJ
	O+rtwJ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAMM-000000073nY-1Q06;
	Wed, 12 Feb 2025 10:52:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiADL-000000071h1-2DmP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 10:43:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C94312FC;
	Wed, 12 Feb 2025 02:43:51 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE7B23F6A8;
	Wed, 12 Feb 2025 02:43:27 -0800 (PST)
Date: Wed, 12 Feb 2025 10:43:24 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 0/4] rtc/scmi: Support multiple RTCs
Message-ID: <Z6x7TBSjBFBxGo77@bogus>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120102117538ef59b@mail.local>
 <PAXPR04MB8459968DFDE5979802CC034A88E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z6uCCeG2d395ZGDS@bogus>
 <20250212063532.GB15796@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212063532.GB15796@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_024331_614255_D060A2F6 
X-CRM114-Status: GOOD (  20.76  )
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

On Wed, Feb 12, 2025 at 02:35:32PM +0800, Peng Fan wrote:
> On Tue, Feb 11, 2025 at 04:59:53PM +0000, Sudeep Holla wrote:
> >On Tue, Jan 21, 2025 at 02:31:55PM +0000, Peng Fan wrote:
> >> 
> >> It is the i.MX SCMI Protocol exports two RTCs using one protocol.
> >> 
> >> Two RTC devices are created, but share one parent device.
> >> 
> >> Do you mean each RTC device should have a unique parent device?
> >>
> >
> >Can you point where is this check for unique parent ? I am not so familiar
> >with RTC but I couldn't find myself with quick search.
> 
> The RTC ops takes the rtc parent as input parameter
> https://elixir.bootlin.com/linux/v6.13.2/source/drivers/rtc/interface.c#L94
> "err = rtc->ops->read_time(rtc->dev.parent, tm);"
> 
> So in the rtc device driver, there is no way to know which rtc it is just
> from the parent device.
>

If that is the expectation, you could create a platform or normal device
per instance of RTC on your platform and slap them as parent device.

IIUC on any pure DT based system, a device node exists per RTC and hence
platform device associated with it. And the RTC devices are created with
parent pointing to unique platform device.

> However i.MX SCMI BBM exports two RTCs(id: 0, id: 1), so to make it work for
> current RTC framework, we could only pick one RTC and pass the id to BBM
> server side.
>
> I am not sure whether Alexandre wanna me to update the code following each
> parent could only support one RTC or else.
>

I assume something like my suggestion above.

--
Regards,
Sudeep

