Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84C9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vytQhgxs;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UW+EsRMb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=j9d8HMdPOBLx2izzwVSbxm7Ew442zRczjYj1drdD8eQ=; b=vytQhgxsMvMTir
	1YZGrkFZArihUb0/fic+oAM3Jk0Kl0/PT0CIF2Ib8djAu+UusiEXzpFoIai0U8RkcVOrCc1lG9aj7
	HDHlOep+6ozLZNIp2Bxs4/4bDOoHjd/DmKOka62+KPP+GFM8f3mg/G9u4mqZTo6LOhATgSJutxv3D
	/3Wmc9bXG3Zk0i9k08hq3Lc7khm+ogu0/3rZx/pGh88afStFj8zYEd6WWTuiPiT1rluS7q2XIcKk3
	sI8g4aR5yWDfvmiGVAQMPRfiTY7KqqPCZlzlxD/rnb28FlGBlmJMQ8EUMBTlQqLDTgQ+z/wf1Djzn
	uiRWpRbOIpKaWaFZnb3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPq6-00000009H7b-3RG1;
	Thu, 29 Oct 2026 13:06:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPq5-00000009H7V-1iQB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:06:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5711243ED4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 13:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C3741F031E7
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 13:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793279200;
	bh=j9d8HMdPOBLx2izzwVSbxm7Ew442zRczjYj1drdD8eQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UW+EsRMbpOtnUZJkL8ULWM5F+FbBi+YSir5WfgzdfSKmr6/u6RtLOLbhJwMK7BrCF
	 uY2O453fYdRT+aSNSC1mIrI7t0sHIXqG/76ihb2yGfkOO1bHRdBzTptMhiboZBw0H2
	 TdTfapOKcyNEECz2evB3TcNtspTWG7MkcAuvmYuFdzULWZi5w7uAZij8wg00ebVjh4
	 utinmmVi/ORqAcByLiH5BaeysrsnoQmEQAdBzOPyDsV05xYIYRiFuTAHRnyJfjR0i3
	 XNahjKRB1nbTWiLXxv4UGWhePRsI9XHc2M0xsaNSjxzFQDYBr65X30FrK2u6zXqqYm
	 X4noo7VDlEtUA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bccecba199so2162807e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 06:06:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxjn9/FtjlXO0vQmDx3AVFEV3ZshcRQpZFZj+VJwd1sSYCHperVhotWI4hXuFcuF+uZPlzTUSIf87iDRIbZwOdm@lists.infradead.org
X-Gm-Message-State: AFq9FYIdY/LmPyigc3eKvEXgiNuxMk6MS40qglXrD5ysmv4b9nuu/GCl
	0H1OdE8KvNFNppvLbnPfZ1W8nqtFFSRpgF8/ta3mQr83XiqvmLfrU7RJ5/U6sbNZAn0gZQ7OY8G
	bAhoNhJqWWXxIsxyYPKwbZ+24Q9NiTk8=
X-Received: by 2002:a05:6512:3c9a:b0:5be:50d5:1909 with SMTP id
 2adb3069b0e04-5bfcad58b3dmr2147748e87.27.1793279198981; Thu, 29 Oct 2026
 06:06:38 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-7-cb47ce2ad758@nxp.com> <CAD++jLnDxTAz2=ge5RgvO02mp+BJyLBV0zR8xqsm8LSsSEcRYQ@mail.gmail.com>
 <as8+sqlBEuhfdtZ8@shlinux89> <CAD++jL=tKnT0qr5chD-fhxgTM-f9kcdFRsKVBbbqionBp9iTyw@mail.gmail.com>
 <atIqPOBaflct369Q@shlinux89>
In-Reply-To: <atIqPOBaflct369Q@shlinux89>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 29 Oct 2026 14:06:26 +0100
X-Gmail-Original-Message-ID: <CAD++jL=nkoYnPfU_swDYrtrxNZtAy+yq8O5SnoLdtqrh_QoxTA@mail.gmail.com>
X-Gm-Features: AclHuK-fkIL7gTTQhakmRRraBxB0TPX72u2Kqo5bF_nURy3d6i6ZKcYJu7FOOm0
Message-ID: <CAD++jL=nkoYnPfU_swDYrtrxNZtAy+yq8O5SnoLdtqrh_QoxTA@mail.gmail.com>
Subject: Re: [PATCH v6 07/13] gpio: mxc: convert pad wakeup compatible checks
 to hwdata flags
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Peng,

