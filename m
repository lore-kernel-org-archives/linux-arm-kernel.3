Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141C2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J9RA8LJM;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kv/z32sT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Pm4shQIXu/YBtkkHvvK7yJLwXmgaG24l6vzhneZ0tVs=; b=J9RA8LJMKYp6EC
	iCqnoYjWDXv9kAXXOzcn3owKJ+2nfJo59Q36sX6zbd3IaDaLpXVsGB8XhgUWSPzYL415Ut4nYL1Gw
	yaEJj2I7NMt8YK+W565dpNL9DS7yCdrqGtHeJgq4K7q1ux4fdPwWrQi7kmblFwAg9KkjZqIN9Adh6
	T1P/WvmvoWtwz85rHNfU8bfIQXDjXIAPMiNRKdj76al0YLvLfvXxgDQcuCAZZ2KIcaQlHz5GuZxjq
	xf2NvfGbmDIBEC8neZuKeu+KtHcx4Pn355DhipGMVhc8hOSQErLeoaHkTNYio9MCsyAixIvFXwCOy
	ERHATFy7jMX5OKyS4aqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNHo-00000008yD0-0a23;
	Thu, 29 Oct 2026 10:23:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNHm-00000008yCj-1Rsr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:23:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 459A96022F
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FC01F031E5
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793269385;
	bh=Pm4shQIXu/YBtkkHvvK7yJLwXmgaG24l6vzhneZ0tVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kv/z32sTIuRqbDuFRY5H3/gUkbCHg5jcWqiz8ua+9UWdLO2gKpKI5eYNDiKVzDnBH
	 ZExWIGDrtF0J3w2Cr/3Hgh9ERZkziyUsoCnSyG4R25dGZ6ulKYCgd+uof/qCzzKbOr
	 9LtBWCjQ/zMEyjNHf2pj2SNostdFCF2nI6DPcrOxhIaBwpsatOZx/TCV2T0NdRK+MH
	 Rrw2Jot9G/ycktHUQxgUi/zXj8/bn1f5HWA6D4FmjciMu2GNZNBebOP6Ul9GnBx7Li
	 NdOeaxVlaRSFEjIK1Ih3aLpGEzSUYhbGSMfF6v0yaeZIIe0JO4LXSqMkpHWpLm/TCi
	 W08vCoO1bHcRg==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6df7f544919so1218881eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 03:23:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwQRBuhQDRnmXKsxiPF2ByD7qok3/2Wyu2loD3wsi+E8nTq/Fd7NMtozwc/hqltg0mFBjSzkJjHRY7pTH0lRwaG@lists.infradead.org
X-Gm-Message-State: AFq9FYJPAQqoQB30MnsxINcITZM58nfgECNq9ZLlWRXO1XAO0LA4gqe9
	TguCmZKF+qEQEw4Wo979yASKXDmL1Kuu+UCLuYHrRBBwhd6eZwkOEOqRAJCrXXkS9saoU0zLGRe
	nIhud9ggc3OpOJNVyZVymq3evh6kJIVk=
X-Received: by 2002:a05:6820:1501:b0:6dd:3534:478f with SMTP id
 006d021491bc7-713f1f4f57dmr2819317eaf.73.1793269384310; Thu, 29 Oct 2026
 03:23:04 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com> <20261027-gpio-mxc-cleanup-v7-4-v7-3-7b602d70c149@nxp.com>
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-3-7b602d70c149@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 29 Oct 2026 11:22:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLngEKZOQm6QK7BzMdCRqNj9-9Ui8JxP+yvCtOOvGFPWxA@mail.gmail.com>
X-Gm-Features: AclHuK_F2FYCXxfvG5vSK3S2hpbujv-j-QBd2VPacOk9bLxQe1BEL834ojBgIss
Message-ID: <CAD++jLngEKZOQm6QK7BzMdCRqNj9-9Ui8JxP+yvCtOOvGFPWxA@mail.gmail.com>
Subject: Re: [PATCH v7 03/12] gpio: mxc: use 'unsigned int' instead of bare 'unsigned'
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
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

On Tue, Oct 27, 2026 at 1:13=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> The kernel coding style prefers 'unsigned int' over bare 'unsigned'.
> Fix all instances in struct mxc_gpio_hwdata and mxc_gpio_to_irq().
>
> No functional change.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

