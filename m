Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3804CCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 10:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwSMfiQMCeU4lUUB9fPK6vGImyG1aOQJtSY6EGHF59Y=; b=isgLL98D2ePRY4cn2GrVySyMdi
	oNKvXd8BKg7cMG+qnvWAn9EaIyAr9FDdS6w2GoEjiTauvujyXpB6qiP88Soc4j9zw/6ymSGLy9mda
	s3PPH7pXwVfoOmdwHxwoBuoaV3bhEluvfxYhoiE31KGIUuOKL5vVtL9hNKaqF6bkqqZ54+6r2iQM3
	gtp1ccE8h/DrQ8MJXMLmfEljfSgR8hFjAVmWtaKgJL7/KIKEMYgi996WlWmInIveNAYpDehrUKi0h
	P3FCpnXdE56468ZwUDAPt39iPo4BVIhjeaJBLEP4jwHcSrJdICIqFbOrZ+EcVp+qpABMEqD3B++yC
	tzMK9vXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9vo-0000000163i-0NF6;
	Thu, 18 Jun 2026 10:25:08 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9vf-0000000160K-3oWP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 10:25:02 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 18529200275;
	Thu, 18 Jun 2026 12:24:58 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa9vd-003QBv-3C;
	Thu, 18 Jun 2026 12:24:58 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa9vd-000000006dq-3gVl;
	Thu, 18 Jun 2026 12:24:57 +0200
Message-ID: <922d581718c90c9ca603a35ece7c44da7c425e0a.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/1] reset: imx7: Correct polarity of MIPI CSI resets
 on i.MX8MQ
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Robby Cai <robby.cai@nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com, 
	krzk+dt@kernel.org, andrew.smirnov@gmail.com, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, aisheng.dong@nxp.com, guoniu.zhou@nxp.com
Date: Thu, 18 Jun 2026 12:24:57 +0200
In-Reply-To: <20260417092809.GA582835@shlinux88>
References: <20260417080851.489303-1-robby.cai@nxp.com>
	 <2605c4332e8a3e8950b0b15fc5377423cfed4a1f.camel@pengutronix.de>
	 <20260417092809.GA582835@shlinux88>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_032500_098686_29F601D9 
X-CRM114-Status: GOOD (  13.22  )
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

On Fr, 2026-04-17 at 17:28 +0800, Robby Cai wrote:
> On Fri, Apr 17, 2026 at 10:47:48AM +0200, Philipp Zabel wrote:
> > On Fr, 2026-04-17 at 16:08 +0800, Robby Cai wrote:
> > > On i.MX8MQ, the MIPI CSI reset lines are active-low and not self-clea=
ring.
> > > Writing '0' asserts reset and it remains asserted until explicitly
> > > deasserted by software.
> > >=20
> > > This driver previously treated the MIPI CSI reset signals as active-h=
igh,
> > > which led to incorrect reset assert/deassert sequencing. This issue w=
as
> > > exposed by commit 6d79bb8fd2aa ("media: imx8mq-mipi-csi2: Explicitly
> > > release reset").
> >=20
> > If this patch is backported without 6d79bb8fd2aa, or the other way
> > around, will that break MIPI CSI-2 on older kernels? That would warrant
> > a Cc: stable tag.
> >=20
>=20
> Yes, will break.
> These two patches should be backported as a pair to ensure correct behavi=
or.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Can you please resend with

Cc: <stable@vger.kernel.org> # 6d79bb8fd2aa: media: imx8mq-mipi-csi2: Expli=
citly release reset

regards
Philipp

