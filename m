Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4039F606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 13:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GI9ldLIL;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dpKVtSB0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9VVN1Qt5s3G19mMDbxU/lzocOYANDZG3AchnpUi2eHw=; b=GI9ldLIL/T/fsN
	LavQwfiUXxyo9j+Vk3oQxcPGttN/+FpaowRgWLVIj40AOsaPQAfr0gLxvyiZwQhisRQrG67ei6pEb
	1T3kGvYsFt/mJw+HLZxl1IAiwtpGMDAFwkc3kEcNF+JorEdgZyPkxo9Kq+JDWno7mkuELspDoBtFZ
	M5qZh0QkSSMrchnvQ7AzpMUA1wN4e0itfB5KwFKrcRX6OdPFh+wWNraSc3gQETvTFwCtpSQDBucZi
	Dzzs75ThaTlUR0SzjlHMeWnYn7GlQ0NOVQRdqKfBmV0wCfnWMJd1knE8vopGxgE4QIr+3Byf2VTBz
	cZqhrdT/YTIJpaY4QDsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPK0h-0000000CR8C-17UK;
	Fri, 06 Nov 2026 13:29:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPK0g-0000000CR7q-0usU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 13:29:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D5FB043E1F
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Nov 2026 13:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3801F00904
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Nov 2026 13:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793971777;
	bh=9VVN1Qt5s3G19mMDbxU/lzocOYANDZG3AchnpUi2eHw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dpKVtSB0TJS9RXsqGV21BPeypigLT1MKlsDUFBdmKdYOxS3nCIOaxx/bNlEZNmBj4
	 PFtHjkAXLFV2SgoG+LbAYg+BNQFlRjzDjH8XcSbfqnCYzEAN0JoH5p87NRZnspeBHq
	 wSX1OgYJQAvyAcs5R+1RBrI6tczk3nVPKkQyoYXXJqBp7eQCtR/Z8rzEtQ9DiOHiN6
	 t+lQ4XutQcMwA6hei8voK7esgQKt4sxaGuBLbyWz2FgeB+KnvjBU6JYO3B5+mNvZ7i
	 1B4AzRD1jAs5DVh2ilB2K3zO04G1QthchK7KhnLjLGDApGBnPzfemx1GTeM3XRoBWv
	 cul3uD7D31vVQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bfbc67991cso477682e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 05:29:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByUiXqPDW9CRI1g8wuzm7Z4XslFzQBMh/MBkrdinpV8mzvyDwQOJ+QXv2AK6A1RvY97tt9z9FlxO3ma9WjrQepj@lists.infradead.org
X-Gm-Message-State: APuU4Z9WQsUPNGut9wgb+V3dXizwQubgXIjFDUNksktmFNUBWSX4tos5
	Ll9L7mcgEwrC/th4KjmcztuAydbpFHzf39HOkaLymxWvKQf8iNJJUc016JoTj2zh2ybdstkpoJH
	xwam1gLI+LO6dpmjDfa8nywnenYXO8NE=
X-Received: by 2002:a05:6512:33d1:b0:5bf:a12b:9ba8 with SMTP id
 2adb3069b0e04-5c003aef4d1mr778706e87.65.1793971776504; Fri, 06 Nov 2026
 05:29:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com> <20261105-gpio-vf610-fixes-v3-3-504e19de5ad5@nxp.com>
In-Reply-To: <20261105-gpio-vf610-fixes-v3-3-504e19de5ad5@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:29:24 +0100
X-Gmail-Original-Message-ID: <CAD++jL=qUShzXutAz568YepQgYvn0Sv4hU43kfxWm+ZL3D3-fg@mail.gmail.com>
X-Gm-Features: AclHuK8gGR8RrYWVb4JB0yl9dd6W-8aSN-PytpvJXvTm5IBU_II2QIjGbup39dA
Message-ID: <CAD++jL=qUShzXutAz568YepQgYvn0Sv4hU43kfxWm+ZL3D3-fg@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] gpio: vf610: use devm_clk_get_optional_enabled()
 for clock handling
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
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
> Replace the manual clock acquisition, enable and cleanup sequences with
> devm_clk_get_optional_enabled() for both the port and gpio clocks. The
> helper treats a missing clock as NULL and automatically disables and
> unprepares the clocks on driver unbind, so the vf610_gpio_disable_clk()
> helper is no longer needed.
>
> Unlike the previous code, propagate all errors from the helper,
> including clk_prepare_enable() failures. The old code only tolerated
> lookup errors and failed probe when enabling the clock failed; continuing
> with a disabled clock could fault when accessing the PORT/GPIO registers.
> The optional helper already covers the "clock not described" case, so
> there is no need to silently ignore other errors.
>
> The clock pointers are only needed during probe now that devm manages
> their lifetime, so drop them from struct vf610_gpio_port and use a local
> variable instead.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

