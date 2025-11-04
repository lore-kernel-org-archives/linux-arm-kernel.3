Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C692CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 08:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5ML5SdR3EXWZKkjEOi1Qi8cT/vlBmPHmVT1U6D43AM=; b=StDup0+ur73qcHBkAyvPqR2IJR
	DJdY1+jxECAhYXkCMzUPGwITI4Tr0bS2T/OPRkb/OgriuljGuc3fgBYBytfa1RwKemquwSeRrCE3u
	AiOh+5IvYILroacBhhFjqX/VF5JWQEp/SXLBbKKO9W+j0l+aJ6YG3W534ovJ0e2FGAsII+4XEnM8x
	wU7g7cSHPGOsWz/2JB4jrL8S/Lsw6UbH4pPH1Xl8kD886WtXg/Zs0GwMWOlwAHZxwauup8qy6kG2c
	bE0AIdFeOVTXg/gTUMoFxM8Ym2VsWbkyLKYgoqO6IfwdBizqlurEuXRFOhtXodP56amfijylHbWmD
	us7ct47g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGC8d-0000000BOKt-0fK9;
	Tue, 04 Nov 2025 08:11:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGC8a-0000000BOJb-3Aad
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 08:11:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 091D24046F;
	Tue,  4 Nov 2025 08:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533A9C4CEF8;
	Tue,  4 Nov 2025 08:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762243891;
	bh=7RaiFs9v/UL4cLzP1EGbRyUA5ARrzGlW5oFQNrU+8sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SkUR6Kzh0jg86uh6A+ix+nKwo2M1QuE0rK1jCJe8c791dEjYlYv3u15FTVPMp+KyA
	 HbKc2L6m2Gv5eZBNnw610BhHBWelvWdB3GDuqYAvkHIuiPg00y8p86TLNDn0VtCiOO
	 JUYzuwdWdV57XtU9PVrDaREvtJkYdJkNijX/u55jU2A+8+QI98uVKMV7NaLC8h5EZ8
	 U8SzKHBLfXwaBpjm2DKwQL9RyWC/eEhmuPBixz+36rqb3kJJy4/CSIl4MS3LlvMURk
	 OQASdotusXDlYR4MiIOV6TlQhU3gIAlbeuGdhblUrvrmuu6+ePCJxoz3emrjycgSrW
	 2M+Er/tzmDWxg==
Date: Tue, 4 Nov 2025 09:11:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	kernel-team@android.com
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
Message-ID: <20251104-enthusiastic-cream-gibbon-0e7b88@kuoka>
References: <20251102-automatic-clocks-v3-0-ff10eafe61c8@linaro.org>
 <20251102-automatic-clocks-v3-1-ff10eafe61c8@linaro.org>
 <20251103-smoky-rustling-bloodhound-7590ce@kuoka>
 <CADrjBPpjX_qSehbNkaAG03f=whs09qFzzgNiY3sztk7v0QeCFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADrjBPpjX_qSehbNkaAG03f=whs09qFzzgNiY3sztk7v0QeCFw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_001132_836041_00134F08 
X-CRM114-Status: GOOD (  27.72  )
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

On Mon, Nov 03, 2025 at 01:49:53PM +0000, Peter Griffin wrote:
> Hi Krzysztof,
> 
> Thanks for the review feedback!
> 
> On Mon, 3 Nov 2025 at 09:41, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Sun, Nov 02, 2025 at 08:27:14PM +0000, Peter Griffin wrote:
> > > Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
> > > that contains the BUSCOMPONENT_DRCG_EN and MEMCLK registers.
> > >
> > > If present these registers need to be initialised
> >
> >
> > ... for what exactly? What would happen if this was not initialized?
> 
> The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
> bus components. So it is related to the automatic clock gating feature
> that is being enabled in this series. Things still work without
> initializing this register, but the bus components won't be
> automatically clock gated leading to increased dynamic power
> consumption. Similarly the memclk register enables/disables sram clock
> gate. Up until now we've not been initializing the registers as
> everything from Linux PoV has been in manual clock gating mode and
> until starting to implement this I wasn't aware there were some clock
> related registers in the corresponding sysreg. Additionally with
> Andre's work enabling power domains it has become clear we should be
> saving/restoring these two sysreg clock registers when the power
> domain is turned off and on.
> 
> > What is the exact justification for ABI break - wasn't this working
> > before? Or new feature will not work (thus no ABI break allowed)?
> 
> No, automatic clocks and dynamic root clock gating were not working
> prior to this series. Currently power domains and system wide
> suspend/resume aren't enabled upstream either. As we work on enabling
> these features we are finding some things that in an ideal world we
> would have known about earlier. Unfortunately it's not so obvious just
> from studying the downstream code either as they rely heavily on
> CAL-IF layer that has peeks/pokes all over the memory map especially
> for power/clock related functionality.
> 
> Whilst it is technically an ABI break, I've tried to implement it in a
> backwards compatible way (i.e. an old DT without the samsung,sysreg
> phandle specified) will just fallback to the current behavior of not
> initializing these registers. Things will still work to the extent
> they did prior to this series. With a new DT the registers will be
> initialized, and dynamic power consumption will be better.

So explain that this is needed for proper and complete power management
solution on this SoC, however that is not an ABI break because Linux
driver will be stil backwards compatible.


Best regards,
Krzysztof


