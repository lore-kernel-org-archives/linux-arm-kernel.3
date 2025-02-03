Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB1AC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 13:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AimYrpyVA5edpQgonl9nU4eHMI4ielqsVQLne4q6tg=; b=SXYIJZI+RPwc4PWP31YfZ2eIrE
	Q0nmrvE9ZqaLavhkdLIBDbqMBzMVgGChfGdP0MPrSTHjAhHRI7u0e3FSiHtMbCJJWQ1Ji3O8I4Ex4
	fbZTRjqk9au6I+PP/8Acm3l1ECwVVRCeeBA5uKnpqHEVXnyVwlFHfFkNrKzg7bfx18e4xp8t3EAz+
	tL4t2wNV69XbXZQfim5vhtTNGWGM6lhU7kKHIM04hN1GOqwRrLomRX2GXuTnNY1r6wlBFvBYqqry9
	OkxWOBMK0odL5dUnXu16SoMWw3+UX1CO5v2p+9fn+MgEye4PkxbtvMFOi3LdL36bmDsn+pi+xhhOV
	GYw95brw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tewGE-0000000FUG1-0slf;
	Mon, 03 Feb 2025 13:13:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tewDX-0000000FTi7-2yvt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 13:10:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tewDL-0003ae-Ae; Mon, 03 Feb 2025 14:10:11 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tewDK-003IYN-0p;
	Mon, 03 Feb 2025 14:10:10 +0100
Received: from pengutronix.de (unknown [IPv6:2a01:4f8:1c1c:29e9:22:41ff:fe00:1400])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id BB1113B7A82;
	Mon, 03 Feb 2025 13:10:07 +0000 (UTC)
Date: Mon, 3 Feb 2025 14:10:06 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, 
	linux-stm32@st-md-mailman.stormreply.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Leonard =?utf-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH stm32-next v3 0/2] ARM: dts: stm32: lxa-fairytux2: add
 gen{1,2} boards
Message-ID: <20250203-congenial-falcon-of-destiny-43b5c0-mkl@pengutronix.de>
References: <20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de>
 <173764775141.3793586.6690578690442295161.robh@kernel.org>
 <20250123-urban-belligerent-bullfinch-2fa9e6-mkl@pengutronix.de>
 <8f28bbc1-1ada-41b2-bff2-5ad549c934a5@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8f28bbc1-1ada-41b2-bff2-5ad549c934a5@foss.st.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_051023_747542_F3DCB599 
X-CRM114-Status: GOOD (  14.20  )
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

On 03.02.2025 13:00:13, Alexandre TORGUE wrote:
> > > My bot found new DTB warnings on the .dts files added or changed in t=
his
> > > series.
> >=20
> > This patch doesn't touch the offending file "ste-hrefv60plus-tvk.dtb".
> > Might be a new warning, but not due to this patch, could this be a false
> > positive?
>=20
> Can you reproduce ?

Nope!

> On my side I can't. As you said the reported error has
> no link with your patch. I'll merge it.

Thanks,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

