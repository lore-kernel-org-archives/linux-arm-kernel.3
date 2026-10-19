Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA41B606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 16:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vnDar4bm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmiGcIdjfKIGHCu1gzOSxutdw7IHUOocB921VJoVgxA=; b=vnDar4bmjYdW9wGjsf0u/6LaK4
	5BEEjDhnQGvkWH30fA0DYWTMzerf7Fn8KZJs5gCsda/F/7nOuuYFcyNj4+8ERXaIyNmE6D97IVnHS
	iSy9FFH9lKtSSkT+SYiH7ex1waG/ES58L/89t35Skz6Zur7mW1Aw+gDVFU4APk0YZzYYnxyyNFkvh
	k4bT9NXonUPsbe0xF96MJjBjlHALFv2q0qS3XpKD7LNc2ODQF7LVifJ5JwOp3YvoN+kYKgttW966h
	r/gaTmIh7cCTOLHYKnJXePlo84upZ+nOiuSw5plH5nNX7ZMsQIrWO12C2AJTEGO2deLgBcLDHczT+
	l4vr68Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqN3-00000007zTV-0K7y;
	Mon, 19 Oct 2026 16:37:57 +0000
Received: from mail-ej1-f53.google.com ([209.85.218.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqN0-00000007zRz-2IsS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 16:37:56 +0000
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4395d31228so182126366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 09:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427873; x=1793032673;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PmiGcIdjfKIGHCu1gzOSxutdw7IHUOocB921VJoVgxA=;
        b=zpDcVHlbYf++P537Vi1UIg8Fo3eOnDhFm6LcjuGSP+TYiH+gg/1VC3auwuwWHDWq3V
         hbXmw6VgMj4XX/TF0hy7AAnKl3rAAiSpcswx1v83RV0OastjH5sWlt2WPiA8Z8LS/oRn
         pxRaeH+0wjGwee3gWQTVz8vgA+5ypyySc71upnZN7LDQJhEkhzNlgkUnm3ZyW0pCxUSx
         BrqCAqbolydWl5WbxZjQQL/oOYhkT4nfeaaWUatsl/AW6ulxpseYxsyTSmGiRjX7G/M2
         E/uoS7jTrLAUsBEoQy0X9sa3FRubj4vILUQcuLGGbiZl8wgbmRWgnxRhFkhJ3xK3rhRJ
         Eqzw==
X-Forwarded-Encrypted: i=1; AKwUvBxF3KENZy85Q9mUF6hARRBZcSl1JZ/liGgPZmHTkTJ0ugkRbq5DJ3Rvj89F1aQSZPVs8wCUjezfvy6mOhIwr6qa@lists.infradead.org
X-Gm-Message-State: AFq9FYIVJVbIOa3g0Cp6a2Pbivn049Lj/qDmyZ1z0hi9O6fdaQJhjtCB
	RLb50ALUmntb7A+p9iyuqbPdhX/+WouijE2OcjfkJhdOdtAiQKLGguZQRCMyyy1pA7Q=
X-Gm-Gg: AYBFou2N3kaZsOVt1YzgjHDTznYTWCjAocR7lyxg81in0HVcIo7F3rqc+C+tw4oLxGv
	3TnfgP4MDmMB/IsJeTy+uo1rQdV/7dk2pz8HdWawC39s7ttG85KWL+jbvGdP/lrgRIKwbM+OlIa
	TV/bQ+qQuGpV0T4954gYF0f4WhNGQUDwdeNv5lJSYx2VsF67cDZ3F2anIU2pqPAiRaB/NP1Thfj
	k6KAn7biAQz9IcvUuM4SQhMUMEDgF9dA6or/nF1z9dK3SHq4TNkTDtmpUV6ULt7UP6qZAe/2ZBo
	Q9wGeQLCcpPo0MTvvy1QSpFmCbe6q+rOyj3IND7cQjBqaHi4TRrId2oNRq2u5GeDi58u/J9pKyc
	aKjpKKgoY6oh+L+93IG1K6Qxdn0DASuQe/1SFKPp6xl1UVDXf9JcM6vQug5PH0qia0hzJSbgUmo
	WtnyvNQI/uWXZ13BmkD2h/CI6yCCD+/WHPIEQNUuKU81twdYcJvZNjfAFzRMPX68RC93tMlec4o
	GClYUpGSjG3ftwoKofwnLPhDUmuG1xlCpdV
X-Received: by 2002:a17:907:c604:20b0:c45:c030:732c with SMTP id a640c23a62f3a-c45c0309c82mr26109666b.41.1792427872444;
        Mon, 19 Oct 2026 09:37:52 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf35asm380593266b.19.2026.10.19.09.37.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:37:51 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4395d31228so182121566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 09:37:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByhGTputeTyK6NLDNYxOQ1GHgMkiVCgDCvpSqrzvIUCQvwwxQnUWJlUFnPq/sCwNrLeaBUAYSjCuBucrdODVwgN@lists.infradead.org
X-Received: by 2002:a17:907:9605:b0:c3e:ee86:d2c with SMTP id
 a640c23a62f3a-c419f31c8bamr564444366b.27.1792427870527; Mon, 19 Oct 2026
 09:37:50 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <1d7da50cfb58232c6dd4c4afefb938fd7e62fdcd.1792163045.git.geert+renesas@glider.be>
 <20261019144256.GC763679@killaraus.ideasonboard.com> <CAMuHMdWkAvkxHkzRVviF_NkZHP7UeCBjebxciE6jFN_8ViM=aQ@mail.gmail.com>
 <20261019152203.GA5830@killaraus.ideasonboard.com> <20261019161436.GD3705@killaraus.ideasonboard.com>
In-Reply-To: <20261019161436.GD3705@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 18:37:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRvguzV+3CpOfkR+b-a0p5TrmUUF1fV0kdafXuNLV1oA@mail.gmail.com>
X-Gm-Features: AclHuK-8scCJz9rF32kL_0712rSWvXw0tvi_Wr1HURn1pKiiIZROkb3-2ONTagY
Message-ID: <CAMuHMdVRvguzV+3CpOfkR+b-a0p5TrmUUF1fV0kdafXuNLV1oA@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] clk: renesas: r8a78000: Add clk_hw to clk_map
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_093754_607323_E8BD347C 
X-CRM114-Status: GOOD (  37.73  )
X-Spam-Score: -1.6 (-)
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Laurent,

On Mon, 19 Oct 2026 at 18:14, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Oct 19, 2026 at 06:22:04PM +0300, Laurent Pinchart wrote:
> > On Mon, Oct 19, 2026 at 04:56:28PM +0200, Geert Uytterhoeven wrote:
> > > On Mon, 19 Oct 2026 at 16:42, Laurent Pinchart wrote:
> > > > On Fri, Oct 16, 2026 at 05:55:40PM +0200, Geert Uytterhoeven wrote:
> > > > > Prepare for mapping to other than fixed-rate clocks by adding a clk_hw
> > > > > pointer to the clk_map structure, and populating it up-front.
> > > > >
> > > > > Move r8a78000_cpg_priv.fixed_hws into fill_clk_map(), as it is no longer
> > > > > needed afterwards, and drop NUM_FIXED_CLKS.
> > > > >
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > > > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > > > > +++ b/drivers/clk/renesas/r8a78000-cpg.c
> > > > > @@ -16,19 +16,24 @@
> > > > >
> > > > >  #include <dt-bindings/clock/renesas,r8a78000-cpg.h>
> > > > >
> > > > > +struct clk_map_in {
> > > >
> > > > The "_in" suffix isn't very explicit.
> > >
> > > I can add a comment...
> >
> > How about calling it clk_id_map ?
> >
> > > > > +     int dt_id;              /* DT binding clock ID or -1 sentinel */
> > > > > +     u32 fw_id;              /* FIXED_CLK() ID */
> > > > > +};
> > > > > +
> > > > >  struct clk_map {
> > > > >       int dt_id;              /* DT binding clock ID or -1 sentinel */
> > > > >       u32 fw_id;              /* FIXED_CLK() ID */
> > >
> > > BTW, do you think it would be worthwhile to reuse clk_map_in here?
> >
> > Possibly. I was about to recommend just using a single structure and
> > leaving the clk_hw pointer NULL and unused in .rodata, but the memory
> > waste isn't very nice, especially if we end up with many entries :-(
>
> Actually, you could even turns clk_map into
>
> struct clk_map {
>         const struct clk_id_map *map;
>         struct clk_hw *hw;
> };
>
> It should consume the same amount of space on 64-bit platforms. Doing
> the same in the MDLC driver would save space.
>
> Or, if you want to save more memory, you could drop clk_map and store
> the clk_hw in a separate array in r8a78000_cpg_priv, using the same
> indices as clk_map_id.
>
> struct r8a78000_cpg_priv {
>         struct device *dev;
>
>         const struct clk_id_map *map;
>         unsigned int num_map_entries;
>         struct clk_hw **clks;
>
>         struct clk_hw *fixed_hws[NUM_FIXED_CLKS];
> };
>
> where clks is a dynamically-allocated array fo struct clk_hw pointers,
> having the same size as the map array.

IIRC, I considered that option, but rejected it, as I still hoped to
put the (at that time multiple, per version) tables in __initconst,
so they had to be allocated and copied anyway...

> Too many options.

Hehe...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

