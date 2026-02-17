Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534FBE68151
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 09:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7fIFqo1oYwWMlmqFx3EVRqOzUvsBalNSAM+yH2U3Eg=; b=zm5RwVViXAhENvBKP5/KLQ3z8v
	rYSB5fPQqBI4oHQMkiIVc5RzquZdBfuXxBpjwPcpgx6rMg9Y1nHOOtZSU+8NC0GIdcz24csfU10Sh
	9+j37wjMX5JZ2Kxv8KdQIHadLVlZiLp8eWmq28kOxfdeXQlhtQtg2myUTxW5gp7BMLaQqRedT1JJ8
	TJHS+h6pihGM+JBklpFQCm8VjFDpN1ue6wfLwfDjraGzC+uL/LCOomrgihWzNTBSMoiuuVAClM7bq
	vCSM0C+z6vRoq6Y9Qc3N9SaIAqolbf7chUcK7nStRucde2bSvVuAZ/AvMlieop3T6bn/hijJaEtVg
	Kmgvwe7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHVp-00000007xM4-0lEL;
	Tue, 17 Feb 2026 09:36:57 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHVk-00000007xLW-2SOp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 09:36:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D95D4C13997;
	Tue, 17 Feb 2026 09:37:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6B195606D1;
	Tue, 17 Feb 2026 09:36:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B4C071036892F;
	Tue, 17 Feb 2026 10:36:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771321008; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=B7fIFqo1oYwWMlmqFx3EVRqOzUvsBalNSAM+yH2U3Eg=;
	b=Zc4iEErOhbAXqNKAU/fxW/Dx8HoXN3/Lp+sorw59pU9J6sw6ujdzOofXuSHciUg/qpHOSw
	CQuE/do3MsWTzyitrBuaUfWJq9UfZ7tKMQCEpNX8SQpKf+N496iD7LQOVLBJZhZginmgw7
	bHT9cZ6GW1l7CrQC2YI9fYiZLhss4KWG1CFCgvG+FT4xgk8m2ym5wUfF3Pic3DH55uKzoG
	QTQtZdL/GvLUO3UBb9xIWPT7hGIM0bV77vdC7JsOM2kWL7MZz/H6kWoTipInmhIZ610atR
	6H5U/XTw5VNCrylESkBMGTxp0qP62biRMXJU8pjH1+YvkY8w2+xxwZwZKQ/kTw==
Date: Tue, 17 Feb 2026 10:36:38 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Robert Nelson <robertcnelson@gmail.com>, Andreas Kemnade
 <andreas@kemnade.info>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Bajjuri Praneeth <praneeth@ti.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Louis Chauvet
 <louis.chauvet@bootlin.com>
Subject: Re: [PATCH 1/5] ARM: dts: ti: Enable overlays for all DTB files
Message-ID: <20260217103638.30149f16@kmaincent-XPS-13-7390>
In-Reply-To: <0EE0658D-56A7-480C-BF71-6B2EB81DC41C@goldelico.com>
References: <20260212-feature_bbge-v1-0-29014a212f35@bootlin.com>
	<20260212-feature_bbge-v1-1-29014a212f35@bootlin.com>
	<B3366A17-641F-4E02-A5D4-978F525E0A96@goldelico.com>
	<20260212174718.7daccb70@kemnade.info>
	<719BF710-26DF-49AB-A016-D2306F0389E2@goldelico.com>
	<20260212231907.6120a2e2@kemnade.info>
	<CAOCHtYicmeSzH5Q2_qTwAZw3s+__JRwUrXvz01+KCsJJHAznUw@mail.gmail.com>
	<20260216161155.09fae580@kmaincent-XPS-13-7390>
	<0EE0658D-56A7-480C-BF71-6B2EB81DC41C@goldelico.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_013653_121086_B4C57E82 
X-CRM114-Status: GOOD (  14.48  )
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

On Tue, 17 Feb 2026 09:58:04 +0100
H. Nikolaus Schaller <hns@goldelico.com> wrote:

> Hi Kory,
>=20
> > Am 16.02.2026 um 16:11 schrieb Kory Maincent <kory.maincent@bootlin.com=
>:
> >  =20
> >>>>>  =20
> >>>>>>> Am 12.02.2026 um 16:26 schrieb Kory Maincent (TI)
> >>>>>>> <kory.maincent@bootlin.com>:
> >>>>>>>=20
> >>>>>>> Allow overlays to be applied to any DTB. This adds around ~40% to=
 the
> >>>>>>> total size of the DTB files on average.   =20
> >=20
> > Yes, I will move on to this solution for now to avoid too many complain=
ts
> > about the devicetree size increases. =20
>=20
> I have done some experimentation with this patch (on top of v6.19 and our
> private defconfig) but could not find any DTB size increase.
>=20
> Does it require another patch or CONFIG change?

No, but maybe you had already the "DTC_FLAGS=3D-@" option enabled while bui=
lding
you image.
This options add the "__symbols__" node listing the symbols to the built
devicetree:
$ fdtdump arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb 2>/dev/null | =
grep symbols

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

