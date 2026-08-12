Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93689C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/axx2TQndZ7l7LrHHfpxsCFqNyyCWsv8j2VxY85Jrxc=; b=wLYM++av0+MfQNr1ayg5I+DQaM
	0MXBueDQevOVybOnRmpZ/rQkJ2FVgMu0wUlQT4g6gC1t8+LwvpBaOhhEHj1OgsDs9XJ559Swn5n5A
	fszMEpIddHsTSR6a6ycBG7F26bgO4f24UzHnuzyPEkEjtXN64mx0EMY1zmeslDibIOlOvKhmtUbr6
	QCcbp74omdWFxKP8B8QhDTffAnbrWj/0WjZWo08OvYRWN0Ywo/HBWtKkVQyOF07CXgqvELpzAjMRg
	lbe9EPMob2ybLfXf2D+zD2y/QH1stcfMt+q7ryHONoR+BlyMKndlymPZ27AWUGhG2RLxwrwuLROBl
	ts54c0gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5Yr-0000000Fo5r-1N96;
	Wed, 12 Aug 2026 09:47:50 +0000
Received: from mail-vs1-f52.google.com ([209.85.217.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5Yn-0000000Fo5M-32ae
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 09:47:48 +0000
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-73a442f7cd3so405920137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 02:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786528062; x=1787132862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/axx2TQndZ7l7LrHHfpxsCFqNyyCWsv8j2VxY85Jrxc=;
        b=pF/FGb57j0XDB0vKmirZDnWQxFE9fFlHgYvqGbMzS/Al3DxaUC8BGwA2e6pbRgkO5y
         EM4Vlc1ztxwRo8FdhsLwqzAwtDFnm75TXspxz/LkwDDe5tz/Saoc5mrhnpqMt4JwMucq
         xusVdQIRQD5vhwBQJsL6qJrCVnLd/Cwg7Kv9Q4HurJOHfkPgBbHzqjMWli8dkLs2SFxw
         ZZVkM6enmf9Ev7Y2ABzS42ocQZFQKKjmfb7s9lVwg4EoMzSwzz0oTwhlOyTozoAtEvA5
         /lcStgFKdC8x+UVKLQbMnV8HZR40jMFRTI4DMYJx/0s+Gu9vndUiAW9hcJT2TQzPQRnA
         mj8w==
X-Forwarded-Encrypted: i=1; AHgh+RqcfKC0SMZ32HHnF+t5hNTFposUt2yaU28L6vcC9Zc00xBe7VyqIs6KOXrQxYR6EI94TGRpCI2vuPgyuBlUVdZ9@lists.infradead.org
X-Gm-Message-State: AOJu0YxPm+jbSpxRCOTUa7xCwpV6Mte8hEj1XESeqgNRm2oHzw+Y8/30
	4Kb5c14M3g9Qoc0wlmr0zhg+8X54kYsJC+fSABmtdWmuwZo3Be/U5mPenOjNyiI1
X-Gm-Gg: AR+sD10GTJ+tsVv9JdaZOQju4dm/X/qjEJRdcVTqD/jQj+tQ/0vjRKHDosDzH+ZMnx9
	oWjhdFlq94NZ9+R9G4LNCYdNqAuZHsNEdXS9rAmOojxSGLK4vAJ+nbH/PBTJRrhqYwZvguO/5Td
	Qy/uoQo4Ygtsnmw+FuHM8Cs4ymh3MkJdqXRQeNHD/HWnbCqwdlwHgBoaoNIcG0/p/5vsGgOmAzl
	3zbGQH9obur5rNAG47Ldq1kJbcTJeP6ufqP2K7m9u2n9Ko1y935v9JiWT9TbDX6ZsktjHTS6J0r
	1ZuUxBhLTouxYTq9Kn+XM3qhORUULvxUGLunRgnEldG8stc1Z3FIdwkrC3bUWKqqrfocCjqOerk
	L3kk/UAmSkxSbjaBclC79+3Gwn++m90Cxt9M2QGGHqDFTLha5CGTZ7V8IePss0beBm5J49v/8NS
	q6T5e9a7blm/ecORMkM08kCiI2ql+VNJ7eJ9qNd5zqnzNgjdMQsiCquDKM3maUmVAqSPittzgXc
	ELwd4LReGzndtryVRWQYilwXRKl534oaf1n
X-Received: by 2002:a05:6102:4424:b0:737:5c42:858b with SMTP id ada2fe7eead31-76c8a36472dmr924967137.11.1786528062423;
        Wed, 12 Aug 2026 02:47:42 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97a3c16f5bbsm1297500241.5.2026.08.12.02.47.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 02:47:41 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-73a442f7cd3so405904137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 02:47:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqLP/sEHPbQUBKtAdnl72/Ag2hdn7UJrAgfYMXNCerjWWZalESO68A63VCCx6jyb99VAOtvfvAkCWT4YCXFNGyE@lists.infradead.org
X-Received: by 2002:a05:6102:8020:b0:74c:7fd8:73eb with SMTP id
 ada2fe7eead31-76c87d7044amr1040741137.1.1786528061345; Wed, 12 Aug 2026
 02:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll> <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
 <20260716214924.GA1477674-robh@kernel.org> <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
 <20260811163334.GA2354701-robh@kernel.org>
In-Reply-To: <20260811163334.GA2354701-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 11:47:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbzg-QpFBzzDa2hC3HzAmWUkerESC5O-cSVxmWX3_PkQ@mail.gmail.com>
X-Gm-Features: AUfX_mxykVa-_GVxsMsY5j-WoXLeEw0hqTlxX_hGEjk_L8dF08TYL9-2xHiMqsc
Message-ID: <CAMuHMdWbzg-QpFBzzDa2hC3HzAmWUkerESC5O-cSVxmWX3_PkQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_024745_820176_27FEFCF4 
X-CRM114-Status: GOOD (  40.12  )
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

Hi Rob,

On Tue, 11 Aug 2026 at 18:33, Rob Herring <robh@kernel.org> wrote:
> On Mon, Aug 03, 2026 at 02:01:18PM +0200, Geert Uytterhoeven wrote:
> > On Thu, 16 Jul 2026 at 23:49, Rob Herring <robh@kernel.org> wrote:
> > > On Fri, Jul 10, 2026 at 01:02:39PM +0200, Geert Uytterhoeven wrote:
> > > > On Fri, 10 Jul 2026 at 12:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > > On Wed, Jul 08, 2026 at 12:16:23PM +0200, Geert Uytterhoeven wrote:
> > > > > > Add a firmware property, for systems where SCMI must be used instead of
> > > > > > direct hardware access.
> > > > > >
> > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > ---
> > > > > > v2:
> > > > > >   - Spin off from "dt-bindings: clock: Document Renesas R-Car X5H Clock
> > > > > >     Pulse Generator".
> > > > > > ---
> > > > > >  .../devicetree/bindings/clock/renesas,r8a78000-cpg.yaml    | 7 +++++++
> > > > > >  1 file changed, 7 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > > > index 4e23bba334382346..fc499e7cf52e4f0c 100644
> > > > > > --- a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > > > @@ -35,6 +35,12 @@ properties:
> > > > > >        <dt-bindings/clock/renesas,r8a78000-cpg.h>.
> > > > > >      const: 1
> > > > > >
> > > > > > +  firmware:
> > > > >
> > > > > RPi is doing similar, but I have doubts. It looks way too close to
> > > > > generic "syscon" which is disallowed.
> > > > >
> > > > > I think this should be vendor+purpose specific, e.g.:
> > > > > "renesas,scmi-transport" or "renesas,scmi-firmware"
> > >
> > > If you can tell me the resource that a 'firmware' provider provides then
> > > it is fine, but you can't.
> >
> > It provides a firmware API, which is not available until the firmware
> > provider is initialized.
>
> I don't know what "a firmware API" is. What does it provide? I know what

It can provide lots of things (everything we are no longer allowed to
touch directly from Linux ;-)

> a clock, GPIO, reset, interrupt, etc. provider is.

A clock is an object you can access through the clock API.
(s/clock/.../ for the other cases).
Firmware is a service (virtual object) you can access through a
firmware API.

In all cases, the consumer of the object or service needs to know
which object or service to use (there can be multiple).

In all cases you cannot access the object or service until it is
available (initialized and registered), for which we have -EPROBE_DEFER,
and/or "[PATCH v2 02/10] of: property: fw_devlink: Add support for
firmware".

Thanks for your understanding ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

