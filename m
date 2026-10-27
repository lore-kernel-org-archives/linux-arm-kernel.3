Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E7D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 14:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EBuqwiIM;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTrYKY/N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=65YpN1lY+wIR6jDJdFChwRJvAOKrauAXqkCBZN30u8c=; b=EBuqwiIMA2v4cM
	HT4P/Jo/2zQOSBzyRjUXHcrXtVaglD+mh1r3PDTE9MBov2LIMdB1zXOnXvvPhVDqu+jFt83/98hre
	f5GJwHEJNTlVNZbpalJBY534CT/FGu/D0rdPQ73n6FizqNHkEUl8ozBHoS19EEkmttRBbliJn3tQb
	OBbVI05YY7//lkGeSFH4nkAT9Bco6d+AY51WJbMXvsblfMS+PcuYJu7pcbphnJohYNNaBmUQ/EnPm
	m2MAZEkGiXUNeQC4Ujyhj4TeHK6cIugNQau8L0eRT+NAiQRWIIQK6H3r6L8rGax4cFR+vWP1l8nGL
	dOTbSCURJbc0ITbkl+Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLi1m-000000050s8-2fdg;
	Tue, 27 Oct 2026 14:19:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLi1l-000000050s1-0oDl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 14:19:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BEC860236
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 14:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B7F1F031E4
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 14:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793110788;
	bh=65YpN1lY+wIR6jDJdFChwRJvAOKrauAXqkCBZN30u8c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bTrYKY/NCtBQEqHzZxx5FWO4+paP6G4Zi606u8ECeNkDqyadFAAmZ//dG3grmowVm
	 d1tciUMEEDAQFCj1uYrrSKri/n6ePDG9eeISLDcFHhEl557VzR+RXrO31eGIO8eQNU
	 JTkprt7vienttMNV5MxlOGduU7dpzTNS/y8MU50kvrBTrwzhzoZISIeYECH7ena7Eq
	 6/otvp2wsbwRx5Z6CXoWzFM/wTZbzOIWo8tv42AVzG1/qMANM2RCs0xSe/KNLOlSZN
	 VdzIxQpxYfFhHzkRW3TnKUV0ZddDh5zMSpZ/iEme/pBnRjBgjgAb+2lpT9sdJJYSA7
	 LB+VxUC7mQXQQ==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-451a49abd8aso3950768fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 07:19:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy3XdKEawL9QPnLcWu20fMYUiOGeb+MoGihcLZaXYCNrlFUCCB6oYwgEKyBrXj8GYsMPgJXgnyf/mUz8PeaQpYx@lists.infradead.org
X-Gm-Message-State: AFq9FYIONZrkvQ8QALE8Va7iboBxW5Hu9Y7/89rZmQzvBrB3t0owe6dK
	VfIhKxzysRHyQu08fztuj39yR4RThZNHUOQtFg1gmIrfXHc5DMQewIpkG6EXLL/sS/S1fStgCS8
	XtVE465jN+vs6ARQWcWYKljXIBR9vyAw=
X-Received: by 2002:a05:6870:8109:b0:48f:e0e5:a205 with SMTP id
 586e51a60fabf-4a83f55fc6amr6537849fac.57.1793110787343; Tue, 27 Oct 2026
 07:19:47 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <528b079a19bd4043754bfb56db8e5950bdda62f6.1792776697.git.geert+renesas@glider.be>
In-Reply-To: <528b079a19bd4043754bfb56db8e5950bdda62f6.1792776697.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 15:19:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLkgVwJCKbQEpapoBtrUdfBLTyR-UpcDxfduw5cOfOHsaA@mail.gmail.com>
X-Gm-Features: AclHuK9sHLPk_RjSdPfQ2Qb8ggjUTeBfa7KowfsZSBkBlD3ysUfPGnnDgLhFvkE
Message-ID: <CAD++jLkgVwJCKbQEpapoBtrUdfBLTyR-UpcDxfduw5cOfOHsaA@mail.gmail.com>
Subject: Re: [PATCH 1/7] gpio: rcar: Convert to gpiochip_generic_{request,free}()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
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

On Fri, Oct 23, 2026 at 7:52=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> When a gpio device node has no gpio-ranges property,
> pinctrl_gpio_request() returns -EPROBE_DEFER and its GPIOs are unusable.
>
> Restore the ability to use GPIOs before pin control support is added by
> using the gpiolib helpers instead, which cater for this use case.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

