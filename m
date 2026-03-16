Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD00F53D6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 16:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnafgkDBs5LDOaW1uc1X+DzozSiaFK2m2V1CCs7ZFPU=; b=VCvwGdpvNa8tWvau92sisZ5W2k
	4ljWZFlmvR3Wbw/mT6hgDa6kvokUdH+UmTnJeOkkP2uPilumB2S7fQuyPJFDcQnHjyPvqOL7FCCnU
	sHS0TZ9TFsJl2PYxbziXDkHIeRMHUe4u/S4tI+xor9jeXtbA1XWKq3tYXrMkZf565P8YqiLPog8vt
	ZxztMDNr1PWqCibQ8L3xsfQRoPQiW7dxZpLNbvZFdKiAKKT+O+YN1vOw1ivRv9biKZkl4gJk7JlF4
	S/C6pKUcHyRY4uAYwDL058iSz/moYqZkR6VdeLG9YRSOMSOZClple6gUR+C4xfozbiKclqK0Ycx3b
	eEZ9fhiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AaN-00000004QHM-349K;
	Mon, 16 Mar 2026 16:14:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AaM-00000004QGh-3RdA
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 16:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FnafgkDBs5LDOaW1uc1X+DzozSiaFK2m2V1CCs7ZFPU=; b=a5s+shwZWPErT73zMV0V3KPtMB
	GENzdP+LQhWN9KCI8vhaNQCyHz0xp/Oa/OEsKO+ajPT2kfONFl75LuByrliOkz9cp8AsBuGDvCRYr
	OeTG01/w2rLFtuwQbwBFXpCji9prwpkdPOm4JczlWzoeQ/ukSsWeWiotF6FHUD8uB9+S0ZwTJbrYd
	QM1tLA8at2xhZ+qxiYMJnsBTOVvxci56AiwJUJmUl/PwL+TMFBfwXUV3Ilgp8yfEUr2GUJdkURofd
	Sqox8PE9aynMrjlOqk3sZhFrpuh2CxzX7McSPTYv+PkopgUlPLffLIbqfGR5pRMcVikNpTM1AUuzb
	0aIpkPdw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AaI-00000007B07-46J0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 16:14:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CD4B1477;
	Mon, 16 Mar 2026 09:14:18 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C8DC3F73B;
	Mon, 16 Mar 2026 09:14:21 -0700 (PDT)
Date: Mon, 16 Mar 2026 16:14:19 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, philip.radford@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol
 initialization
Message-ID: <abgsW1yoGtMNE3c7@pluto>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com>
 <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
 <abG4VfyB2C-gBa5Q@pluto>
 <20260312-classy-misty-platypus-5baea1@sudeepholla>
 <abLrm7x8ggzAhYOg@pluto>
 <CAMuHMdVWL4rVTPnsMofPKFKCozjCPqF0K95ZFmrdrBD8EUt22A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVWL4rVTPnsMofPKFKCozjCPqF0K95ZFmrdrBD8EUt22A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_161427_305039_1F392ED7 
X-CRM114-Status: GOOD (  46.80  )
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

On Mon, Mar 16, 2026 at 04:50:17PM +0100, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> On Thu, 12 Mar 2026 at 17:36, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > On Thu, Mar 12, 2026 at 03:33:52PM +0000, Sudeep Holla wrote:
> > > On Wed, Mar 11, 2026 at 06:45:41PM +0000, Cristian Marussi wrote:
> > > > On Wed, Mar 11, 2026 at 05:59:43PM +0100, Geert Uytterhoeven wrote:
> > > > > Hi Cristian,
> > > > >
> > > > > On Tue, 10 Mar 2026 at 19:56, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > > > Add proper error handling on failure to enumerate clocks features or
> > > > > > rates.
> > > > > >
> > > > > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Hi Geert,

> > > >
> > > > > > --- a/drivers/firmware/arm_scmi/clock.c
> > > > > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > > >
> > > > > > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > > > > >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > > > > >                 cinfo->clkds[clkid].id = clkid;
> > > > > >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > > > > -               if (!ret)
> > > > > > -                       scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > > > > +               if (ret)
> > > > > > +                       return ret;
> > > > >
> > > > > This change breaks R-Car X5H with SCP FW SDKv4.28.0, as some clocks
> > > > > do not support the SCMI CLOCK_ATTRIBUTES command.
> 
> Apparently it is not just CLOCK_ATTRIBUTES, but also
> CLOCK_DESCRIBE_RATES.
> 

I was indeed suspicious that I could have opened a can of worms by
more strictly enfrocing these...

