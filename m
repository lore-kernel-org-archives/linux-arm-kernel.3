Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F408ECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4c4LRRJ8sw5A6vf7y+x/rzyPGD7ZqnrLurNJrM/Rt1U=; b=ZM8buWp2bR0T24f/a2xobAsB9/
	8V3M6g1DqjTil2+zGnn4abZavRmeBUFR3aRuHjVLyCBe04c/AmUmswiT3huXqy2hG7hO7dISiDfdP
	dvIQ5Qw2olo+8DU4+iHmS6cSUYqUMzhWfYZkIiXVykMip3pD2WuN4oQQWtESdeR4A8fT+aMbqA6Ve
	DeGQFOmYIaFaiwtsxR6uozx06QIrN3QBVZfESZxH0E2gbuuOUsyyRihDLNPuPeXoFFrWyGbGbg9RR
	KCpYJuSN/fi2cT/A78NZGlkEjA89CUFfnOw7+Zqut2b6Lqdevwe0mvKpkAoD39AMfMxPLj2Q03i9D
	bLLYgBUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwuH-0000000ACNY-16OX;
	Mon, 03 Nov 2025 15:55:45 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwuD-0000000ACMc-0i8T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 15:55:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8ABF81A182B;
	Mon,  3 Nov 2025 15:55:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A68A60628;
	Mon,  3 Nov 2025 15:55:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FA3310B5013A;
	Mon,  3 Nov 2025 16:55:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762185335; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4c4LRRJ8sw5A6vf7y+x/rzyPGD7ZqnrLurNJrM/Rt1U=;
	b=YiP0Q3MGz6gKrdhEJYtIAzBLLE0V4pCs3lkwuur1gQC4tqTE93BsSj+Bkf4+dvh0NbYtmz
	IUJSHBgvH5XUn/58C/KgsMPolI+ztn40Eosus6fKiAeEC2MQzFJ9Ql4dCxLg6ThYVZ0eSE
	4TSuzPoVZZeQT/BHz2ADoIRkklr3QfnittPET7bboaawDrInQQqFr4V3/bSzm6zCa77kS2
	14dKpih+uvDajz56ookb4xHM/Q9DH+TGBidee0WG7jlqrMfPONznoMI/7Kt8A9aFT7TkWy
	fBGMPsAMqf3nFRfAfZQLmAsOJcC4OFThkJaD/C4YYUXGbgiSb/cupY0C4LE3cA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Nov 2025 16:55:30 +0100
Message-Id: <DDZ6KCUVYB55.330X4X5ETRXR3@bootlin.com>
Cc: "Abel Vesa" <abelvesa@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Fabio Estevam" <festevam@gmail.com>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>,
 "Lucas Stach" <l.stach@pengutronix.de>, "Peng Fan" <peng.fan@nxp.com>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Rob Herring"
 <robh@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2] drm/bridge: fsl-ldb: Parse register offsets from DT
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Marek Vasut" <marek.vasut@mailbox.org>,
 <dri-devel@lists.freedesktop.org>, "Laurentiu Palcu"
 <laurentiu.palcu@oss.nxp.com>
X-Mailer: aerc 0.20.1
References: <20251102170257.65491-1-marek.vasut@mailbox.org>
In-Reply-To: <20251102170257.65491-1-marek.vasut@mailbox.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_075541_698264_1013B0B0 
X-CRM114-Status: GOOD (  17.94  )
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

Hello Marek,

+Laurentiu Palcu

On Sun Nov 2, 2025 at 6:02 PM CET, Marek Vasut wrote:
> The DT binding for this bridge describe register offsets for the LDB,
> parse the register offsets from DT instead of hard-coding them in the
> driver. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

I was initially a bit skeptical because normally register offsets are
derived from the compatible string, not from device tree. But then I
realized this is about the LDB which has its two registers in the
MEDIA_BLK. This means all in all this looks somewhat like an integration
aspect (the LDB component uses two resources of the MEDIA_CLK component)
and your patch mekse sense.

So my only remark is that the above may be in the commit message, to make
the "why" clear from the beginning. It took a bit of research for me to
find out.

Laurentiu's patch adding i.MX94 support will conflict with this
one. Whichever gets applied after the other will have to be adapted
accordingly.

[0] https://lore.kernel.org/dri-devel/20251103-dcif-upstreaming-v6-3-76fcec=
fda919@oss.nxp.com/

> @@ -309,6 +302,27 @@ static int fsl_ldb_probe(struct platform_device *pde=
v)
>  	fsl_ldb->dev =3D &pdev->dev;
>  	fsl_ldb->bridge.of_node =3D dev->of_node;
>
> +	/* No "reg-names" property likely means single-register LDB */

Uh? If it is "likely" it means we are not sure this code is not introducing
regressions, and that would be bad.

> +	idx =3D of_property_match_string(dev->of_node, "reg-names", "ldb");
> +	if (idx < 0) {
> +		fsl_ldb->single_ctrl_reg =3D true;
> +		idx =3D 0;
> +	}

From the bindings I understand that having two 'reg' values and no
'reg-names' at all is legal. Your patch implies differently. Who's right
here?

> +	ret =3D of_property_read_reg(dev->of_node, idx, &fsl_ldb->ldb_ctrl, NUL=
L);
> +	if (ret)
> +		return ret;
> +
> +	if (!fsl_ldb->single_ctrl_reg) {
> +		idx =3D of_property_match_string(dev->of_node, "reg-names", "lvds");
> +		if (idx < 0)
> +			return idx;
> +
> +		ret =3D of_property_read_reg(dev->of_node, idx, &fsl_ldb->lvds_ctrl, N=
ULL);
> +		if (ret)
> +			return ret;
> +	}
> +

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

