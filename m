Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AF2CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 07:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8G/x4JJtOPaC66y0xIpsyhNcO8UWKG9STKYzUChGp/o=; b=O5jYqY21nPW9ijWr9CAw5vuD6G
	0r+uZNtlMVwcmJpBCcZ5Jo3cNPCRI92lJMpAbLHZsLB27n0LHf2p9yyKTqmPKd11Nt7BkksEURbQg
	NmlBSMH5GI643FNLzXXTBkDTFzTlWjLnFVs5qsG9VwrTZk4ZW90Su/y+vLI41l1qCPZRpVlTUuoV0
	J+DDm1b1ZLSagJ4ceg7vnKxXMu/eI5TNIpB/espw2Xh/MRR4QBglw/w+C6kWDUsGIQGrC+LWoQBvN
	1KAgTLY3Wu0FVy88ulwwUqaq2nRkqfi3rPvtX4ZSIlJw8axu33RnsX/sUVUWPVge4t9QmSVOtCM3K
	/hf97flA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyIY-0000000720M-1Tev;
	Thu, 21 May 2026 07:58:30 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyIU-000000071zQ-3GTg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 07:58:28 +0000
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b9fcf7c91bso61260575ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 00:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350305; x=1779955105;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8G/x4JJtOPaC66y0xIpsyhNcO8UWKG9STKYzUChGp/o=;
        b=L0cgvpkgvTUzmx0DDdM2jUAQ723gyvBOC3R0NGX4i8658VW0/fJ9pINn02Bqs+XQWX
         1pIGDHViSZtaO77rIYRqOEO1KBs/AxVpHSr6UkfiSo09bHGV5VptB1eiaps2HZeDRdmG
         qlL9qRRZURQdSuZuc0BeUvEAnUC7iSc8ExVDoEut4c6qc9S+Rso0AvwOuY9urF8ZAXGw
         sU1D3PtZuZErx6gxqTABZwBsSbaOlElWEbN3BvwhLbDPGMIZgAqJV8YDEkOw/TNHxlSI
         l+GnAd5HxqG1Q7ZKpzGuh+OD7EcuLQ/PaLvQYzg8OxcVCjDGXWXTopgi0uQHwYWn6uOm
         1PVA==
X-Forwarded-Encrypted: i=1; AFNElJ8aLBek+j9PuABfdNHrBcrdlcanPrpm1cNSE7Dyeg9JIC7d2wbtHUKpAdh38ASakY4CfWntzea5CfBm48quXesU@lists.infradead.org
X-Gm-Message-State: AOJu0YyR/TOGgX1kXSZ0JN8ixAOIHRH3xuff++VcDdz8EAxB1zSA9Yw9
	anBA/kDPgLAaG5+0KRH3KRFqO9xWEokR15/S7c4at1BOqmS83ESOKICf1wXgQtJkE6E=
X-Gm-Gg: Acq92OEtgpPr4mra/yZZU4IF19qa4tEVHdL2Jt4t3TH3FBOUt8dBtxr5oGxOGEgcta8
	CKTVoI2KUtbSdXuj6XERDpwd0YfPyRJwWZboSxL/u2PGsBy82jFEDvHnBcMP7cHus/aTLnxYQw0
	0+Za3m/6G2jZK3as7y/yy49sSxDcTGXSsy6J+llZZlM9yk7d2Tg3TRlj45KhbQYTykjyzLfup8l
	f9Jnzw2TFx9VjFXhyiGYBaPvNBkWni1QUYyLlU26nudNbN73181GHk2cUdP7vlose4dlcffWl+r
	aDg8AyP3Q27gN6oGTW/FX3ROW+iVuGmuy4CwEKChb0AH8SwYpmdKEMZHP5oJOp3dnT7S1v6QvVr
	RngwLWBWPxSbDKgQ6t8MQt/WwsXC1XRIfBfL7CNL9qPzVbzyi0NLibHuefJlQdE/MntXLcL1FwZ
	onCWABUtxQMFBVa9ABuMoqUXa0mZSTG+T9eDKByCcwknY22tLAbN+cP4NETBqURjuX