On Fri, Oct 16, 2026 at 3:39=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
> Hi Linus,
> On Fri, Oct 16, 2026 at 11:13:28AM +0200, Linus Walleij wrote:
> >On Wed, Oct 14, 2026 at 10:30=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com>=
 wrote:
> >> On Wed, Oct 14, 2026 at 01:10:48AM +0200, Linus Walleij wrote:
> >
> >> >Hi Peng,
> >> >
> >> >On Sun, Oct 11, 2026 at 1:51=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.=
nxp.com> wrote:
> >> >
> >> >>  static bool mxc_gpio_generic_config(struct mxc_gpio_port *port,
> >> >>                 unsigned int offset, unsigned long conf)
> >> >>  {
> >> >> -       struct device_node *np =3D port->dev->of_node;
> >> >> +       int ret;
> >> >> +
> >> >> +       if (!mxc_gpio_has_pad_wakeup(port))
> >> >> +               return false;
> >> >
> >> >Why is the entire call to mxc_gpio_generic_config()
> >> >bailing out here if the port does not have pad wakeup?
> >> >
> >> >> -       if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
> >> >> -           of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
> >> >> -           of_device_is_compatible(np, "fsl,imx8qm-gpio"))
> >> >> -               return (gpiochip_generic_config(&port->gen_gc.gc,
> >> >> -                                               offset, conf) =3D=
=3D 0);
> >> >> +       ret =3D gpiochip_generic_config(&port->gen_gc.gc, offset, c=
onf);
> >> >> +       if (ret)
> >> >> +               return false;
> >> >
> >> >Then no generic config can happen.
> >> >
> >> >This looks weird, isn't it just some of the configs that
> >> >don't work?
> >>
> >> The early return is correct and matches the original behavior - only
> >> i.MX8 SoCs with SCU have pad wakeup hardware.
> >>
> >> gpiochip_generic_config() here calls into the pinctrl backend's
> >> pin_config_set(), which on i.MX8 programs the SCU firmware with the
> >> PAD wakeup source type.  Non-i.MX8 SoCs don't have an SCU pinctrl back=
end.
> >>
> >> The function name is misleading - its only caller is mxc_gpio_set_pad_=
wakeup().
> >
> >This is just a big hack and I want it removed.
> >
> >Implicit in this reasoning is: the only config we support on
> >the pinctrl back-end is wakeups so let's gate the entire function
> >call if we don't support wakeup.
> >
> >This is a *generic* back-end like the function says:
> >gpiochip_generic_config() so the GPIO driver can't make
> >assumptions about what the pinctrl backend can and
> >cannot do. In a new SoC using the same driver the
> >pinctrl back-end could be something different.
> >
> >So this is breaking modularization and encapsulation.
> >
> >It is better to let the pin controller return -ENOTSUPP
> >or whatever is appropriate instead of gating the
> >call like this,
>
> Sure. To get rid of the hack in gpio-mxc.c, we need update pinctrl imx dr=
iver
> and gpio-mxc driver both, which will create cross-dependency. So I need
> to take two steps:
>
> 1. Update pinctrl-imx.c to return -ENOTSUPP for non-i.MX8 SoC
> 2. get rid of the hack in gpio-mxc.c
>
> The current patch is mainly code style change. Could the above 2 steps ba=
sed
> on current patch/patchset? Then we no need to carry more changes in one
> patchset.

The current patch is NOT a cleaup because you add this:

+       if (!mxc_gpio_has_pad_wakeup(port))
+               return false;

If you want you can drop this and related parts and make a pure cleanup
patch, that is fine.

If you want the above semantic change, make change 1 above, fix the
pinctrl driver.

Yours,
Linus Walleij

