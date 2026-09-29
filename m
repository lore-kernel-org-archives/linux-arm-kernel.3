Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF94C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 15:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dZbuYFRWaYPbHqq2vBKMBfGE1dD5iM+GHzPgRrdI6c=; b=36xmWjmqVN55Y9X4dmg3X43IM4
	dpi3B/S85tcR/+kk5j/1IOpiwIn1jcuHUt3hq9+OYae9P5Aegu45b73voA6alT4T4HZrg0dNvJaO1
	kXtF5FWUauyVHjhURGQCAuZwkk1tzhyb8ZH05ggEud8UqDsXGK79njF3ubFAog60BWoDfGYgDjCce
	VQyyoKEY2gvjxCkMTrM27C/5Qnsnew4dNyp/xO/oJ+y2i74TXnvFlYi8rWJGH7ytE0lQLammO9+7D
	plDheAZYp/M6EiQJjxlidGiUWCWLUE27uXbnPGwswWKBhIQerNHC7QekjT5UjORSuNoNJxqx6eX8m
	kR9Ec3vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBa3r-00000003yVj-3snf;
	Tue, 29 Sep 2026 15:48:07 +0000
Received: from mail-ej2-x0f.google.com ([2a00:1450:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBa3p-00000003yVB-2jkg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 15:48:06 +0000
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so661976766b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 08:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790696884; x=1791301684; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/dZbuYFRWaYPbHqq2vBKMBfGE1dD5iM+GHzPgRrdI6c=;
        b=YN8ZzG2L2INaoIgziUmdj7+FpjKiknzylsCQvtsJr3A6Sl6WnzH3STJMvETIFnkEsi
         gjpap4IJBLisumutRNezbNDB5K7LuEpEFqJGWGAuIRsCtZHn1xNz3m+twFfQVT8XAp1v
         prnTfD5GTGtKfK0JJMjF1IVuB9cv7lgGRB0jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790696884; x=1791301684;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dZbuYFRWaYPbHqq2vBKMBfGE1dD5iM+GHzPgRrdI6c=;
        b=mCOwzYgeyV6gh8ivnUgxkZxuSWtnj4mhmPf8AJYPEMkcDQZp8JmC4NuvjmoE7lgvGj
         Afzf8Rm+fWuK6np0lESp5UbjAg0bPdKkzC5z5GhLM1IXrPDPtGUxZsyCAcBLgPXY0Jr2
         7zA1MRmt9cxOrJ+whcPPXEKvTuOEVxoi6s0gMBfT3aierycT7ShlKH5Ol/xpXKuGiaAz
         o6rsV8uXT3AoKkfx8ayIdkQixbWqkHtdrln1RPVfXoU5lHagIHrEmTlxxwyOTIkIWThp
         n1T32kY9nKsD0xVaB0rdz1xwyQHrL4GSaTTYJGyIORV+y2uS1ftSSALuNWzaaHHjRbd4
         o24A==
X-Forwarded-Encrypted: i=1; AKwUvBzspHYWO7NHLSXHZCs96yq9TRcnEhbBurCCDpvgD9OCPZIxdMcBGt1jUDs4LVtv/3XkLg//hrNsNTMmHDw6YksA@lists.infradead.org
X-Gm-Message-State: AFuF++noK3yOd2wyMM9SksaX/vBJDIvIKurquoWGw2w/d+/lg+9kCwhw
	UwVYtO4hVIZtOVN/pyMSWZqr3sW4j5ci9H9j2n+P9bMYIoWSnDA2Xyf2CuHwHl1RB11VcfQkJ/F
	W9LrvqJJo
X-Gm-Gg: AYBFou0SCAseZ6sslgBd/kY0c7qy2s1LRn9JTmW7wEHZfZfKTDeXof0eVadRLQ1MLcB
	BPeMon+0h8GE2tWgZnkIvt3uwn28GaNGpCrRFh4cXg1zXQhwOnB/UclGtg3e163cJGyQW9p+AJo
	Ii8WkPkjcK7UhuruRWqogwZa3SMTDcu2iuxkZMUUU8X0BTMYYcbIvmTbKK4+RVVpkH2pAj0KqnS
	WYjUM0LIHIE6mV+wRissXfHTZnGwszRPZzlrmsFJxNXI3GxzZQ/RrjT1u5CWgvaFoIXX4QTSagn
	BtiZ/kc0AYUIIISbLGPtsc8mci5t5B84RiqrijDYys0PG4jU+/mOn6LC0xbmMwJe8+1N52AtSf8
	v5RyoMOUFJuCUVH3Q7frJxiVx3MWC+E/jrgXpgDWlGhmgVwQWVKE5LgPvyE539o5RDJBfiuCKka
	09Wan80OhUC7fX7sEI9Ik1UH6cPlmd9jSsn0S5QpqBim79iKUik3SML0T7nQVt0VIKqAGkiT8Gr
	B7vJk+oB597CxgRONfO9GZtwAcRLLmR4QgPcOo=
X-Received: by 2002:a17:907:ea8b:b0:c2a:fbe1:7340 with SMTP id a640c23a62f3a-c2afbe173b5mr866887366b.41.1790696883748;
        Tue, 29 Sep 2026 08:48:03 -0700 (PDT)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com. [74.125.225.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e12fd1af7sm1662066b.28.2026.09.29.08.48.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 08:48:01 -0700 (PDT)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so25469935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 08:48:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxF2CkyKNYtQYESlNFRGYQPXKQOD6lc7CtHD1WB84cj2w4GdnhSCRBglcDH3nlfTieqb0wBfQNf9u+OrXhXfON1@lists.infradead.org
X-Received: by 2002:a05:600c:310b:b0:49f:bd3c:bc18 with SMTP id
 5b1f17b1804b1-49fe66f4c72mr292995155e9.19.1790696879396; Tue, 29 Sep 2026
 08:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260929-pixel10-initial-dts-fixup-v1-1-b304868cc3e8@linaro.org>
In-Reply-To: <20260929-pixel10-initial-dts-fixup-v1-1-b304868cc3e8@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Sep 2026 08:47:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VAiHf0-9sPvgGKji4j47rL38Ja3S2yiEfztubgZqBpjw@mail.gmail.com>
X-Gm-Features: AclHuK_dL-VTDHnUEUTR3x2HZaC9uQoYf0vNl-UJk1UZAv-h2C9KslcOuDr2aQQ
Message-ID: <CAD=FV=VAiHf0-9sPvgGKji4j47rL38Ja3S2yiEfztubgZqBpjw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: google: lga: fixup #size-cells DT warning
To: Peter Griffin <peter.griffin@linaro.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, Juan Yescas <jyescas@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_084805_741160_228C317D 
X-CRM114-Status: GOOD (  16.41  )
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

Hi,

On Tue, Sep 29, 2026 at 4:11=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Fix newly introduced DT warnings:
> Warning (avoid_unnecessary_addr_size): /soc@0/interrupt-controller@588000=
0:
> unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or
> child "reg" or "ranges" property
>
> Fixes: 80f23487d554c7 ("arm64: dts: google: Add initial dts for frankel/b=
lazer/mustang")

Is the above git hash correct? In linuxnext, I see:

54edd8698bb1 arm64: dts: google: Add initial dts for frankel/blazer/mustang

Other than that, this looks fine to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm64/boot/dts/google/lga.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/google/lga.dtsi b/arch/arm64/boot/dts/go=
ogle/lga.dtsi
> index 26a14b3a1b190a..919ee6619d9ee8 100644
> --- a/arch/arm64/boot/dts/google/lga.dtsi
> +++ b/arch/arm64/boot/dts/google/lga.dtsi
> @@ -370,8 +370,7 @@ gic: interrupt-controller@5880000 {
>                         reg =3D <0x0 0x05880000 0x0 0x10000>,
>                               <0x0 0x05900000 0x0 0x200000>;
>
> -                       #address-cells =3D <2>;
> -                       #size-cells =3D <2>;
> +                       #address-cells =3D <0>;
>
>                         #interrupt-cells =3D <4>;
>                         interrupt-controller;

nit: Leaving "#address-cells =3D <0>;" alone in a section, with blank
lines before and after, looks a little weird, but it's not a major
issue...

-Doug

