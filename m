Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF1B606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 23:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cCKhVw+w;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1llVcx/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4DhFTEeDoKbntxLITsLWIvgLd3FXN6aVEqXjdkWZdA=; b=cCKhVw+wq3JrNAIZzpop0316XK
	LYGgsTrBZazGRsp/bXfvThQyTFy2ekv+27qdO/OD0QiZYUy9JwXNarMF8lyRClezElCY2f787GE92
	W0YhQNxuVBiM7X/bIkBvfZAWRvXsQKJQSsEnvNWs6YZUD7uOhO32zzwqvDXExo0cDd8x/yEwJ0MxM
	IGUgdMU3ENhmHE1eZg0h4+wpSyUrMYNudTr8E6ty7MrDKajke8QUV8eMJzQ+pcxks18CnSOxHiBZw
	TruRNxzlm4toO7KDTUIvsldl3ti7aEa2xrdDegzL7vegnSfOAD/OevzoT9V/p8EOQ4AltCCm1asY/
	MgL0DwJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJfvr-0000000D3Fe-1cwz;
	Wed, 21 Oct 2026 23:41:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJfvq-0000000D3FT-2W5s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 23:41:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A3BE601FF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 23:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506541F000C1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 23:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792626077;
	bh=J4DhFTEeDoKbntxLITsLWIvgLd3FXN6aVEqXjdkWZdA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D1llVcx/Wcx2gxACxf6PGWvV4TKxazaq4Q3KGU6h4AZUmyGDLgr1XhGcuLAN8UDtF
	 ds97t3PfI79HGI/CpZotBeWlUyaPy5sYWX+4YbDhQ6knZLFpLKG0GTdy1hj0kW7QfC
	 zHaCd4xsoKRkjww2W1UASPu8Vpwr3j9QQphByjXjMOm9LeDq46blt1y4eyvPJTfIxl
	 nPPOCcOWt/D5lR77swScRX+J1VQNYhdZddlBq96h846cZ0fTwnGY7ja+x9/BgVgmEY
	 Zf0ctifTnhFFcvOyVY+1kNPzOE0WQ0QAU90vZ1FfunNlrQyobbIHfYIDgddnh95OkA
	 3cp7cfs1mbd/w==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ba35c0df4fso1357445e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 16:41:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwc8t61upHn+hSn7d3n9xsRHtX8RYFjVVSXskmksG3TBpZhPhofEGzRBkJuORzKOmT6ZEJVt+j7cKfovDg/OxBT@lists.infradead.org
X-Gm-Message-State: AFq9FYLlBodZu6meGXi/nE2q5+JNGmG7/yW7a8XFPbhslPJ/ky151G8a
	l+rFq3kefnJqrePz4fpatak/SSmmvJJWH6zKg4c0UOXOukOxbVDnBxZKXY5AM+DjRW9UAcpt4/P
	jFLVmT+WNDHUBoKYcaVj6etlWyfpi1yU=
X-Received: by 2002:a05:6512:3e0e:b0:5bf:7c40:d086 with SMTP id
 2adb3069b0e04-5bfa1b96422mr1376212e87.8.1792626076140; Wed, 21 Oct 2026
 16:41:16 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021121245.3111563-1-lee@kernel.org> <20261021121245.3111563-23-lee@kernel.org>
In-Reply-To: <20261021121245.3111563-23-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 22 Oct 2026 01:41:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLmLOP+5ef-iLvfzc_7RCD9+qMsRgX4ngD1=tiafBw_3qw@mail.gmail.com>
X-Gm-Features: AclHuK8pfYXRmoE4oCo4fv8YhwqKRNMvuqICl15jr0fU6UsmfMQ7frp0R1kJ7GI
Message-ID: <CAD++jLmLOP+5ef-iLvfzc_7RCD9+qMsRgX4ngD1=tiafBw_3qw@mail.gmail.com>
Subject: Re: [PATCH 23/28] mfd: ab8500-core: Register sysfs attribute groups
 via devm_device_add_group()
To: Lee Jones <lee@kernel.org>
Cc: Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>, 
	Rabin Vincent <rabin.vincent@stericsson.com>, 
	Mattias Wallin <mattias.wallin@stericsson.com>, linux-arm-kernel@lists.infradead.org, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

Hi Lee,

On Wed, Oct 21, 2026 at 2:16=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> ab8500_probe() registers up to two sysfs attribute groups with
> sysfs_create_group().  On AB8505 and AB9540 (cut 2.0 and later), the
> second sysfs_create_group() call unconditionally overwrites the return
> value of the first, and if the second call fails, ab8500_probe() returns
> an error without removing the first group.  Because the driver context
> is freed and driver data is cleared on probe failure, reading any leaked
> sysfs attribute dereferences a NULL ab8500 pointer in
> get_register_interruptible().
>
> Register the attribute groups via devm_device_add_group() and only
> register the second group when the first succeeds so that devres
> automatically cleans up registered sysfs attributes on probe failure.
>
> Fixes: 93ff722e8853 ("ab8500-fg: Add power cut feature for ab8505 and ab8=
540")
> Closes: https://sashiko.dev/#/bug/linux-a9ac1a9d-5a97-4ad3-b4c5-c7775c24a=
333
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Neat, thanks for fixing!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

