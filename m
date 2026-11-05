Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF57606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RzT95jfs;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1ZMAeBQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/dEMCZlIPKSp6FJQ3llvVNF8Yw2vzkM3XYknJS08GWI=; b=RzT95jfsPR9OUG
	l6FgG4B73PBTxqMX8i50EYwW/ugkhtYngeFY42lCAO1mw/zaw1opFwcxTXfPmS6pTlUtHRUWeWv2z
	E9Dvb9Clf/8R9/nlqtOxIWjmNPYTdo64jTIQ29nXkh70Fuymh2I2Oe3OU3GQaLrdQ9zAK/c97RUxv
	BCCUvBO8ngtQ/M8b0FpOUo/rC6o7CCbYxB7BYPKJNkBMzZhgyvUpZt7levM8Vmtd7JmU3xnZ1x6Tc
	zOB5PzafrK0+2PkStvRVc8QyqlghJGUdBjDbKh6EAWX2wl8PWpjKPGL1smQt/fLfVPvRB0WalUu+Y
	Uh0XiQqo8py9iFu9ns7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOt7N-00000008Bs4-2UWt;
	Thu, 05 Nov 2026 08:46:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOt7K-00000008BrU-1eZ1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:46:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A3A8960D90
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 08:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59DBE1F00A17
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 08:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868401;
	bh=/dEMCZlIPKSp6FJQ3llvVNF8Yw2vzkM3XYknJS08GWI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D1ZMAeBQg6kCKHbuLmKMILx1ALCaS8Y0+Zqv0lRRgMedLGAqlsZG4uMez8fFtNAiU
	 /9iZK3348TAcStbdMMj1Ha4SogTv7sAy/TwkXNmql/LXQnCO2u/Ek83dq2QJ1uxHPp
	 ZNqM+jjFbnWdJSPFseY3diiIKuduVtFL3hLqr6tfc+5FAIE7yN98EP5SwFiuiU2M5C
	 qlU1+awYIYsBjDa3qpAIpH2kn/c0b+grnMmEnFrxfnC54FsN8lUy9XSfFe8EE/w0/O
	 epZ2aGNmdGBgQVlox4t1PiX0DOxfXhIZpb9sRP7vE+kEY3yzX7P5YKrga9+ReXyTgn
	 nMWxOLx1lZ3hA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso1514518e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 00:46:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz2F+sm3S+eszCIosZ8reXzg0FjQsJHE6blnnScbnWCMOCri8GxWnfebnuBPfPRu43z5Pz/Qm0OMmsKbAGFNvPO@lists.infradead.org
X-Gm-Message-State: APuU4Z/q1g9Fbwbs6PCDv82gn4BUG5gLe69o6XDScmlTSfiB77V9fZ+g
	ZBE2BCzVqmqO4oD43I/8gY34sGg0ljHXKxg7eTDkBRHwdaEOco3oKQHWbw7hpdIURtblD+JSRQO
	S1GfA79qkF8lwv4A/bbktM4eacWXY1Dw=
X-Received: by 2002:a05:6512:6082:b0:5bf:fd1e:1677 with SMTP id
 2adb3069b0e04-5bffd1e17d2mr318092e87.63.1793868400125; Thu, 05 Nov 2026
 00:46:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-0-0a61a9837744@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-4-0a61a9837744@free.fr>
In-Reply-To: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-4-0a61a9837744@free.fr>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:46:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLkFN_pm8qUzgr9jXJwgZaytERwF0eLGiJwGfsqR_2ySQQ@mail.gmail.com>
X-Gm-Features: AclHuK8ETflp150o6Y4D_MC0oBw9nE3K4Lvwb5z2qXB53rv4YdppYnKd_3n9_hE
Message-ID: <CAD++jLkFN_pm8qUzgr9jXJwgZaytERwF0eLGiJwGfsqR_2ySQQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: freescale: add the LX2160A RCW pad-mux driver
To: vjardin@free.fr
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
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
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 10:52=E2=80=AFAM Vincent Jardin via B4 Relay
<devnull+vjardin.free.fr@kernel.org> wrote:

> From: Vincent Jardin <vjardin@free.fr>
>
> The LX2160A muxes its IIC, XSPI, SDHC, UART, IRQ and EVT pads from
> fields of the RCW, read-only in RCWSR12..14 of DCFG and changed at
> runtime through the same fields of the override registers in its DCSR
> view, which read 0 until written.
>
> Since commit 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c
> gpio to support bus recovery") Linux drives them with pinctrl-single on
> the override registers, so its first pin state clears every other field
> of the word: a board whose RCW programs a non-zero pad mux loses those
> pads at the first I2C probe.
>
> Add a driver for the pad mux as a child of the DCFG node: the fields
> of RCWSR12..14 and their encoding.
> Then pin states select them with the generic function and groups
> properties, and every change goes through the RCW override
> of fsl-guts, which reads the status register, writes the override and
> waits for the status register to follow.
>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Does this have compile-time dependencies on the other patches or
can it be applied separately to the pinctrl tree once the
maintainers are happy?

Yours,
Linus Walleij

