Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F9EFF8855
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 12:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDOLKuOjSEQmJAZ+IgIXl7Itx+RNr8G7XoHaZmpI50Y=; b=U3kiKAMyI9rrfUNlienh332JH3
	WAsF3C0uJ75pAoQ1NCe+9q3WB5j6G+hLoejPlIUJ9hYlkqXpqrG3x/RZ3NJ0IMQPlgkJ84HOfo21/
	zmZXb1qHZ07pXTEZx39bHbkb5g2ORW9LJwWydgMMPGNLtjLv6zYlp1noMnyv1d1lXF6gJBZ0vqjL8
	GoKv8mLBlftBdIoygdytFKH14/X3rIGUrXrRL/LBEXdeeWoTxKAQkYhBosQqwBYSODbjMt10p4sAe
	g3A3qggqkbAmHfGWh38acw7Ujg9f6C4t9DbMoKCTxZeF894l5KXFk2XR2oKsAseQIPkD4kMkbJ8hr
	tPPjIIQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbqD-00000000phX-19nZ;
	Wed, 06 May 2026 12:59:05 +0000
Received: from ms.puri.sm ([135.181.196.210])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbqB-00000000pgP-30Dp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 12:59:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1778071871; bh=iDOLKuOjSEQmJAZ+IgIXl7Itx+RNr8G7XoHaZmpI50Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rBcMD0KFWemPOTp9tAX7xOpHhrl2rB4HTzkO+THGK43UJ654ByeFwM/Nb2MSiTrdR
	 NFXWqOLhUPkl4w2XoPBCH/ZOchpFupOWf5W1CMOLGN887Fq7GLL7Jykz1oP75TDlRm
	 KkAFSC4NdyvpQU2gGZuoYaXibad0ZuUUgXjKUasb41edCUWKHib5ppks5V3oy3J+V/
	 gB3aAshQVT75+589ZIhEGp208BK6pzxIZAmlwipEmjir+EWDZx2N0xJo3fGe1AXN/f
	 8wo9SqBaM0lbO9LAjYF9Nc5+jQvGKCCbdOuwP8KdF2Jtco2AGxvkOAZSyvARa8nXrx
	 MrJ1BTMFPSP6Q==
Received: from pliszka.localnet (83.24.27.154.ipv4.supernova.orange.pl [83.24.27.154])
	by ms.puri.sm (Postfix) with ESMTPSA id 79E311F79D;
	Wed, 06 May 2026 05:51:10 -0700 (PDT)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Martin Kepplinger-Novakovic <martink@posteo.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [PATCH v2 3/4] media: hi846: Add 6MP and 8MP modes support
Date: Wed, 06 May 2026 14:51:08 +0200
Message-ID: <OmTXoHZJTSGePymL9I-1Cw@puri.sm>
In-Reply-To: <20260501095433.1609309-4-mitltlatltl@gmail.com>
References: <20260501095433.1609309-1-mitltlatltl@gmail.com>
 <20260501095433.1609309-4-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_055903_908964_921C550B 
X-CRM114-Status: GOOD (  17.57  )
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

On pi=C4=85tek, 1 maja 2026 11:54:32 czas =C5=9Brodkowoeuropejski letni Pen=
gyu Luo=20
wrote:
> Hi846 is an 8MP sensor, but the upstream driver has only supported 2MP
> mode for years. This patch adds 6MP and 8MP modes to maximize sensor
> utilization.
>=20
> Note that these modes require 4-lane MIPI CSI-2, as the downstream
> driver only exposes 2MP, 6MP, and 8MP configurations in 4-lane
> operation on the target device. The register sequences are extracted
> from the downstream Windows driver.

Has this been tested in this form at all? I tried, failed and looking at th=
e=20
driver I don't see how could it ever end up using these modes in its curren=
t=20
state. It can only cause troubles when used with 2 lanes, while 4 lanes are=
=20
completely broken.

The driver defaults to its first supported mode, which happens to be a 640x=
480=20
mode that only defines its register list for 2 lanes. hi846_set_format was=
=20
supposedly meant to check whether the mode returned by v4l2_find_nearest_si=
ze=20
is compatible with the used lane count, but it does so too early - it actua=
lly=20
checks it against the already set mode rather than the one it's about to se=
t.=20
This means that you're never going to be able to set any valid mode when us=
ing=20
4 lanes without fixing this first.

And even if this was fixed, with 2 lanes this makes some calls from userspa=
ce=20
that previously succeeded now fail when v4l2_find_nearest_size happens to m=
atch=20
a mode that's only supported with 4 lanes. v4l2_find_nearest_size would hav=
e to=20
be fed with already filtered list of modes to fix that (which would actuall=
y=20
make the check mentioned above unnecessary).

Of course these are preexisting issues in the driver, but they make it=20
impossible to actually use what's being added in this patch and to add thes=
e=20
modes without causing regressions. So far these didn't matter as this drive=
r=20
was only ever used with 2 lanes, but they have to be fixed first before add=
ing=20
any actual 4 lane usage or modes that require 4 lanes.

S.



