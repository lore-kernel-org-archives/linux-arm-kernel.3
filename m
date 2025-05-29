Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77194C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 09:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmwT3S6qnsDYq9vLb7EV+FnhJgCFYNVQnLN2KszkuxU=; b=O+Mywlc6fCiOYkkrjRFnPweCbP
	5J+xEhJ/V58w0pKO40BKgKBYHjebKGVlSMuZwCrEQuk/3PlpE+s2s1W4G6+oLskTDkYOWruSRvsut
	gHKTjgQ5akWzdWJ2VG52lfx0SXmtiP9q9npwsQK/MONAt7vcfGzgrPlAln4+Au8zBQnY0sFHJJu8p
	KBOd1h7O6e4K+DIlYzCgWuwCk1V72qJl/6OV1HlrzW+4WXCBsoighNnMJN6ujvPU1AvyyWEydEbLF
	6qSLx+fMotSynQNO8vRaMHLe5KZr20LFup7A+ueAb/cbi2GBlj/dzm22hDlorpTdFUs5kzne9hTV+
	mJHIJ39g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZgM-0000000FQHg-3zQO;
	Thu, 29 May 2025 09:36:14 +0000
Received: from [195.187.100.5] (helo=ni.piap.pl)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZVk-0000000FP5d-1dij
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 09:25:18 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id CC1DBC3EEAC9;
	Thu, 29 May 2025 11:25:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl CC1DBC3EEAC9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Rui Miguel Silva <rmfrfs@gmail.com>,
  Martin Kepplinger <martink@posteo.de>,  Purism Kernel Team
 <kernel@puri.sm>,  Mauro Carvalho Chehab <mchehab@kernel.org>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  <linux-media@vger.kernel.org>,
  <imx@lists.linux.dev>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Enable MIPI filtering by DT on i.MX8M*
In-Reply-To: <65670a02-e217-4d0f-955d-d13ca0240819@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?=
	Szymanski"'s message of "Fri, 23 May 2025 17:34:01 +0200")
References: <m3h61u9jy2.fsf@t19.piap.pl>
	<20250509103733.GE28896@pendragon.ideasonboard.com>
	<m3o6vn8np5.fsf@t19.piap.pl>
	<iegnn5xoosqpk52hvipcr73aliwhqtsq6r6ctvt5756bhy6yen@rqcdongb7fdf>
	<m31psg97dy.fsf@t19.piap.pl> <m3plfz7io0.fsf@t19.piap.pl>
	<65670a02-e217-4d0f-955d-d13ca0240819@armadeus.com>
Date: Thu, 29 May 2025 11:25:08 +0200
Message-ID: <m3v7pj6a6j.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_022516_597529_78364434 
X-CRM114-Status: UNSURE (   9.19  )
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

Hi S=C3=A9bastien,

S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com> writes:

> On i.MX8MM mipi_csi is at 32e30000. NXP kernel (6.12.3) with ov5640 camer=
a:
>
> # devmem 0x32E30000 32
> 0x03060301

Thanks a lot. So at least the version register is the same as on
i.MX8MP.
I wonder if you could test if the CSIC possibly supports filtering by
DT.

How would such a test be performed?

Maybe: while streaming (otherwise the system may lock up):

I assume 'devmem 0x32E30004 32' shows 0x4305.
# devmem 0x32E30004 32 0x14705

and:
- does it change anything? If the streaming stops, you may try
  restarting and writing with devmem again - writing to this register
  directly frequently stops streaming on my 8MP.

- what does the register contain after write?

- you may also try:
  # devmem 0x32E30004 32 0xfffffffd
  # devmem 0x32E30004 32

On i.MX8MP the above returns:
# ./devmem write32 0x32Ex0004 0xfffffffd
# ./devmem read32 0x32Ex0004
0x0000FF05
(and the streaming still works, usually).

The above is not a very good test, I admit, but it may show 8MM really
doesn't have those/that bit.

TIA.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

