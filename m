Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C20606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 23:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UWih7Xat;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cGY3K1M7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCttpM/mIWeoisgI4Oe2UgAbsAorju2aXD0ZdeQI/eU=; b=UWih7Xatmx3d1R7xB4SHzr8esN
	yEO/zD+LM4+D6Kh0231zNP1hdaPUyLdxEQmTUeEwyEWY+UjYiAUGU3jgnhBT0w8p35TZU+O4VTklO
	TncTLgdMR+HWDa36DYRCyQyiA4Lwyj2ggBFu2lqel9dN8+7+iXWq9spbRWTAGgYp71g9dRcuBv4ZF
	+mfcN+jhliitfcZUBycrxfyxl9wcADkcpUPyQDluIP+wcsJWXD7qbVfM7iPyTGDAyH1yFdWm3GL2E
	E8RuC1ucwm3XTSCd57RRqvjcTZwyLTpG+O1sZQSRWJecQpYFxMSyY23olrNRs6+N62KNHbl4gHiWF
	aXHRaOyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJfxE-0000000D3Vr-34Ck;
	Wed, 21 Oct 2026 23:42:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJfxC-0000000D3Vf-41Lp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 23:42:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AD3F60098
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 23:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0691F000C7
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 23:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792626162;
	bh=FCttpM/mIWeoisgI4Oe2UgAbsAorju2aXD0ZdeQI/eU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cGY3K1M7fCHt+Twn9BLTTxRcWwHGXe/n/oshtl388cWfeDxu9OoK6OywwiaavpZ84
	 dM5o9tAl9k8qM2pWUnYQl/zBYKFpouhsneqjvoz7jfgcG1RSPR3pGlzP5zLmP0f2ZP
	 zFmtKN6geV1ZKWVyRGz0ebSnuG5QimrsLqw2qk6DX5RhUdGiEmY2ZzLqDiFaQbH4gx
	 Rl2CXMZpi7GtzfCHCUDobVvkY8vuBmBn7A2+gHFHB3W4zCW/pzOxI/3wNaOqcAMwyZ
	 9hEpBKfGb2clVN0MkRmVipfUya7IG4rTBPUvKvXHtt3W62+MSd9m4fwkW0Un5pxb5t
	 ipnX66rl7+m3g==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so971328e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 16:42:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByW7/pCO176g4M53ROznZcrC/FSJ3K6S7efMSRUE1bdv93Evw3whru5pmzNjkLUDPBm/L2qiJrGViC69PYTEv1e@lists.infradead.org
X-Gm-Message-State: AFq9FYKi5arD6S9crOhLXZE6N7+VVv1izihcHrp3vdyB3aQCmJgl+BsL
	Mn9F8tOSCEv5wsYDVhcQddLq8AFV7vC3TUbMtcfBTgB3pJsQgaNRayHV/RHJxXl42pQxj3LuJWB
	CW37XQUCNe7meV/WXKlJ52O64XLRR5xU=
X-Received: by 2002:a05:6512:23a2:b0:5be:478e:c5d2 with SMTP id
 2adb3069b0e04-5bfa1cdba7emr1474028e87.29.1792626160903; Wed, 21 Oct 2026
 16:42:40 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021121245.3111563-1-lee@kernel.org> <20261021121245.3111563-22-lee@kernel.org>
In-Reply-To: <20261021121245.3111563-22-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 22 Oct 2026 01:42:27 +0200
X-Gmail-Original-Message-ID: <CAD++jLmfKFG7uWWUQg42+vvaRg2NO8GGOji_qT9O+nabf8Q5+Q@mail.gmail.com>
X-Gm-Features: AclHuK-bW_sOqMKCXDtKCtW_jSZo6X1GW1kVojPPLhylF6_iQYgXHCX5xCW8YWM
Message-ID: <CAD++jLmfKFG7uWWUQg42+vvaRg2NO8GGOji_qT9O+nabf8Q5+Q@mail.gmail.com>
Subject: Re: [PATCH 22/28] mfd: abx500-core: Unregister device ops on devm release
To: Lee Jones <lee@kernel.org>
Cc: Mattias Wallin <mattias.wallin@stericsson.com>, Samuel Ortiz <sameo@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 2:16=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> abx500_register_ops() allocates struct abx500_device_entry via
> devm_kzalloc() and links it into the global abx500_list without
> registering a devres cleanup action.  If a caller's probe function
> subsequently fails, devres frees the entry while it remains linked in
> abx500_list, causing use-after-free and list corruption on later
> traversals.
>
> Register a devm_add_action_or_reset() callback in abx500_register_ops()
> to remove the entry from abx500_list before devres frees it.
>
> Fixes: c211b6b9c014 ("mfd: abx500-core: Convert to managed resources for =
allocating memory")
> Closes: https://sashiko.dev/#/bug/linux-6a9c6b8b-8f89-4af5-8cb1-102822e44=
e6e
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

