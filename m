Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C42C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 10:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAaxtuF+mwLJIfUtqiEg1qSrHp0HQXhgx95lZmbGZ8s=; b=rfv7Vi3MZ7MQPg8+MzXrr2MOic
	KrrmbMhUB9+GcC+uR+8X9IAPVhribEn1WJIP7aJT++nP9S+6mC3xwA/ERJlhL0TKwjkffELQlTxhw
	NF65vxBMWAcIr5z27wuCaktMeOOBBgVwISTb9wWWWjIZo5JTRq1ca8MPFaiuLY6cl/4Hju0Tc/UtO
	PJ1U5z8xxwp+ERyqDVZ1IpR7yS5MXwVhr3/gvWzghr4IQ495we0pz6yDgoKOSJVcBLJKtsPQ6VGZw
	7xBssNJUO8R/7RlqYcRgMlu7U6V8o4dlFW6DtJ5/i1sq5LWxTn8EeJDiq8VSTtLqPxKiDShNA7MJd
	rTfRJMkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPCj-00000003WKg-459P;
	Fri, 23 May 2025 10:00:41 +0000
Received: from ni.piap.pl ([195.187.100.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPAY-00000003Vuv-3rBd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 09:58:28 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 9A651C405A4C;
	Fri, 23 May 2025 11:58:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 9A651C405A4C
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,  Rui Miguel Silva
 <rmfrfs@gmail.com>,  Martin Kepplinger <martink@posteo.de>,  Purism Kernel
 Team <kernel@puri.sm>,  Mauro Carvalho Chehab <mchehab@kernel.org>,  Shawn
 Guo <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  linux-media@vger.kernel.org,  imx@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Enable MIPI filtering by DT on i.MX8M*
In-Reply-To: <m31psg97dy.fsf@t19.piap.pl> ("Krzysztof =?utf-8?Q?Ha=C5=82as?=
 =?utf-8?Q?a=22's?= message of
	"Thu, 22 May 2025 14:06:49 +0200")
References: <m3h61u9jy2.fsf@t19.piap.pl>
	<20250509103733.GE28896@pendragon.ideasonboard.com>
	<m3o6vn8np5.fsf@t19.piap.pl>
	<iegnn5xoosqpk52hvipcr73aliwhqtsq6r6ctvt5756bhy6yen@rqcdongb7fdf>
	<m31psg97dy.fsf@t19.piap.pl>
Date: Fri, 23 May 2025 11:58:23 +0200
Message-ID: <m3plfz7io0.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_025827_119817_FAD4F3A1 
X-CRM114-Status: GOOD (  14.34  )
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

I wrote:

> This produces (test_pattern=3D5 which starts with black, using ISP):
> Y =3D  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00...
> UV =3D 80 80 80 80  80 80 80 80  80 80 80 80  80 80 80 80...
>
> Now I do (perhaps I should revert the patch instead):
> ./devmem write32 0x32E50004 0x14305
>
> and this does (=3D without DT filtering):
> Y =3D  E6 FF 36 1B  00 00 00 00  00 00 00 00  00 00 00 00...
> UV =3D 85 6A 74 B4  7D 8C 80 80  80 80 80 80  80 80 80 80...

The corruption is visible in ISP RAW-12 mode as well: CSI2 + ISP2 without
DT filtering: IMX462 test patterns, Linux v6.14, 1280x720p25.

Only 3 first 16-bit (12-bit on MIPI) RGGB values in each frame are
changed (bits 3-0 of the third pixel aren't changed).

32EC0060h          0 Gasket 0 output disabled
32EC0090h          0 Gasket 1 output disabled
32EC0138h    2D8000h ISP Dewarp Control Register (ISP_DEWARP_CONTROL)
      ISP ID mode 0, ISP1: DT 0, ISP2: DT 2Ch (RAW12) left-just mode

32E50040h        B0h ISP Configuration Register (MIPI_CSIS_ISPCONFIG_CH0)
      DT 2Ch (RAW12)

pattern 1:   0 800   0 2AB changed into 2AA B02 B00 2AB
pattern 2 and 3: FFF FFF FFF FFF... not altered at all
pattern 4: 501 501 4C2 4C2 changed into FFF 7FF 7F2 4C2
pattern 5:   0   0   0   0 changed into 7EF FF7 FF0   0
pattern 6:   0   1   0 101 changed into FFF FFF FF0 101
pattern 7:   0 2AB   0 2AB changed into BAA BAB BA0 2AB

RAW-12 on MIPI goes like this:
 lane0    lane1   lane2 7:4   lane2 3:0   lane3
----------- MIPI Header (all 4 lanes) ----------
P1-11:4  P2-11:4    P1-3:0      P2-3:0   P3-11:4
P4-11:4  ...

This means all the changed values are located in the first 4 bytes after
the packet header (i.e., in the first byte after the header for each
lane). Which IMHO smells like a hardware bug - especially given the
problem manifests itself only on CSI2 (+ISP2, I haven't tried using
ISI).

Fortunately enabling DT filtering fixes it.

I remember I was getting a bit different results on, I believe, the
NXP's 5.15 kernels (with their =3D Verisilicon VVCam driver). Instead of
simply changing the first 32 bits of the MIPI payload, the rest of the
RGGB data was shifted a couple of pixels or so.


Now, what do we do with it?
Is anybody able to verify the CSIC version register value on i.MX8MM?
Something like devmem read32 0x32E50000 (or 0x32E40000 for CSI1) WHILE
RUNNING CAPTURE on that very CSI would do the trick (using your
favorite instance of devmem/devmem2/etc). Alternatively one could add
a debug printk to the csic module.

And: is anybody able to check if the DT filtering works on i.MX8MM
(=3D if my patch doesn't break it on 8MM)?

Alternatively I guess we can add MIPI_CSIS_V3_6_3_1 for 8MP only.

Anybody using i.MX8MM with ISP2 + CSI2 BTW? Is the corruption there as
well? I understand it may be hard to spot, it's (usually a bright) dot
in the left top corner.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

