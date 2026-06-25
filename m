Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C21CCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 10:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZLFfOQmGDFlX3PTUJhEv/KCfVYYPzDv7PEyM1q/Oxw=; b=kvquspjpaQLbmo96FULT9QFzgP
	e62tAXAdi2t1U3hB6IpBv1bky5hx3b9F4Z/xHF4oEENEW+GS7sV95VqRQ8sStoenLz0b29sXL5sb7
	rzq3uOVALKoZ9jozo+wFeGV4958Sw22KT84BapA2kUUNHlCMs2lASLKL04cKeUIWYJjuHvFd4hde4
	c1xC/szZOgbbtxpy3HMb3+c4INM37LyDaEPRUcDqFu1PDVdFl9if7IEY33kJAHqdYYrZpNHpQKuSg
	GUAQedTeCUSLNrk4SvyLtQ2lN66ZDjGTq+I/4O/xdo8vHIs8ED+y8IWaUYJjSpwEpJKXxwmF88DnD
	B11aSEmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchE1-00000008z0c-4AIT;
	Thu, 25 Jun 2026 10:22:26 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchDz-00000008yzt-0oBB;
	Thu, 25 Jun 2026 10:22:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B42EA2006B1;
	Thu, 25 Jun 2026 12:22:18 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wchDu-004Zgc-25;
	Thu, 25 Jun 2026 12:22:18 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wchDu-000000006AZ-2JJx;
	Thu, 25 Jun 2026 12:22:18 +0200
Message-ID: <36c8a3db6038db4973b6cd80c554339f5b71d32c.camel@pengutronix.de>
Subject: Re: [PATCH v9 04/12] reset: realtek: Add RTD1625-ISO reset
 controller driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yu-Chun Lin =?UTF-8?Q?=5B=E6=9E=97=E7=A5=90=E5=90=9B=5D?=	
 <eleanor.lin@realtek.com>, "mturquette@baylibre.com"
 <mturquette@baylibre.com>,  "sboyd@kernel.org"	 <sboyd@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"	
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Edgar
 Lee =?UTF-8?Q?=5B=E6=9D=8E=E6=89=BF=E8=AB=AD=5D?=	 <cylee12@realtek.com>,
 "afaerber@suse.com" <afaerber@suse.com>, Jyan Chou
 =?UTF-8?Q?=5B=E5=91=A8=E8=8A=B7=E5=AE=89=5D?=	 <jyanchou@realtek.com>,
 "bmasney@redhat.com" <bmasney@redhat.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-clk@vger.kernel.org"
	 <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, 
 "linux-realtek-soc@lists.infradead.org"
	 <linux-realtek-soc@lists.infradead.org>, James Tai
 =?UTF-8?Q?=5B=E6=88=B4=E5=BF=97=E5=B3=B0=5D?=
	 <james.tai@realtek.com>, 
 =?UTF-8?Q?CY=5FHuang=5B=E9=BB=83=E9=89=A6=E6=99=8F=5D?=
	 <cy.huang@realtek.com>, Stanley
 =?UTF-8?Q?Chang=5B=E6=98=8C=E8=82=B2=E5=BE=B7=5D?=
	 <stanley_chang@realtek.com>
Date: Thu, 25 Jun 2026 12:22:18 +0200
In-Reply-To: <f3b747e20110424c8a434cbd271edb87@realtek.com>
References: <20260624112940.3475605-1-eleanor.lin@realtek.com>
		 <20260624112940.3475605-5-eleanor.lin@realtek.com>
	 <9db83aa615f43ff6eac090626b43915fcd593a25.camel@pengutronix.de>
	 <f3b747e20110424c8a434cbd271edb87@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_032223_400414_24736EB9 
X-CRM114-Status: GOOD (  23.23  )
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

On Do, 2026-06-25 at 10:05 +0000, Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=90=9B]=
 wrote:
> Hi Philipp,
>=20
> > On Mi, 2026-06-24 at 19:29 +0800, Yu-Chun Lin wrote:
> > > From: Cheng-Yu Lee <cylee12@realtek.com>
> > >=20
> > > Add support for the ISO (Isolation) domain reset controller on the
> > > Realtek
> > > RTD1625 SoC.
> > >=20
> > > The reset controller shares the same register space with the ISO cloc=
k
> > > controller. To handle this shared register space, the reset driver is
> > > implemented as an auxiliary driver. It will be instantiated and probe=
d
> > > via the auxiliary bus by the RTD1625-ISO clock controller driver.
> > >=20
> > > Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> > > Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> > > Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> > > ---
> > > Changes in v9:
> > > - Extract reset-related code from the previous clock driver patch
> > > (formerly patch 9 in v8).
> > > ---
> > >  drivers/reset/realtek/Makefile            |  2 +-
> > >  drivers/reset/realtek/reset-rtd1625-iso.c | 99
> > > +++++++++++++++++++++++
> > >  2 files changed, 100 insertions(+), 1 deletion(-)  create mode 10064=
4
> > > drivers/reset/realtek/reset-rtd1625-iso.c
> > >=20
> > > diff --git a/drivers/reset/realtek/Makefile
> > > b/drivers/reset/realtek/Makefile index c3f605ffb11c..9007c9d5683b
> > > 100644
> > > --- a/drivers/reset/realtek/Makefile
> > > +++ b/drivers/reset/realtek/Makefile
> > > @@ -1,3 +1,3 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > >  obj-$(CONFIG_RESET_RTK_COMMON) +=3D reset-rtk-common.o
> > > -obj-$(CONFIG_RESET_RTD1625) +=3D reset-rtd1625-crt.o
> > > +obj-$(CONFIG_RESET_RTD1625) +=3D reset-rtd1625-crt.o
> > > +reset-rtd1625-iso.o
> >=20
> > Is there any benefit to these two being separate modules?
> > I suggest you merge them into one: reset-rtd1625.o
> >=20
>=20
> If I merge them into a single 'reset-rtd1625' module,
> both the 'crt' and 'iso' clock drivers would trigger the probe
> process for the same reset driver name, which would lead to a
> duplicate driver registration error.

What do you mean by duplicate driver registration error?

There would only be one auxiliary_driver, with support for all three
auxiliary_device_id's.


regards
Philipp