> > > > > Before, these clocks were still instantiated, but were further unusable.
> > > > > After, the whole clock driver fails to initialize, and no SCMI clocks
> > > > > are available at all.
> > > >
> > > > ...and this is exactly what I feared while doing this sort of hardening :P
> > > >
> > > > So there are a few possible solutions (beside reverting this straight away)
> > > >
> > > > The easy fix would be instead change the above in a
> > > >
> > > >     if (ret)
> > > >             continue;
> > > >
> > > > ...with a bit of annoying accompanying FW_BUG logs, of course, to cause future
> > > > FW releases to fix this :D
> > > >
> > > > Another option could be leave it as it is, since indeed it is the correct enforced
> > > > behaviour, being CLOCK_ATTRIBUTES a mandatory command, BUT add on top an ad-hoc SCMI
> > > > quirk targeting the affected FW releases...
> > > >
> > > > This latter option, though, while enforcing the correct behaviour AND
> > > > fixing your R-Car issue, leaves open the door for a number of possible
> > > > failures of other unknowingly buggy Vendors similarly deployed firmwares...
> > > >
> > > > ...that could be solved with more quirks of course...but...worth it ?
> > > >
> > > > Thoughts ?
> > > >
> > > > Let's see also what @Sudeep thinks about this...
> > >
> > > I prefer to fix it as a quirk to prevent similar issues on newer platforms if
> > > the firmware baselines are derived from it. In the worst case, we can relax
> > > the hardening until we figure out a proper quirk-based solution.
> >
> > Ok, I can post a V3 with a dummy quirk 'template' RFC to be filled by
> > Geert with proper versioning....so I can check that there are no
> > surprises round the (quirked) corner...
> 
> Unfortunately you cannot "continue" from a quirk, without resorting
> to a goto, so I sent a fix: "[PATCH] firmware: arm_scmi: Support loop
> control in quirk code snippets"[1].
> 

Yes ... just realized that this afternoon when trying to draft a
quirk... (see other thread)

> Then I came up with the following preliminary (have to check more
> firmware versions) quirk (Gmail whitespace-damaged):
> 
> diff --git a/drivers/firmware/arm_scmi/clock.c
> b/drivers/firmware/arm_scmi/clock.c
> index f62f9492bd42afbc..6f2af6e9084836c6 100644
> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -1230,6 +1230,18 @@ static const struct scmi_protocol_events
> clk_protocol_events = {
>         .num_events = ARRAY_SIZE(clk_events),
>  };
> 
> +#define QUIRK_RCAR_X5H_NO_ATTRIBUTES                                   \
> +       ({                                                              \
> +               if (ret == -EREMOTEIO || ret == -EOPNOTSUPP)            \
> +                       continue;                                       \
> +       })
> +
> +#define QUIRK_RCAR_X5H_NO_RATES
>          \
> +       ({                                                              \
> +               if (ret == -EOPNOTSUPP)                                 \
> +                       ret = 0;                                        \
> +       })
> +
>  static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
>  {
>         int clkid, ret;
> @@ -1254,10 +1266,12 @@ static int scmi_clock_protocol_init(const
> struct scmi_protocol_handle *ph)
>         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
>                 cinfo->clkds[clkid].id = clkid;
>                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> QUIRK_RCAR_X5H_NO_ATTRIBUTES);
>                 if (ret)
>                         return ret;
> 
>                 ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> QUIRK_RCAR_X5H_NO_RATES);
>                 if (ret)
>                         return ret;
>         }
> diff --git a/drivers/firmware/arm_scmi/quirks.c
> b/drivers/firmware/arm_scmi/quirks.c
> index 3772139a758c8a78..5a69f119e1b6c806 100644
> --- a/drivers/firmware/arm_scmi/quirks.c
> +++ b/drivers/firmware/arm_scmi/quirks.c
> @@ -172,6 +172,8 @@ struct scmi_quirk {
>  /* Global Quirks Definitions */
>  DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
>  DEFINE_SCMI_QUIRK(perf_level_get_fc_force, "Qualcomm", NULL, "0x20000-");
> +DEFINE_SCMI_QUIRK(clock_rcar_x5h_no_attributes, "Renesas", NULL, "0x10a0000",
> +                 "renesas,r8a78000");
> 
>  /*
>   * Quirks Pointers Array
> @@ -182,6 +184,7 @@ DEFINE_SCMI_QUIRK(perf_level_get_fc_force,
> "Qualcomm", NULL, "0x20000-");
>  static struct scmi_quirk *scmi_quirks_table[] = {
>         __DECLARE_SCMI_QUIRK_ENTRY(clock_rates_triplet_out_of_spec),
>         __DECLARE_SCMI_QUIRK_ENTRY(perf_level_get_fc_force),
> +       __DECLARE_SCMI_QUIRK_ENTRY(clock_rcar_x5h_no_attributes),
>         NULL
>  };
> 
> diff --git a/drivers/firmware/arm_scmi/quirks.h
> b/drivers/firmware/arm_scmi/quirks.h
> index 74bf6406dd043049..13f28d13bbd74d4c 100644
> --- a/drivers/firmware/arm_scmi/quirks.h
> +++ b/drivers/firmware/arm_scmi/quirks.h
> @@ -48,5 +48,6 @@ static inline void scmi_quirks_enable(struct device
> *dev, const char *vend,
>  /* Quirk delarations */
>  DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
>  DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
> +DECLARE_SCMI_QUIRK(clock_rcar_x5h_no_attributes);
> 
>  #endif /* _SCMI_QUIRKS_H */
> 
> Does that look like what you have in mind?
> Thanks!

Yes in quirk I was only addressing NOT_ATTRIBUTES and mimicing the old
behaviour with continue, BUT if the set of clocks not supporting attributes
and the set of clocks not suppporting rates is disjoint, I feel we need your
double quirks :P

If you are still finding out the exact FW versions that are failing maybe
it is better if you carry on and test the quirk-framework fix above together
with your quirks and we can make sure to pick all up together...

...OR maybe better I can also drop for now my offending patch that breaks
your FW from my V3 series and you can pick it up and post it later with
your quirks and the Quirk framework fix you propsoed so that we are sure
that we dont break anything while fixing all of this...

Also because we are already in V4 and I dont want to risk to post the
breaking fix (that was at the end broke since forever) BUT not the quirks...

Let's see what @Sudeep thinks

Thanks,
Cristian