X-Received: by 2002:a17:902:ced0:b0:2bd:3bfd:74f2 with SMTP id d9443c01a7336-2bea32e738cmr20264005ad.10.1779350305275;
        Thu, 21 May 2026 00:58:25 -0700 (PDT)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com. [209.85.215.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea9a3dbf7sm1755555ad.84.2026.05.21.00.58.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 00:58:25 -0700 (PDT)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c795f441ff7so4648754a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 00:58:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/HhfS8i5GTpfRyj8ZX/EALlwXKRMBWco90t8Hkj4Z6yThTOSexo0HxL+eQ1lUeWfmN4p+4kb2UZ1C9g3cxZZ6f@lists.infradead.org
X-Received: by 2002:a05:6122:235:b0:575:a5b5:3233 with SMTP id
 71dfb90a1353d-58424155ad5mr536200e0c.4.1779350001458; Thu, 21 May 2026
 00:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto> <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
 <ae6Zp54NhKlVes8J@pluto> <CAMuHMdWK3Noh5ZQVWT9C0EKyXZePMaJ97C0A_syK+xCb_=abeQ@mail.gmail.com>
 <agooKghZJw3iElvp@pluto>
In-Reply-To: <agooKghZJw3iElvp@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 May 2026 09:53:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8VRCOZtLrM2EoHFmhd5XFs8cwXc2A1tPTTr01KvUx0g@mail.gmail.com>
X-Gm-Features: AVHnY4LC2rjbQG8RkBy_xv_1xXXocYwPF3Jc-uBUk0RJlVpVup9HQXGw37O9RpM
Message-ID: <CAMuHMdU8VRCOZtLrM2EoHFmhd5XFs8cwXc2A1tPTTr01KvUx0g@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_005826_827741_883FE006 
X-CRM114-Status: GOOD (  69.05  )
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

Hi Cristian,

On Sun, 17 May 2026 at 22:42, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Fri, May 08, 2026 at 12:26:19PM +0200, Geert Uytterhoeven wrote:
> > On Mon, 27 Apr 2026 at 01:03, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > On Fri, Apr 24, 2026 at 02:08:55PM +0200, Geert Uytterhoeven wrote:
> > > > On Wed, 22 Apr 2026 at 20:45, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > > Also because this should be one of the selling point of the SCMI stack
> > > > > in a virtualized environment: you can ship the same kernel drivers with
> > > > > the same DT and you know that ID=<N> will always identify the specific
> > > > > resource that is needed by your driver without worrying about the fact
> > > > > that in reality in the backstage the effectively managed physical resource
> > > > > could be different across different platforms, because that does not matter
> > > >
> > > > This sounds strange to me, do I understand it correctly?
> > > > So the ID should (1) be tied to the use-case, and not to the underlying
> > > > hardware, and (2) be the same for different platforms?
> > > >
> > > > For (1): Then we must not put these IDs in DT at all, as DT is supposed
> > > >     to describe the hardware (and firmware IDs in DT were IMHO already
> > > >     a stretch before).
> > > > For (2): How can there be a contiguous list of IDs, as not all platforms
> > > >     may have the same underlying hardware?
> > >
> > > I would NOT say that an SCMI FW must behave like this regarding IDs, but it
> > > is a possible SCMI deployed setup that can be useful in virtualized setups
> > >
> > > I mean, the DT describes the hardware of course BUT when you refer to
> > > some of this hardware DT bits from some other subsystem by referencing a
> > > phandle, even in the non-SCMI world, you are in fact selecting a specific
> > > resource that fit you use case, right ? Can we say this ?
> > > I mean you needed that specific clock or regulator that you described
> > > previously so as to be able to enable some other piece of HW...
> > >
> > > Now, the SCMI provides an abstraction on top of this, since you really
> > > discover domain IDs of a specific class (clocks/regulators etc) you are
> > > in fact describing an HW abstraction that you then refer with the usual
> > > phandle...also because there is NOT so much SCMI hardware to describe,
> > > given that the HW is handled transparently (opaquely really :P) by the
> > > driver on the FW side...
> > >
> > > ...you basically obtain such domain ID, usable as phandles through dynamic
> > > SCMI enumeration so that you can use it all over your DT to make use of such
> > > resources...
> > >
> > > ...on top of this, consider that the SCMI server CAN provide to its agents
> > > a per-agent-view of the world, IOW it can (and should) expose to a specific
> > > agent ONLY the resources needed by that agent, i.e. it can expose the set
> > > of resources 1-N to two distinct agents and that does NOT mean that the
> > > underlying physical resource mapped by ID=3 in both agents has to be
> > > effectively the same piece of hardware: it could be the case, and this
> > > would be useful to exposed and managed properly a shared resource, or
> > > it could also be that the same ID=3 could refer to completely distinct
> > > pieces of the same class of hardware...(same protocol same class of
> > > resource...)
> >
> > Exposing only the clocks/reset/power domains the agent can use,
> > in a contiguous list of IDS, means that the number space changes,
> > depending on which resources are exposed.
>
> Yes, potentially, it depedns on how the HW/FW stack was designed I
> suppose...
>
> > Suppose you have a system where you want to assign a specific hardware
> > block in the SoC to the realtime CPU core instead of the application
> > CPU core running Linux.
>
> Ok, so this is definitely a considerable change.
>
> > That means all resources used by that block must no longer be exposed
> > to the Linux agent, and the corresponding IDs must be removed from
> > the ID space exposed to Linux.  As the ID space must be sequential
> > and contiguous, the IDs must be renumbered, impacting resources that
> > are exposed to Linux.  As these IDs are used in the SoC .dtsi, they
> > must be changed there, too, However, these IDs have become part of
> > the stable DT ABI, and thus cannot be changed.
>
> Well, you have to ship a final DTB blob that is crafted to describe the
> actual HW at the end, right ?
>
> I mean, in your example, it seems to me that you have changed considerably
> the HW surface by moving a clock (and its related resources) away from the
> reach of Linux as a whole, so should not be expected to have an updated
> DTB shipped ?

It is not necessary to ship an updated DTB.
The bootloader stack can just change the "status" properties of devices
nodes that are be taken away from Linux from "okay" to "reserved":

Devicetree Specification, Release v0.4, Table 2.4: Values for statu
property states:

    Value: "reserved"
    Description:
        Indicates that the device is operational, but should not be
        used. Typically this is used for devices that are controlled
        by another software component, such as platform firmware.

When all SCMI IDs change, too, much more work needs to be done.

The remap driver could also help here: it could scan for device nodes
that are marked "reserved", remove SCMI IDs used in these nodes from
its internal tables, and adjust all later (higher) IDs.

E.g. the existing drivers/clk/renesas/renesas-cpg-mssr.c already handles
(ignores) clocks used by reserved nodes.

> And I am NOT saying to do this by changing the base SoC dtsi, but via build
> time overrides and/or runtime overlays so as to derive from that same SoC
> base dtsi a properly reviewed final DTB that describes how the HW has actually
> changed, becasue beside the renumbering that you mention there will be
> also a bunch of HW pieces that were relying on that clock that now will
> have to be removed from the DTB if no more usable (or remapped to use a
> different, maybe non SCMI resource)
>
> I maybe too naive and not used to very complex DTBs, but why all of the
> above cannot be done along the lines of how is done as an example in
> JUNO [1], where some initial base dtsi was overriden by virtue of includes
> and overrides to properly describe the board at hand (r0/r1/r2), even going
> to the extreme, funny enough, to move from the old SCPI to SCMI.
>
> [1]: https://elixir.bootlin.com/linux/v7.0.8/source/arch/arm64/boot/dts/arm/juno-scmi.dts

As long as the IDs in arch/arm64/boot/dts/arm/juno-scmi.dtsi
match the actual SCMI implementation, that works...

> > This patch series fixes that issue, too, by describing the actual
> > hardware in DT, and doing the mapping to exposed SCMI features in the
> > kernel, based on which firmware version is running on the SCP.
>
> Which seems to me to go in the opposite direction to what SCMI expects:
> but I understand that we have to deal and cope with the existing already
> shipped FW, so my concern is not really around enabling this in particular,
> is much more the fact that we open the door and normalize this kind of
> design even with future, still to be developed, SCMI FWs.
>
> ...otherwise...have the spec changed/clarified to allow for such
> non-contiguos IDs...
>
> ...anyway let's hear Sudeep opinion on this general issue of contiguos
> remapped IDs and being able to peek into SCMI version from outside the
> SCMI world...

As long as the ID space becomes stable.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

