Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1DFCA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 07:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g090mOLY0GjseIayblfr6BbC1w37mRK2LGnf4ra15ms=; b=Ym8Cdk5cf16aPSE2Isc9D4M7R6
	7KsoJZeyYfsUAPNGfFjOr8l29r4aqDZGqs0cuJG5xomLZH04eDsY8psOUa3zCIup4+5g3XEVQ2XB/
	hZ/zbpzI6ZMzgcY/lxFigV/Qy77z2Iy6XJ7kYFIx/SwJhK+Sdh0KKWUICWGixvjj3ltMLWw0428YF
	q1TFx8KzxvSTZDPf65MspiIEIay28JwvzER3BZs/aqLxtz51RJTGkX/VJfE9dUJGMZSPeoDFk359C
	oilgETQgBz3O1xwJ2mZZ0LwpK8jiS+jcP40Dwsihm7yZg3iE9zdezzF/EX2FdL52UcR6BSykMFmyC
	6JNEVLkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unueD-00000006pE0-3tGb;
	Mon, 18 Aug 2025 07:51:17 +0000
Received: from mail-vk1-f182.google.com ([209.85.221.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untfm-00000006i57-1SIY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 06:48:51 +0000
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-53b17194b1eso3130027e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 Aug 2025 23:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755499729; x=1756104529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g090mOLY0GjseIayblfr6BbC1w37mRK2LGnf4ra15ms=;
        b=p3kGGIx0oz0bBCu7v+RFc00N7iWcIwjSImNtURt8agInNYYYJ14yakvkB46fziEYu8
         8kqLiKn4OA3ATiBY2mG+VVAFnDRjcSBulS93joiy8r1fPlv3u/SDFsAz1c/Cip6MQie/
         ED77lSojkHjK0uZxopm76UnCuFFXSVfB7dzcP99VNMLowCG6vHl3JBZ46Trc6bqI+AGW
         bOnpiScKUpfF1SSuY6nJ/zsld8tfYwhT9Z//TfN2Ca4Kc+++cCKdq3TiE0Un9LEfmk0g
         SUIverREDQUnRhz+AzDql5d2BGlVRFeo5mHo9bVkMJA5U+HlTPnDI4zl05BL1uTFCg9K
         BIBg==
X-Gm-Message-State: AOJu0Yxe5C9G1pnKXd+4DzOUhNUOPNNnKkV2dVzL/CGB2Gb66h5l8oFv
	WgqfiP/Me9WCXd/40rXYaANgtr+ECLDZB+KxMqN8qMw/Sv9cKuFSSHopforC5Oqq
X-Gm-Gg: ASbGnctBGnhmE1vG5rF5pDlJ6UfWPFykNGjOhim6Ew6BRBw3R7i296+nMMDjU28d9Ed
	+D4u9xEiYnEq4sG+CxTBjbspwlyQTjhliZw9yOS5JwXrR5hWD1bKYYA1JSwboJ1tbXlFkNS9RCJ
	HamxuPcmVqEZ8jm/2TqaEARGHSuS3ybgXCHF9JXrxjkCQfy+5qYyLHg242aWQ9xLN/2OK3uyFOA
	WRw1C3UP1kXqvpzYNpisR4uUV6FgtIQVNXOYxdSNPMsTU0t4ULOqEry7PKmpHCrH6Kdq1dYpdXF
	VaTrSiGeBRfysidu7ZuKakfwrRVDRPgXzT/POeU2HMX6Dgj9F1I1Si3MEXp/Pv/OTpepJFpbE08
	AVhfmpsOJ1FzgMOrwI+eOPfF3FIbVo75OBC4LGQ6rNUDfbijdvv0AdOHXiEe0
X-Google-Smtp-Source: AGHT+IEAy+oVnph2zZumCDGhirYyUbmXQPlRayza/gehW0Wgw6Pbn8MXtyTapt0eQ4Sb1p01H2kMzQ==
X-Received: by 2002:a05:6122:d9b:b0:539:2a2c:6ef3 with SMTP id 71dfb90a1353d-53b3538aa7fmr2419391e0c.7.1755499728706;
        Sun, 17 Aug 2025 23:48:48 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2bdb453asm1654585e0c.12.2025.08.17.23.48.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 23:48:48 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-89019119eeeso2435613241.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 Aug 2025 23:48:48 -0700 (PDT)
X-Received: by 2002:a05:6102:50a1:b0:4c3:64bd:93ba with SMTP id
 ada2fe7eead31-514c8e87202mr2768722137.11.1755499727845; Sun, 17 Aug 2025
 23:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250814233529.191874-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250814233529.191874-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 08:48:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWObPb97mYrPDBikjHsy_egsPqmMvoTgq4p6y=e_HE75Q@mail.gmail.com>
X-Gm-Features: Ac12FXxyeNIsyfCz0-lWV2jv0Yu1az_ElYdYVkMq34gKzKZ02Okpj8UUWdWAGZk
Message-ID: <CAMuHMdWObPb97mYrPDBikjHsy_egsPqmMvoTgq4p6y=e_HE75Q@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: r8a779g3: Update thermal trip
 points on V4H Sparrow Hawk
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_234850_382871_7BBE00D5 
X-CRM114-Status: GOOD (  19.96  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 15 Aug 2025 at 01:35, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Since the Sparrow Hawk has a smaller PCB than the White Hawk, it tends
> to generate more heat. To prevent potential damage to the board, adjust
> the temperature trip points.
>
> Add four "passive" trip points which increasingly throttle the CPU to
> prevent overheating. The first trip point at 68=C2=B0C disables the 1.8 G=
Hz
> and 1.7 GHz modes and limits the CPU to 1.5 GHz frequency. The second
> trip point at 72=C2=B0C disables the 1.5 GHz mode and limits the CPU to 1=
.0
> GHz frequency. The third trip point at 76=C2=B0C uses thermal-idle to sta=
rt
> inserting idle cycles into the CPU instruction stream to cool the CPU
> cores down. The fourth and last trip point at 80=C2=B0C disables the 1.0 =
GHz
> mode and limits the CPU to 500 MHz frequency.
>
> In case the SoC heats up further, in case either of the thermal sensors
> readings passes the 100=C2=B0C, a thermal shutdown is triggered to preven=
t
> any damage to the hardware.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: "Niklas S=C3=B6derlund" <niklas.soderlund@ragnatech.se>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Add RB from Niklas
> V3: - Sort DT nodes
>     - Update comment on idle states, note the 0..80%
>     - Add RB from Geert

Thanks, will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

