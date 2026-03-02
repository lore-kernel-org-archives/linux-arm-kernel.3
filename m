Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0A8E9B347
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 09:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyMfMtRhobnbhhTa8wxHG744/QHuGG5OUzKRNx7qLZs=; b=jZAxKbWQLDfwuhPK8B9nEnnomZ
	lZd2EIa46YQCt/CCxLphCv+eoaeugTcD7NCdHYjRWxMCo6HZR24E5nd4qAQo9BVr0V3RkcVaEM8vo
	viduI67gZ4dyVpCh4+XeBXiuBCQjPseVkFauhJPkP3pXOQePGfsJmrV7XwFxW/+c3230NoEkUhi97
	g2mabABnqhlid6OeUjrmriVBFwtwWNgrzzOU7G199KJGzH3g0Sg46kPEsheTAD9lSmkR1HKvKoKvT
	v4Usr3yM/d/YKmvGxMiAHX2kzaXaF7cp5TbFJbsXfCLi1oY513cQ75Jj7oaFF9uIxJHWSgQV/HYfk
	Ze2ahqPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwzvE-0000000CcrB-1Jdu;
	Mon, 02 Mar 2026 09:50:40 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwzvA-0000000CcqH-3m17
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 09:50:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 27BA31A2117;
	Mon,  2 Mar 2026 09:50:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFC905FE89;
	Mon,  2 Mar 2026 09:50:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ADF7B10369541;
	Mon,  2 Mar 2026 10:50:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772445030; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NyMfMtRhobnbhhTa8wxHG744/QHuGG5OUzKRNx7qLZs=;
	b=yy9nuxvixIDkfdT6D+bnnZJLkfisrqHiiN9ObFZNYi8zyLqZIbNFiGVAYCX1Ut/dpDCuk7
	sUfHqMKMg8/sstMsgtB4MeOVqPWHw9nAF57/niUYYK9qmQDrr9fEPUfTrvDy0YyVGdXINX
	iPqeHF7ANoUv0COIn4C6sDSuadT5NOMVjyo4Q7F1l2V+t6NhxUI+aJAUuw6Ug5isqa8+UQ
	QRgfwtQ57T33DhKSnhkTZ/Ei82FoU4v3wxCBBHWOcM0QrzoAGI9LMMje78O+iitxOOcvSR
	NQZze6x4HJIYYvfj/oIBCVBs9tsS7wPCMSV99WQZ5u4vAEnGaDNtFxVrQUKrhw==
Date: Mon, 2 Mar 2026 10:50:21 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Bajjuri Praneeth <praneeth@ti.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Louis Chauvet
 <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v2 0/3] Add support for Seeed Studio BeagleBone HDMI
 cape overlay
Message-ID: <20260302105021.400b9621@kmaincent-XPS-13-7390>
In-Reply-To: <20260216-feature_bbge-v2-0-22805cfdbf62@bootlin.com>
References: <20260216-feature_bbge-v2-0-22805cfdbf62@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_015037_072784_4C6857D3 
X-CRM114-Status: GOOD (  12.91  )
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

Hello,

On Mon, 16 Feb 2026 17:55:51 +0100
"Kory Maincent (TI)" <kory.maincent@bootlin.com> wrote:

> Add devicetree overlay for the Seeed Studio BeagleBone HDMI cape, which
> provides HDMI output via an ITE IT66121 HDMI bridge and audio support
> through McASP.
>=20
> https://www.seeedstudio.com/Seeed-Studio-BeagleBoner-Green-HDMI-Cape.html
>=20
> This overlay requires the recent tilcdc cleanup patch series that was mer=
ged
> to drm-misc-next to function properly:
> https://lore.kernel.org/lkml/20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bo=
otlin.com/
>=20
> With this DRM tree dependency I don't know if this series should land in
> DRM tree or in OMAP tree.

Any new on this patch series? After a few internal discussions I think it s=
hould
land in OMAP tree.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

