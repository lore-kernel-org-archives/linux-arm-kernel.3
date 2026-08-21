Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C305C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 11:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ec+NopWifWei3xhy94Jsaew2jyivOXpRYVcmATiWbTA=; b=s+cQn+sMGFzZTumZBFq2YMlXne
	omYFag0Fw1lprFjTwKRnX+HvE449zTzD+QuEVNigS2IePkmlBSnzj8gd8l3+QJGvOdH7tX3VpaR1G
	1Lav7A9IfBgAwVchz09PLx4q0fAPb5jT7LClHbCJYk6eY2wVVXvwFvp7aS8HhQQywHNhdXG8sB4ER
	8OqPr7QrgrxrAD3cLwrGMV836MQhprhW3HFxSLdeR3yiKrugRc0Mg4+/VI8ulr/oTvxkc/sWtHgbd
	z0Zsz7HebYlQSDiRuCAN8CVwGmYwdVKyVD0d98DIO7z+ma+Sa6Li+qRn6yYk3FrmjBGoDgKh4zFLQ
	m8uBovYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNY5-0000000DCOT-1G2s;
	Fri, 21 Aug 2026 11:36:37 +0000
Received: from mail-ua1-f51.google.com ([209.85.222.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNY0-0000000DCMi-0C8I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 11:36:36 +0000
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97c7a6b936dso20712241.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 04:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312190; x=1787916990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ec+NopWifWei3xhy94Jsaew2jyivOXpRYVcmATiWbTA=;
        b=Hs2ZUeKEPahQ0pvGfV5WfZejxhzIwT2mQw+064NPQ5m3c6dTwdUwdf7OFENVElbx5q
         0udt2dEZmWLBCe9m3/e0ngY/rM2R6tIL/5tzjT6BFvUJBhHD5mRmVuloCcIJG+TOcV19
         adQ/yYzD9h8goHu4xiKrDOmD/W2rC1WFycWaNieU1BLytihdSFlrRDEmM8QS4r58OG0P
         Z0Cd6gqFqUcwaiWomFxi4fXPPJRcer2cNJANqG09/gEGsbDdAVr6rT4KhWXgpkQsABgq
         I5t//Dl5kZmJ4UNxbUMrCzmnjdfsWI/I25kh4q90U7kUwhmjGwtqW2SAdWnWRTYt8pcS
         D85w==
X-Forwarded-Encrypted: i=1; AHgh+RpOFUgLtx6VH4UgLKZgro3n3f7fHGeUBmpHfVcHJypBhxUMF6k7pYx/kuhnMZ4HXm2WTA4VCXIa/R2bH2GHa+Pn@lists.infradead.org
X-Gm-Message-State: AFuF++l2IU2thLpV8X6dWcy/hLFOcbapPu1+gSBWqTRHkUj5cEPYpcmY
	gQ0SrsbDJqCjoCCRA8hgDp6qlQ94kiiueBgLwemJoFPGNaGL5SwLxeuW7gKvda4D
X-Gm-Gg: AR+sD13DwX4N0sQbcmv4GxzSu/DLGOwMrTzfLysJ+qWPu8zUV1HoEBrjU7pz5saHR+I
	P8Vb6aZj2mDJo+s5VpnaWPywsJk0qCL+C/1Qp4GBg9VQ/Rsnuof8qZ8WY1mB2Q2ptCjcnr03uA1
	KogI+nSIv1Z90WDHcj9wKKU01MnHRS0P0arGDxIA8nVELhTFb2djjNdGa2Qhl9T6Fb8+7LfF1K6
	p/JbR3yUMBmul7OZjsmOb1izC6DUSDu6SAVtYx8mXag751TVw8T6uXvGWYft/cfOy1yb8yu85Cs
	DeR4LWY/kr3s9O1Xx+jn7WLrip1qNATHbzGKAj7+Geq/Z/90z/pzx6l64PrYEoJnKJJuIcW79DQ
	332icz5wF8lIHz5YSSxP956xp1TPGQUedqJvdHRFkfNwofKDWow+p8fb+64fghXFA3uBzS9KdrL
	ylXSTw26HxGANdbR61gU/4KcFFQaYy9DiRgEchDUeW52ea3Cz2Tege2RC9uXNoOAUVLe7bPOZCY
	SFyyulwZyK6YEAOZ6dJAVv1qSJRXQ==
X-Received: by 2002:a05:6102:94c:b0:74d:ce65:4739 with SMTP id ada2fe7eead31-77a632439admr1620454137.8.1787312190503;
        Fri, 21 Aug 2026 04:36:30 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c4e906558sm8743640241.10.2026.08.21.04.36.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 04:36:30 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bf9466867cso369547e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 04:36:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoSYR9696eLKwm4tK3x69wYIoFopImutyNgcDIYTltYIcois8L6jAvf5Kej9v35fk6+tLCC/NkRYZYcMKt0lDFt@lists.infradead.org
X-Received: by 2002:a05:6122:1798:b0:5c5:732c:f4f5 with SMTP id
 71dfb90a1353d-5c5ff866132mr2035837e0c.8.1787312190118; Fri, 21 Aug 2026
 04:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787240090.git.geert+renesas@glider.be> <5d066598-7aff-4912-89c6-23761fdccc7b@amd.com>
In-Reply-To: <5d066598-7aff-4912-89c6-23761fdccc7b@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Aug 2026 13:36:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSwx36pDJ0kW=CvQztFx53OvcdfMTpv1h2H6J3z2+Wfg@mail.gmail.com>
X-Gm-Features: AcwNN1Vx5LhEzAerkbLpsNS7FWTQ-s_Hejhf3XNTw2-87OEOYM9RyiJaA3RAFBU
Message-ID: <CAMuHMdXSwx36pDJ0kW=CvQztFx53OvcdfMTpv1h2H6J3z2+Wfg@mail.gmail.com>
Subject: Re: [PATCH 0/2] mmc: Make sure clk_init_data is fully initialized
To: Michal Simek <michal.simek@amd.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_043632_094701_0ED1BED5 
X-CRM114-Status: GOOD (  27.05  )
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

Hi Michal,

On Fri, 21 Aug 2026 at 12:56, Michal Simek <michal.simek@amd.com> wrote:
> On 8/21/26 12:06, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Hence this series aims to make sure all members are fully initialized,
> > to avoid such bugs, and to prevent future breakage when converting
> > drivers to a different method for specifying the parents.
> >
> > Part One[1] fixed all cases that I identified to be real bugs, in
> > response to a crash I saw on BeagleBone Black.
> >
> > This series is the MMC subpart of Part Two, which fixes remaining cases
> > that are currently harmless.  These are still fragile, and may cause
> > future breakage when converting drivers to a different method for
> > specifying the parents.
> >
> > Thanks for your comments!
> >
> > [1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
> >       initialized (part 1)"
> >      https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be
> >
> > Geert Uytterhoeven (2):
> >    mmc: meson-gx: FIXME: Make sure clk_init_data is fully initialized
>
> It looks like a broken series to me.

Doh, I made a silly mistake while filling in the correct patch prefix...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

