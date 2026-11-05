Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910C9606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q7nwzOIh;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U4ctk/e9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1NnQLqR2uCMnd3itzlh8VaOt0O3sai2BlY8pcFdTdmQ=; b=q7nwzOIhaTvHJq
	IpHS9j5WpwXtKLa7nL+FpZjLld6BkgmUTzhIGhIFyuC3UG/VI4EbjD4rq2/ugKii4j+JEgRxS2a0B
	1d1rst93TAOCgkNrkKwVj/P82E9crnLMacjzHim17Wz6VJ9NvOAeMa0cm8P/MbGSMPf64J5OpySGm
	CmDiqX73AoIo/gsekIm3zYSOJ/KBKcxaRqmlapt+otwtZdEDOmM3+ua9t8ifkJezZcA07uK6ENsWV
	KvH3UEkpOgTA1dnTtcjcm1j24jx/eG+0acnq18h0Lu9sA22nnkDNEVV9Be6jEQDOY4tDvR1HDcrPK
	ykEnoAX9fcjZMWnKNCdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOt33-00000008BFD-1raJ;
	Thu, 05 Nov 2026 08:42:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOt31-00000008BEv-3MXd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:42:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D8C141F49
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 08:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2241B1F00A16
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 08:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868135;
	bh=1NnQLqR2uCMnd3itzlh8VaOt0O3sai2BlY8pcFdTdmQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=U4ctk/e9mR76UFfWfNOi4UBakuAFAgvSnuMzSCONjbimL9Cmh/iCW9hfY92HjHYRc
	 1ikUEYqDBRbs9oe7VQrQrcaNFIHjZDOYt6OxxNKF0ft4p9bKIFxeRqXywmIlf5GtNS
	 8VeWq3fXHnKoVnxOu5ULi8PyGi21xD8I3IZ6tZ2h4YGFtKCUeT3ZzC8qVuE8DI1BYL
	 LmYmwCClAxbBL7tBgZwctIRXLpeW9UgowwkihVU72hG0qOFx6Qp29B5zKFXb+jleuj
	 5SjeUMaoodTCFvb3M7YgCwpFiaXUyEBOYt4OpFb+nrAO2h8uzR/kkyT/Uh1PW8zZKu
	 iGcE7XV5M3MAg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bfa686881fso1260959e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 00:42:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxifPC/AmzN+SEJdh4/iPmf2bOE6V0WcgOutNLbNP5vARtUunohm97btFOYXmPsS0wkvufnrKf9W6OEHkVbFUxg@lists.infradead.org
X-Gm-Message-State: APuU4Z+S4TXispMc+DZWSGOQzB9XfuCX8QacUPrFjhB6uLdTwIGwg3Hu
	UWZybKd6vaAfQGctNI16Ylca2hs+d38w45CNVs6sxMsLNwjn5d4UECw79ZBr/REmmCNgUwR16KM
	0qQY1d54ChKr+F+Fceg37J2n+aGZSE9Q=
X-Received: by 2002:a05:6512:3d1e:b0:5bf:d653:ff30 with SMTP id
 2adb3069b0e04-5bfd954bb16mr6226650e87.7.1793868133918; Thu, 05 Nov 2026
 00:42:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com> <20261103-i2c-nomadik-fixes-v1-6-655c6af2cb70@mobileye.com>
In-Reply-To: <20261103-i2c-nomadik-fixes-v1-6-655c6af2cb70@mobileye.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:42:02 +0100
X-Gmail-Original-Message-ID: <CAD++jLm+m+YNhTaUnTm=dwO4p8xYe8OjZ7qhQ9_u15dnxURiVQ@mail.gmail.com>
X-Gm-Features: AclHuK8NQyqVDfhK78w809jJIaVTKTrl2fy9xxD5EKcQscvjepyMgbErwdGzdGo
Message-ID: <CAD++jLm+m+YNhTaUnTm=dwO4p8xYe8OjZ7qhQ9_u15dnxURiVQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] i2c: nomadik: handle pm_runtime errors
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, 
	srinidhi kasagar <srinidhi.kasagar@stericsson.com>, Ben Dooks <ben-linux@fluff.org>, 
	Andrea Gallo <andrea.gallo@stericsson.com>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Tue, Nov 3, 2026 at 9:30=E2=80=AFAM Dmitry Guzman <Dmitry.Guzman@mobiley=
e.com> wrote:

> In nmk_i2c_xfer(), pm_runtime_get_sync() is called on start and then
> the controller registers are accessed without checking the return value.
> If pm_runtime_get_sync() fails, access to the register of the device that
> was not correctly powered on may cause a bus fault or other unpredictable
> system behavior.
>
> Check the return value of pm_runtime_get_sync() and it if is not 0,
> return the error immediately.
>
> Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
(...)
> -       pm_runtime_get_sync(&priv->adev->dev);
> +       i =3D pm_runtime_get_sync(&priv->adev->dev);
> +       if (i)
> +               return i;

It's a bit odd to reuse the i (=3D iterator...) variable for this.
I would just add an int ret or int err for this.

Either way semantics are right so:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

