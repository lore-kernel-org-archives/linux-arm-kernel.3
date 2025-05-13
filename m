Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1586BC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 10:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hx3F8VCPOnxX8264+l+zPf9MaXhpNImCftMmE/6zvYM=; b=FEQesfEea0Iv6mdOCVJYFW0TFq
	xEmNgcFklA0BS5CDiOv5MWkYTIs3XIA0qapPyiLjA18F6AAmOrlsBYpAv2mYt/XUhpkEghKsl9/vG
	JnTmmnnPrdMmM079L7Ot6R2rx6nEISFwqM7pgpt5W0D98Dhe6K7LYuU52TCT5zW7s0eeJLl256de4
	SEMPGCWlELpkRCo4y5XaoxAP2YtIJh2Bw1jrG6pYAyUmH92cxKppEjJ8iZtf6FoGfb7xUBuoWyrTa
	fRuJKbZy8wF0p9yBnuEUUINuUs3DEtuaetUn2b3UHMj3/4PPKg60glSuik87EvZPo3ofXben5ARp8
	PbcYFhCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmre-0000000C6s2-0ij6;
	Tue, 13 May 2025 10:27:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmhY-0000000C45x-36we
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 May 2025 10:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hx3F8VCPOnxX8264+l+zPf9MaXhpNImCftMmE/6zvYM=; b=PeHyxHwh44U9LobSIopsbwcME/
	/C4tEZF+WtsnBT0tpk/MwYpO9Q9mvD8bKH5NL2SBWdfV+pi1/IBxU550EUqzIzo3PiSLVXAjm3qSA
	pM1O8JjHDUi+Mamz6S4SaMZdnK6R7VhNZXg0J4MveQt5TnjhIY2v7SSKszwgPp99hrdPNtFFqXjY+
	Jl82VhS0b4aJxEBo9EhxrOkFnUykpeQtvCzW39xsOsXOit4FVVvM1K3r2wn/lh52syWODCKvR0gCi
	/uU0vCvDfR5LXy2FgwBaBcr7fD50H8/OjRSnYEIgeHXhTwb5u4DFNS3reM39feA60d1CKBawETfsh
	y7IMianQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uEmhV-0000000GwDj-3VwR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 10:17:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 873B1A4D488;
	Tue, 13 May 2025 10:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A91CC4CEED;
	Tue, 13 May 2025 10:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747131446;
	bh=1gM1XLcPgvrG+ys+qc6lxYqS0BilUpTT/Xx1KYUfe40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WGeVCKf5BhAzUcwQrQNKICGlkgCNdN3dH/UoO/2nAPKY9brPthNPn8gUGIf70g9YL
	 TMf8n+iVRsClxw1Va7+bTGdReYr/vKD3+z2XaEWycSj0tjnfF6K4StAwWXmIEGGM2t
	 CVdPEf7vLcUe9uiUFWZc0RtAZw6TRwAtwYOoPByVro1hqMizQnD0Ffzm5/oIR7K3EF
	 iAtCQrA0g6iL9FD+8KfsGzSIzrcuK6tU2Q4LczOxUzE7GFd2fCdi51Xx+JUlRDQIB/
	 yfgUiX7a4O2nR/rDMwFZ5vVlaRR8NV/dAjfW9/SNuHaOJiVEaxK9i6DkmBFFSnQfWq
	 EoKuvHVSEYLkw==
Date: Tue, 13 May 2025 11:17:20 +0100
From: Lee Jones <lee@kernel.org>
To: daniel.lezcano@linaro.org, alexandre.torgue@foss.st.com,
	tglx@linutronix.de, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: ukleinek@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jic23@kernel.org, robh@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, devicetree@vger.kernel.org, wbg@kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org,
	olivier.moysan@foss.st.com
Subject: Re: (subset) [PATCH v6 0/7] Add STM32MP25 LPTIM support: MFD, PWM,
 IIO, counter, clocksource
Message-ID: <20250513101720.GH2936510@google.com>
References: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
 <174713127684.4157861.15977616973399970511.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174713127684.4157861.15977616973399970511.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_111730_099353_E1AD4330 
X-CRM114-Status: GOOD (  14.02  )
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

On Tue, 13 May 2025, Lee Jones wrote:

> On Tue, 29 Apr 2025 14:51:26 +0200, Fabrice Gasnier wrote:
> > This series adds support for STM32MP25 to MFD PWM, IIO, counter and
> > clocksource low-power timer (LPTIM) drivers.
> > This new variant is managed by using a new DT compatible string, hardware
> > configuration and version registers.
> > It comes with a slightly updated register set, some new features and new
> > interconnect signals inside the SoC.
> > Same feature list as on STM32MP1x is supported currently.
> > The device tree files add all instances in stm32mp251 dtsi file.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/7] dt-bindings: mfd: stm32-lptimer: add support for stm32mp25
>       commit: 3f9ce9d0760ad68a9c20167664d026d91da66879
> [2/7] mfd: stm32-lptimer: add support for stm32mp25
>       commit: 4f8ceb0302b36c5f78bcc8d0e7cfa2372fba134c
> [3/7] clocksource: stm32-lptimer: add support for stm32mp25
>       commit: 5414bc8c57c41038b1994cd21a2cc0b8415c1544
> [4/7] pwm: stm32-lp: add support for stm32mp25
>       commit: 3f51b232c1da8e59eb562f1d81533334827a4799

In future, please match the subject format with that expected by the
subsystem.  For this, `git log --oneline -- <subsystem>` is your friend.

I changed them all for you this time.

The above patches have been applied and submitted for build testing.
Once complete, I'll follow-up with an PR for the other maintainers to
pull from.

Note to self: ib-mfd-clocksource-pwm-6.16

-- 
Lee Jones [李琼斯]

