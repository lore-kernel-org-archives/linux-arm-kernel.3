Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0F5CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 10:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xww/iHCRl4Br2j+u3kaOpXoF0IPDaTQthPF3CkkfnBg=; b=jneeVbPoI1XOMSTydEWyOqoWzy
	5I2Jye7o22QeuDe0xgC2ce9XK/VFvOZ/0tINk1054lJKNxwQ+ev3lh0QrQWgcz3o36kQw/9mZHUwp
	nJYZoCSs3zLwabIaD5DLwLYdACJxAE8haohEVGMof6nazdnlBAlX+sr56v0ry+tuHL1Qi3WDsDbW/
	QpDpLZtflEL6/sD+jfbYYUMXwlrXqpszj9jaoCGDQunG4B5Re1kupwJkV7CAwEXNl31KCjZ61Ydyj
	49Mzkl+hh4lQgza5VHUE+cfeNyuylrzQpmG7FjGXWP83F3T23J3Pu29YGLzLx4MIPT+VqSNbcqORO
	Wp0qZCDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkl9-000000066Po-3Sg7;
	Wed, 03 Sep 2025 10:30:35 +0000
Received: from mail-vs1-f53.google.com ([209.85.217.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjdN-00000005uTs-19cT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 09:18:30 +0000
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-50f8bf5c518so4000122137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 02:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756891108; x=1757495908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xww/iHCRl4Br2j+u3kaOpXoF0IPDaTQthPF3CkkfnBg=;
        b=YxAa2RCiYFMAC+8mTPKTL0AWmYX7bkHsOHPI4VnLEf2RA1+Gz8KsxslNAow/VEaQyW
         ipe0vF38xoUH++uDr6OKGnkGEDtoXfqJVYN6NY1cDTu8gdHUsGlC0uh0QcW2O72B8Ute
         jqVFgeomJ89f0mXOw/jMu9eTIeLYyXkw7iyP7Fb3EJaetKzJgFkzPjI21MPBQGbWGjoe
         BQ4V3WgDbhiDwrq915eputSwLhAOt5ShMHJePWRN097bUw267ptYC5KyUGYtSmgOCZdA
         VVteUm+0GJeWznAlMZmiqH/DqOcWziOkTjYzEvDA0JVT4jeWkDDdaGCNBaz2KMSsfMQa
         Yq3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXlgfCSRzNRkIcOTk108qJqViak+O7QgfSV2AU0yzWz4LF0vdEoq/DzAlMuiZBnjP3Q4VVqVK6vfNNAtGedmIGv@lists.infradead.org
X-Gm-Message-State: AOJu0YwSgBdvET8Zb5WGVw+Hc8e4qRJ/MxQOqO4P0qUlg8sMng9+H4bk
	kHgSZ6iXvPAMPnij/aiC/QnfM9mrSHJNEdzTtB4aEPl9s8JoXEWoXQfhkPkAXzkb
X-Gm-Gg: ASbGncvEZzIi2OQ8zrMmYuh/B1PTFUhTX6m174crLGD1hJ51ZIZ96jZNZ89hkIxK9Km
	LXVQHozOaoGXXfoCMffJiiWMyYvh3iIorfJ3i7TWW0E/eXZyQXOBy3tllPCFn6MtFbrA35xu6hR
	pzP8Aeort9AsZg6/5wrrHu07ZaTDHwsR+XMShVLuGyodZrY9dQm6Dnd3ohv8Ud4/5sn732zF48H
	WLBpEvb41cv84tlc96TosIzQkQ+KE9q5W9SFAm7eZWrrej9IjiizjdxdgXcjgFZHI+cq5SWO324
	ygg9nHOzYRlksqGd6YO49hOWxCOUZVOjERyhDACb2lROO4ULbdXJysCAYVbPCg9OP6rsAu/tdbM
	ABFbBi/qLqCJZHlCDIAXgDjzas/xPSBGrEtUXC3ntx9ezFX5DttQzfnim6zpWUfdHl6ivPnY=
X-Google-Smtp-Source: AGHT+IFLbZ/NyzGDsoHcwb+i9PVJe2ofWb72l5n0fRdeqdWSOXwbNjKUV7m6lC+eqkvlm1Swspcehg==
X-Received: by 2002:a67:e707:0:b0:52a:5fc6:e50 with SMTP id ada2fe7eead31-52b1bd35203mr5274877137.30.1756891107820;
        Wed, 03 Sep 2025 02:18:27 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-898364cdf79sm2324073241.1.2025.09.03.02.18.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 02:18:27 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-50f8bf5c518so4000108137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 02:18:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEK0yHYzx1wC+eULiiMu2VXlAUjbsuf8wQZ/6Qt+6HDI0SwUHpBdsUNDhsmwODQYOZ5BkGD7obABbZcdOQBPXn@lists.infradead.org
X-Received: by 2002:a05:6102:54a4:b0:522:1013:cace with SMTP id
 ada2fe7eead31-52b19a5277emr5076476137.10.1756891107431; Wed, 03 Sep 2025
 02:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org> <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 11:18:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXT35qvPNyjegzhCysA7kRY3fTWSWy4GZ=TZ7FG1JpKQw@mail.gmail.com>
X-Gm-Features: Ac12FXy7CQvB1AiVQKpvJM9u_WFe4oPUM6ax2MBP4KMifXDrnlzAsDa3ZqgU8bU
Message-ID: <CAMuHMdXT35qvPNyjegzhCysA7kRY3fTWSWy4GZ=TZ7FG1JpKQw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: net: renesas,rzn1-gmac: Constrain interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Magnus Damm <magnus.damm@gmail.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_021829_312111_CF9EADE5 
X-CRM114-Status: GOOD (  17.85  )
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

On Tue, 2 Sept 2025 at 17:41, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Renesas RZN1 GMAC uses three interrupts in in-kernel DTS and common
> snps,dwmac.yaml binding is flexible, so define precise constraint for
> this device.
>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

