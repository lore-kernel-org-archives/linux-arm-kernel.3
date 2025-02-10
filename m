Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96BFC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9kko6nvgrCtMDMk3GCD451xeU3goOMEnvnQebWZMb0=; b=2fkuYpm69dAT1oZRKaIch4FHW+
	JWmUmCxp1TCp0C0RTWeL5ERMyPntvj+z/HzbftiebXLlhyNCfhNEJG3phHvJ9Q75CTt4GgoFHxL/f
	0imzltPPOhapKPRJQdtXFSxy2tfE5IVcyeYMmfKqlRd/Z3UlZpVl4URySTgoHIylSxxW4Qgyq47Rd
	NmteH9CVwQfU2216U4ZW7+bc3U2DZJdO2l0T1GZ1pM2tvJkX0lXq6XuLn9pxxXKILcI3VFg/n/SU3
	aWwxY4dkVLHXJgqD3By9RCPFllmBSeULE1QLhHygmR8ACC2rjHlCK63RkZSGu+bUsrSrLmI7uOSVp
	+QbsO/0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdAt-00000001qvr-1zuf;
	Mon, 10 Feb 2025 23:26:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcz9-00000001oKq-2jgO
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 23:14:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/9kko6nvgrCtMDMk3GCD451xeU3goOMEnvnQebWZMb0=; b=LMgiSZaCft48Xg+TXTem8hF2GS
	F43jpg4Y4ZKtZa5KDqoAz4ptRDU4xv7xSiLfyuvfaYjKiBPWdtEIE3Fv3SrlQzkdLxiAe1Vw5RbPk
	721vy+TxeUrCGaDBBg8L9qso+1ybPP5YZV7O4AbX5AXEHXLU5R64HhiClo8u5o1TBZBjCykHjg83M
	4a7gemzwOJ7Es5K+FPOGF9bfpNF54hGcNjFsU/JshGragLEoMMRKzjjzZX8aJa2ipS3kpthMTl1D/
	lATwyJnUaQE0m3asyTKHmcYQbQ0lrtim2C2Ae/8RazbPY/cyT9U/DUBpmZMjWu9WHgaKJw8BPMC2D
	eDyP6stA==;
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcz5-00000000MBr-1YlT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 23:14:38 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-308f32984bdso10088591fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 15:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739229271; x=1739834071; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/9kko6nvgrCtMDMk3GCD451xeU3goOMEnvnQebWZMb0=;
        b=s1ID1e0Xne0rroED7VlyxZDy/i8AtMrsv3eBSQMulifoLFPMg52upJnoy3asElo/mV
         otoh4eALnvu0R1fV6TrkwnYdTSAAJ7wr9K5Fhlak/OfzNEKYRbb87Y8DRV86yer0DgcD
         ftCLTlfM7+C5meBHd40H5IKnAuhhzjLegAF5DFu7Gjg4zltknkWqYy0qwmtWuMpj9CNb
         aoCXVc5ttpj2zntz4wuz4lXYl6NDoyja/R3CP3Qr8MiHLm0kBAmVp7l52EJLfhwEHuhZ
         IGBGsqXqyVWZ93RU6QIl2cCNgOF7AAo18CJ+jR21QOqPysWDqfGCJSiREucq4ZDlxmvH
         R4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739229271; x=1739834071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9kko6nvgrCtMDMk3GCD451xeU3goOMEnvnQebWZMb0=;
        b=Iczy/V7dzWpv5MWgJxepfPhF6AH4K+wm+amjpaOl9rFAc+iy/uaw8X5TD4NyeILFVJ
         vuAsews+A4lMgYqMAdZhmq5waYbGEiN+JwfPxgWs7OJ7IQd7vaFHqElMtIUkoXFfymGO
         eg8vS8Vpb6Mst+e8kSXUJLRiEz/zoue8/97ytflmxRfRhAZGm5svYwoazLt0wfMOCfTT
         0Eey/osXcI1/1AFqmsYDzci3Kp4E0N3W+E9Yo1cRqtZYxfuw36yUrTNsZKjc5ex9gQRq
         7cgkEfwo1eFXzKxHt4xUstegT6uHTJrkLifIk3nDFlll7TA18iKRwBRp5iSIR8PLUr5c
         VwlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6fIgdpsAJSLigWdOGJiW3KxgSn8ZR01ku2ynt/jcPi6Dbteyx5Z0zi8VzVEPkDa4qO/xYLfMmWALucANtqB/F@lists.infradead.org
