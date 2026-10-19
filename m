Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEA3606A328
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 16:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hy5Zi+j2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNVvlFmAYqdL7e0NbR8n4mhG40CW5PlDGJg9XCAnokY=; b=Hy5Zi+j2gPp03Jop7SLoImkuzZ
	Hbhty2M8rceynI764AWSLnd5D5a5E9xKvTjNFV3yQXtqmzmeZvwX48H0+/AAhG09Ki6EH8xXDB3dE
	AaeFCcauNI7ku0UXgmc7nGWmlclzHsW51+CKZjUTgZpP3yDsNoG+qwzPZYA+ray1+dtgyyOcyLcxp
	+vvKrDyid9nKy3GA2FWRUuF9j/SpU5eGKroAdxoah2j5Z1ZB9jqRRiUoXtU+DZzph8wwBSvVccQrQ
	awpNvwNiD6CllNG63ZjGmUz7VA4uinNZf0ezBKdzirBpfmHkzJc4R1L6w+rlf17NnRiXH8bLXU769
	LLMPMiDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIq1m-00000007wPn-0bEy;
	Mon, 19 Oct 2026 16:15:58 +0000
Received: from mail-ej1-f50.google.com ([209.85.218.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIq1j-00000007wPE-1abq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 16:15:56 +0000
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c434376dbebso261622166b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 09:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426553; x=1793031353;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VNVvlFmAYqdL7e0NbR8n4mhG40CW5PlDGJg9XCAnokY=;
        b=ubsvsZ+Q84dbj3FUlQzVHG+N7VxHAIFzB0Qs8G/cT7uxipdTmHxn3k4Jo5zEp/81RV
         G4t/3JXZHPMyuCJcfXjfbTpdlgHDQXLSLRyh5a2RHQN32nRNT1lvtyxgDnXULunGK8HR
         b7scLRSfw409P88ubU7kaUYsaNZ6T2GfYq/Mo24u9Cc+YdO/CMEW1wXZ9dG5ccQhA3Lt
         dwVK7+eaR1Ly99rkrEUSdBr62j8vwoy7Qgv217BbWryJdXaRK8GQYNjijmQVis4azLib
         l1uLw7/V7F0O7tKK2KbN9QNSNq2phT2P2p/TG3xBgrf+nSdrKj5GNfylhJZVMbCEQ3vK
         Pxbw==
X-Forwarded-Encrypted: i=1; AKwUvBx0JlRqhR/Gay0IaWMuI/St1DR9bHAVP6nuQnatJ7dCRQYVQSeEqkMd16Hz72PKauMZ1M0nsXgePBFTmzE0ci2K@lists.infradead.org
X-Gm-Message-State: AFq9FYIDjdSBktJQmrv+ZXUrcVGdazLrznrL9iWOyKl8/iTFeN0s4VcU
	eF393ZQi7Rb5xVPPz7x4YM42Oo9U/qwiqly0pLPCw+IztiJpJiWjYwDoXeNQKnCuUyY=
X-Gm-Gg: AYBFou1Jt2l70iA66mqLHbCnU/SChHe2I/zBl7BzCgInSFeSy+3vOhtpXhK1lePT9gZ
	/NCKKQ1CoLnKlRrxHoKXYGFOxNe5XadqI81ep5doBAs0+o+uSiY+TNaKuKFa7E5t2B4rdxM0q1i
	gbtEjOoBsumjyFKvmV7h0j4sM4G5ADxqjPLMvRo/PP/3If2mJAFfhJ2CJtR9WNAmuLu+pN9wNjm
	myZ7o1U+bpWFC2Cndx+FmR4eJV2AWOM31Ctsoj/MpHBOdaDzhaxa4aWboyeWXhSr2R00k4z5Lfl
	99JJYOHyDvzGzcsx047brWu5AHM0FwDicY6GKruW4wTNuiHIPULltG+EiEGWKsmECizX3xwKnri
	I4BIq6xmdEC115LEHuCzP3MGc8MRYKni1grA/s0cCtauz8TFHQKbfgn74ecAKn32BqBKLsFjiJF
	0w2uZ2uW67slYP6ixwfdgHMCQMRxS1dS1bJlRSZFccEUhd4ReetQAutIdPSIofuu1SbFpbWaBrQ
	eskqxgpQZfyw8PkndTtB9t4ikrOvfAq3kum
X-Received: by 2002:a17:907:6c11:b0:c3f:8c92:3b54 with SMTP id a640c23a62f3a-c401ae97526mr948231766b.0.1792426553339;
        Mon, 19 Oct 2026 09:15:53 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf72asm391093466b.18.2026.10.19.09.15.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:15:50 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c169ae1cb26so542840466b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 09:15:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzKl/8fUGy0SZTX5SiEEOPUhjC7L2X7BklkKJAtQbLEhSjOjhiYiMJ4eWKwiQ5wXLf1dI90iQB2iaA2A4guRQaP@lists.infradead.org
X-Received: by 2002:a17:906:99c2:b0:c41:825d:ed8c with SMTP id
 a640c23a62f3a-c41825dfa20mr602336266b.26.1792426550419; Mon, 19 Oct 2026
 09:15:50 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <c38d744c09dffff550a9b882051c211b572b8daf.1792163045.git.geert+renesas@glider.be>
 <20261019155619.GB3705@killaraus.ideasonboard.com>
In-Reply-To: <20261019155619.GB3705@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 18:15:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDgc+NMFQ2HgkngsvyhVd1+yEgnk3DQpyVmVUQ_aLvEA@mail.gmail.com>
X-Gm-Features: AclHuK_Wqb_TY8SIlHzico7Y9pGZs0pikimfidJslyUcM_WsFGAezgyxmzAMr2w
Message-ID: <CAMuHMdXDgc+NMFQ2HgkngsvyhVd1+yEgnk3DQpyVmVUQ_aLvEA@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] clk: renesas: r8a78000: Add SCMI remapping support
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
X-CRM114-CacheID: sfid-20261019_091555_445965_F3A60DFE 
X-CRM114-Status: GOOD (  43.74  )
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Laurent,

On Mon, 19 Oct 2026 at 17:56, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Oct 16, 2026 at 05:55:41PM +0200, Geert Uytterhoeven wrote:
> > Extend the Clock Pulse Generator driver for R-Car X5H with SCMI support,
> > to remap DT clock IDs to abstractions (clocks) offered by the SCMI
> > firmware when running on a system with SCMI, and SCMI support is
> > enabled.  Take into account some peculiarities of the current SCMI
> > firmware implementations, and fall-back to fixed-rate clocks as
> > replacements for SCMI clocks that are not available.
> > Support for bus clocks used by serial, I2C, and SPI devices is included.
> >
> > This lets us avoid putting SCMI IDs in DT, and allows us to use the same
> > hardware description in SoC DTS for systems with and without SCMI
> > firmware.
> >
> > For now, it is assumed SCMI clock IDs are stable, and match SCP FW
> > SDKv4.31.0 and later.
> >
> > Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > +++ b/drivers/clk/renesas/r8a78000-cpg.c

> > @@ -94,6 +113,21 @@ static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec,
> >       return hw;
> >  }
> >
> > +static struct device_node *scmi_find_proto(struct device_node *scmi, u32 proto)
>
> This is the kind of function name that looks prone to a namespace clash.
> I'd name it r8a78000_clk_scmi_find_proto().

