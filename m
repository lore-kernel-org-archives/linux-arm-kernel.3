Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D229AC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 16:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hxPoNGqnrfhBrfHS1iu6MjT/Y0C5RkQPJequbXhIKE=; b=G4QsirLnZvEMzpaJLniV96VAdc
	SzUyzmIfCgwebgDjTSJav9Kcnaps3GGvOaXC2LRF1o7vfeQclSnxWSHDGrRwTEo2exrAZqmBshGDc
	YGHLD5ZGyv6hirW2ZUguZkVAyQrCc2hgGfdMdrB+Kq/gusSdVBKf8dfcZpXlh4m9rSz8Ib/p064QK
	PvZprkLWR0cZ3MYBUU0+hkJ0C20m6XUcZqRQqZmT6cQlbG0WuVVn3uaCsQNG6/BdpyXLJx3Zu9IZA
	PbbXICbFNAcE5sOREeAXnf7XXt2IDCkyh4RzmMN/Bz7cXzZAvRxdZB9QW2Iw6BuJ5GZucu0DHufyn
	OZp6+JBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhNT-0000000FoCC-0J6W;
	Wed, 06 Aug 2025 16:52:35 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhKu-0000000Fnlo-49X2;
	Wed, 06 Aug 2025 16:49:58 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-76858e9e48aso167309b3a.2;
        Wed, 06 Aug 2025 09:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754498996; x=1755103796; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2hxPoNGqnrfhBrfHS1iu6MjT/Y0C5RkQPJequbXhIKE=;
        b=SJfB7Ko2YKI8zpHipWqXBFa8e1IS+pWRSTHNag1UPAScVAVE6JAF6zx0S5GpTg08Oz
         iA32p8TKpjqj9y6n1UvyNghbA4ymugEGz35pmpLCcSFw+EemO2wqdtHiWawEPk8akSMo
         LM/0LhSpLJKn0svbVIxcBWgIHjyNbTLimxBaseS5jtuXTlFcw5g5qhTaiF3IvrQf9Eei
         1ynVaGb7qo0eRGdCke6omKmjl8CCbw4p5TNWFrXGLluzusO4LswsSDIMJOCt9cvlAAmo
         CXk8b9ZO6UhwUg1VfG7zd+XFUR8DI6EMMy9f259pDr4Z5DbRXc0gy3awVKoYEwT3jvUU
         4OJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754498996; x=1755103796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hxPoNGqnrfhBrfHS1iu6MjT/Y0C5RkQPJequbXhIKE=;
        b=HXPPSvh2fyIwS8AADRnAlCpvdboFU4OprlKDUR0qrt+UTqSXpfwOgoQshMExxcRqXX
         lVS3xQhRaGO7lov9IoL3aWM1XOTxaFTdZmm93jQMWuG9FPNpW6PXQNOWVR433kQPeSTt
         8UPV8J9fvszUXkvlPgGMKmOaSl7H9jrnkFw4taqOTRM6AD4UIVozLt2VhqRci0W/Z6Vj
         V/p2y4CoBPhthUnhJwtXQgZUzXrVNs0rTLuIvVxqWR/esLrkU3/E0yIRZxFMEEEk1s3g
         eWChvSGlMPXmvTVsx+PqP+AMaSDim0ZZhAft5ijr06DNyCATR4r/hx+Ydaw1CDGeHELn
         6Alg==
X-Forwarded-Encrypted: i=1; AJvYcCV2YjfEBHvYt/hu1Wbh3+E8pnBDMvHEGbXIb8BzPdFsHzxVksJfMSy2P7rLFHvPSaH6hbxD6WdalFpF58MkezuM@lists.infradead.org, AJvYcCWcI7Rw9Gct6kt61s/RKau7GFqcm1dTI41Dx1pt14eyrv3+9iZMLRd4tuFP+RlZfxGY1UKGKTBpOfJdmhi1lpA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNEvaOAmXV8tXr0giO3KIQwja95M8MqanjxND+8Oa8PPpubS1v
	daob4wzb3mvAVAxVnclmMIADgqmwxkLARMhmTID+IpZJaJk+uhtsnswDoZ0cig==
X-Gm-Gg: ASbGnctbIo2jKX+1HXy060bxUJ8O28g1gFI16gb5yJbflP6t/kFqGp7mDtr7D78C4sX
	htX8jU6Z03/DIG6QVxYfjQ6XeENatcyHymlvqCH0Jo87oRb7zYaIFKr2i3la1Hh9AU+2DNVllL6
	KOYOtjV+3wHT/Upids5qgMTftmOs/jINJOR4lrYcuz5/OvAsiZ7FCbK7la24cns8S/9uNUjJPF5
	/CY8CX+Qk/z1wl2QoDsADMsbuZQ/ACNg2ClxOoCTpE+RPFpyxWpC7Zar+yYS0LWABH3trZXae3K
	QrKLru/t1dQvqYAN2vuC2iS1OTGBX6yskIk+JoyPBDGokSGDP0HTzTIRhCT0HSmpWblL504/d9+
	+Dr4HPlZ3z25hVzeT0kk5Fdk=
X-Google-Smtp-Source: AGHT+IFsccJl+8grrtfEeQECM+TOHiPBar5NCMMdqnb5GEn/iiF9QyTE/qR0isk8lV8PjxYY9tqQWg==
X-Received: by 2002:a05:6a20:7484:b0:240:750:58f with SMTP id adf61e73a8af0-240314f5ef5mr5388018637.30.1754498995688;
        Wed, 06 Aug 2025 09:49:55 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f30b:816f:bb8c:fe9f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce6f30bsm15918359b3a.16.2025.08.06.09.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 09:49:55 -0700 (PDT)
Date: Wed, 6 Aug 2025 09:49:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] Input: mtk-pmic-keys - MT6359 has a specific release
 irq
Message-ID: <akavphbw2wh5vga3eoe6abqdawdssko4cy2sz7oedef4jvzunn@37whg62gmfoh>
References: <20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com>
 <20250801-radxa-nio-12-l-gpio-v1-1-d0840f85d2c8@collabora.com>
 <a9cd33f5-cc37-4a1d-b1fd-094761a146ed@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9cd33f5-cc37-4a1d-b1fd-094761a146ed@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_094957_026126_715D565B 
X-CRM114-Status: GOOD (  15.44  )
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

On Mon, Aug 04, 2025 at 10:05:21AM +0200, AngeloGioacchino Del Regno wrote:
> Il 01/08/25 15:16, Julien Massot ha scritto:
> > A recent commit in linux-next added support for key events.
> > However, the key release event is not properly handled: only key press events
> > are generated, leaving key states stuck in "pressed".
> > 
> > This patch ensures that both key press and key release events are properly
> > emitted by handling the release logic correctly.
> > 
> > Note: the code was introduced in linux-next by commit
> > bc25e6bf032e ("Input: mtk-pmic-keys - add support for MT6359 PMIC keys")
> > and is not yet present in mainline.
> > 
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> 
> Well, you are effectively fixing the commit that you pointed out, so this needs
> 
> Fixes: bc25e6bf032e ("Input: mtk-pmic-keys - add support for MT6359 PMIC keys")
> 
> and
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I am really interested in how exactly this was developed, tested, and
reviewed...

Thanks.

-- 
Dmitry

