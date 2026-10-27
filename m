Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11C5606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 14:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BQgQKeJI;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ofhIRjS8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NbaKo2EojPBVQVK7LV8aGSsd5gN1hbSzP/sBhHan3BQ=; b=BQgQKeJI79oUES
	Gy89w/qzrqaC0sp7u68RfxxX0M/XNVVbu9YoW3OnhjoIcsyTLUyPgCvEBWsCaCZM5aJ2jhCr7Xf1h
	vq5jyv+qmTXVQT/CVCH+TgYKcamtSR10rCwC4Vzd6q8KIBy+1Vt02Bzrmo3sNzcaQ3Dt4V/w3TCB7
	/sGuMUhBjQKfDiiKyvs30P7H2kZ3XivXbmG8bSQ2UkY0rgKmkcOpjF6qYnX3GG2WoxiRYl3izbnuX
	ELpft2+0S1KJdfia/3ZpQDkm5nU6l49pcuCAoW4wY+NORtzloa0OfNXxV9ImERTe6gWDSRW0mO1qs
	WcuAtokysCAfNuHLsntA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLi38-0000000516e-3rdO;
	Tue, 27 Oct 2026 14:21:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLi37-00000005161-2moA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 14:21:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 134346021D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 14:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77531F031ED
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 14:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793110872;
	bh=NbaKo2EojPBVQVK7LV8aGSsd5gN1hbSzP/sBhHan3BQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ofhIRjS8UEcNYvRQ7QGnfdQbpB4M4tcgf59FYC/8+tx0dVDsCcJERBhUt/ywGnGS7
	 Z7sw8QQSG7uwU6gjncZs+IwlfvhcrwE6aCGfPy4jNRVkGLuUnk63x7MGS/amO8dmHw
	 y4lQKO41tkZaNFLPiG2aan3Gg2+Zol2FedDrEmOyui0AkwlLkM7Ya49QyeaelD1Css
	 LDNOpLnYlgg2+jG0xMFwJrBzCcYuubAckbNCOAlJLP0KvnbI2YkPnBAT2eRDIRenUU
	 rxSu/IvzW4Ly/hucGVFn1y3e0XFgUnfZZ2rRXkQw+fT8W7KUEDOufo9jKr81kh6tzu
	 kTa8p1cfiEAbg==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4a89b4a59a1so792626fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 07:21:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByUlHScT2Ee/Cvf8KlkUXFplcPWjdywjDJptypfnscW7es9uo2Mmm4JLGQAaWXPUBoK7Ii1X11sEU3wVfIvkcIn@lists.infradead.org
X-Gm-Message-State: AFq9FYICZvoMGSUSPq1yiye7CU65gMoK+g+SRpPSueMjcyQ+p0HKX0bn
	AcNgOewYJtE++rXNRNwfT0lHn/tW/ygH7vdglt033d1ZutblT5Q5oJdSG53/VX4SiqRqhVguUTj
	Y+FDpDb6XOnXkMFHluP3z4LjSC+toVPc=
X-Received: by 2002:a05:6870:3047:b0:49e:50bc:79dc with SMTP id
 586e51a60fabf-4a89b6135d3mr1718291fac.22.1793110872016; Tue, 27 Oct 2026
 07:21:12 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <f9de8214043ad4c8748fadce7fd2cc2fa95b1291.1792776697.git.geert+renesas@glider.be>
In-Reply-To: <f9de8214043ad4c8748fadce7fd2cc2fa95b1291.1792776697.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 15:20:57 +0100
X-Gmail-Original-Message-ID: <CAD++jLkrF-Fuqa_ojSyeO8ogDrY==nupNvZAUC+nPoK+PNJc4A@mail.gmail.com>
X-Gm-Features: AclHuK9wpK2sOZ4pxVax9gNRbt2j8VY4zFskPh_vnOw0mDesf_mVGe4CvELlVTU
Message-ID: <CAD++jLkrF-Fuqa_ojSyeO8ogDrY==nupNvZAUC+nPoK+PNJc4A@mail.gmail.com>
Subject: Re: [PATCH 3/7] arm64: dts: renesas: r8a78000: Add GPIO controller nodes
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
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

On Fri, Oct 23, 2026 at 7:53=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> Add device nodes for the General-Purpose Input/Output Ports (GPIO) on
> the Renesas R-Car X5H (R8A78000) SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Co-developed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

LGTM!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

