Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434B6C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 00:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+aoBAoeFpkctJ6JqzIU/vyQwUkSp0QwqX2H1qRlEkgw=; b=2nMmZ4nuUb7bcTdSwUH9qIYSgs
	3OUQnXowYyWX0fqKy71VwaqPJxfG8jBTC10Q3ZooG8LZog5FKELup+BSQdHWbsorPm1hF6hexH+Oe
	B5gstye9Ynx7/eG4Vw47/EjRx9LnDS+DY58lbyXgDpS73csGTiwIEA8W6T6PYpkcIZ7vpbpVBkh0x
	Ha9hzIHa2P2Wf45T+YTBg2balE35O6k8iDGPo7WiuBZOFRzRH8rXeW/2jG6FVRScW4J9382agTJwP
	BQh6Wf+GX1n90Rs32ENmaNirVI1QVh/ul/O81Pod8+M5qZAQolZAEPGsmE99CGMn5kYp7gowoFvHI
	RQs5mmgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Z7C-00000007wIO-3i7f;
	Tue, 29 Apr 2025 00:46:26 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Z5G-00000007w8z-3LkM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 00:44:28 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-301918a4e3bso6077652a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 17:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1745887466; x=1746492266; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aoBAoeFpkctJ6JqzIU/vyQwUkSp0QwqX2H1qRlEkgw=;
        b=UEGAmY/gHbx6zf1fmLYGmUS9GcUWa5Bil1F1UUsmcPHJI9pbF3xdp8vp13RbmLWvst
         06SoCVSDC5Piz4mk8J/fzrrvY5O7A4M1go9l7GkImXm8Tv4tkvlN2jgAGHk9nEkNjFjt
         ZJJ922gK6OxoJguD3VM9jG/QBaWxLHjjwy/aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745887466; x=1746492266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+aoBAoeFpkctJ6JqzIU/vyQwUkSp0QwqX2H1qRlEkgw=;
        b=saUwHWj1r9DzgGXpuFLuU7/RikFkE8iwTua7ouJhJs1gjjqfUbHUcPWDcL3SEe/Sim
         u2MlcNrSpaz1TYyS4ifjLEAnCjq4ensmiWTAlf1V1BW1VN/KK+83AnkgH9UhD6geBB8z
         14e+MKn15GHxG4UduXYUV1ZSqBe/nTugczE8B0w4KREkPud7ikRYIkE+201VrBNeQVBL
         20vwhMVUlXTLNI7DAb6hz31uXzIt4b6rhoBkCKQ7V00aQOMRUuDUNFOvzZLtDSnMV4mU
         JR1DF1/fkzZ8M/7qVTAd1ImXGjuKoI2+JnK54O3V221Vpv+s8/ZAfVPa5iOZoBjcB5ju
         2RSg==
X-Forwarded-Encrypted: i=1; AJvYcCUCsEJGFajBu3fDj8bPzo4dg0kmATDtIL8KiaYQ7alC7RmEr7o/DFNAXeCGXtRC0wvT1fOX9IXuW+o57BUsytGM@lists.infradead.org
X-Gm-Message-State: AOJu0YxdFt1s7YNWPWeXMtpAmpJneTfe+/VE1lDMmSbZdcRectDNnU/r
	sNtKK+DvDptDSTKXUqJZaOx0Is1EXlWl4jqgbglAYbgyqum0QzT2atSy3EbgaIYxz+5IEbCI+Fu
	NK9bb+w2j12O2ATtgg18XL1dyGx1CT+usQsXYeQ==
X-Gm-Gg: ASbGnct8hacm+3sGIt+5yo/gdbMZRHnIxfQMDMftB7wJyWJwy/f7vKXujpfFKoQqRoF
	Zx3JnjMY6wHVjKR7bSDE4Cjq4r/UbGULjLIWgIxL39c+1amSy7AyH0VP1j3nBd6xJAgpUUqsvgL
	Lri3ObJtRyNNYV1lUolmsq14AZtSOYRniquueJvSPlIy8rtvpFVUQWnFE=
X-Google-Smtp-Source: AGHT+IFjPL18h5P/u4F4dyTMOcvewGcroYbUT0gU7VtQUvVqhIshw60ZVQaT8g8ZD4qgd/tbKkO0lKtc/fcYY5m9kdU=
X-Received: by 2002:a17:90b:280c:b0:301:6343:1626 with SMTP id
 98e67ed59e1d1-30a21546d6fmr2342151a91.1.1745887465903; Mon, 28 Apr 2025
 17:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250425192009.1439508-1-da@libre.computer> <20250428181242.GG3339421@horms.kernel.org>
In-Reply-To: <20250428181242.GG3339421@horms.kernel.org>
From: Da Xue <da@lessconfused.com>
Date: Mon, 28 Apr 2025 20:44:14 -0400
X-Gm-Features: ATxdqUEf_AoTzAnuf_I1pvf8_AvQf7sxk_KOWa8wGk2GqUmGhIm8SEm3MmjT6RI
Message-ID: <CACdvmAhcBmoDNyuu0npZzyExfhyLKdyPw9HvHvV+OdADxEfJJQ@mail.gmail.com>
Subject: Re: [PATCH v3] net: mdio: mux-meson-gxl: set reversed bit when using
 internal phy
To: Simon Horman <horms@kernel.org>
Cc: Da Xue <da@libre.computer>, Andrew Lunn <andrew@lunn.ch>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Russell King <linux@armlinux.org.uk>, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Jakub Kicinski <kuba@kernel.org>, 
	linux-amlogic@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, 
	Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_174426_837625_AF7DB61A 
X-CRM114-Status: GOOD (  23.59  )
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

On Mon, Apr 28, 2025 at 2:13=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
>
> On Fri, Apr 25, 2025 at 03:20:09PM -0400, Da Xue wrote:
> > This bit is necessary to receive packets from the internal PHY.
> > Without this bit set, no activity occurs on the interface.
> >
> > Normally u-boot sets this bit, but if u-boot is compiled without
> > net support, the interface will be up but without any activity.
> >
> > The vendor SDK sets this bit along with the PHY_ID bits.
>
> I'd like to clarify that:
> Without this patch the writel the patch is modifying will clear the PHY_I=
D bit.
> But despite that the system works if at some point (uboot) set the PHY_ID=
 bit?

Correct. If this is set once, it will work until the IP is powered
down or reset.
If u-boot does not set it, Linux will not set it and the IP will not work.
If u-boot does set it, the IP will not work after suspend-resume since
the IP is reset.
Thus, we need to set it on the Linux side when bringing up the interface.

>
> >
> > Fixes: 9a24e1ff4326 ("net: mdio: add amlogic gxl mdio mux support");
>
> I don't think you need to resend because of this,
> but the correct syntax is as follows. (No trailing ';'.)

Great and thanks! I just set up git send-email so I'm a little rough
around the edges.

>
> Fixes: 9a24e1ff4326 ("net: mdio: add amlogic gxl mdio mux support")
>
> > Signed-off-by: Da Xue <da@libre.computer>
> > ---
> > Changes since v2:
> > * Rename REG2_RESERVED_28 to REG2_REVERSED
> >
> > Link to v2:
> > https://patchwork.kernel.org/project/linux-amlogic/patch/20250331074420=
.3443748-1-christianshewitt@gmail.com/
>
> ...
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

