Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DD1CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9oPjoXljJJlUVHMn87s6VhA1+MnxIqFzqOvfh/e2MM=; b=G4LyHm52hA7uEbbzbMN2moUORH
	H1MFlQWRRvI9DNmHy+6RHIwZQFU/lCbEWhRkCigFWWLehDws7mbcUr3Y5krZsXESm61eLjlg/pFwC
	66qAtStUHyw03KZGqa8fwJ4Ij/tXzGW1YHKiT5Q9VW7f7evtOnUa5B8UXUVT+Rao0GVfWxc8IOyRh
	RNVj3fXzMhGpCLieEXXC0/JuW4M+HWS0poW6fixcajeip5XfHn27HoVA8CpkciBT4i+hyJg0V7YKx
	CIaIOArsaOy311CC3x6Uz1qEmiQg5/Y0dVCBRA6KwFlMiXuVu4GyHYsT4G6jUBmgFR9GVTbertzin
	UAF5beow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVQE-00000002JRy-2dDj;
	Wed, 22 Oct 2025 09:46:22 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVQA-00000002JQp-1fH8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:46:20 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7c28559bb45so3311038a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 02:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761126377; x=1761731177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9oPjoXljJJlUVHMn87s6VhA1+MnxIqFzqOvfh/e2MM=;
        b=j/t4Njxltt3KrZateeR2g6B4wGoTurgMarxQh2uMWpRMS4LwSMqVnQZdXOHl85EvPw
         KJPSUVSj0PqNEAgHcnD+EGod1VBIdo6jDvy9fifRKKY4BPpEsSMHk2S46AjZ3c8M/mAR
         GLDRgcBgHYgXdHoWmvkMw0tIHli29IhM/sbp0MYb0iyM4giecv/bBPEBaGByypPs3Avw
         3o43qlelJCE2Ddpfl4CdRRTaDYVgtniQ4p6M5pUYHYZlbKXNQGWgQN8DuxOr0sp1Wrfz
         J9VskAmoy2+RUTPggAUHdiRTZ5AVYKOiV7GJk4O12eoQWef7CSnXtNDE4KrhPuPXh6ed
         CNjg==
X-Gm-Message-State: AOJu0YwqeGBHF1MUiV4SxpA0w85fbP8CLl4+psX4sXOOp/vDAt9EqGKx
	h3bIjrCEPS88cMaLuwZVhHyg4NhcVupq14zNKqWd+dw9STl/A4LugogAgeMcczcP
X-Gm-Gg: ASbGnctrgd4IU26CFcOlkzWv1SAX3lIEOUqQMK6WQVc9USf63vbcnNibMyZLbR53Eof
	2XeN8q4ptKYtI7Vu4LH832Ixez16qJVGtx4Af0xsQvYIl90vNpc/HotRhjXJUywUEu6xC6zI+fZ
	+zKpj1afuZcxHta8PlN6SqCNcpihOp/qixBMDrvAENzPhO6L1w7A26zAWAaslHpTnwYKNxFb9ry
	0hDOM7lquUOGTu7MtR6dKbOaeCHGvGUwzDyJEFkMgaW5DH1Drw3YHyigIjBWR3o8OdazpdHLNGU
	H12It0DK2y+MM9q9z1LescdOPM8Ka9i4dfIXxx47HSbkLkMHis94I30EP30PZPCj1N/56MBxyee
	sb2P9vSPViyBqCQZG2Twozb/XaeRDUnMz3FZ1MbuAPu/HhJrSX+UfXkffpWmspwxVL8qNuZ9TpM
	nOE3TprFzV5aFBYoBxOHB/LHHhN4Rw3zfF8khy9A==
X-Google-Smtp-Source: AGHT+IHOPiFanneox3Lcj1rH8g3pvKP+FJb+8Q/Rx5PH4FqEjRs2Kvf7powG9SwuXgA8gk3jM4VCrg==
X-Received: by 2002:a05:6830:6d44:b0:74a:1f03:db4b with SMTP id 46e09a7af769-7c27ca31353mr10153811a34.1.1761126376537;
        Wed, 22 Oct 2025 02:46:16 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c3e326df99sm430003a34.33.2025.10.22.02.46.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 02:46:16 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7c2816c0495so3738940a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 02:46:16 -0700 (PDT)
X-Received: by 2002:a05:6102:a4f:b0:523:759e:b0cf with SMTP id
 ada2fe7eead31-5d7dd6ad6bdmr5856194137.21.1761125966715; Wed, 22 Oct 2025
 02:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org> <20251022033847.471106-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251022033847.471106-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Oct 2025 11:39:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpVkvHwihk=jVdq37Xi01oh_6O2p9Z2b645ViiuxpFTw@mail.gmail.com>
X-Gm-Features: AS18NWCLE2aAyAzKtAQbH4VnFmVWNSxcs2C7oaQZc_Iov4xWvW3S_J-Tvmn1Aps
Message-ID: <CAMuHMdVpVkvHwihk=jVdq37Xi01oh_6O2p9Z2b645ViiuxpFTw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: renesas: r8a77961: Add GX6250 GPU node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Matt Coster <matt.coster@imgtec.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_024619_389737_A91D63C1 
X-CRM114-Status: GOOD (  16.00  )
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

Hi Marek,

On Wed, 22 Oct 2025 at 05:39, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77961 M3-W+ SoC.
>
> Acked-by: Matt Coster <matt.coster@imgtec.com>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V3: - Add AB from Matt
>     - Disable the GPU by default

Thanks for the update!

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on v2 is still valid, will queue in renesas-devel for v6.19.

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

