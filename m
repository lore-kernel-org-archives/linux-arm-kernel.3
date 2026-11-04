Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DFD606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F//Qzjv3;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mQtWwU57
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=c8OLoXUADxmTIhb1ARQ3kSmrgr4mjHrNRuEWZTw6vgM=; b=F//Qzjv3vwVY82
	KOYSMmcLdKV7UOTiILyBYuGtXoQp3MCVtOCgn99U+09N1xFROIBDOvt3y/Mf+EjMB5ZPecjsvbvuz
	yoppu1l+YzVDTul+deM16Q00JINTBfewVy1cde7HOuW0AijdxfWBz9KVLMLYltHBTbUHyGwbF9V/w
	gSnIKVvBsy2D/BNQPZyoIblR/t2uIX13ytlRBXD938RVDRi3RKfD5EvMkoYKSSQLaV4aKXLJGHzge
	n4Fv/tlILoxRhr54cd2VemD6IOMY3xNQGgLQJvxFbueokFRSMw+9mRSFLYmD22TTz7mw4mh89qJiD
	iKWjabZXVC+y5R+9j4BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaVo-00000005PTf-3cfn;
	Wed, 04 Nov 2026 12:54:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaVn-00000005PTW-0cOz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:54:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A3E063087
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 12:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338D81F00A1F
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793796882;
	bh=c8OLoXUADxmTIhb1ARQ3kSmrgr4mjHrNRuEWZTw6vgM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mQtWwU570HRWwVBIJsn0PDSTB3JR5ujGhAe3RwRSf4gp7sIoS9iNOx3wVDA9Cjldw
	 SEWFm76qn4Xwfw0gM2tG+GU07r6txv7NuVFVkSxAG1Bjms3/qV+lkaQIIhken3m41h
	 pLpGhKUjsNY7Xkja+NvFM1x7ZGoBEo1QvJhq+6+39cNMABSLfWudR3ThE3X1LIM+EP
	 FBkddQToQZr8ebcdnPk+9hfpC0LUy2rtgxh3B7i7mQNE2cD9dW5bIF42CvrV8B5J4f
	 zG2pQzMvlFuBtEtyHGK109W6UZWlkYSNgi2i1CNBxXs2IXKIPD/F/20J+PHsWRd3fr
	 xHvn4l9pQYs7g==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso701793e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 04:54:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBySTE4CZQw9QyWgOiKnAdOApI3Ji76tErmJIzOyKCTBwfnZH6tHIGSHBtsy8u5kgbuZlIzTXJMbZpl760Oc8P+b@lists.infradead.org
X-Gm-Message-State: APuU4Z9ahuLFH/Z5tRy+BPB0jnRuJ6KwPZBgiA5HHKyhNgTvTo6pVtYD
	L1bnu8H0magkZixyQx+rvYj0yShVALrvPHO4LfD6ZgugxEJ+XvRZ7ftfjvM3DrQCx1r/zZOeDpp
	cKuAi5iWnMS/cp20ghkaWNSWKmzpvj0Y=
X-Received: by 2002:a05:6512:3b0e:b0:5bf:b5a1:390d with SMTP id
 2adb3069b0e04-5bfd9569843mr5461686e87.27.1793796880916; Wed, 04 Nov 2026
 04:54:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019-b4-imx937-frdm-scmi-pinctrl-v1-1-0576fb20964b@oss.nxp.com>
In-Reply-To: <20261019-b4-imx937-frdm-scmi-pinctrl-v1-1-0576fb20964b@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 13:54:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLno_ViL5X7+NLvpS5EQObXR9UpsphHH37iSKumDU76_SA@mail.gmail.com>
X-Gm-Features: AclHuK9G2TThs1q916LoUpjeeYNp5qScvCLIPbgAZ1ECJyTzREIgJY25tvkfh9c
Message-ID: <CAD++jLno_ViL5X7+NLvpS5EQObXR9UpsphHH37iSKumDU76_SA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: Use of_device_id match table for per-SoC data
To: joy.zou@oss.nxp.com
Cc: Peng Fan <peng.fan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Ye Li <ye.li@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joy Zou <joy.zou@nxp.com>
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

On Mon, Oct 19, 2026 at 1:05=E2=80=AFPM <joy.zou@oss.nxp.com> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the hardcoded of_machine_is_compatible() if-else chain and the
> static string allowlist with a proper of_device_id match table carrying
> per-SoC data via the .data field.
>
> This eliminates the static local variable anti-pattern for daisy_off
> (lazy-initialized, shared across instances) and adopts the idiomatic
> kernel of_machine_get_match_data() APIs.
>
> A new pinctrl_scmi_imx_data struct captures the daisy register offset
> for future extensibility when new SoCs may not use register-offset based
> daisy configuration.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
> Replace the hardcoded of_machine_is_compatible() if-else chain and the
> static string allowlist with an of_device_id match table that carries the
> per-SoC daisy register offset in its .data field.
>
> This drops the lazily-initialized "static uint32_t daisy_off" local and
> lets probe do the compatible match and per-SoC data lookup in one step
> via of_machine_get_match_data().
>
> No functional change intended.
>
> Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>

I don't know if this is the latest version of the patch... if it is,
look into Fabio's review comment, rebase on v7.4-rc1 and resend,
thanks!

Yours,
Linus Walleij

