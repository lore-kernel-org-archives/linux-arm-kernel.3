Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA94CA0EDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4g5Q8ca8/tRwBUukHx2RaU+lCj1ezgiY20ELoGKC4kI=; b=eaHerN9zpqLKFH+LvLPPc2NCMK
	ItRdhEI2ym6rk9b9rIHq4Dlrwk0rIwPD9+1JKgvTcnCdkpm6ukr4G/koZCQR+BBl6rJ1rnHZSFkcJ
	9uPJIlJtpqAuwwe3RIbiSU62lGP0ZElnT7FhS8JvAaQfXtt279Y7yRSecSqBxRuyt7eVFm8aetlSq
	nfloMAmwsQ2ufHsl3Js/8rmyVojRSGzUm173teHoeuCZkDQmFKFx7Lu6Pxyn9O06TIQ8VlxBZIYSR
	bntp+WlnIZCzSuVqDK0iuFAvNKz8DpPVzbn8qsymXsEigGVwfdDTEvvzBfsoq8ci/bpA8J2HSkojm
	GiBZdH2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulacj-00000009CiO-1il1;
	Mon, 11 Aug 2025 22:04:09 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXTO-00000008ocz-3sRQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 18:42:19 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45a10a09fb7so2514875e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 11:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754937737; x=1755542537; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4g5Q8ca8/tRwBUukHx2RaU+lCj1ezgiY20ELoGKC4kI=;
        b=jvKu7jTN1aEqvc4+k885KFUP2kZO9V5A0PxTkxqHNhNITfFPYML9ubA981WoPNqlvl
         fmFtXHgHff/0G314qAHKZs2M2YvKLvVa9NlaivVcGZqQumjbJzl1NfjpBGLyuDRsFAEp
         IewFlBPNPLMItZ3Srqlfdw83rpCim8bNtTj3sttsjN9S25zPqEhI4S02PXgOvFRUUATg
         TPe6H69rMbRkdFKqWrfkC04QePSc4ZQ6uN/FyuppoQI8Z+Uq3uiijaPzvQl+67vi1o4Z
         4dibwO6XEGnK44hyU/N2BcyKDoDyN/DiqvGizZ4AGL8V30nXYWfC7m6VtgF5I19ZsVHO
         ALrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754937737; x=1755542537;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4g5Q8ca8/tRwBUukHx2RaU+lCj1ezgiY20ELoGKC4kI=;
        b=As12T/8ZDSkDB/e2lNRgIz42JKtxgmKdSnkVvR05w2BRNJQ/3hrNe8vFEoOybSzSN2
         o5/lCpNZQ07OhO8Oj9XYtDGz8lQ9iQfdC5cceHTQR0pjb7wein579muhMAh1ndIvtmRw
         7x2OAW+hsbxjFixhOHd8lx4zisYGTTr8qdaGJ12amMM8zgfEV3A+ndZbfevZMJ15UCqz
         efUBw2WYvfKWRCLx7h0/9WCIiqNnSZnk2tebSSc/PEvTXpLwWWxGrak98FkbfLyncCKe
         WxtCC/y7SUAHVpTKbt0ygVF7u+cmeuFrOL7hcO4mUJnRRaOUpWAsuT4rc9mVO5206e3d
         P6rQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4Jex4ajK4fZbxsSOiqP+WoMBz4PoT2+cINww2XaVkASOxIqv3itCl77zCZrgF9ntInfmUwoLOC1nBwzxTPPNf@lists.infradead.org
X-Gm-Message-State: AOJu0YxuZqqBbdRHQI6AO10hJitTAfUVPYp1F8VpwDaTautGU6BrGKsW
	UBHQnGBiVQif9BbI6jFW7PzU7/h7kJeORVx9502vjuxkIikRyaVjAGjcI/TSJsEL
X-Gm-Gg: ASbGncukrKjrrMIRmO7awd17g9tq/ftiYLt/NpBZ22/mNLGUqsdERW0ZTEm4CAB8ERb
	LJTg3j6C+8TKz8YrFF84SEWhanbI1xMDP/8kqaWw8s0cNh1PYXGUnSxbpvSj1e8Kw+1RA2ikzea
	+c7ijmmhs0uDbe14BBbzCClEA+BlxRXJ7DR+rYvmjd7ru+GqY5lRnLaKHY2u4E8Skai09zeZZEb
	dF7T1qddONcP5ti8Vl55iDGYvyhWGQx6e7im9ZZtefoF9j3v87OemWt0tFoquMa2wBtF7JrKcC7
	1dRyA8KtkKEMSsoJLc2YuGDVJJAkKUzgj2W8GDOLF3Ez5VmuQxIotNi8peWRJpYMwusxwXdChkU
	iZMDKt2zsHpH3NSLBMaGLiPhdJZKX5n0HdT+t/oqm7miYShVFGSwKT++KsE8kaXU=
