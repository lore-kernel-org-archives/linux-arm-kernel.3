Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036BCC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIEXEh8Wqwl1bJzwWtu4bthbnhWMS0XSiSB3GshMrlU=; b=sYEo41P1wKXm3lBFthEAUTRwnQ
	HnBKPTIoLZu3qNGZFSRY7dOJ9aLdbCueKDeHJ3o7c34lQcoppBPMJmAtEMj5vF547NarcpLdTl8WD
	SCclVPLJF5ahAmwa13lA0Rk5/scNk3S8FhxUyzpl3JTV2Gi9+O/mrTbKq+c7ehrvg+pDzJpFoK9vJ
	VlXUxBXttm2tdtz5T2id5DADeuJ8me2/m5FqrIdvw50iYMzxYLefgwbk3dYwANzVyqjfYDNgwhy6M
	AcUXY5Hp8RgNwU2KatMCc3jNyJqQm7j24nn0Nf3dbH4NxvLMuH/cH0B52PL0T8PUD/qMIMtSEHJcx
	Fi7NtAbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Zlu-00000006z6d-1J5N;
	Mon, 07 Sep 2026 13:52:30 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Zlr-00000006z67-1mOE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:52:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Subject: Cc: To: From: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1788789144;
 bh=OIEXEh8Wqwl1bJzwWtu4bthbnhWMS0XSiSB3GshMrlU=;
 b=bct+loYqzQ3xS4RTLO4NlP7euaVwHUUETOey2AfwqtlDXP89xwQZzrP95cwzP3LeeBZrDdVIx
 hpkER1XtuicOdRTnrEiK2b8MyC6gnsC2yKv3TfqbaglgK5KgMq2dyWVyWm0mkESlNbxtE2rCxFp
 krVN82f8Eg8X8Naostmnzau6lSvf0NLDaDZK3hLWche6g/t5uQcpaHMoiBWOtBpWyUoQwbB8Bg0
 xIbnc/lwX/VxFAEnRC3OVvs1o47iV7Us1RechOeesO9ELSm3b4wxENBozSmn8kez1p2t/7fgxLT
 baRpwJz4xPgAynqEe8v942BpMgieUg/u6MPOWLRwOIWg==
X-Forward-Email-ID: 6a9ec19570f4b45aa0d07729
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 07 Sep 2026 09:52:19 -0400
Message-Id: <DL94TU52KBMO.2HAKJMJXV2CPE@ubuntu.com>
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sven Peter" <sven@kernel.org>, "Heikki Krogerus"
 <heikki.krogerus@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Janne Grunau" <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>, "Andreas
 Noever" <andreas.noever@gmail.com>, "Mika Westerberg" <westeri@kernel.org>,
 "Yehezkel Bernat" <YehezkelShB@gmail.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>
Cc: "Konrad Dybcio" <konradybcio@kernel.org>, <linux-usb@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, "Joshua
 Peisach" <jpeisach@ubuntu.com>
Subject: Re: [PATCH v2 00/22] Initial USB4/Thunderbolt support for Apple
 M1/M2/M3 SoCs
X-Mailer: aerc 0.21.0
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_065227_516330_C5EDF169 
X-CRM114-Status: GOOD (  36.99  )
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

