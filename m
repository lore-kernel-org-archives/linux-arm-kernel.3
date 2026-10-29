Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E15760A261C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 23:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IRcJs8Cb;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=S1Y050qI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lnVNxxbt+qbN8QJ5DPYiLdQeqrQxagvjKYBjiz3eH8c=; b=IRcJs8CbNXgL+k
	F+HOQkO3XycdZ0emE0rSJCwVA0qzRCfMT4Agm9LWElN/380SSuN3x1v/HR9sRz+RIdweE57XWWbAZ
	yVNNpx8DNNrcDh4QdD2v6MVMKLapEJ/vjFgE3lhhPn7GMMtgJIIAcf+Zm3si2przznOH3inwVbTwu
	aO4VtsJcKd1p11S+O/Oh4/FoVUi/zqDnaLu8KL54JjvhmlZSQBxSORdDWulNQzaG3NYZn0WGlNg1r
	ADJKufGBROYSl3kRza8KC7K5RlnZP1uRPZ3Ppz+t752RX3ucc+PrJXt/Zqi1KoKIbGrYFWXCWuFXA
	D0sIwGAm8QVPz1pf3AwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZcn-0000000AXku-3ugR;
	Thu, 29 Oct 2026 23:33:37 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZcj-0000000AXkX-3FKq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 23:33:35 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c4550d8ab15so8772366b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 16:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793316811; x=1793921611; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lnVNxxbt+qbN8QJ5DPYiLdQeqrQxagvjKYBjiz3eH8c=;
        b=S1Y050qIz3hnoVwehloUWifz/RG+ObMxutqsnAqWRlWCVh+tDZm/9gnS0+WyLDBiov
         hZsY9yyog39N0z5RwBcHQn1EZDRKQTmnfidmH0Ac+5415KZ4FTgaWDV0ZJh4eUgcpwt2
         VAh2HmCAfsfIfNpz9TsJ6kLv5keXDfuCu90U0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793316811; x=1793921611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lnVNxxbt+qbN8QJ5DPYiLdQeqrQxagvjKYBjiz3eH8c=;
        b=1c3SaLHSMSC3Jut8X6b9RhKnbBzpo2ZZ0/wA3ttGZIMj3Gvtoc+OkhlYjoBlBJBK8b
         N5d+DephBHFMSKy5ByxbdUWWVEQ79v4/ddFTe+ncYHnZjnUzo/OqBV2wJcM1Ej9jrna7
         GCuamS1HZnIuUmiedmJVEhwXKQ3q+IOrsUQmXSlFNKM5j22MIZ+ECeUt5qivDaJ2CfXP
         aR0ZfPs7/0eQ2AGJNJZkPqyzNTuUotATd/iB8gErkSpfvCCs0IK/kG+5blvmd+InPfre
         rVZAMHWSXPCdP/4SOKNnuoz70Br+qqf5CWt3VsFFd22wr29O7o9pMeaYmjZVspBySdwZ
         6URw==
X-Forwarded-Encrypted: i=1; AKwUvBw+R9Gsg5GFRUPpiw79Xvx/zBleuDrpty+qwTTWkRQ7s7+EMxuCOzMal7Qoh4RSVXOoRcrTgcmptWfkURBTq8SX@lists.infradead.org
X-Gm-Message-State: AFq9FYIpA7BYXWT/EZzlayFO/lDK0QBXUzdux44Hcw5YCUuaPYW1Qo2m
	iGMDNe116RpSKkCauj8in0ILxm3vgjqs/LfzYf9kCwxdTrHRBSm82dyxFFuNGGs5LjzUWp6y5e3
	kmv5EsCye
X-Gm-Gg: AYBFou0D31aXspd4F3jDXyYt/g4RyHZDhAugywdCTpXw+AYC5ZW+XPXHjNnQT4gpRgv
	7gfKSzV4vaqbHhBzOiaF1G4WKTTHKtf3/+++Mnt8aC/beoTBygsxN9m3grso49t5gzozXulqoOT
	L0NzymVd+6O3GUsUdbo4QiyD28RZkAlImoYdFOtAgr1cWeLgdI3zR8jOnZNBmAenifI/4VnD/iz
	zvhanVGgeyEeM4+a8mzdlGlL0RabmfBJDAd54oDyTrkLQOAs4gV5dJ7dHw3GLgWMoxtFnXB3vhf
	OSGieIO0OK5SBfgZtemRpc+kQ9i6OmoBp4mNJ4ahmLKRywG5nJ0ksMg4CBkoDh0jLpPHlKUuru3
	bwiJoI3BeTZQFxtwX2t7HxLhS1/zyGbPQd4xMNFgBUIQlSPEt4DZtxkNqkc8POqoeUAKt55mJ+f
	Lm+qE2Dh2S2uvErQXdH2/o1UoOTq1QVmU5VrTF2hRdiS4T0bK8z10dwaysvqJbp0eq5g2nJyiV4
	FFZc4zqajlu6cPGbX8wbeMe90QVW3IbFs7uZNCA76suqwRZuxBZep/cydogNj4yQITxB79yPPtA
	BRv4K+9FgMyW4IVyKMZUggvGukvxGWu51MDO9nnWmN8Ls3k8xR2woU0AB4NusH+6Xm8ye3Hfeai
	WSkVRPYaSVpFGnck=
