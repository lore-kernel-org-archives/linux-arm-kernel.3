Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192B2C9EC7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 11:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7D/+JsCZT7S+ELMJk5Pon+TW+ns6OcWrFCQ+j/lRVY=; b=y1u3WsEnyRQuo864WD+BCUTwqL
	5VqLyAMMCmrC+rndfKyYqT/ZvFyvPfOvH32stVIqasUG+4PMaM6W43R9MbZ62LxHUjC5Ves3qDtyM
	nfiA0OET+f/xHb+TBNollFllOzvrVeCz1FMTFVx5rIU3Jm0QsbE+9d8rQnuqGqDNulytW4JtcQFBB
	6OGqxZ/8MCbXbzt1jyFgSQow8ECyB1f1JKWQ7pqh9n+ol+y7NIb1wft8INdjZNHcWPzr/LyrZHTh3
	dUi1KvyDdMg2By6u1/qrr2FIBV+w4ylie8zbuYR7o+QVxEnFPv/djPXFy+92xNUsexCZA/0BmdKd9
	ly2UKLWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGZm-00000005IJW-3L07;
	Mon, 12 Jan 2026 11:59:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGZk-00000005IJ5-0Jly
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 11:59:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC339497;
	Mon, 12 Jan 2026 03:59:04 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00F8B3F59E;
	Mon, 12 Jan 2026 03:59:09 -0800 (PST)
Date: Mon, 12 Jan 2026 11:59:07 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] firmware: arm_scmi/imx: Support dump syslog
Message-ID: <aWTiC78PXRoadeJy@bogus>
References: <20251029-sm-syslog-v3-v3-0-64e14a6e3f87@nxp.com>
 <aUCy5+vAPzDGeux3@shlinux89>
 <aVuzVNmG2l-igiEB@nxa18884-linux.ap.freescale.net>
 <aV0uVXXbxKQ5qzLD@bogus>
 <aV24N72FoGeGwgqm@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV24N72FoGeGwgqm@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_035912_642098_6E37852B 
X-CRM114-Status: GOOD (  22.02  )
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

On Wed, Jan 07, 2026 at 09:34:47AM +0800, Peng Fan wrote:
> On Tue, Jan 06, 2026 at 03:46:29PM +0000, Sudeep Holla wrote:
> >On Mon, Jan 05, 2026 at 08:49:24PM +0800, Peng Fan wrote:
> >> Hi Sudeep,
> >> 
> >> Hope you're doing well. Apologies for following up again, but this v3 patchset
> >> has been pending for quite some time. I wanted to check if everything looks
> >> good on your end.
> >> 
> >
> >Yes overall it looks good to me.
> 
> Thanks a lot.
> 
> >
> ...
> >> Alternatively, I can ask Shawn to pick patch 2 if you only intend to take patch 1.
> >
> >I think that would break build or need to wait for another cycle.
> >I can ack if it can be routed via i.MX tree or need ACK to pick it up myself.
> 
> Shawn,
> 
> Do you plan to pick the two patches with Sudeep's Ack in patch 1? Or
> you prefer to route the patches via SCMI tree with your Ack?

I noticed this morning we are already at -rc5, which is later than my usual PR
timing (I generally aim to send to the SoC team between -rc4 and -rc5). I have
already sent the SCMI PR.

For these changes, would it be acceptable to route them via the i.MX tree if
they are still intended for v7.0/v6.20? If not, I am happy to defer and pick
them up for the merge window after next.

-- 
Regards,
Sudeep