On Sun Sep 6, 2026 at 2:36 PM EDT, Sven Peter wrote:
> Hi,
>
> This series adds initial USB4/Thunderbolt support for Apple Silicon
> M1, M2 and M3 SoCs. Each USB4 capable Type-C port comes with an ACIO
> ("Apple Converged I/O") block which contains a Cortex-M3 co-processor
> and the hardware implementing the USB4 router.
>
> The NHI and DART IOMMU are part of this ACIO block as well. Instead of
> being exposed as independent always-accessible devices the main SoC bus
> only gets a 16 MiB window into ACIO's MMIO space while its co-processor
> is running. It is not entirely clear whether this is ACIO's own address
> space or a window into the co-processor's address space.
>
> This is why the device tree represents the NHI and DART as children of
> ACIO with addresses relative to that window. The driver only populates
> these children after booting the co-processor and removes them again
> before powering ACIO down. This setup is slightly unusual but matches
> both the MMIO layout and the lifetime of the devices.
>
> ACIO also has rather strict ordering requirements: it can only be
> started after the Type-C PHY has been configured for USB4/Thunderbolt
> (and ideally has to be stopped again before the PHY is powered down but
> this doesn't break anything unlike getting startup wrong). It also
> needs cable details which are only known to the Type-C port controller.
>
> The first two patches add synchronous Type-C alternate mode state
> notifiers and support for representing USB4 connections on the Type-C
> bus. USB4 uses Enter_USB instead of Enter Mode and has no SVID, so it
> gets its own mode kind and stores the negotiated EUDO directly.
> The next two patches register a USB4 port mode and publish
> the negotiated Thunderbolt and USB4 partner modes on the Type-C bus,
> along with the Thunderbolt cable mode. These modes are marked active
> after the mux has been configured and deactivated before it is switched
> back to its safe state.
>
> The following two patches add the bindings for the NHI and ACIO. The
> Thunderbolt core patches prepare for the different NHI register layout
> and interrupt handling, read the USB4 router DROM from the device tree,
> unlock the host router ports and find the Apple VSE capability. They
> also add a hook for device links to tunneled native ports, a quirk for
> USB3 bandwidth allocation not implemented by the Apple hardware and
> the symbol exports needed by the driver.
>
> The main driver registers the newly introduced notifications for the
> negotiated Type-C modes, powers up ACIO, boots the co-processor,
> populates the DART and NHI children once their MMIO regions are
> accessible and registers the NHI with the software connection
> manager. The last three patches add the device tree nodes
> for the M1 and M2. M3 nodes will follow once the rest of the stack is
> upstream, but the current Thunderbolt/USB4 code has already been
> successfully tested on those.
>
> Right now only XDomain connections and USB3-via-USB4 tunnels are
> supported. Both PCIe and DisplayPort tunnels will come later since those
> require additional work and reverse engineering that is not done yet.
> Suspend is also not supported yet and we actually have to prevent
> suspending whenever an active connection is present because we would
> otherwise resume into an SError.
>
> This series depends on the Apple CIO reset controller [1], the ATCPHY
> USB3-via-4 pipehandler support [2], support for specifying the DART DMA
> aperture in the device tree [3], a fix for CD321x Thunderbolt
> altmode VDOs [4], and fixes for making the DPTX capabilities read fail
> gracefully [5]. I couldn't split it any further since the remaining
> patches now directly depend upon each other.
> Except for the dts changes the series applies cleanly without these
> dependencies though.
>
> For merging we'll probably need an immutable brach with the first two
> commits after they've been reviewed which is then merged in both the usb
> and thunderbolt tree sincethere are other tipd changes in flight as well.
>
> Happy to split this series in two as well if you prefer that.
>
> Best,
>
> Sven
>
> [1] https://patch.msgid.link/20260821-b4-cio-reset-v2-0-2d045f80a424@kern=
el.org
> [2] https://patch.msgid.link/20260821-b4-atcphy-usb4-v1-0-45c0b741e0c0@ke=
rnel.org
> [3] https://patch.msgid.link/20260819-iommu-apple-dart-aperture-v1-0-2527=
03f381aa@jannau.net
> [4] https://patch.msgid.link/20260813-b4-tipd-vdo-fix-v1-1-70317f2cd554@k=
ernel.org
> [5] https://patch.msgid.link/20260829-b4-tbt-fixes-v3-0-e1fab6ac54fe@kern=
el.org
>
> ---
> Changes in v2:
> - Dropped thunderbolt switch in favor of the typec bus and an additional
>   notifer
> - Add USB4 to the Type-C bus with its own mode kind instead of an SVID
> - Register port/partner altmodes for CD321x
> - Replaced the struct with ring MMIO offsets with two callbacks insid
>   tb_nhi_ops
> - Moved port unlock sequence and finding the Apple VSE capability into
>   core tb code
> - Added device links for USB3 tunnels
> - Move the USB3 BW quirk from an NHI quirk to a router quirk
> - Added Joshua's rb to patches which didn't change
> - Link to v1: https://patch.msgid.link/20260830-b4-apple-soc-tbt-v1-0-44b=
c9348683c@kernel.org
>
>
> ---
> Sven Peter (22):
>       usb: typec: Add alternate mode state notifiers
>       usb: typec: Represent USB4 on the Type-C bus
>       usb: typec: tipd: Register a USB4 port mode for CD321x
>       usb: typec: tipd: Publish CD321x partner alternate modes
>       dt-bindings: thunderbolt: Add Apple USB4/Thunderbolt NHI
>       dt-bindings: thunderbolt: Add Apple USB4/Thunderbolt ACIO block
>       thunderbolt: Try reading host DROM from device tree first
>       thunderbolt: Don't read the UID if we already know it
>       thunderbolt: Allocate ring HopID before requesting the ring interru=
pt
>       thunderbolt: Unlock host router ports during startup
>       thunderbolt: Find Apple VSE capability during startup
>       thunderbolt: Add ring_interrupt_active to tb_nhi_ops
>       thunderbolt: Add ring register accessors to tb_nhi_ops
>       thunderbolt: Add ring_interrupt_mask to tb_nhi_ops
>       thunderbolt: Add ring_configure to tb_nhi_ops
>       thunderbolt: Add add_links to tb_nhi_ops
>       thunderbolt: Add QUIRK_NO_USB3_BW_ALLOC
>       thunderbolt: Export symbols required by the Apple Silicon driver
>       thunderbolt: Add Apple Silicon support
>       arm64: dts: apple: t8103: Add USB4 ACIO and NHI
>       arm64: dts: apple: t8112: Add USB4 ACIO and NHI
>       arm64: dts: apple: t60xx: Add USB4 ACIO and NHI
>

For patches

3: usb: typec: tipd: Register a USB4 port mode for CD321x
4: usb: typec: tipd: Publish CD321x partner alternate modes
10: thunderbolt: Unlock host router ports during startup
13: thunderbolt: Add ring register accessors to tb_nhi_ops
15: thunderbolt: Add ring_configure to tb_nhi_ops
16: thunderbolt: Add add_links to tb_nhi_ops
17: thunderbolt: Add QUIRK_NO_USB3_BW_ALLOC
19: thunderbolt: Add Apple Silicon support

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>

Side note: I'm probably going to stop reviewing devicetrees as I am
not really an expert in the full hardware definitions and how it
should work.

