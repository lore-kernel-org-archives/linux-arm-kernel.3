Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBDCCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 02:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJkHWNhg96u/bWwhWBm9dtQDm3fe+lYmlVB+NnrOYTw=; b=ReoYvppSRFarscKj867fMbzfiT
	Dl5aW02pyRIuP/kFs7jkiNkns0EwGM1hbQDrWo4EZDxOgm1KfsxEDJecEaM61mxdvq0AkTXegGtTT
	4tVY7d9IW4TpiTb+jTkkiq6qe6GpZZyaYegMYLK97oI/EY0tP1b41bGKmmgzPlJREfpQJmYw9mA6e
	DL8inIWfv3kIXC9ySfScnQROGWgSwbovCGK9ciqmR9FwgQonmO47hzf9+B5dQPjKUb5Uhm+b5arKr
	FWFwpp9QxdG0jkP8dqyW5l+P1Yr177JSwnWnDbw33bpKVmu8G/ws2M6VRJrjad3crpdsLO5IuPjPd
	JYpyXJ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwWcf-00000000HwJ-2XV6;
	Thu, 11 Sep 2025 02:01:17 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwWcd-00000000HvV-0m5L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 02:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=MJkHWNhg96u/bWwhWBm9dtQDm3fe+lYmlVB+NnrOYTw=;
	b=fGALOccqq3/HB3aYedK7mhGWYXFRFcdVOtp+ZXVnxng+uZtQ9lkUnW2zJL3vr7
	ruXARSF/uRxQSVqXlXYKRRvjrsqimVa+QAWhA3jb0fLInqUyGVj3xMtaunG8FWjE
	ECxl9GnpqSVUMpHOUI0/wPF5HqfRZp9G7TD3BO+aAedQQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHNdtTLcJoC6dfBA--.50379S3;
	Thu, 11 Sep 2025 10:00:52 +0800 (CST)
Date: Thu, 11 Sep 2025 10:00:50 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Peng Fan <peng.fan@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] firmware: imx: Add stub functions for
 MISC/CPU/LMM APIs
Message-ID: <aMItUoCIhGpF7tIK@dragon>
References: <20250825-imx9-sm-v2-0-0bae0265e66a@nxp.com>
 <PAXPR04MB845910056A522BC1DD5D0F168806A@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB845910056A522BC1DD5D0F168806A@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CM-TRANSID: Ms8vCgDHNdtTLcJoC6dfBA--.50379S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7jg4UUUUU
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBUrkGjCLVXWFQAA3L
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_190115_562758_3179E406 
X-CRM114-Status: UNSURE (   8.06  )
X-CRM114-Notice: Please train this message.
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

On Tue, Sep 02, 2025 at 01:01:39PM +0000, Peng Fan wrote:
> Hi Shawn,
> 
> > Subject: [PATCH v2 0/3] firmware: imx: Add stub functions for
> > MISC/CPU/LMM APIs
> 
> Is this patchset good for you to pick up?

Ok, picked it up, thanks!