I deliberately picked that name, as a suggestion for a future common
helper ;-)

> > @@ -145,7 +184,46 @@ static const struct clk_map *fill_clk_map(struct r8a78000_cpg_priv *priv,
> >                       break;
> >
> >               map[i].fw_id = map_in[i].fw_id;
> > -             map[i].hw = fixed_hws[map[i].fw_id];
> > +             if (map[i].fw_id >= FIXED_CLK_OFFSET) {
> > +                     enum fixed_clk idx = map[i].fw_id - FIXED_CLK_OFFSET;
> > +
> > +                     map[i].hw = fixed_hws[idx];
> > +                     continue;
> > +             }
> > +
> > +             scmi_spec.np = scmi_clk_np;
>
> This seems to be safe because a NULL scmi_clk_np implies usage of the
> default map, which only contains fixed clock offsets, but that makes the
> code a bit too fragile for my taste.

Fair enough, I can add a check for a non-zero scmi_clk_np...

>
> > +             scmi_spec.args_count = 1;
> > +             scmi_spec.args[0] = map[i].fw_id;
> > +
> > +             clk = of_clk_get_from_provider(&scmi_spec);

... but please note of_clk_get_from_provider() will return -ENOENT
in that case.

> > +             if (IS_ERR(clk))
> > +                     return dev_err_cast_probe(dev, clk,
> > +                             "Failed to get SCMI clock %u\n", map[i].fw_id);
> > +
> > +             hw = __clk_get_hw(clk);
> > +             if (!hw && fallback != map_in) {
>
> And if the above is correct, fallback should always be different from
> map_in when fw_id corresponds to an SCMI clock.

True.

> What issue does this catch ? Should the fw map contain a fixed clock
> entry for clocks not available in SCMI ?

Originally it had entries for fixed clocks, too, as the firmware
restricted access to several bus clocks.
Recent firmware provides access to more bus clocks than before, hence
I figured it would be better to use the SCMI clock when available,
and only use the fixed clock when the SCMI clock is not available.

> > +                     for (unsigned int j = 0; fallback[j].dt_id >= 0; j++) {
> > +                             if (fallback[j].dt_id == map_in[i].dt_id) {
> > +                                     enum fixed_clk idx = fallback[j].fw_id - FIXED_CLK_OFFSET;
> > +
> > +                                     map[i].hw = fixed_hws[idx];
> > +                                     break;
> > +                             }
> > +                     }
> > +                     if (map[i].hw)
> > +                             continue;
> > +             }
> > +
> > +             if (!hw) {
> > +                     /* CLOCK_ATTRIBUTES is not supported */
> > +                     dev_warn(dev, "SCMI clock %u is NULL\n", map[i].fw_id);
> > +                     continue;
> > +             }
> > +
> > +             dev_dbg(priv->dev, "SCMI clock %u is %s at %lu Hz\n",
> > +                     map[i].fw_id, clk_hw_get_name(hw), clk_hw_get_rate(hw));
> > +
> > +             map[i].hw = hw;
> >       }
> >
> >       devm_kfree(dev, fixed_hws);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

