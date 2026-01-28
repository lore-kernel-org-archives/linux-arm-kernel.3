Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8625FD46BE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 18:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYR1JKFU/xuxQ+QTiSdf69T2RlRcjVvApnn5tuFlIA8=; b=rLwq4t0HDJ8WyXbOGIA51R0DnJ
	vEYnuJwaKW6XR20JKJdVbKzYlLt238XhPTymAfZJv05JNw5bbRM7rpITrBDnRbvEff4X8NMEiK/eX
	V8puG6mSClV9EQM79LVYh3693z1Sl7P6ls0324+tGz9GIjsYXpS4TYj0swB6BmRay2p6HqaE3qtnX
	E5QOiUjIWsL0phBy0pWVSlHfBaI4lVElP/sVWGOvSCcux97HPS2D3rmaeU2UTPw3bFs3NPg4ah6HU
	2j9+r6tjcOrYADMss+1+wYj5hkZ4WldBnkYye7KOFtRxLKq3jAEBz6l6W5Y9V+ylrZWyA6lszl2W8
	4hWKRqrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9qP-0000000GXKJ-1opx;
	Wed, 28 Jan 2026 18:00:45 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9qM-0000000GXHp-1iAa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 18:00:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 239531A2AD0;
	Wed, 28 Jan 2026 18:00:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB1E16071F;
	Wed, 28 Jan 2026 18:00:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C7A4119A8687;
	Wed, 28 Jan 2026 19:00:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769623235; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iYR1JKFU/xuxQ+QTiSdf69T2RlRcjVvApnn5tuFlIA8=;
	b=C7XvoYg4XAy5+d4HTkKakM5O/Xg3YecyV+rsWkKJx4db51531cLLZsXxKHeoG4yFvhm8rV
	DdgCahO+FNkIlVTQnyazu/Aua6UetM9IVZonyf8kTO0TFHzno0ylp5PKS4UguYzBbV4+Iu
	VXLToaGcGchtTU+Jeqqxy8zXuKccFvKbTleXlBQIaTEqraP5apbR2z9kGR26kKyPVXFpig
	o08yjqkHcr9TjtfuQ9Y7z5F8WBYsjEJwOSlohTDvuOI6CYNe+h/VTB3lg7ikeCz1V2kQPD
	KVhz5HBnS7Vh8j4ClacwvM7D9Mc1LbMj+RxV+fapMxiUqY0Jsy97tedakTT0Qg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 18:59:57 +0100
Message-Id: <DG0F2I1W5EKK.28CCEYZVEDM0U@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: (subset) [PATCH 0/3] drm/bridge: imx: A few fixes
Cc: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
X-Mailer: aerc 0.20.1
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
 <176951374753.94588.10653964166300906894.b4-ty@bootlin.com>
 <f11d4407-9951-40a3-bde5-583ca1ca5bc5@nxp.com>
 <DG0BSWR9XRZS.29D743F5RWI8N@bootlin.com>
In-Reply-To: <DG0BSWR9XRZS.29D743F5RWI8N@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_100042_586157_EE2229BC 
X-CRM114-Status: GOOD (  18.07  )
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

Hello Liu,

On Wed Jan 28, 2026 at 4:26 PM CET, Luca Ceresoli wrote:
>> Any reason why patch 3/3 is not applied?
>
> Yes, the reason is there's a patch conflict and I still have to find out
> how to handle it.
>
> Patch 3 by the rules [0] should go to drm-misc-fixes because the bug (add=
ed
> by [1]) is already on Linus' master tree (since v6.17), but it does not
> apply there due to a conflict with an unrelated change [2] currently on
> drm-misc-next.
>
> Note that [1] and [2] are the two commits mentioned in your 'Fixes: 'tags=
.
>
> I had a chat with Maxime on #dir-devel about how to handle this situation
> but still haven't got a final answer.
>
> I guess the correct way is:
>
>  1. apply patch 3 on drm-misc-next, where it applies cleanly
>  2. send a modified patch for drm-misc-fixes, to fix ASAP the master bran=
ch
>
> Would you send the patch as in item 2, so it can be applied to
> drm-misc-fixes and have master fixed ASAP? Note iit should not mention [2=
]
> in the Fixes: tag because [2] is not yet on master. I can send it of cour=
se
> but you can test on hardware so that would be the best option (and I'm a
> bit overloaded at the moment).

Nevermind, I've just sent it:
https://lore.kernel.org/lkml/20260128-drm-bridge-fix-imx8qxp-pixel-combiner=
-null-deref-v1-0-2138d0933cf1@bootlin.com/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

