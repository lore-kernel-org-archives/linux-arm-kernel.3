Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51649606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SM/SV9gx;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QoPNTswb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CaE2mbFJFf4TOWhow4uSx7nxUZ40EeB+lDQEpmH/lWU=; b=SM/SV9gxEZ64WB
	6IjJLJx3x/ns7cRTwuOyuIosfAt5znqpNdomYoFIX63yschqsnCdBp29r7hRNa2FA4+gFpcaII7yA
	kkvnbQ2GvsYo7Pm2UrmGiQlJjoouJA/o3SoICQzTB5Xv7nGtuNDqz5f8LZlORVqFkLx/jNwHdecVk
	HyFa81McDWrQqH5B1KyrVAcG2lK1eYL16Lc/TWB9CPdc6QKXpZR0uMQTigGsGAUOfC/uUb1EEkEmk
	wOgcSWlOUzP4bdlb8vs8ytuAp2ZOS55UOT2eewBXMEAW/+fhGE8PZVeUm6L0Hhcq4w3gVFczbxNhd
	hjTnM4UoMRWhUFghFeVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOth7-00000008Hw1-0zjL;
	Thu, 05 Nov 2026 09:23:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOth3-00000008Huv-37iC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:23:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E9D9A60F2A
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 09:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48891F00A1A
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 09:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870616;
	bh=CaE2mbFJFf4TOWhow4uSx7nxUZ40EeB+lDQEpmH/lWU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QoPNTswbHPNPpf4zeVgFUvtTHoQEKatEp/uqswizvYnP0CXc3ernxUdwm5dzS9oh7
	 UKKn3CE3YDjRjNcXffvCfJMD/8p86nUrbO+Wrk5QdJrWT4u7t213s0pv5Iad7QedZY
	 lGsPfOcLS7d3H5Dn8C9wD6/2yx45/sND3bAtOxbFWfREXtdx6UNxKQxUNvfkpEO0AX
	 1tzw8fHsl3br38ekbwPhQnHVYuskaccJcKVHZGDcowXd1rscGSlwg4DI6EJ2noOq7C
	 3f7v5jn7xkSA3p1avYdYOb/UY4/nJp38MZ2q9wYWyUqM1EE0AU1YP0HP25DHobaaXS
	 RdkMlklfVZXqQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5ba3ec92031so1950829e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 01:23:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzl+ybX45IdypPBUO4kxZ3k+IALhKigEWz1RYINmPPpAwWUHtyoorGRfcGm/avPWj5dohjVFiUN22UhWyNzRn1F@lists.infradead.org
X-Gm-Message-State: APuU4Z+B94k2nwqS9C/uclDqOQS9RpDqM7kxW8WXLiOkj1Q7GgWA6Exs
	jqvwrqxPavM5l2rMrrlhFWjaP4Y1jQyjr8bRj59oBE38C3pDlh9NPCbp8A7ftBE4kmhamarKhfh
	4WC3+1UqDAnhp2KOO0tNKtyoaUynyRCg=
X-Received: by 2002:a05:6512:1318:b0:5be:516e:5728 with SMTP id
 2adb3069b0e04-5bfd958027fmr6146113e87.32.1793870615446; Thu, 05 Nov 2026
 01:23:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103213002.1673560-1-lee@kernel.org> <20261103213002.1673560-6-lee@kernel.org>
In-Reply-To: <20261103213002.1673560-6-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:23:23 +0100
X-Gmail-Original-Message-ID: <CAD++jLmC9k6hpkZtcRUgJRj6rk_knjAQ9cOHitRDBn1FbAgZPQ@mail.gmail.com>
X-Gm-Features: AclHuK89aMeIOVygFGusGSM_QZnZVjoeLN0D3bDiQpEYrRyvGRiPkF-dM-Czu94
Message-ID: <CAD++jLmC9k6hpkZtcRUgJRj6rk_knjAQ9cOHitRDBn1FbAgZPQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] pinctrl: realtek: Prevent out-of-bounds access in rtd_pinctrl_find_config()
To: Lee Jones <lee@kernel.org>
Cc: James Tai <james.tai@realtek.com>, Yu-Chun Lin <eleanor.lin@realtek.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.com>, 
	Tzuyi Chang <tychang@realtek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, linux-gpio@vger.kernel.org, 
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 10:30=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> Several Realtek SoC pin configuration tables (such as rtd1319d_iso_config=
s,
> rtd1619b_iso_configs, and the rtd1625 config tables) omit trailing pins
> that do not support pin configuration, making data->info->num_configs
> smaller than data->info->num_pins.  Because rtd_pinctrl_find_config()
> indexes data->info->configs[pin] without checking data->info->num_configs=
,
> requesting pin configuration on a trailing pin reads out-of-bounds memory=
.
>
> Check that pin is less than data->info->num_configs before indexing
> data->info->configs[].
>
> Fixes: e99ce78030db ("pinctrl: realtek: Add common pinctrl driver for Rea=
ltek DHC RTD SoCs")
> Closes: https://sashiko.dev/#/bug/linux-60e13761-fd9e-4fd3-826a-47344f36d=
4fa
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

This patch 5/10 applied for fixes.

Yours,
Linus Walleij

