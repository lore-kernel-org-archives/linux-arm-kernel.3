Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1945606A322
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 22:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5EPglpea;
	dkim=pass (2048-bit key, unprotected) header.d=a-marquet.fr header.i=@a-marquet.fr header.a=rsa-sha256 header.s=gm1 header.b=hGcJfSZL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SEe+SUWK2rxTs3v/5WQVrWp4ZPCN7HRi54mevK7AlNw=; b=5EPglpeaCq5fhbcvsU5NahskQV
	gu6jujOURAgijDiYdqYi/hI10PpYCty58sopabJJJadQ2OrOkoGhwLe3uY78xS5bBbYaKJL029MHP
	lkNMHZ4zujrTxnV7BApQZqSL1s7iA0BQpDNDzoX4m/C2FsOlC4NAL6AGnUxlTR9SAVMY/fv1MCy5Z
	N6KhnXbQNIS8w0YsCNnVgP7bDMz8PT9rFBs25I2pEaKv5S1M0rt41KJK1Upi/Z8ErjCxMyNjEsk3j
	5zydRKzqDAZPoNYT3rqn5y1HchuItiThRLgDdPAaM6oRgDMZPIif8Z0QbZQn50KnLsFoEsLgka8UC
	/NNd6bgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMudu-0000000CeJO-2P0U;
	Fri, 30 Oct 2026 22:00:10 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMudq-0000000CeIQ-0XdD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 22:00:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EFCC429A6;
	Fri, 30 Oct 2026 21:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a-marquet.fr;
	s=gm1; t=1793397599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SEe+SUWK2rxTs3v/5WQVrWp4ZPCN7HRi54mevK7AlNw=;
	b=hGcJfSZL4w1jdsXi0YtwaOVS1gosJ8ykYGNj4MoQmozDdP7h0mXTk3AJPeB5rtpziLvhUr
	ejPEOeitkSMOKfrKu2DS1Hq/DwBwGRzaoYk3CeYiG91kev0lA0ZbUJs7dHPmdJo/hprlr0
	PC75sUp60vkTlTF79M9IEF4C72g9Z76/u2RL2Y//YvEBrVnUxXiJ8x88hq6v3BO3bEK0AL
	qC2wHS7iQOVlDN/IwI5akvA4cN7ZJyiuE2psGMNcXcWrMHR8y0428ISCbRUgawpT5BWLgg
	rs03U27xnZcJuyPX9pwiXUd5tIImMixZ9b1QBYFKignA6yhM7dXS/gcA3gTLYw==
Date: Fri, 30 Oct 2026 22:59:51 +0100
From: Alexandre Marquet <tb@a-marquet.fr>
To: Doug Anderson <dianders@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Lukas Timmermann <linux@timmermann.space>,
	Henrik Grimler <henrik@grimler.se>,
	Hendrik Noack <hendrik-noack@gmx.de>
Subject: Re: [PATCH 3/3] drm/panel_edp: Add SEC LTL101DL02-002 panel
Message-ID: <auUTV87eElVyIeTw@laptop-218>
References: <20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr>
 <20261027-drm-misc-next-manta-auxbus-v1-3-3a45c3cf531d@a-marquet.fr>
 <CAD=FV=XmfYM8diBOh3UidN7xEuB3n+n9oAm_zhopfFLERC2QpQ@mail.gmail.com>
 <auOyxKTuSNysAA3X@laptop-218>
 <CAD=FV=VV82NG1CAL9DtLeDYQdjC9Su6nYfLYbjzmhzEY9a0JSg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=VV82NG1CAL9DtLeDYQdjC9Su6nYfLYbjzmhzEY9a0JSg@mail.gmail.com>