X-Received: by 2002:a17:907:9341:b0:c49:cf38:3baf with SMTP id a640c23a62f3a-c4ca795d38emr47459266b.5.1793316810728;
        Thu, 29 Oct 2026 16:33:30 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4caa441ee9sm10202666b.86.2026.10.29.16.33.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 16:33:30 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1ec41d8e9so105911a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 16:33:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwmSJ25HaDafAYcpcp0J2B1Z7dZkFdIFfCFHa3FVjaz56ObgT/nBvJprGUGDk4oK6b4vNNmwYJ3hCHjaKWFnup0@lists.infradead.org
X-Received: by 2002:a05:600c:4715:b0:4a3:598e:e7a8 with SMTP id
 5b1f17b1804b1-4ac150b28bamr10449115e9.4.1793316462561; Thu, 29 Oct 2026
 16:27:42 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr>
 <20261027-drm-misc-next-manta-auxbus-v1-3-3a45c3cf531d@a-marquet.fr>
 <CAD=FV=XmfYM8diBOh3UidN7xEuB3n+n9oAm_zhopfFLERC2QpQ@mail.gmail.com> <auOyxKTuSNysAA3X@laptop-218>
In-Reply-To: <auOyxKTuSNysAA3X@laptop-218>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Oct 2026 16:27:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VV82NG1CAL9DtLeDYQdjC9Su6nYfLYbjzmhzEY9a0JSg@mail.gmail.com>
X-Gm-Features: AclHuK-RAnD-cE_PStAvE_4zQkeWnl1muDgR4l5_h3nIFbUe3wcXyeLuhes_lRY
Message-ID: <CAD=FV=VV82NG1CAL9DtLeDYQdjC9Su6nYfLYbjzmhzEY9a0JSg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel_edp: Add SEC LTL101DL02-002 panel
To: Alexandre Marquet <tb@a-marquet.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Jessica Zhang <jesszhan0024@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Lukas Timmermann <linux@timmermann.space>, Henrik Grimler <henrik@grimler.se>, 
	Hendrik Noack <hendrik-noack@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_163334_106932_57DCEA4A 
X-CRM114-Status: GOOD (  27.18  )
X-Spam-Score: -2.1 (--)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Thu, Oct 29, 2026 at 1:55=E2=80=AFPM Alexandre Marquet <tb@a-marquet.fr>=
 wrote:
>
> > > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/pane=
l/panel-edp.c
> > > index 94bc54c3833a..c92985363093 100644
> > > --- a/drivers/gpu/drm/panel/panel-edp.c
> > > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > > @@ -2198,6 +2198,8 @@ static const struct edp_panel_entry edp_panels[=
] =3D {
> > >         EDP_PANEL_ENTRY('L', 'G', 'D', 0x0778, &delay_200_500_e200_d2=
00, "134WT1"),
> > >         EDP_PANEL_ENTRY('L', 'G', 'D', 0x07fe, &delay_200_500_e200_d2=
00, "LP116WHA-SPB1"),
> > >
> > > +       EDP_PANEL_ENTRY('S', 'E', 'C', 0x9c0f, &delay_200_500_e50, "L=
TL101DL02-002"),
> > > +
> >
> > It would also be good to note in the commit message where you got the
> > timings from. Datasheet? Downstream code? Guessing?
>
> Both downstream code and guessing, as I could not get my hand on a
> datasheet. I will add an explanation to the commit description.
>
> Basically, the downstream code waits: at least 500ms before toggling the =
LCD_EN
> GPIO for power on; and 200ms after. I matched the 200ms to the hpd_absent
> delay, since in panel-edp.c, hpd_absent is also the delay that happens
> right after enabling the LCD regulator (or toggling the enable GPIO, as
> appropriate). Similarly, the unprepare delay is called just before
> enabling the LCD regulator, through panel_edp_wait(), which matches the
> way the 500ms delay is used in the downstream code.
>
> For the enable delay, I went with the smallest value that would still
> work, but I admit that I did not try anything below 50ms.
>
> >
> > I had my AI agent take a look for itself. It found evidence suggesting
> > the enable delay should be 97ms, not 50ms. The other ones seem to be
> > OK.
>
> In the downstream code, 97ms is the delay used before setting the
> backlight on. My understanding is that this should be used elsewhere
> (e.g.: in the backlight node of the device's DTS).

I don't believe I've ever seen a delay in the backlight node of the
device's DTS, so that sounds wrong.

The .enable delay here is described as:

/**
 * @enable: Time for the panel to display a valid frame.
 *
 * The time (in milliseconds) that it takes for the panel to
 * display the first valid frame after starting to receive
 * video data.
 *
 * This is (T6-min + max(T7-max, T8-min)) on eDP timing diagrams or
 * the delay after link training finishes until we can turn the
 * backlight on and see valid data.
 */

That sounds like exactly what you're looking for, no?

