Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B11D25B45
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 11:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pr5QgnStPy8shftc1YgvtP+RNy22asbXYtKGGSGXcSI=; b=USBrdC5hePwPtcQPeDBI+XRIbl
	w2qItx0DLdOau5XGQKnYurltdlXmupafJlEsueLq9OXS7vHcSRLTHz7i3xJ9/4j+AdUWpLdS/sZZH
	NhvL0ZaLtXjFSKwJZB9NeaL5k3oOkeUsHhKD0NdzKns+pgtfBxVGIYRLpwDXQm1dtYZHcHG1MI3QG
	JsJWtNt9LiYJYx94gxytRFb18vUQ3LgypN+yoxn3n6oFP7HkSncMsObyaRAqFi95TG8Tdc9QbNm+f
	EH3CbbNTHiF/p5sOnhzPFCjyuHR0bu8YeBnNpy6aQzY43kHAHF7jGY+oW7sX0kJZqFSqG0OvLJmE1
	p4A6/X5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3iE-0000000FvbJ-2Txy;
	Wed, 28 Jan 2026 11:27:54 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3iB-0000000FvZv-1MNt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 11:27:53 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vl3hi-00061y-Vb; Wed, 28 Jan 2026 12:27:22 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vl3hi-002uKI-1I;
	Wed, 28 Jan 2026 12:27:21 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vl3hh-000000009M7-2kXq;
	Wed, 28 Jan 2026 12:27:21 +0100
Message-ID: <c4c546df215cbf4fc42bca58500a94140a5d6bf3.camel@pengutronix.de>
Subject: Re: [PATCH v4 2/3] reset: cix: add support for cix sky1 resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Gary Yang <gary.yang@cixtech.com>, lee@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, peter.chen@cixtech.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, cix-kernel-upstream@cixtech.com
Date: Wed, 28 Jan 2026 12:27:21 +0100
In-Reply-To: <20260128093611.1932770-3-gary.yang@cixtech.com>
References: <20260128093611.1932770-1-gary.yang@cixtech.com>
	 <20260128093611.1932770-3-gary.yang@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_032751_362850_E191E70E 
X-CRM114-Status: GOOD (  15.22  )
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

On Mi, 2026-01-28 at 17:36 +0800, Gary Yang wrote:
> There are two reset controllers on Cix Sky1 Soc.
> One is located in S0 domain, and the other is located
> in S0 and S5 domain.
>=20
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> Link: https://lore.kernel.org/r/20251124063235.952136-3-gary.yang@cixtech=
.com
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> ---
>  drivers/reset/Kconfig      |   7 +
>  drivers/reset/Makefile     |   1 +
>  drivers/reset/reset-sky1.c | 376 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 384 insertions(+)
>  create mode 100644 drivers/reset/reset-sky1.c
>=20
[...]
> diff --git a/drivers/reset/reset-sky1.c b/drivers/reset/reset-sky1.c
> new file mode 100644
> index 000000000000..92e34b48f041
> --- /dev/null
> +++ b/drivers/reset/reset-sky1.c
> @@ -0,0 +1,376 @@
[...]
> +static const struct regmap_config sky1_src_config[] =3D {
> +	{
> +		.reg_bits =3D 32,
> +		.val_bits =3D 32,
> +		.reg_stride =3D 4,
> +		.name =3D "src",
> +	},
> +};

This looks unused.

regards
Philipp

