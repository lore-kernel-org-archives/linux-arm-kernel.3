Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6E7606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 10:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1fMvL4m0;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=naU9y/xI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQyv3UXDKrcHPg5SiBMTwmI7JSOMjEBmbwi+E5uk+A8=; b=1fMvL4m07i20q9KTxeXIsEdIes
	9D6s6DiScJx8GKueEkuv4UuU30C4ZFITRVl5MJLOlRl04GmaEuWVuSSwO9P207Auvt3XFb77VnTFI
	Rpno9dFiMbSvW3DbpEdsADNzmHg6i4/913c9Qb8PBap/XahCL7VyMfMmv1aakBYZstNMP7EsD7X+r
	ORmp+FF1nt3XW2GxlsYTwzPZ1yzufVPz8f9Eb167VqnAlFICNnLHcVfbUjAaFWnBHrv+L80E9wuIH
	u9xjNNhbmiDZNTIh23On6r5YdqU8rLU9sXda5lWtIFtZ5wy2kWBw29yRTBUIpWczWhyuIktmETASt
	wEzVWSIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ79n-00000009RRT-0Nd8;
	Tue, 20 Oct 2026 10:33:23 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ79k-00000009RQf-06JI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 10:33:21 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-15354aa70e8so198906c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 03:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792492399; x=1793097199; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iQyv3UXDKrcHPg5SiBMTwmI7JSOMjEBmbwi+E5uk+A8=;
        b=naU9y/xI8r7nXLVKMst2sqlPSxWJMts63nez43KTJ4T3gkDs0W8CC71/Km1lrX8hZX
         9SlUJAHOgss4HKw8NN0Nc5AYYHmII+9bUEnioBv9ZSWobGRXN1KDvvwMXeTntnOiF4Az
         aB/qwVR6eEbVe8E94Go+0OGGhKuxljqkQ6Hl39VsWJRk4AiQC2Jan9d76knL5sDpP/Ey
         7Z8kkGctHOOscbHSlG8m0Ql9l9TjzrvSrPmt5mriy4IGtbr8cy9kWLXr1v5lvKhHfIrp
         8gj5CcyT3f4ZHKiGwG9xfU53a3QYni/8OTVV4iR4MCTQZPueWgK72Tny66y+EX1w1kPk
         yzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792492399; x=1793097199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQyv3UXDKrcHPg5SiBMTwmI7JSOMjEBmbwi+E5uk+A8=;
        b=GIaBnmnNGCj1Ffqb8qSwXkC/BH3rOrBnocfkpRobHdB44Eyy0Sperj6t0/JPtsg9z6
         vIJWHc2du3PB6JaJ5RcqC/t/sS420QguY1xQndfYc9qb0wZTkfedTFEtzg3gUksJ89U7
         Fv/PGYRgHYxruLR7WodytBbf0NENZtSiTvegzGMkNqObVR3WDKzbbaOIPNK6v/d6bcz8
         N0gHstxiVHyA+qzwMfaoLhR/O5rHGKoUKnL2Oy/rUSjADt+Jah4MCnSwsgDVOGLQePGO
         4o77Lo7UC1UU5gUIyz1G1nreWZOHosBQrBXB9zlIlURJR5f4EYpeopA37jUDO0e2jypS
         zpoA==
X-Forwarded-Encrypted: i=1; AKwUvBweiyrF6uZ2iY/nqZYV0hEguYE8cvRji3VjKi5O/aolo4+FopvsfLX9Lxmh6HIIyq6V8pHzBkAmi9ueKDR/f8/6@lists.infradead.org
X-Gm-Message-State: AFq9FYJS0r30UL0LVoJr8Elz41zWkLXBZ9wZv2ThO0CMa6Mj4Ryk+v6n
	myYC5kzP1DViYW1x9fFeOWOFrc/lBalWzbBbY6D+wyUNjNSTwSUr/zc6
X-Gm-Gg: AYBFou0kGZHWpm+mCj/GRgg8Rb1XJZahdxXQoTEO1PCa1u2IUqE8AcHGpfi6dn/eHym
	Uz5PKuWh/Jjbt4k8n6trELVK2+Ue2i+GXt8o7GUw20G8vNYlOYLI1JYTF3eywemA8xKIF04MeKP
	U2mtyEkBBUtf0Vz+mK3XuGXR1tXscg+Wvqe3hUAnqERqjrc5BAaD6T3EWTeuLupN1H6hTC9fPOT
	CzcPuTF0613XXQzG8Qf+eANdHS/4sSSMIzbRtkmVZoHMXhMPv1lWgyoG2H9iCvJ3bZQ22ziz6yV
	+ACloplPA0C5DR+8xCQFLz5fgxRwdwbxUJpH/5rQzFKfVNeU23I4wfpbnfCeWVG4jRGKTqD2dlR
	cd6YXL2jhObyDGaGmsorLPUudyvJ7E0sbZ40b6u2mVoP9gq5cLAAfLzg9FFDLEGepCtn/lYZUEs
	1IMWRwEfMcW4NHDtbnuPG4C3RU1meK8T4hyUbTCi6Giao4YXuy+kRD7BixeLUW+5oqM00vOzBKP
	LyA
X-Received: by 2002:a05:7022:1001:b0:14c:be8e:69fe with SMTP id a92af1059eb24-1850c8da80emr20220476c88.5.1792492398134;
        Tue, 20 Oct 2026 03:33:18 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm35068908c88.21.2026.10.20.03.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:33:17 -0700 (PDT)
Date: Tue, 20 Oct 2026 07:33:10 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: imx6q-apalis: Add VGA overlay
Message-ID: <lozimedmt3h7v6odvp4svvmatvk7726a4ztn3j7ft44oto7p5p@dmrudrmzyz3s>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
 <20261019-v2-apalis-imx6-enable-vga-v2-3-ef6a3a780472@toradex.com>
 <atZxhWaUWthEHkti@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atZxhWaUWthEHkti@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_033320_065556_6C9E42AC 
X-CRM114-Status: GOOD (  19.20  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 02:37:41PM -0500, Frank Li wrote:
> On Mon, Oct 19, 2026 at 07:17:16AM -0300, Leonardo Costa wrote:
> > From: Leonardo Costa <leonardo.costa@toradex.com>
> >
> > Add a device tree overlay for the VGA output available on the Apalis
> > Evaluation Board, which is driven from a parallel RGB interface passing
> > through a non-programmable video DAC to a VGA connector, without VESA
> > DDC I2C signals.
> >
> > The non-programmable video DAC consists of a simple resistor ladder that
> > converts the digital 16-bit RGB signal to VGA. The VGA output is gated by
> > an active-low data-enable signal.
> >
> > The overlay is also combined with the various Apalis Evaluation Board
> > device trees to provide ready-to-use DTBs.
> >
> > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
> >  .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 80 ++++++++++++++++++++++
> 
> what's difference with
> 
> https://lore.kernel.org/imx/20261019-colibri-imx6-overlays-v1-5-e4d028727382@toradex.com/T/#u
> 
> Is it possible share one dtso also?
> 
> Frank

Hi Frank,

The Apalis iMX6 one needs to set up the connection between the IPU the
LCD interface (endpoints ipu2_di0_disp0 and vga_display_in), and the
Colibri iMX6 one uses a DVI connector instead of a VGA one. Most of all,
the bridge on the Colibri iMX6 doesn't have any control signals, while
this one on the Apalis iMX6 has an active-low data-enable signal
specified on the input endpoint. Because of all of these, the overlay
needs to be different between these modules.

Best regards,
Leonardo

