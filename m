Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3D0606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 23:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hoy8LOUp;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZP4bKyhe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=F6RKSKoXJzKlNaMzDigqrXvD7n1HyX5zOJi75UDgxuY=; b=Hoy8LOUpTZnZLH
	pZ/xsLNTjyFD/R5Zcgp374QzuRK5GG4pBsly8AiAAGBFJ/KhNZpTzd+AyHkenDzBbQWjKg0UFX81q
	aeU1TI+Yw2yI2h1lwnSgLeurs3TkexeYX2OJTqxGRK7JNbdP8dB+dZNVl0eutTqByvYg4GP76+cSe
	d5axSYXkEgtQVe8Un3dSLsBaL1FwuxES1+S9cv7aorBBlfyd+rZEGNcg2Y4JOlREgutjEot0LMgHY
	n+nXN+CQevz4/88bSBWh+UFdksqirh6qjQtnaZwQ2zKeG10G6uxKUgDk4q7/6X4IRg9qyUa5MVn6/
	zsai/t/F3gLUYhTolOjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMwGI-0000000CkMS-20Dx;
	Fri, 30 Oct 2026 23:43:54 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMwGF-0000000CkLq-26Mj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 23:43:52 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6b45f9ec1ceso1434800a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 16:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793403829; x=1794008629; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F6RKSKoXJzKlNaMzDigqrXvD7n1HyX5zOJi75UDgxuY=;
        b=ZP4bKyheEngoAkZOSQuOjVwqOqcoU/yaUrxkp9rkU27HS30i7J+/25EVEfhkGXbsct
         nqAM+hDRdTPnujV6foNM+I5yI5OETccjSuI/ePk+OVQxfGNbwiF7PrC0UFA2jI0WiIHJ
         z9QbqAPmHfHxXaRRg2IbO7PLX0Xk9E76tOy14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793403829; x=1794008629;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6RKSKoXJzKlNaMzDigqrXvD7n1HyX5zOJi75UDgxuY=;
        b=f5eMAYsSgvBfdfxcMNz5burjFqiTGtJTlzsQg2eOmrF9K6tvwj4gp/LSJ+gtSmqGHc
         xJzaYNT3uNtt+Kjbw/LpsD63TDuz383R42vGp9p+NRwtqzMLjCYrpc1p137QUAkXCBom
         11U3F5FB0PoHTG5VlYrOyBpj6BNfIcBR0IUAwb1id0T3fViRZjzK8SNVPNGjj7RLcwW4
         TImA7jWZ+VApVv0WbRfVQv25krDYub3qxL55TIL9eE4zmNclbwEM6IDV9G3k6Kmt5iex
         tQE4k8+L/8OZgrcWoucQnBl3OY3RXPiE7zJNzUePxf3S0cN+1/MKT/yWUFWA2C5+Lah0
         oZMw==
X-Forwarded-Encrypted: i=1; AKwUvBwd1OpCo9eWlRnVZp5tZktxxDROFHUi9DISzxucQlM+/1X63xFG4Gpe+tkIZqnkBnUgA5Rcug6aMILyueTbZ3x2@lists.infradead.org
X-Gm-Message-State: AFq9FYJTRrdRh5ze1E0ZX7IeNTi2O+vUJJD9p+rV1/GOtGtSfyJ00YJG
	QR+nUWbK5mP512xqEaVVh+JWXEf5NpFBkJm6krLLEpDDRwUPgdtBYnc0xywuB8gt02R9B5I4tdE
	NDoej4w==
