Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA07FE9A74D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJpZfWii39Pl2CGVviW5wJECwhKEY7RXjU5Qjoc9wd4=; b=rUdOWcwxQ/zxD2xLbqR+FYT5UQ
	/f6cjeYy880p1AniOy3e4qwzbd4EnvSTaeORpDCP/MIjoZmy5qrOSvES5BC0MBbVtpY32/dJ/ODa+
	w91mQqfG/ehlHP1HDKAsMGtDr/3I93901uIPodkQdeKej97iErqUv2KnNQA7BrSMbcbOG8UzrgbBq
	C3CC2Q1torvGOGgBCXjNvCohd3Kk59JACI29vXxUzjLxHn5WciESO1sm0mh24T7Nve1g7cycoTy5h
	18kVTMdePwDeE+RGWIjmuxPDMQfiPYNfP5xpGkSbtyfUPR8Tzgd4U/fk4sjz4Iu3o3/6Iw0HcC2p4
	uQ68YZ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yEs-000000017NO-2SvE;
	Tue, 24 Mar 2026 09:39:54 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yEp-000000017MR-1WYD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:39:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0EF5B4E427C4;
	Tue, 24 Mar 2026 09:39:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5AB86011D;
	Tue, 24 Mar 2026 09:39:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E872210450D32;
	Tue, 24 Mar 2026 10:39:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774345185; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nJpZfWii39Pl2CGVviW5wJECwhKEY7RXjU5Qjoc9wd4=;
	b=bFdClbMpP0gfSu09EHQpPe4c6GMbqI3IOBKukCVmCXixiIZJUsNqewJjVmalDaJm0wc6DZ
	kuseC3/48cPQJrKTyE7YkXMNWMaKDvhYHLLH8YGdRRtZSOikYnTfCgzrkx/OdtdREwZqZX
	Z8cRKBE9KJzrfzJZXrbgQFLNV/yEXbmREH7lWa1YYC4jN19zOGbpTr+TLp9KinrlYmIpD1
	CWKLER0zgVX2WSysrkvrCYXQtBvyCK8gcDzvaIK0+Q0RQO0CBkXwOP1fGBGRcRkRQaOSWm
	5QpuBvSUQ9OjTBZOsITKHQ7yCP0VGFnWK28DEP/2FGGuZdkQA7DqeBSdmksgNA==
Date: Tue, 24 Mar 2026 10:39:34 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
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
Subject: Re: [PATCH v2 1/3] ARM: dts: ti: Enable overlays for am335x
 BeagleBoard devicetrees
Message-ID: <20260324103934.7d259008@kmaincent-XPS-13-7390>
In-Reply-To: <177275924369.1445909.1029086854461649971.b4-ty@baylibre.com>
References: <20260216-feature_bbge-v2-1-22805cfdbf62@bootlin.com>
	<177275924369.1445909.1029086854461649971.b4-ty@baylibre.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_023951_535747_5EF39378 
X-CRM114-Status: GOOD (  14.27  )
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

Hello Kevin,

On Thu, 05 Mar 2026 17:07:23 -0800
Kevin Hilman <khilman@baylibre.com> wrote:

> On Mon, 16 Feb 2026 17:55:52 +0100, Kory Maincent (TI) wrote:
> > Allow overlays to be applied to am335x BeagleBoard boards. This adds
> > around ~40% to the total size of the DTB files on average.
> >=20
> >  =20
>=20
> Applied, thanks!
>=20
> [1/3] ARM: dts: ti: Enable overlays for am335x BeagleBoard devicetrees
>       commit: 18161bb01ede109fed41c66efa2624a4c27377f7
>=20
> Best regards,

Thanks for merging it.
I see that you have merged patch 1 and 2 in your for-next branch.
Is there a reason to not merge the patch 3? Are you waiting for a dts
maintainer ack?

Maybe I can resend only the 3rd patch to ping the dts maintainers.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

