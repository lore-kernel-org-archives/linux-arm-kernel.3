Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E699606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D7ThDOVX;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ReL2UJWm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iXIfKUGJGkEnqn9QRpsp+DcwEv6yTAPnOh0Ju3Orv/4=; b=D7ThDOVXjQaHVr
	jAOe4y6vE4Sm64pawr+kFrRz7xhXB3ru7XU9Zsn4lfDUXcPOI+37ejo/lnJHLB7/LQmmNk0u1rIDs
	8wFstx/G19lJKidxEJkrcSmmAjaanim3imf2bn4kHRecS6TU6CINXmRthx6mirOrYwotFMj5hUeSG
	95v7KTGDXfXc7Pr/ObxFiOykDPPkEmLFY9+hfIl7MFb+HHgYymawpVDvQ49hXDPsMMZe2dVX2FZkE
	mZ55+OA3aCQdedKtS5FIxlyGzqVuwLnSbkRCJEafC3GqgdXWI0T+wCaIrIXLY5a6ojkiczdB8dIMu
	KLbdeWcyzv/nQq8KGDdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtAQ-00000008CDS-1azh;
	Thu, 05 Nov 2026 08:49:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtAO-00000008CDL-2hhJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:49:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A4043601DE
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 08:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF401F00A17
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 08:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868591;
	bh=iXIfKUGJGkEnqn9QRpsp+DcwEv6yTAPnOh0Ju3Orv/4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ReL2UJWmNZ5TxcrGIpbnhGyNp15nEgfXjZNsOeS5W6sHxs5USw7+ZVbdKsZy09F1z
	 pRSB/TuMSFPtsXMNDG1SsTLvPYkJZ0TsGP4FO5x1zVQgyB2mNOZu7nHyRKg0r2l9TI
	 tWfYU/iKpxdFgbSDSfiBjvDXCoGYUKXe3cLUsYxx61v/U6cVmrY6/2l4dA2FZIfWZA
	 0sjsdkJ/VvgkEU84ZRXCtJkq2gbT7exadCn5Pv9/lT9A3S8Hxv+7GKSMPeOLtyqz+z
	 uJWk4bJnyJP7sadqT0trgPRv3UduGH/blDEYxmEGmQwQ9nqXW/rBCNws/cuGIrKTyi
	 7URlnRPbQGTVQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5ba3fba0080so1221129e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 00:49:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBykjrlz4/zFjVj4JMqeRyLeSwzCa+/cNVUf4Dze8XfgQkbBSiindP6GKrcMAHTBGnCtO1OGunGrLZ34HdAoiZHJ@lists.infradead.org
X-Gm-Message-State: APuU4Z8unB0rbJNBMw75uW/ePuGLsNhWurGwki3JNyO99u2qmThfquhL
	U7sz8q6fS5obcWouz6IHjKz2TUW0mKjEQJ2QuEQZHKxZlWIDbnjXxQkEYiEyIWUCEN07Z7O1s5M
	gLyvOgSLfnLlyjpqG8XIMXaWkGckdeCM=
X-Received: by 2002:a05:6512:688b:20b0:5bf:e4e6:7f78 with SMTP id
 2adb3069b0e04-5bfe4e68c03mr2745563e87.39.1793868590127; Thu, 05 Nov 2026
 00:49:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103104242.1373883-1-vulab@iscas.ac.cn>
In-Reply-To: <20261103104242.1373883-1-vulab@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:49:38 +0100
X-Gmail-Original-Message-ID: <CAD++jL=YuYS85WFBv-dHJLqMW1VMgoTo3YSnDU8Yqg1Tp3Vd=g@mail.gmail.com>
X-Gm-Features: AclHuK-DqpeWMThWze48WguFPTy5w3muiNn0JsxnoY0aN27dGfjAgVQWa0g9Prk
Message-ID: <CAD++jL=YuYS85WFBv-dHJLqMW1VMgoTo3YSnDU8Yqg1Tp3Vd=g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: bcm: release the NS2 pinmux controller on detach
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

Hi Wentao,

On Tue, Nov 3, 2026 at 11:42=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:

> ns2_pinmux_probe() registers the pin controller with pinctrl_register()
> and stores the returned pinctrl_dev in the driver data, but the driver
> has no remove callback and never calls pinctrl_unregister().  The
> controller is therefore never unregistered and its memory is leaked
> when the platform device is unbound.
>
> Use devm_pinctrl_register() instead so that the controller is released
> automatically when the device is detached.
>
> Fixes: b5aa1006e4a9 ("pinctrl: ns2: add pinmux driver support for Broadco=
m NS2 SoC")
> Cc: stable@vger.kernel.org

??????

What is regressing due to this?

Don't add stable-tags like you add sugar to cereals.

Yours,
Linus Walleij