X-Gm-Gg: AYBFou3FiGTfC3dWO+rWnRilZAbK0O4XQ46bbXv2qmbqCh+hkM+cU10ZfEW1Uvx9LlG
	V+oJp2xH2QKiboBuCYP5OT1YYJf1u5Nmbho6olMSTQMougX1k0rUekG+VgIUxUrvCe3D1pICjir
	4zAr8pk3l0eTQSHJXI38laofIjD9stdytEKvhTEn5HQ/x+kZFgt4WNqMNuWuO12gI3u79e2YX9H
	i1Omv8Y7Bu/+RYWgm+fkgoHw9KQlUPnwXl7CKRqe243JmvLXNhJyEdZsCjR3k9RY5DsDjvL9LbY
	dWpDH9+Uwplp0WPlQkRgV6M3Tmf2C1+bYdAkH8Oq0CQvzCo/FS7vxJKypyUuYHvVGUMNyDMylhY
	nBV4gM6pSCbWIHpB5Puf43v/F23al+nITlciywhVrmgNs9og9ITdbZZ6Y07W9LjVJueAlhK0XO8
	LEnyFituyDPKp6TeNOiSz83BfRe7zXfWGjjgSOsH5Qy8p4MZnht4I0xy7h4+hTU1ZG60PuXeQ5b
	KXz3hCzCBrNc8GpvS/b4FTV/q9Lh+Te/gDYHp3WSZTsZ/qJt/W+/6atxigC4pdotz9h8WHZ2Ae7
	9sfeKM6ydcQEQI4zIlGzVmyfaT3Iti4F3lQFCQyDN6x8e55T3sHMINR5n5kBsEgpbsPW
X-Received: by 2002:a17:907:3f1b:b0:c46:9e42:2563 with SMTP id a640c23a62f3a-c4ca7ad1d53mr322472966b.39.1793403829492;
        Fri, 30 Oct 2026 16:43:49 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe0fd97sm119212666b.47.2026.10.30.16.43.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 16:43:49 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1204077f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 16:43:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxBE+nQGbu8ulhcv4Z185sTr8aIU8/XpGqOrBKHHCfbZzeZshzxlYr4UB3u465vAfH7uRAv7rZ7MKnuWy9LCC5e@lists.infradead.org
X-Received: by 2002:a05:6000:47d4:b0:48e:60bf:4177 with SMTP id
 ffacd0b85a97d-48e6e3024f2mr6586994f8f.9.1793403436187; Fri, 30 Oct 2026
 16:37:16 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr>
 <20261027-drm-misc-next-manta-auxbus-v1-3-3a45c3cf531d@a-marquet.fr>
 <CAD=FV=XmfYM8diBOh3UidN7xEuB3n+n9oAm_zhopfFLERC2QpQ@mail.gmail.com>
 <auOyxKTuSNysAA3X@laptop-218> <CAD=FV=VV82NG1CAL9DtLeDYQdjC9Su6nYfLYbjzmhzEY9a0JSg@mail.gmail.com>
 <auUTV87eElVyIeTw@laptop-218>
In-Reply-To: <auUTV87eElVyIeTw@laptop-218>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Oct 2026 16:37:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X24gZgixqSb4SoD2wYt93Z9tDO5dyaeg=jdH4wUwk81Q@mail.gmail.com>
X-Gm-Features: AclHuK-J1ggLxz07KiiLvF7KuKegFXEk98IgNkkyMHaorZ-92pfQb4x0ipGnZnQ
Message-ID: <CAD=FV=X24gZgixqSb4SoD2wYt93Z9tDO5dyaeg=jdH4wUwk81Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261030_164351_587880_C32988B7 
X-CRM114-Status: GOOD (  21.33  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Fri, Oct 30, 2026 at 3:00=E2=80=AFPM Alexandre Marquet <tb@a-marquet.fr>=
 wrote:
>
> > /**
> >  * @enable: Time for the panel to display a valid frame.
> >  *
> >  * The time (in milliseconds) that it takes for the panel to
> >  * display the first valid frame after starting to receive
> >  * video data.
> >  *
> >  * This is (T6-min + max(T7-max, T8-min)) on eDP timing diagrams or
> >  * the delay after link training finishes until we can turn the
> >  * backlight on and see valid data.
> >  */
> >
> > That sounds like exactly what you're looking for, no?
>
> Indeed. Also having the 97ms value from the downstream code in .enable
> removes the guessing associated with the 50ms in my initial proposal. So
> I will implement this in v2.
>
> Any preference as to where I should put the new delay_200_500_e97
> panel_delay struct? I was thinking after delay_200_500_e80_d50, but
> I noticed that the delays are not strictly in alphabetical order.

Yeah, it's a bit of a mess. Probably they need to be fully sorted as
you said, and I probably should have been enforcing that all this
time. If you wanted to send a patch sorting them, I wouldn't object.
;-) Otherwise then after "delay_200_500_e80_d50" sounds fine.

-Doug

