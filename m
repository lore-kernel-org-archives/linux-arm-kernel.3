Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A531C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8MEGxuiLlmPuqpoYOTE5EbOg9Iz3g5ldM672B1/FXg=; b=P86FYJongQBt45Kb5Yp7oor51p
	4TnR+17Ei3p4Oh/iM7487hmv4ef9LAKhsEwW0paBGimqux19KPb0X6zug6h3rb2rdl2rcyq3YLWFs
	9jisV+SzIMfdJUrwBAOWnbV6yQY0TdjM7vrSFI4HP/YKHfy2LGnH8dXXjgM06wY122FWtWtfCsKau
	EawYd1NYvRwiyzvwR5q+s1STpmz1TAVn08SzhBlTQNCZic45lvfGcC95l4b7XBV25LieU6HyrLagE
	lc9HInYj3WDwO8HUU1KjBvyDOOzuAFT8GTbuy1VtXwYllIrJmkrKjZpkISmGduenXfUX5EVl2IpaV
	3EkTjODw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0cs-0000000FuU2-3S7w;
	Fri, 14 Feb 2025 18:41:22 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj02B-0000000Fo8g-3mgQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 18:03:29 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tj025-0000CI-3a; Fri, 14 Feb 2025 19:03:21 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tj021-000xHw-2A;
	Fri, 14 Feb 2025 19:03:17 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tj021-000BqJ-1u;
	Fri, 14 Feb 2025 19:03:17 +0100
Message-ID: <8a9518fdfda805f52b96e93649c9ee39274f5844.camel@pengutronix.de>
Subject: Re: [PATCH 1/4] [PATCH 1/4] reset: simple: Add syscon device
 compatible
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Wilson Ding <dingwei@marvell.com>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>
Cc: "andrew@lunn.ch" <andrew@lunn.ch>, "gregory.clement@bootlin.com"
 <gregory.clement@bootlin.com>, "sebastian.hesselbarth@gmail.com"
 <sebastian.hesselbarth@gmail.com>, "robh@kernel.org" <robh@kernel.org>, 
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, Sanghoon Lee <salee@marvell.com>, Geethasowjanya
 Akula <gakula@marvell.com>
Date: Fri, 14 Feb 2025 19:03:17 +0100
In-Reply-To: <BY3PR18MB4673C5C5CA684C64B2C218AAA7FE2@BY3PR18MB4673.namprd18.prod.outlook.com>
References: <20250214065833.530276-1-dingwei@marvell.com>
	 <20250214065833.530276-3-dingwei@marvell.com>
	 <6dd9ed2750abe1f5174805673411ccb919ee5461.camel@pengutronix.de>
	 <BY3PR18MB4673C5C5CA684C64B2C218AAA7FE2@BY3PR18MB4673.namprd18.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_100327_936481_9D721446 
X-CRM114-Status: GOOD (  20.58  )
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

On Fr, 2025-02-14 at 17:13 +0000, Wilson Ding wrote:
>=20
> > -----Original Message-----
> > From: Philipp Zabel <p.zabel@pengutronix.de>
> > Sent: Friday, February 14, 2025 3:54 AM
> > To: Wilson Ding <dingwei@marvell.com>; linux-kernel@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > Cc: andrew@lunn.ch; gregory.clement@bootlin.com;
> > sebastian.hesselbarth@gmail.com; robh@kernel.org; krzk+dt@kernel.org;
> > conor+dt@kernel.org; Sanghoon Lee <salee@marvell.com>; Geethasowjanya
> > Akula <gakula@marvell.com>
> > Subject: [EXTERNAL] Re: [PATCH 1/4] [PATCH 1/4] reset: simple: Add sysc=
on
> > device compatible
> >=20
> > On Do, 2025-02-13 at 22:58 -0800, Wilson Ding wrote:
> > > Introduce the new ops for updating reset line and getting status.
> > > Thus, the reset controller can be accessed through either direct I/O
> > > or regmap interfaces.
> >=20
> > Please don't add a new layer of function pointer indirection, just add =
a new
> > struct reset_control_ops for the regmap variant.
> >=20
>=20
> If just adding a new struct reset_control_ops for the regmap variant, alm=
ost
> all the functions will be duplicated for regmap variant.=20
> Besides reset_simple_regmap_assert/deassert(), we also need to have the
> regmap version of reset_simple_update().

Yes. You could also duplicate/fold update() into assert/deassert().
It is trivial enough and the compiler will do that anyway.

> Since reset_simple_reset() invokes
> reset_simple_regmap_assert/deassert(), it also needs to be
> duplicated.

That one could go through the data->rcdev.ops->assert/deassert function
pointers and be reused. But I wonder if that one function is worth the
added complexity.

> In this case, there will be too many redundant codes in this file. I doub=
t if
> it is worth to use the reset simple code. Maybe it's better to fork a new=
 file
> for the syscon device, such as 'reset-simple-syscon.c'. What do you say?

That sounds sensible to me.

regards
Philipp

