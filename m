Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8997EA4FBA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 14:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLzVdK8lDfgaTPyV9xNjlD/1kxno0u/2SblofGNbVRQ=; b=vRC3rUWJxVW3EWh54jL5rvC9mA
	Tv2urN/z6+V5jcoOCfZTpbpxWlMKnyOrhkuCxYqBn+t4gXDrg72/MaBQTyyEqv99VwFBi+ZtANGu3
	2Qv3nlmKqGwgpoGfl9gRDDG7/+QwTIy9ctP+gG3U6CehFXREXpge0sWZaxNRwuVH0XkbG/RRy2J7z
	8HAosXBzFJlxa83QHR2g9O9Tj/wCUE1P25tSWbu1f2/WKkqaJBEGKSMEYiUhcoeTScYxrmRCQjtbZ
	V9FuPfrL9LgiatlFIzTCoNrgYcOxszmaaB5q1OyV0PAdEBrb+8RyaY/00w0jJ7lfyYPzwMqEAYWUB
	qPiWYk3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWcf-00000000RaK-0B0J;
	Mon, 23 Feb 2026 14:09:17 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWcb-00000000RZr-2tHJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 14:09:15 +0000
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56636dc53a6so1554131e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:09:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771855752; x=1772460552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLzVdK8lDfgaTPyV9xNjlD/1kxno0u/2SblofGNbVRQ=;
        b=KfRsV/83uOI+OS6OXMKsFblazVmTK95khhqCuJWAG3zTDDdD/v+uiIKzJk1zTbZutJ
         pH5IVjEBghN2Wj27+uw0dRKohT2eva+2cMkMfqRQe0sgbcnIzFaxf3uIjimCAJRNiUwO
         6JxkavycjyHKBKQcgQTqhAUYPDkDt4YhfoWVqzZymMpHvrvlHTUZKFWDur747iT79Ojv
         ym7ITlpUkQpuTthYscyKT6XSR7yWR3hdoNA13mExzzq4Olg0gXpGQ/wAkIEYdbaCLBw/
         551IuQ30kqFA9ZGUU2C74qPa8Qg5fPvJTn7YITOxRKTECoJoLQ2nDLUf/Li5fZjvzSap
         aR+A==
X-Forwarded-Encrypted: i=1; AJvYcCV9sFn/kLV1Mgk0QvCuAM4OU5gH1QbmsZNCGrwban5IZQe9GY0ahaL3l8vmzas8gzI8+54UC1iQxvZQrVW5jR6H@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm8Tbfh+Lh3i/9DbHecFewhiAeTZhohMVIoE+OLEpqBVIWxCpI
	s82OOgrv49gFqlBPUw0o/OUXhnh92NR7N1AftFkvCx/LYPl7MI60IKm24rnf+/jQ
X-Gm-Gg: AZuq6aI5DedD/dzfqHRfDTyXu1wZ1aujt9vaLR/IV00Tx/UMhnWybXkNTF0GI91cp8t
	f6yuPR4gh4hghSpDiN37a79GaiXnSOwPXYc8Qp/lFksD43q/p5SlIGKCenPtcIB4usPDKbsqo5/
	tXcG/NtjCQBIwHe9R+aalgp6vbw9JHdV/NLSZNRhne53RzHgGRdfW+BvducNDN11AzrlnGinf6M
	oKHaCHjDp8O2rLor+Ht83KiYczR1qEbDp+42ggrl/mf043fZyv5fWEMmuSn8rtlHJxXAU5EmaEq
	/5zcp6a9UOjElPvsGWF6e3+s/FeMVwg5if9YchEF/q/EUz9apU3YJsswKjcCiOZ0Xe8fuEzd7RA
	cLyUze1QlxV/EaBk/G8N3Fq/LyuUd82wiktcF7M+pVFzAeWIPq+QIadw4jJgxalMjO6LLmob3+t
	K1lCLw1ygqKGrS51AE82dbOntytNZeipjQx/07b1J87YVR0Kogz6DKC+hTPobT
X-Received: by 2002:a05:6122:489c:b0:566:357b:ef25 with SMTP id 71dfb90a1353d-568e48b4f62mr3193984e0c.15.1771855752181;
        Mon, 23 Feb 2026 06:09:12 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-568e57daebcsm9076902e0c.7.2026.02.23.06.09.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 06:09:11 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94ace5d0e39so1247682241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:09:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXlmzPamSgdhBeQeQb1cHFHZIdzXteVnEVYsQExEj4kGsKyxDbTi/ez9JkvQZtkMoJz6NOWRS8AEo86NY/N8iwO@lists.infradead.org
X-Received: by 2002:a05:6102:38ce:b0:5ef:a346:a020 with SMTP id
 ada2fe7eead31-5feb2f081dbmr2742454137.17.1771855750377; Mon, 23 Feb 2026
 06:09:10 -0800 (PST)
MIME-Version: 1.0
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Feb 2026 15:08:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWJCc-UeaJLM4dpDN=toDvteXFvOFpTm5AbvNoKf3rTqA@mail.gmail.com>
X-Gm-Features: AaiRm50V2ONm2B9njU7ZJRcOuR4Nb8zI5Hsqj9aPxNU6M55eyuOZ1HhwjvL4ass
Message-ID: <CAMuHMdWJCc-UeaJLM4dpDN=toDvteXFvOFpTm5AbvNoKf3rTqA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] i2c: configure parent device and OF node through
 the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_060913_759974_437BDA40 
X-CRM114-Status: GOOD (  17.57  )
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

Hi Bartosz,

On Mon, 23 Feb 2026 at 10:06, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Changes in v2:
> - fix a NULL-pointer dereference in gpio-rcar (Geert)
                                      ^^^^
I guess that is bound to happen when a GPIO maintainer touches
the I2C subsystem? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

