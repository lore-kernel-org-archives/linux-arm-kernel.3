Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97159C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 12:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nDVqGt4bh4GduTF/dLHHmt1KAgIXSFM8ltQic7Kn2I=; b=gEbW9dvwk/wJ+sDZ6fhxsH3jO8
	SUdwTg5n735uNshYcEf49TQXcC8ee3o5kWfhEMudjTThVjvNjNnVUaGlDdsTsUEYdoGrwvTb0Wev+
	WSWfHd9kxVQr1fq5+sRc3ao6N3SSqZC6fjLDItqCE8PcDXzXyfDI7Z9qAKgZBGPVvNeuKsHr4cdo0
	XbXOTUW8r5D+U8cz7jyf1vJiTLT03n3bD7QLGHHN3KIb/ujRp73+q4Hri0Iw1nzPFK+sva1CGDMIP
	e8vk5VpSXOIACmb7KeMvUcDkCrzKTxm+pSHlY7qUXLIPx+Y4F7eW1eRM04M3OVaOqqH9Bb6i63Ixa
	N65xtMnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taaK4-0000000AE4S-0M15;
	Wed, 22 Jan 2025 12:59:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taaGs-0000000ADSo-2tia
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 12:55:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 459DF1007;
	Wed, 22 Jan 2025 04:56:18 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABA043F66E;
	Wed, 22 Jan 2025 04:55:47 -0800 (PST)
Date: Wed, 22 Jan 2025 12:55:45 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/5] firmware: arm_scmi: imx: Add i.MX95 CPU Protocol
Message-ID: <Z5Dq0Yb6wsIJQYF4@pluto>
References: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>
 <20250121-imx-lmm-cpu-v1-2-0eab7e073e4e@nxp.com>
 <3b9a7392-8ebe-4d43-a111-68bb6d2f93b6@stanley.mountain>
 <Z5Di-uU52aejU-U8@pluto>
 <ac1a1ebe-ef97-42a2-a2be-529a656a7706@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac1a1ebe-ef97-42a2-a2be-529a656a7706@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_045550_770141_AA1A9255 
X-CRM114-Status: GOOD (  21.28  )
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

On Wed, Jan 22, 2025 at 03:41:41PM +0300, Dan Carpenter wrote:
> On Wed, Jan 22, 2025 at 12:22:18PM +0000, Cristian Marussi wrote:
> > > > +struct scmi_msg_imx_cpu_attributes_out {
> > > > +	__le32 attributes;
> > > > +#define	CPU_MAX_NAME	16
> > > > +	u8 name[CPU_MAX_NAME];
> > > 
> > > char is always unsigned in the kernel these days but strings should
> > > still always be char.  Same thing in patch 1, there were a couple u8
> > > names.
> > > 
> > 

Hi Dan,

> > While it is certainly true that char is the way to go for strings and, as
> > such, it is used elsewhere to hold the resource names across all SCMI
> > protocols, in this context it is a field of structure representing
> > exactly the layout of message reply coming from the server, and defined
> > in the SCMI spec as a uint8 array, so, we have generally preferred to
> > used u8 to represent such fixed size array all across the SCMI stack
> > protocols implementation....
> > 
> > .... not saying that it is necessarily completelt right, but that is the
> > reason we are guilty :D
> 
> Fine.  I don't have intense emotions about this.
> 
> It does slightly bother me when we assume that the SCMI server NUL
> terminates these when we do things like:
> 
> 	dev_info(ph->dev, "i.MX CPU: name: %s\n", out->name);
> 

Hang on...I have not really done a proper review still on this series...
...and this printout above straight out of the message payload seems very
wrong to me too..

> But from a practical perspective we have to trust the SCMI server.
>

....nope we should NEVER trust the server...and instead assume it can
kill us (kernel) all the time :P

...despite what the spec says, we tend to assume tha the server can be
maliciously wrong (or just crappy), so in other protocols where we do used
an u8[] to describe the resource name field in a message, we have also always
(hopefully :D) taken care to use it ONLY after having processed that field like...

   strscpy(dom_info->name, attr->name, SCMI_SHORT_NAME_MAX_SIZE);

...to remove any possible bad outcome from a misbehaving SCMI fw server.

Thanks,
Cristian

