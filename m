Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AD1606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zKzaQQx7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYBN35i8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pde4IRbJpAOQk7JvedG1bHbUGI9ubFv6COFmYv6a2fg=; b=zKzaQQx7wJb/RS
	mEvj8mqpaaOumZf6Lv/ddHyFG0dyGEhfpaaiVMOfdc+izF4rbB8ATC8s3DnMQHQiNX2wrZzE5qGc1
	Tihece6oXQPIyUlxZZouvScRh1HbIO+BwmnxLYtDDoDIrmzR3Q2AFm/rAlAzAayaWja5momfcoMko
	8y3ucEiNpmoPmibHiITreQPWnH0n8RK42kIPF9byA/QFx/OIZIz8rFmTbq/0ZXM4cfVRc2W3AaMad
	RGssTFnrmllBHYVaF0r0PZV7NgvnaBlf2qHE2TUWM5d/rLsUTfsBGvVfI6E85k4351NYPaxHQDTxh
	JuOSxncBwfUT9TFbTg2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZy9-00000005I2X-3WyG;
	Wed, 04 Nov 2026 12:19:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZy8-00000005I1o-3f4V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:19:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AB4340406
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 12:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9591F0093A
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 12:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793794796;
	bh=pde4IRbJpAOQk7JvedG1bHbUGI9ubFv6COFmYv6a2fg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bYBN35i8rT5dyUuhJZ8BzmjlTk4ZuycAfAqFlWU0WkCYVmOaCqBtzm8g/W+99MB1/
	 75sEn6/l6QCC6cm9mgv7+2/mTAygCddkOUJHO+aSQ87vRvTjJUjW7o0zea5fOEKj+E
	 vUYzsmn2G/ZaqqzaK0U2n6pm12ZXxe6AaeQQfxHSKFTIh9cEJYOVNL9DHT6KLwBvFC
	 bbehIR7G3CAieHZv/3LCeSNp1CUOflXI7nZhFCXjxEUXe/lgBQD/WG5OFBZnzBaFQC
	 HNKZUEXuWn+/hM19KbSogcIUgtj+m+qfc4v6Ggym4gonZ6fbzK9XD9+zTv3FKs4Phs
	 1M/I0a5yEN2YQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab4c608a6dso7571021fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 04:19:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxao7GTKkM/dh77cl+2x0OD4gkcklIQc6h0iHLFufSWh1FI1CQ7O6LqOAUJzuMnAt1NbNNIQ3j0ReVdDv3UuYWg@lists.infradead.org
X-Gm-Message-State: APuU4Z/nmg87hJL97dnrY4EcVxAX/WBszyxALmgkge2x3B/dpXqan0kX
	jWQRkJGcEikZ7hEFjQkvxk0Fe4o4aeehb3aIfV300zWDqhPRpz7MjZFnQcIu219x5Zdu1ScqM9Q
	UYFqsYt74HAQTA4TG4SykE65wCacQ75E=
X-Received: by 2002:a05:6512:114c:b0:5bf:a28e:4ef with SMTP id
 2adb3069b0e04-5bfd956e555mr5361214e87.38.1793794795200; Wed, 04 Nov 2026
 04:19:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
In-Reply-To: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 13:19:42 +0100
X-Gmail-Original-Message-ID: <CAD++jLkx4oQ2ZuUSUQE1Qtrk-1XSMdnDjfLG0rrOm=gt9VD3VA@mail.gmail.com>
X-Gm-Features: AclHuK-CfwS_0wnxINSAmHAEPIJvv97Wm-Obrw2TLjMQq_EQye6jjyYuZrMjHRE
Message-ID: <CAD++jLkx4oQ2ZuUSUQE1Qtrk-1XSMdnDjfLG0rrOm=gt9VD3VA@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: aspeed: Handle GPIOZ6 pass-through strap on
 GPIO requests
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: andrew@codeconstruct.com.au, linus.walleij@linaro.org, joel@jms.id.au, 
	brgl@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

Hi Prasanth,

On Thu, Oct 15, 2026 at 5:51=E2=80=AFAM Prasanth Kumar Padarthi
<prasanth.padarthi10@gmail.com> wrote:

> On the ASRock Rack B650D4U, requesting GPIOP3 through gpiolib does
> not provide working host power control when the GPIOZ6 pass-through
> strap in SCU51C[9] is set.
>
> With the existing GPIO request path, SCU4BC reads zero, but a host
> power-on request through x86-power-control times out waiting for
> power-good:
>
>   SCU4BC =3D 0x00000000
>   SCU510 =3D 0x00000000
>   SCU51C =3D 0x00001e80
>
> The AST2600 A3 datasheet describes SCU51C[9] as an additional
> pass-through enable for GPIOP0/P1, GPIOP2/P3 and GPIOP4/P5 when
> SCU510[30] is clear.
>
> A diagnostic experiment that cleared only SCU51C[9], preserving all
> other bits, allowed the same GPIO-only power-control implementation
> to power on the host:
>
>   SCU51C: 0x00001e80 -> 0x00001c80
>
> SCU4BC and SCU510 remained zero. No per-operation THRU1 switching
> or additional userspace delay was required.
>
> Add an AST2600-specific GPIO request callback that performs the
> existing GPIO mux configuration and clears SCU51C[9] for GPIOP0-P5
> when SCU510[30] is clear. Check register access errors and verify
> that the strap bit cleared. Other GPIOs retain the existing path.
>
> This RFC handles only the GPIOZ6 strap source. It leaves SCU51C
> unchanged when SCU510[30] is set and returns -EOPNOTSUPP for
> GPIOP0-P5 requests when SCU510[28] is set.
>
> Hardware testing on B650D4U with this pinctrl candidate confirmed:
>
>   - Remote power-on: power-good asserted.
>   - Remote graceful power-off: power-good deasserted.
>   - Physical power-button power-on.
>   - Physical power-button shutdown.
>
> These tests used x86-power-control with software button forwarding.
> The earlier board-specific SoC driver, its DT node, custom sysfs
> interface and diagnostic boot parameter were not used.
>
> This replaces the approach explored in the withdrawn B650D4U
> power-passthrough RFC. The new proposal changes the existing pinctrl
> driver and introduces no DT binding or userspace interface.
>
> Feedback is requested on two unresolved issues:
>
>   1. SCU51C[9] is shared by all three GPIOP pass-through pairs.
>      Clearing it for one GPIO request may affect forwarding on
>      another pair. How should that shared control be represented
>      and coordinated with existing mux ownership?
>
>   2. The SCU510[28] enable path has not been validated. Returning
>      -EOPNOTSUPP is a limitation of this candidate, not a proposed
>      complete solution for every AST2600 configuration.
>
> Is the GPIO request callback the appropriate place to handle this
> strap interaction, or should it be modeled through the existing
> signal-expression mechanism?
>
>
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>

I don't quite understand the status of this patch, if it is still up for
grabs, please rebase it on v7.4-rc1 and resend so we can restart
the review.

Yours,
Linus Walleij