X-Gm-Message-State: AOJu0YyeRtMuVx3n1BGCkI6yiPhij/aEmAA6SzveIW0HSREwzkS+osX8
	db6udT5nck10oIXOO12syyfUg3WHDO6zXZVlw2khCfBPwb4pkHQkLhguUhx3ig4=
X-Gm-Gg: ASbGncsQIu21O+Vv5HL36uPFbNKOraonoAAgGNn+mOtSVLJea+lZOMuvwq+RhypK7wd
	oelvET3WAVs6UfzMo51farKB1aIe7mWpCSstYekg96Qyrcz4LT6TkLwhwWPnAFPifFaJI45yJNW
	EcmQe8OfknNhBoeIbsJqtk3jCuyLTklO/2CF7uefceoC5u0znF4daZNlN97jFRWI0RdG9+bipHk
	jrm6OIL9vnHDuit1aQ1zIvfxNmQCHDWqbBZSkGYhAAP9ZvnjixcZQgOgiVGcOHkW3nMv/Hj343y
	BH7B7sMcjnOXOayEcTZkfpOV3Gy5A3LcR6x6AJp9+WPmXk5+OaYVpiNBrjTmBT14fYJWiQQ=
X-Google-Smtp-Source: AGHT+IEiYA4ZdHNW0MIRhlYTkHA5cjZMO3XRsBNobQiwPDauCXQyDb35RHo4o7SlxDmsaMRxsdJWGw==
X-Received: by 2002:a2e:b8c2:0:b0:2ff:d2e4:8dd9 with SMTP id 38308e7fff4ca-307e5a779a5mr54736081fa.32.1739229271515;
        Mon, 10 Feb 2025 15:14:31 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2baaf7sm13653451fa.81.2025.02.10.15.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 15:14:30 -0800 (PST)
Date: Tue, 11 Feb 2025 01:14:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <qnuskv4mln32nqgbgvwi2qcdwfma6tqfbq7e6sqb3za6pmms2j@ir7pt5634dsh>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
 <20250210181244.0e3e9189@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210181244.0e3e9189@booty>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_231435_693948_D64143BD 
X-CRM114-Status: GOOD (  22.38  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Feb 10, 2025 at 06:12:44PM +0100, Luca Ceresoli wrote:
> Hi Maxime, Dmitry
> 
> On Fri, 7 Feb 2025 21:54:06 +0200
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> > > > +/* Internal function (for refcounted bridges) */
> > > > +void __drm_bridge_free(struct kref *kref)
> > > > +{
> > > > +	struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
> > > > +	void *container = ((void *)bridge) - bridge->container_offset;
> > > > +
> > > > +	DRM_DEBUG("bridge=%p, container=%p FREE\n", bridge, container);  
> > > 
> > > Pointers are not really useful to track here, since they are obfuscated
> > > most of the time. Using the bridge device name would probably be better
> > > (or removing the SHOUTING DEBUG entirely :))  
> > 
> > bridge device name or bridge funcs (I opted for the latter for the
> > debugfs file)
> 
> These DRM_DEBUG()s proved extremely useful exactly because of the
> pointer. This is because when using hotplug one normally has the same
> device added and removed multiple times, and so the device name or
> bridge funcs is always the same, preventing from understanding which
> instance is leaking, or being freed, get, put, etc.
> 
> Do you think this is a sufficient motivation to keep it?

Then it should be something like %px. I found that %p is mangled.
What about having both device name _and_ a pointer?

> 
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry

