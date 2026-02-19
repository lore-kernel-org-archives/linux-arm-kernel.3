Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EDCE9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 10:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/iP8fek36cTZj7uGuQwlk+a5PJBqWvYn07ZjqPzOHk=; b=zNWiFmjL5gI5JShhXio86ipNyw
	QPMR5vSS+AufyroJy7PG30TsjplZSqt7gVAKp/hHNfJbNIErTzOhMMSzceeS0pIbQ1ph1ICLiUK61
	NT8PHQ/+Wg+gLXLlLzNZs9/H0uKuLUT4e7RMjnc9QomuROpnS23Jo4XN4rLBf26tuTUx5vTRK27Ry
	b5kQlx3UgPC2s68vrXljEXBw9c0fuy9QXKiN+rKkICxhfC9KQgRm+dXALsb5fQ7sVfo+lpZdAHVZT
	aJYYYamFuq0HhSXFywCDIawPznNW5pA5CRfnhrguqImsfS59VccsA2LLpG2COMga9wJ+vzemXeEof
	hzS4Igrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt1Hx-0000000BDzt-2ooU;
	Thu, 19 Feb 2026 10:29:41 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt1Hv-0000000BDzM-2Zuf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 10:29:41 +0000
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-948d0d5d4d0so535816241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 02:29:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771496978; x=1772101778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/iP8fek36cTZj7uGuQwlk+a5PJBqWvYn07ZjqPzOHk=;
        b=fF2p0mY10JWo997dmvPGlaHIlxHhY2GDMw0IIwZz/VqNDNrZSj+UU25fHx/4vl+QmQ
         SpgdAcA2ytFZEszF2m8DTaiHvscVUdVev3i/TyZC2/X8VwAwBW2oGBCspE/zs5M1sLg1
         FrG2QSNK8Qlg6U+KQ+pfmap9MvuJtOzNSC7JG51Rehd4OqwEUKxxKmuNhF+zATYSqaZF
         +VGBTS+2lWC3fqcehb4MMZk6qxeRF5CS4FnUEG1qI42554a/Y2qYIS/yCz+t0c29ZvwO
         cHT/3Zi02uMI5TM07J8kqTxhzhgI55Tcu52hHP5wZVh0Kwl1BnbVj5QkLfmwwLZ6r9CQ
         tpMA==
X-Forwarded-Encrypted: i=1; AJvYcCWVJRORUvGJ6Ubpvc2tJt8cuRW3s5fElqPcpcnh97xtwyq9CSJo2QcWd9OCsry4Zmud3Gl2GiwuwqDFadIPa5Kd@lists.infradead.org
X-Gm-Message-State: AOJu0YyvQZ5sp0gRFlS5Z+VZr32U8F5Lap9X7Im9RqUOLwF6oXdYIEBy
	tNN7N0/LqyidQ48RaXL2qif6ZdjP9s9Fl7XQE4UMG2PdKrEqpePpHJ98lKeP+xtP
X-Gm-Gg: AZuq6aLyMaCKAMZts906qSVl00CkJoPOkl/xWmUFTiFIh/xFjbn71wBLbl7ELU8eu2b
	GKwQva6E8/Gx6MUTYI6mSHkAYzgSPh2buogzj7IrSIcG/bC2Mf+F5SEWT0BZ8E/xaZ8bZjePAPF
	V6tSkMo+GqfvyRCBjyyvTa2GcAwBxq824ym4DEJfKoMldkVQrup/HDtK5BShcm6LzAWl5CWzWNt
	lXOSth1/+Dzst7dw0TIruefSm6rSVe861QMZabUQ1zOHuJ1FedDn5TE/nfDpx89AJIg3b/8G2Kk
	Aft2MDUQAu2O39EHWikC180eIM3GtBaWwVa6RKQU9vpYm6Mx4sGmCqaTRPYRM7GNkZfJaKt6hK9
	5We5uzlCr1RgvcNJHpS/O+aD+X+S1liBZIZy/3EvnpCBt2Ixdn1pa2Vx5o1xd8M3FoOrejnxokz
	GMVci0mN4I+DZ7EUTIGqPxH8lPYDCcSFkrHQrFwx7xGyhOhkbswoteyneonE0boDLM
X-Received: by 2002:a05:6102:390e:b0:5f7:307e:80d9 with SMTP id ada2fe7eead31-5fe7fd7c889mr2274177137.28.1771496977613;
        Thu, 19 Feb 2026 02:29:37 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94afd1ab720sm12626371241.4.2026.02.19.02.29.36
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 02:29:37 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56750cb34c8so671936e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 02:29:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9DOIcztqjCCwiR9dUkdrRmbIr4fR70wBL7cMxZmwYIIcglKqKepdaxsLynYh8y8cEgmZITAdoQkVCjvfE92A2@lists.infradead.org
X-Received: by 2002:a05:6122:2494:b0:567:2b94:2e6c with SMTP id
 71dfb90a1353d-568bf59a621mr2370313e0c.11.1771496976112; Thu, 19 Feb 2026
 02:29:36 -0800 (PST)
MIME-Version: 1.0
References: <20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com>
 <20260122-pmdomain-hierarchy-onecell-v5-1-76855ec856bd@baylibre.com>
 <20260127151735.GA1699112-robh@kernel.org> <7hjywtzaiy.fsf@baylibre.com>
In-Reply-To: <7hjywtzaiy.fsf@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Feb 2026 11:29:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdURxN=kBQHJKnsTVEQPeuB41r5kZy4sgFNqg=U2ynuZMw@mail.gmail.com>
X-Gm-Features: AaiRm519SaRshXGNVfvg14cRnmfkYROkGvJOkhQFEH8pcasVxqZP2kH1_tN-rv8
Message-ID: <CAMuHMdURxN=kBQHJKnsTVEQPeuB41r5kZy4sgFNqg=U2ynuZMw@mail.gmail.com>
Subject: Re: [PATCH RFC v5 1/2] pmdomain: core: support domain hierarchy via power-domain-map
To: Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_022939_661103_7B22188B 
X-CRM114-Status: GOOD (  35.72  )
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

Hi Kevin,

Thanks for your series! I became aware of it only recently, and read
it and its history with great interest...

On Wed, 4 Feb 2026 at 00:13, Kevin Hilman <khilman@baylibre.com> wrote:
> Rob Herring <robh@kernel.org> writes:
> > On Thu, Jan 22, 2026 at 05:14:00PM -0800, Kevin Hilman (TI) wrote:
> >> Add of_genpd_[add|remove]_subdomain_map() helper functions to support
> >> hierarchical PM domains defined by using power-domains-map
> >
> > power-domain-map. No 's'.
> >
> >> property (c.f. nexus node maps in DT spec, section 2.5.1).
> >>
> >> This enables PM domain providers with #power-domain-cells > 0 to
> >> establish subdomain relationships via the power-domain-map property,
> >> which was not previously possible.
> >>
> >> These new helper functions:
> >> - uses an OF helper to iterate to over entries in power-domain-map
> >> - For each mapped entry: extracts child specifier, resolves parent phandle,
> >>   extracts parent specifier args, and establishes subdomain relationship
> >> - Calls genpd_[add|remove]_subdomain() with proper gpd_list_lock mutex protection
> >>
> >> Example from k3-am62l.dtsi:
> >>
> >>   scmi_pds: protocol@11 {
> >>       #power-domain-cells = <1>;
> >>       power-domain-map = <15 &MAIN_PD>,  /* TIMER0 */
> >>                          <19 &WKUP_PD>;  /* WKUP_TIMER0 */
> >>   };
> >>
> >>   MAIN_PD: power-controller-main {
> >>       #power-domain-cells = <0>;
> >>   };
> >>
> >>   WKUP_PD: power-controller-main {
> >>       #power-domain-cells = <0>;
> >>   };
> >>
> >> This allows SCMI power domain 15 to become a subdomain of MAIN_PD, and
> >> domain 19 to become a subdomain of WKUP_PD.
> >
> > One concern I have here is generally *-map is transparent meaning when
> > you lookup <&scmi_pds 15>, &MAIN_PD is returned as the provider. It's
> > also possible to have a map point to another map until you get to the
> > final provider. The only way we have to support both behaviors is the
> > consumer has to specify (i.e. with of_parse_phandle_with_args_map() vs.
> > of_parse_phandle_with_args()), but the consumer shouldn't really know
> > this detail.

This is also the first thing I was worried about, when I noticed you are
not doing transparent mapping, but add an explicit hierarchy instead,
based on the map.

> > Maybe a transparent map of power-domains would never make sense. IDK. If
> > so, then there's not really any issue since the pmdomain core handles
> > everyone the same way.

AFAIUI, SCMI is not limited to the SoC, but may be used for the whole
hardware platform, so it could control power to external devices, too.
Once we need to map a power domain through a connector, we need
support for transparent mapping through a nexus node.

> I don't really know enough about potential usage of maps to know if
> there's ever a usecase for transparent maps.  However, the problem I'm
> trying to solve is less about transparent maps, and more about
> describing hierarchy in a situation where "leaf" domains of the same
> type (e.g. SCMI) can have different parent domains.

Hierarchy is indeed something that cannot be described with the current
SCMI power domain management protocol.  This includes external hierarchy
(your use case), and internal hierarchy: AFAIK, Linux cannot be made
aware of the hierarchical relationship among the different power
domains controlled through SCMI either.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

