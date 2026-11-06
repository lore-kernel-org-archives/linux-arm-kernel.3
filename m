Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544C2606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 13:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sknnyxro;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xsk6b2WL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/oknbUn4S13Tsp1GjEbyztprp/5ERIantWGXpvB95Ak=; b=SknnyxroomtFyB
	2KbWhreIDgoQt/Uc8mlxmZ41BRn3zHI9irNQs465FmgfMjBXqCEIMBoZM1G2NuQ3/UohTtu5uFx25
	cJGRl6TNG/qwBlXJxSGk+XfTPZjKtdZysFLRHYrTy+F0Yf8/0oxeiJkgbq4k7YGnf/EG2Lt9CSpZp
	5MNw2ymTO9QHFDMzDB1A8y6impuGGheTxbcYai/Ji+Xd1kQCCxfDGkDi5XUbQh60oP3i+ODJj3TVG
	hxGDP1BeCjD4f/oM+FLz2KJWyWsOjLT3glFk4WgV2ePXN74hxz7DsW3IB4V6zKmOtCkQmkSmp52cx
	kmR/4Vl1is2o/mM3dGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJzt-0000000CQrF-1azF;
	Fri, 06 Nov 2026 13:28:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJzr-0000000CQql-3B7P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 13:28:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 647CC43E01
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Nov 2026 13:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47BDC1F008A1
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Nov 2026 13:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793971727;
	bh=/oknbUn4S13Tsp1GjEbyztprp/5ERIantWGXpvB95Ak=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Xsk6b2WLdMAU4byOQXFsAVBOCMsOww4BdhGplRm2sYAjr/aOUAyDyNz0ENwDFmdpJ
	 uQ35GT/ceuesF256fWfT72bhDVA2Xo7RVVLWBeCGB9XrI7E0dZBe42LJ21tWZTpryG
	 +yx6o4Gf92UH5BXPyE/Q+uiJ5l0/vpchGTV1qJUY1V+Eh7xVfdbhFwGx0cJuk76Yqv
	 +SVB1GQGmj7DTaEGlhBgrBsTLi8hze80HFgUX8yjUbPC9MrSV1irN20Ydlvam1meBF
	 CyxDANeYjqi47U3dX1cqrJHuMHLjCq+2OoOnnt8mTsXSdeY/gN4F2+h5CxsscorroI
	 j/ppankneYVhg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bfc9154ceaso464369e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 05:28:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByw1qPjg6hk+6Wht+KZfeHTU9h9qknenf32LYURV0fhW0bsJPW6wqsPpC9935rNc62G3WbWAcApgiwS4xLFr5GK@lists.infradead.org
X-Gm-Message-State: APuU4Z8CqSK7ptMvGYVnHwQ41WXAHSsmp5Tsj3emTEppmXO1z9yRTixS
	vAZbHLFmMWxBctAz1E8w8Qq/8dEDBn17x8tqMbaeJ4ejHTwAWgIMtOKE0pKCC3LJLnZ/yZBu4uH
	UZ7fsbTyzC3s+pzBB5FxiI4JXr5ADL4g=
X-Received: by 2002:a05:6512:3a90:b0:5bf:9fc1:3938 with SMTP id
 2adb3069b0e04-5c003b0477dmr712282e87.38.1793971726003; Fri, 06 Nov 2026
 05:28:46 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com> <20261105-gpio-vf610-fixes-v3-2-504e19de5ad5@nxp.com>
In-Reply-To: <20261105-gpio-vf610-fixes-v3-2-504e19de5ad5@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:28:34 +0100
X-Gmail-Original-Message-ID: <CAD++jLkyU54qmoaLSOBdXay1oecZDiPQJds94wCiZbyXyXrowg@mail.gmail.com>
X-Gm-Features: AclHuK9EgoyL3Lf6bUzcYEkXfVXFNufjNdYyDc_zbikouVfosUjqSHJJBS9wocU
Message-ID: <CAD++jLkyU54qmoaLSOBdXay1oecZDiPQJds94wCiZbyXyXrowg@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] gpio: vf610: simplify with irq_set_irq_wake()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 5, 2026 at 4:56=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the manual enable/disable irq wake logic with a single call to
> irq_set_irq_wake() to simplify code.
>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

