Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AFB606D80F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dhF5OFNq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2BAabvEd6vL4y9BLf5sVKsYhFFT7p2yobeyEnKOJ5A4=; b=dhF5OFNqr8zgowwmzfhn47brJ/
	5w4ET9QG8bT0uWHQ6SgQUE0NKTQwtNBW/vdN2VvzLdLnRiiA3GoG9iH3fY1dQk5cFDuFz3GBBHH7U
	Q6WVE5kHru5pxC4WoL1hou8yWEUGb7HowNmHIbkM2mtn/HSHouuC6rnmfs1x1WYlIVAVdPaAqmpvJ
	6RSFKbBh1N1ICV8vdmRRuexM1kGfccExX1rgKl7/b/U5bUOI8bXh8cArdDjbkIE1dcJwEPu4S+PJq
	U6hLcNCad1bOb6VK8E0dNaMeK5S8dPmikFVcqstU5Fs6DRrtR/yYcI013Fe6RoDAEAMiByg43D86y
	V1xjbfPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHWr-00000003AQv-23HJ;
	Tue, 03 Nov 2026 16:38:33 +0000
Received: from mail-qt1-f179.google.com ([209.85.160.179])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHWn-00000003APj-2TkT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:38:30 +0000
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5364042eecfso70518611cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:38:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723908; x=1794328708;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2BAabvEd6vL4y9BLf5sVKsYhFFT7p2yobeyEnKOJ5A4=;
        b=SgcOw1WrU48lKoW2Y5gHfNV39VEen0plXe1OwPbOpP3UY3GjoTTqGyf/wDcPJdoHdz
         AQRw9MpO1Cbukp6rhkxEVlM6IFq6xEC8PvvvO60jiNvsKaaFymu31b/9ltNXmQDpbY8j
         znmmswJzuoOWGkXr+nUmtQO5RS46fo/tR29F6NhTWiuSweVHQRvL9ceqG5XJN0c8gtw/
         pUQ2l5Fc/T9LSt1aednvcikkWh1EI0HYQ+NTNJ40sWuSYLxx8zi57elBQYfFA0BesWjw
         iOVy+OQayI3hqv/FxUqvOPpO+PW8OVN4VpnF3Q4OgkS4T/xPEJuNwRvgRqU2VKwz2xmK
         nnqw==
X-Forwarded-Encrypted: i=1; AKwUvBwSzW5EIaoYe/Ye2b0KEB03QRubr6i1by1S3u+0te/8ie251nmryaSZKBoAyCN2tHvUSstVWDbUmgWPBL66iHTG@lists.infradead.org
X-Gm-Message-State: APuU4Z/qNlNRnQHj166gQXuAqAsLZNCc8UOAe/dBIcklggzpFBoTmExt
	jSLcTn460twI/IPogUQjQmGNlJx/UYIso3+P0LwDOjoOpt/lz3EfGQwVNkR7RcsDYR4=
X-Gm-Gg: AYBFou21lbwJHu/wcPZKNKeakQiS7dvr3trK38tkGoIDjfHcGQR/X/3sL4J5PSjZzyK
	i5gmbhosqh+b6nJICLBMqurigsc7NQR9PJgIeNyzuYEIV3Xwm0+AUp8dA5kdaG+vNdKL+yXLM2i
	q/EMxFvaj8Fqm88MLZJ2VGM/34W6sLUcjkG04KFzAapmiJrGPXPKcU992BTybwB+mykWaFMPWez
	grusnMVGjgn1IHIIF3vfubJgZ3+ETI827by+jvt52EyB6P3JIdfljsBqMMrS5YVOYyxqJlvV0xQ
	MwGYSlRQbFNf51oO1LNfUrEnSmC5UXVHDvtw2ePHFcPuyGJCo+nBlTU9+66d39xOWKYWXMsSLac
	2cpW4o7oKwbKdHUSFgoEskwmbZP1CP5aLIi5cIzoizvU3SlZX5Sh+gd8xBUVM1GSU86n7TvQOHE
	aOpZYh2w/XVxAx5wOvbQ+7VtnFJCl/ROSCm+k4Rokk2q12pFtBq8RzvgxXDTA4OtC19p3L4tCDC
	9wfrj9KAqHyrVpuz5CZz36hq4P7zZlStza5xaVKVEZmDD2aLS3HzQS5hmNvncvYKeJgMfaEg2t+
	p4jHSwaLTCsT1vy3ZX5eIO4QDXA+Q8Xnioxl+8AO8doj9qHhHTBZ0/9Lyrz6r3AHyICPYcNjORy
	EDGKn4fJ+DDcNn/6e8ASMc9M96gywSJTPlqSnDcBO1+aKQgKqAtHryA2x
X-Received: by 2002:a05:620a:1a0e:b0:93c:7040:bf7b with SMTP id af79cd13be357-94421586f8emr2064063185a.9.1793723908151;
        Tue, 03 Nov 2026 08:38:28 -0800 (PST)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d33c0043sm3152285a.14.2026.11.03.08.38.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:38:27 -0800 (PST)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93f20c3aaa5so460177785a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:38:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzYoHRGkQEhBszxuZsnv54CNdJW8Ud8rgu3v2IuvZvJ5vnXkmkwIuyO7n0Fz+OGnEHysJoGbNFRz94GBltMUFQO@lists.infradead.org
X-Received: by 2002:a05:690e:4810:b0:67b:9051:e32a with SMTP id
 956f58d0204a3-67ba50e0ademr6918680d50.93.1793723407281; Tue, 03 Nov 2026
 08:30:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-3-tanure@linux.com>
 <95418d50-a83f-47da-819b-de04eab449e2@lunn.ch>
In-Reply-To: <95418d50-a83f-47da-819b-de04eab449e2@lunn.ch>
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 3 Nov 2026 16:29:55 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+1jAYu-0XjUqmNsR4hbSPTWT+JzsBK+PNqPg_yxCKy8YA@mail.gmail.com>
X-Gm-Features: AclHuK9mStYKxlMFWLlexMhXND4q5zYuU5C_HQS0PBE7THFUZlCXo6CxCqTl6Rk
Message-ID: <CAJX_Q+1jAYu-0XjUqmNsR4hbSPTWT+JzsBK+PNqPg_yxCKy8YA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_083829_626015_5DF08BC6 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.7 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: tanure@linux.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 1:18=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +        rx-internal-delay-ps:
> > +          enum: [200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 200=
0,
> > +                 2200, 2400, 2600, 2800, 3000]
>
> Is 0 possible with the hardware? If so, i would accept it.
Yes, 0 is the delay line switched off. v5 accepts it, and the T7 joins
the existing G12A list in the binding instead of carrying its own.

>
>    Andrew

