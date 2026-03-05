Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1321F30937
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyzgqHBTIRWys6T3ef9YTAXgeD/CZH7ydpXxQ1OHI9A=; b=QLianh4MTx5HXAp3VveVSEEJQ3
	2uH7kEKHxqpsWlwM1kCCiqXo9A8S0zAGNyjKQrUsXUA6UhTAwr63AvTJbcVKT2iOYzxXd4oGFqM+g
	me20Xk4AO7ah20Ysy13XCUCr/Qe4gy669renyycJIoZQk7bCoG3HVFZ18ghxA+gJSJiL91TchKNhH
	PrpQ6J9H5ozF4p6XLuTbO2y/NVyosmpCCnxZv4J2tNbGWfjSTyE2A8tE4vZE7DGT0s9j2J0rZ3iIf
	T6P+5dnGd2RQKprRT2IpokuJ7aMtsoCmE8vOkBlrckTi3o570xwDW1FoBCdEogwCYzV531sxk2dLh
	3A0QCKFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6G3-00000001cO0-2z8O;
	Thu, 05 Mar 2026 10:48:43 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6G1-00000001cNA-1bz2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:48:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vy6Fs-0000TS-L0; Thu, 05 Mar 2026 11:48:32 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vy6Fq-003rwV-20;
	Thu, 05 Mar 2026 11:48:31 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vy6Fr-00000001aVY-3j3z;
	Thu, 05 Mar 2026 11:48:31 +0100
Date: Thu, 5 Mar 2026 11:48:31 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/2] firmware: imx: sm-misc: Print boot/shutdown reasons
Message-ID: <aalff2CtcIeln0NG@pengutronix.de>
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
 <20260305-scmi-imx-reset-v1-2-18de78978ba9@nxp.com>
 <24409695.EfDdHjke4D@steina-w>
 <aalZV981HAneFWiC@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aalZV981HAneFWiC@shlinux89>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_024841_422435_EACD4BB9 
X-CRM114-Status: GOOD (  18.07  )
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

Hi all,

On Thu, Mar 05, 2026 at 06:22:15PM +0800, Peng Fan wrote:
> Hi Alexander,
>
> Thanks for giving a look.
>
> On Thu, Mar 05, 2026 at 08:44:26AM +0100, Alexander Stein wrote:
> >Hi,
> >
> >Am Donnerstag, 5. M=C3=A4rz 2026, 02:56:45 CET schrieb Peng Fan (OSS):
> >> From: Peng Fan <peng.fan@nxp.com>
> >>
> >> Add reset reason string table for i.MX95 and introduce a helper
> >> (scmi_imx_misc_get_reason) to query and print both system and LM
> >> (Logical Machine) reset reasons via the SCMI MISC protocol.
> >>
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> [...]
> >> +		if (boot.valid)
> >> +			dev_info(&sdev->dev, "%s Boot reason: %s, origin: %d, errid: %d\n",
> >> +				 system ? "SYS" : "LM", rst[boot.reason],
> >> +				 boot.orig_valid ? boot.origin : -1,
> >> +				 boot.err_valid ? boot.errid : -1);
> >> +		if (shutdown.valid)
> >> +			dev_info(&sdev->dev, "%s shutdown reason: %s, origin: %d, errid: %=
d\n",
> >> +				 system ? "SYS" : "LM", rst[shutdown.reason],
> >> +				 shutdown.orig_valid ? shutdown.origin : -1,
> >> +				 shutdown.err_valid ? shutdown.errid : -1);
> >
> >Is there a way to query this from userspace programs instead of printing=
 into kernel log?
>
> I not add sysfs or debugfs to get the information in this patchset, since=
 our
> customer only want the information could be shown in kernel boot log.
>
> But I could add also sysfs interface to allow userspace get the informati=
on if
> you need this feature.

I started to working on corresponding framework:
https://lore.kernel.org/all/20250618120255.3141862-1-o.rempel@pengutronix.d=
e/

but it is stalled due to devicetree decisions. I wont to respin the
discussion tomorrow

Best Regards,
Oleksij