X-Google-Smtp-Source: AGHT+IFjsaOKAidMJsBQ61tXePqBPVy+/RULgEVEIGknZxMmpPXOSVqdei1Q+3db07zeUpB1IUPggg==
X-Received: by 2002:a05:600c:1c90:b0:456:2a9:f815 with SMTP id 5b1f17b1804b1-45a10b941ddmr7754095e9.4.1754937736797;
        Mon, 11 Aug 2025 11:42:16 -0700 (PDT)
Received: from dell.localnet (188.47.24.49.ipv4.supernova.orange.pl. [188.47.24.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a053a9019sm79864335e9.21.2025.08.11.11.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 11:42:16 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
 Russell King <linux@armlinux.org.uk>, Tony Lindgren <tony@atomide.com>,
 linux-arm-kernel@lists.infradead.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: patches@armlinux.org.uk
Subject: Re: [RESEND][PATCH] arm: omap1: use string choices helper
Date: Mon, 11 Aug 2025 20:42:15 +0200
Message-ID: <3002078.e9J7NaK4W3@dell>
In-Reply-To: <871ppodol8.wl-kuninori.morimoto.gx@renesas.com>
References: <871ppodol8.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3364134.aeNJFYEL58";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_114218_967992_36299131 
X-CRM114-Status: GOOD (  18.40  )
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

--nextPart3364134.aeNJFYEL58
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: patches@armlinux.org.uk
Subject: Re: [RESEND][PATCH] arm: omap1: use string choices helper
Date: Mon, 11 Aug 2025 20:42:15 +0200
Message-ID: <3002078.e9J7NaK4W3@dell>
In-Reply-To: <871ppodol8.wl-kuninori.morimoto.gx@renesas.com>
References: <871ppodol8.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0

On Thursday, 7 August 2025 01:20:36 CEST Kuninori Morimoto wrote:
> We can use string choices helper, let's use it.
> 
> It updates format
> 
> -	..."%sabled", ...? "dis" : "en",
> +	..."%s",      ...  str_disabled_enabled(...)
> 	      ^^^^^
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Acked-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

> ---
> KernelVersion: v6.17
> 
>  arch/arm/mach-omap1/board-ams-delta.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
> index 16392720296c..52681837ba4d 100644
> --- a/arch/arm/mach-omap1/board-ams-delta.c
> +++ b/arch/arm/mach-omap1/board-ams-delta.c
> @@ -759,8 +759,8 @@ static void modem_pm(struct uart_port *port, unsigned int state, unsigned old)
>  
>  	if (ret)
>  		dev_warn(port->dev,
> -			 "ams_delta modem_pm: failed to %sable regulator: %d\n",
> -			 state ? "dis" : "en", ret);
> +			 "ams_delta modem_pm: failed to %s regulator: %d\n",
> +			 str_disable_enable(state), ret);
>  }
>  
>  static struct plat_serial8250_port ams_delta_modem_ports[] = {
> 


--nextPart3364134.aeNJFYEL58
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnyr6IsGnTYAeAkHJ2WqSnltsjBoFAmiaOYcACgkQ2WqSnlts
jBrn1AgAl9418ohCHjpyzZ99f/KzETqvuvReKCoNoU0HQ8A8DAb2+bMY6b44By7M
i0NNPR8ChO2UJnV2+GI0UyLpf4pjKDljllMcECA3TEbVgISVvUDoRvLZQ61Qu0hY
/dbqMw0LRbqinbT+E8WwLaV6GSrJgV+n0AIePcYgG42x7mJcxjFWzOxASj9Zclhd
2rUGa5gSWhRQggYHhpjd3EEdBqSRKzt2WjZCjXm3LedkUqGFwHWBFjD3IzWdn7L4
mJM/LfiQMd1LoPxeH6q/GxAZzmSGK6PVpFg6lv1e56R0dGEobIIuNFZo3A3UJPCG
VNndACMokq2Z7xIT6xlrpoPBraixYA==
=3fEv
-----END PGP SIGNATURE-----

--nextPart3364134.aeNJFYEL58--




