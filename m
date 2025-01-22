Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AD3C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 14:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsO/TnVMoFg5ZeeRaSSA6uluVqIpL1PUl7uwODDJ7Wk=; b=DEjzL7pHBk3o19nAiCm459Nwsh
	aa/D+Tf6v0WGyOysYoc7naeuYh6S7z4NTm2KBp1oJINP+J8RlhiYIKEvtnEJRehOnc9CLHlfLTZVn
	g+xmERGcstX8+OXRBD+NMTGF5l5VmW9u2l5EcjIJj4RfdyOaT/6EhWOsD63aCwnaYEKc84CEJ1RBs
	hropEtbTdhm80FJNPHrvd1J5cHN2A9K7VqkigIegee0OZoW3NjFTWVqPsWA7/Ore3CAQrcIVc6CTM
	3vORC8bhi09Mf/tA5N+EMSJ/aTuk8aVTWtQjdZoiBlGtf5uJ69ludmKB+s8hTvxDyrRj/LkFun8F7
	DPg46HJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tabPL-0000000ANRf-2me0;
	Wed, 22 Jan 2025 14:08:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tabGp-0000000AM73-3Y72
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 13:59:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0DAF1007;
	Wed, 22 Jan 2025 06:00:18 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC6183F738;
	Wed, 22 Jan 2025 05:59:47 -0800 (PST)
Date: Wed, 22 Jan 2025 13:59:45 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/5] firmware: arm_scmi: imx: Add i.MX95 CPU Protocol
Message-ID: <Z5D50Wy6R6FuxSzG@bogus>
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
X-CRM114-CacheID: sfid-20250122_055951_953166_FD515B69 
X-CRM114-Status: GOOD (  21.97  )
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

I was about to reply earlier and got distracted. This makes it even better.
I agree with Cristian that we have defined it as u8 when referring to the
payload from the SCMI platform/server. But it should be used only to extract
information from the response payload and copied to OSPM's own buffer before
accessing it like the above dev_info example.

In short, I agree with you Dan that it shouldn't be used in OS like above.
I haven't looked at the implementation patches(just looked at the doc 3/5),
but if they need such logging, they need to copy it to some buffer in the
kernel.

--
Regards,
Sudeep