X-GND-Sasl: tb@a-marquet.fr
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTFc9EGaCvfEUCaoC4qgd/TP4sAVYRTco+4acfrE+gR7Lwjd88DtzEDt4+fgU97UMKvWoFC7r1VdcMOI/JEGYu+JEgXI3Gdo+5bhtmyy/MFrDPhXfeeCHu4+oIf/Tv81SvsFnGJq+P86UZjv5WkfU0jjAJtIh72ogLJ41sxqBhOph5CEeBM95pjZbbkT9KgWVFnVtqJzOqKBzh4PWWTiCHbbpeJmb5QbyfG+tmATGID1ag3v/Fgmtg+j6JC8e9WnFungznHcvdJv8DrJ0GaOwJtOL/d7k1vGfHZXY0SbsBJb1oDSKSOU52rG3/k/UtihxVETDVzoRyArdHiMPURQLbBcF5Rq2tW3X00I8xtyX2wJ8ka2qYDdRC+l7rCH50lSbOI12uwjvKSbuR+Ahk/0uFfaAOGLYqcc9fVdTq3iPd4CKrfgWEjV2qv1PUOKO9rW4U+zMvgXrmhLGwhOzCzVepCdokQCfVtBTE5gf5FzP9R0ipP7MXEIIpvz2QsngzTb4aMIbE2IQQBi3PeBpSdErj0f7361vJ5j/0Ep5me04GAJSdrgczGsKFZI7NqFi/QPJ3B2JYaNGivv2uZmcRGC4OFcngtyOB85nC77Eaefa4ATUtEVPghavX9NNc2gAkKbVkpS5MHX4DP7H0eeyFMbUVpELBi/KrCrYfzVOPgOnYXjEw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_150006_479658_AF6296F1 
X-CRM114-Status: GOOD (  34.58  )
X-Spam-Score: -2.8 (--)
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

Le Thu, Oct 29, 2026 at 04:27:30PM -0700, Doug Anderson a écrit :
> Hi,
> 
> On Thu, Oct 29, 2026 at 1:55 PM Alexandre Marquet <tb@a-marquet.fr> wrote:
> >
> > > > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> > > > index 94bc54c3833a..c92985363093 100644
> > > > --- a/drivers/gpu/drm/panel/panel-edp.c
> > > > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > > > @@ -2198,6 +2198,8 @@ static const struct edp_panel_entry edp_panels[] = {
> > > >         EDP_PANEL_ENTRY('L', 'G', 'D', 0x0778, &delay_200_500_e200_d200, "134WT1"),
> > > >         EDP_PANEL_ENTRY('L', 'G', 'D', 0x07fe, &delay_200_500_e200_d200, "LP116WHA-SPB1"),
> > > >
> > > > +       EDP_PANEL_ENTRY('S', 'E', 'C', 0x9c0f, &delay_200_500_e50, "LTL101DL02-002"),
> > > > +
> > >
> > > It would also be good to note in the commit message where you got the
> > > timings from. Datasheet? Downstream code? Guessing?
> >
> > Both downstream code and guessing, as I could not get my hand on a
> > datasheet. I will add an explanation to the commit description.
> >
> > Basically, the downstream code waits: at least 500ms before toggling the LCD_EN
> > GPIO for power on; and 200ms after. I matched the 200ms to the hpd_absent
> > delay, since in panel-edp.c, hpd_absent is also the delay that happens
> > right after enabling the LCD regulator (or toggling the enable GPIO, as
> > appropriate). Similarly, the unprepare delay is called just before
> > enabling the LCD regulator, through panel_edp_wait(), which matches the
> > way the 500ms delay is used in the downstream code.
> >
> > For the enable delay, I went with the smallest value that would still
> > work, but I admit that I did not try anything below 50ms.
> >
> > >
> > > I had my AI agent take a look for itself. It found evidence suggesting
> > > the enable delay should be 97ms, not 50ms. The other ones seem to be
> > > OK.
> >
> > In the downstream code, 97ms is the delay used before setting the
> > backlight on. My understanding is that this should be used elsewhere
> > (e.g.: in the backlight node of the device's DTS).
> 
> I don't believe I've ever seen a delay in the backlight node of the
> device's DTS, so that sounds wrong.

I was referring to the post-pwm-on-delay-ms property of pwm-backlight.
But I tested without this property, and with .enable set to 97ms, and 
could not find any difference in behaviour.

> 
> The .enable delay here is described as:
> 
> /**
>  * @enable: Time for the panel to display a valid frame.
>  *
>  * The time (in milliseconds) that it takes for the panel to
>  * display the first valid frame after starting to receive
>  * video data.
>  *
>  * This is (T6-min + max(T7-max, T8-min)) on eDP timing diagrams or
>  * the delay after link training finishes until we can turn the
>  * backlight on and see valid data.
>  */
> 
> That sounds like exactly what you're looking for, no?

Indeed. Also having the 97ms value from the downstream code in .enable
removes the guessing associated with the 50ms in my initial proposal. So
I will implement this in v2.

Any preference as to where I should put the new delay_200_500_e97
panel_delay struct? I was thinking after delay_200_500_e80_d50, but
I noticed that the delays are not strictly in alphabetical order.

Thank you again for your review,
Best regards,
Alex.

