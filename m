Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEE2C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 09:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14plqPeyH6RsdU2VmFKnJtMB+pmrsGKI/JGoWS24hKY=; b=yJ4f0sobn3o9VB4FMKr6Hvx5G6
	Bh700jjcCOA6QwwS0/aH8tpOqmoTux1lN/3jtfm8oE58ebdweHETraeWQRD7KVbx7SSwQV6J994Zu
	26hMo56N9xc/wUAH8/HGykJ7ijhd4kHj8RRrHzcS6j97sU+8QjmBQUkvRwQhGjaCVdRohgPwIpLHQ
	Jf0n03xDYOb4ldgZph4BiZzdU1IjGQfqThrxwqjaRE7BU6EF7uLzhuSdT4FCgPN3H+T9jVQc/VrTh
	a+6JH5uSgzury3j/yxH/betGTwmJvCHY6IBK7RVjhno1g5VxRLwy3qMpkj9nju3t7vOE1ln8SfTIB
	7QIU6IKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtia2-0000000Dhnd-3j8l;
	Tue, 11 Aug 2026 09:15:30 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtia0-0000000DhnD-39cV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 09:15:30 +0000
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c3fabe908eso168266e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 02:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439727; x=1787044527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=14plqPeyH6RsdU2VmFKnJtMB+pmrsGKI/JGoWS24hKY=;
        b=dtak6urc4jdKg3wIWtH9i5Ccny3C2+IHC5vgkwn+q9JSHN/J0Qy0J5nT/jSl9KGnMA
         UxnsSWNc0H8ihpZsIWMqOYPHgLYg6unHT8J2rVqngyTexSkzjlK5ryv0JeA91MJN1ikw
         14wWyJ/NtV139gh0N3tk3ShzpJvYYn41K+w/RGizqga3B5vP9ogO0tB5wuOuR1J7qDdr
         f14q4LZRX8UVlT+p3efAT+MeeSQAwrX5JM9rRUMEFRhARj4pet0hWtYMX7h8kxxApx3x
         EWRLBhIyjpEhsp90SNxobQsx+aXKaqzvZXUaW6JpXZj0Wg4acBauY92LSIQfEXnhebP4
         G9VA==
X-Forwarded-Encrypted: i=1; AHgh+RoKh//3gVkGsjfwv9pBNBeXRsY9oD48tOfhl/XfV/BmH7p9Jak7BZOuVhihm40736LOWS2oJWK8RK4OLFep+4l8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3SAaW5qtypvBbT6g5uMTIt4K2RryZ9yXd3MtTz8maqa6Q21fp
	o2nLIM2i5gFzGbYndqPlq5qd9r4PddMswFFVpR1rp1zHr31hSdqstRqVdWfaPzHI
X-Gm-Gg: AR+sD137EHMhIRr8oJYKkgv+iUtA80T5l/DjsynLunkf5ZavYbEm59fN/nJuw+h2Kzs
	Bel5or/80w6BW2yBsiV6OnOZDmNlLojVUP+GQmAJp93isLxf3Lmm/PrDmofFLaHTiqhOKQhqgEp
	tU4nCqjbKfzkj2/5CtaXNq92c5DlOtaW/Ieq0BE6Xy2jCXsoTJhlzMYMOLHHBiVHFBOvmweVUL8
	jAVt8VsT25QaYPuSoIdYVhIBLRBJccFDx5nwD4jd+9lppQoe3YqkBeac88kmcGjwpsTHxa77Uxr
	FvDujY1tL4SyPqgXeT/uW51G5Dnnor0N9GtnKX/c1p0wR/ci6gRAaZ9wMeg+vRWAeYUxLA0hSVC
	WHNdLzK/e65GlJlaWrCvAOmld92jqsiiVl0bQJ07XPi0/S7OOJxF6uwNQ2uZP6/JBIfTQn0ySWQ
	3xZ8vmCospwCOddSjcUtm7dFyLNo01nA4yVJlAd5tUcB5j1L7uww4EyyLBFjh8rWJP/JEPjwtqI
	tmtXcF/utXe5SrRH7sCaGeMow==
X-Received: by 2002:a05:6122:d8c:b0:5c2:c0b2:9889 with SMTP id 71dfb90a1353d-5c4503b8608mr174928e0c.4.1786439727273;
        Tue, 11 Aug 2026 02:15:27 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c451e802absm195790e0c.17.2026.08.11.02.15.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 02:15:26 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-967327a0c7dso154634241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 02:15:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr0RF50FZAb/oG06pCE7WxN0/FtcaRuuMnNA0NNj3hwfy9IFYQ/ZQCqd7f6c/1Oq5k4FKuChrgoNrs3autSoNK8@lists.infradead.org
