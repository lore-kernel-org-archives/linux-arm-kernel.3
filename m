Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F482606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 14:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H3kICOJZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gvbpjObWezyuObEIw7vWCioNUAtttLKw08sbbnbJ9pw=; b=H3kICOJZQDN+EUlVtVHAqv8YpK
	+VU1z578cgZ7ZZooHpvkLRDM1evLCGu1rA9kShfBGt8d1ZUaPdzPhunw/yVfieWzVIDVG4fWTOm5O
	vtGXgY6YzDJ6fYfq12pmokebEAKrsrbNbkzkyaj45N/jjceU2eGA0SzqeUF7Tt3LNs+5e5USnnXqp
	qYtHOxnDKeuBC2IaICnbF2SQNmJWDmrqbj8aXQSEwKgS5ADBowsbHCPOS/eDBxRCp4kmk8hA/7cHt
	c4DUeXW0PSoHyzOlMdQK9ZbS12q5rywn+F089eFrxONCB980ZoGMARUmX0VI3aDWSu8zE8sNy8W3U
	A4RGXgkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4z2-00000007FxM-0Ejk;
	Wed, 28 Oct 2026 14:50:32 +0000
Received: from mail-pj1-f48.google.com ([209.85.216.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4yy-00000007FwN-3bkx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 14:50:30 +0000
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so884293a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 07:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199027; x=1793803827;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gvbpjObWezyuObEIw7vWCioNUAtttLKw08sbbnbJ9pw=;
        b=qrgD9ArchSJL9GxAvUD+MTp5713XDDK+JUqwmQDadRWDGFAAe3xNM8KnAGl5+YaU//
         O6t7YTyi6cTT7FG9pasbV//AEFyX4VuP/MLUa8WRHTdwPjzCPem5n3my6VbZ64nAaGKs
         VJbKhOyM/2UkncR0KlCXL1DS+EK3RvSqMwy/maVEigZj/tNjxGIH3snzYsJrHJx1FoT6
         UxeiPgPBXpm/GD86CzUo1Q2Q5KtfzaYT5A/nxpvVbNh9BPZ50EJyQQh2VICpdUEjpObx
         y/tyY9pQNg43LhP4vUe3yKwwz4laHOFxodFbYXU7sjPuyfhhLM/5yqgE8dRB8Y88Ngwt
         d3nw==
X-Forwarded-Encrypted: i=1; AKwUvBxbIXuUZXgYLO19pQxoPVXTPg8hDzGGQqZiqrna/yt0edYRe5P401ZJowJ0hBDLZjxDt8nNyAevGkHg64xtVTRU@lists.infradead.org
X-Gm-Message-State: AFq9FYJh2kguti1ho4t5xuFB6Z4sbh28x1tj5BiILTyjmSR+Rp21dZyA
	ohwJjb95yRsfRZm6twC3x9XYMCFpQ2HCGl5Tlh95dOPf2pvTsv3v/+h+DGf0Iw==
X-Gm-Gg: AYBFou3GEdeV5vqxl4nGHVlqniyPA14cdbi+tt58B23CndfnxR+NMEbcEQNhrkQNXf5
	k8wGujJ+SeH+qEMpERUWjTgx/kpRg2mJApVa/MbrxmB6ppMLb4xCbdHVQMjIKo9hYRMF+Shdb5c
	kbjWIIE0af56ND6E8UnETetHprPqje2gX0v/BSgc1DE3eCt+nxU2mB7gTiUrfrXwLs1o5n2HInk
	s/uvX2I4L8t6KSnzGc96MGdgISvjFNoifrwAo35BRLQ3qKHKIhJU+XO+ua0viJEv90sfnwhqJ91
	EDOJ2e0kiR0TpynraU0vzArpOrZsKcrjw3j7RUfyxQD4oZaPPpAA/b224iP6ZVeqIifQDi2USsT
	CV6AhUErx+XdfNeYJhAtpnWL1bwVtv4oeCYojvXWxbeHZyAtBv+dnfrUJoD9MmevXQzdITChhUQ
	SwWjFD6Uxl4rCfoZmG09HA6n1JYYkzKc8tCevt4SMdq5v9/3h0Br3889h4bV18Uj0cxxjvM87KJ
	Jj7G+bXzsWglHOyn4S2KzhXc3NaOXDgyZYQcRFvRxvW+v/IVQ2k+YFIo086bRoexC1lh4xdj1ZS
	/e7alSGda/A2O5ivIGM6p2dmuS2N89AJS86PZry8JEkpb8etW79sQ5sVqOo9l484Y6q+R60=
X-Received: by 2002:a17:90b:1d44:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3ae57f638cbmr1821889a91.20.1793199027315;
        Wed, 28 Oct 2026 07:50:27 -0700 (PDT)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com. [209.85.210.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b774acsm23091345ad.22.2026.10.28.07.50.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:50:25 -0700 (PDT)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a05effaf8dso825502b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 07:50:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByDQi0Jifl2oVH9SN8g3w0uC9nuptrk0JslWsz65RAv0TJbZF3AFO4BY7QZHNd42j1qoReC4V+vL1GOpTrkOEtS@lists.infradead.org
X-Received: by 2002:a05:6102:6f07:b0:7c3:1d7:f234 with SMTP id
 ada2fe7eead31-7d03a294a6dmr903761137.2.1793198633657; Wed, 28 Oct 2026
 07:43:53 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793026273.git.geert+renesas@glider.be> <e723696e02cfb34fb808e2ae3ccb6faf68528c00.1793026273.git.geert+renesas@glider.be>
 <20261028132937.GL15441@killaraus.ideasonboard.com>
In-Reply-To: <20261028132937.GL15441@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Oct 2026 15:43:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXycpJ6COtiAA-2oRRfHSfLK40n2cacStW15QJRN3EfLQ@mail.gmail.com>
X-Gm-Features: AclHuK8gWV6NxtQKAEUrEm-e_rgKbr7fNh5k6QXPge3G8NVSao5SAOErcvAPoSI
Message-ID: <CAMuHMdXycpJ6COtiAA-2oRRfHSfLK40n2cacStW15QJRN3EfLQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] dt-bindings: clock: renesas,r8a78000-cpg: Add PWM clocks
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_075028_902473_826E0B82 
X-CRM114-Status: GOOD (  25.12  )
X-Spam-Score: -1.6 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Laurent,

On Wed, 28 Oct 2026 at 14:29, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Oct 26, 2026 at 03:55:23PM +0100, Geert Uytterhoeven wrote:
> > Add definitions for the clocks used by the PWM modules on R-Car X5H:
> >  - R8A78000_CPG_SGASYNCD16_PERW_MAIN,
> >  - R8A78000_CPG_S0ASYNCD8_PERW_MAIN.
> > Include R8A78000_CPG_SGASYNCD8_PERW_MAIN for ordering consistency.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > +++ b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > @@ -28,5 +28,8 @@
> >  #define R8A78000_CPG_SGD8_PERW_BUS           18
> >  #define R8A78000_CPG_SGD32_PERW_BUS          19
> >  #define R8A78000_CPG_S0D24_HSCN_OTHER                20
> > +#define R8A78000_CPG_SGASYNCD8_PERW_MAIN     21
> > +#define R8A78000_CPG_SGASYNCD16_PERW_MAIN    22
>
> Could you also add R8A78000_CPG_SGASYNCD4_PERW_MAIN and
> R8A78000_CPG_SGASYNCD32_PERW_MAIN for ordering consistency ? The
> dependency patch should then also include R8A78000_CPG_SGD4_PERW_BUS and
> R8A78000_CPG_SGD16_PERW_BUS, as well as
> R8A78000_CPG_S0D{1,2,4,8,12,16}_HSCN_OTHER.

I could add them, but do you have any need to refer to them from DT?
So far I only added clocks that are listed as clock supplies of on-SoC
modules, e.g. R8A78000_CPG_SGASYNCD8_PERW_MAIN is supplied to the
Timer Unit (TMU)).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