X-Received: by 2002:a05:6102:941:b0:738:1fcb:f276 with SMTP id
 ada2fe7eead31-76b5527db20mr448203137.1.1786439726421; Tue, 11 Aug 2026
 02:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785941595.git.geert+renesas@glider.be> <CAPx+jO87d7H92KSR7R7ObR05sM2JcHBCo+YuUf_1gE-KwhR7CQ@mail.gmail.com>
 <CAMuHMdW78wFHKP8n2P_MEVASO3MFHCjXkEWSFXfE3-mCjkhsgA@mail.gmail.com>
In-Reply-To: <CAMuHMdW78wFHKP8n2P_MEVASO3MFHCjXkEWSFXfE3-mCjkhsgA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 11:15:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV15qa+bntYdeEysEc3rJ4dNhQxiVJd-moAGTNyfPdDkA@mail.gmail.com>
X-Gm-Features: AUfX_mzrvqkMTS8THhoJKajeDFG8F23c6THOaD8Dreq76GI2rXJHX-LkuIBfF_U
Message-ID: <CAMuHMdV15qa+bntYdeEysEc3rJ4dNhQxiVJd-moAGTNyfPdDkA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] R-Car X5H CPG/MDLC support
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_021528_805831_EB3ABC7A 
X-CRM114-Status: GOOD (  46.88  )
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

Hi Ulf,

On Mon, 10 Aug 2026 at 16:50, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
> On Mon, 10 Aug 2026 at 16:18, Ulf Hansson <ulf.hansson@oss.qualcomm.com> =
wrote:
> > On Wed, Aug 5, 2026 at 5:21=E2=80=AFPM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > This patch series adds minimal support for the Renesas R-Car X5H Cloc=
k
> > > Pulse Generator (CPG) and Module Controller (MDLC), to aim for replac=
ing
> > > the dummy clocks in r8a78000.dtsi with proper hardware description.
> > > These two components are closely related, in the sense that they are
> > > both supposed to be accessed through the ARM System Control and
> > > Management Interface (SCMI) on the Ironhide development board.
> > >
> > > This series consists of three parts:
> > >   1. Patches 1-2 add DT bindings and DT binding definitions,
> > >   2. Patches 3-4 add minimal CPG and MDLC drivers,
> > >   3. Patches 5-6 update the DTS.
> > > Note that this series depends on v7.2-rc2, due to the use of
> > > <linux/device-id/of.h>.
> > >
> > > Changes compared to v2[1]:
> > >   - Add Acked-by, Reviewed-by,
> > >   - Add fixed-rate clocks to kerneldoc of r8a78000_cpg_priv.map,
> > >   - Use devm_clk_hw_register_fixed_rate(), drop unregister_fixed_clks=
(),
> > >   - Drop fill_clk_map(), as it is not really needed until SCMI remapp=
ing
> > >     support is added later,
> > >   - Replace <linux/mod_devicetable.h> by more specific
> > >     <linux/device-id/of.h> in v7.2-rc2,
> > >   - Add a comment to document only always-on domains are supported,
> > >   - Consistently use /* sentinel */ for zero sentinels,
> > >   - Drop trailing commas from sentinels,
> > >   - Sort MDLC nodes (alphabetically, by label).
> > >
> > > Major changes compared to v1[2] (more detail in the individual patche=
s):
> > >   - Add default support not using SCMI,
> > >   - Drop everything related to SCMI.
> > >
> > > Note that this series does not use or rely on SCMI in any way.
> > > SCMI remapping support will be added in a subsequent series (old vers=
ion
> > > at [3]).
> > > Full hardware support without using SCMI could be added, too, if anyo=
ne
> > > would care about that use case.
> > >
> > > For testing, I have pushed this series plus additional work (includin=
g
> > > a rebased and updated version of [3]) to [4].
> > >
> > > While I know it is getting late in the cycle, this work (especially t=
he
> > > DT bindings) are a dependency for about any R-Car X5H progress, so it
> > > would be good to have it included in v7.3.
> > > Hence I plan to queue the clock patches (1, 3) in renesas-clk for v7.=
3
> > > (Stephen still hasn't merged my earlier PR for v7.3 anyway).
> > > Ulf: It would be great if you could take the pmdomain patches (2, 4).
> >
> > Patch 2 applied for next, but I left patch4 for now as it didn't apply
>
> Thank you!
>
> > cleanly (drivers/soc/renesas/Kconfig had a conflict), thanks!
>
> I guess your tree still has the duplicate "default ARCH_RENESAS"?
> Patch 4 just adds a single line there, and the conflict should be easy
> to fix.
>
> If you want to send me a new patch, please let me know.

I have sent a v4 against pmdomain/next:
https://lore.kernel.org/all/d4bd0cc7f26c1bcdc260edb994b4971cb5dd3a10.178643=
8424.git.geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

