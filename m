Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D36C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 14:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7otg9CBtCT7QAKWzhQ51y40SaaQ+r/ZEtal4jjG9ZsI=; b=Wy+cf5vjYKu/o6N9M/hVFKwO+F
	6vRbEhkjBAdP1/9TrSYLysbujBmvkiYOgCbJPmQU+0RYWr4VupOpg9NbPmVKqLejxC/KRLlPPl5aY
	7YGP5SUp0bRN+6vqkhWNOB+PQqpGYrsU99P3KCgjq04tYIBHQF+oMp4NFgV/W5TWBNAA/Q4LuavgC
	wFWf117B0x9MU2n3roj3x7bMGdnv9GGoOdO8Ph8MceD1aHXlwtwo27D6gug1Esq0DtT1v6Wqwqv4M
	NNd7RK19V4bfW6laCVX+q2LuKKLzpPRx1fHge5AOoXuaErK1sbgKWtGlVCZ0Qq/Pzu/YCFrmhyOKh
	g8fzgyUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xLS-0000000EKsz-1WD3;
	Thu, 24 Apr 2025 14:14:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wCf-0000000E7qh-3ZCw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 13:01:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C42905C63C0;
	Thu, 24 Apr 2025 12:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE734C4CEE8;
	Thu, 24 Apr 2025 13:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745499679;
	bh=w4ERmlgT37R8fqbbx4uVzFLB0bFMUP+qmxc5xgde/7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pxm6+iDHVTleShgiF8bFeJvckCUPbkg57ANzPMtBwns7jfQzzmQz0EFJ05T112lwB
	 WMYmpudJjzcHgAOUsrdINVZwv2/j3JmqCXznxVSHQq2h8faiVnOKb2RPegnUC/8c7p
	 CHaM/QMNsb9S3xfYYv2Uod/Thx792cyS2aY6xTHFYMs9lM9RC3snvzyGXMCbGnsq0q
	 S9nGIj8WSYURRlSOIHYy78OF6pj5n9fb8Tqqt9Sn/E9qC4HqxLGOVqzFxJrudWvFAS
	 cqzpZUf5gYP+kfQp7RKfjlVq62KmV3pjTBFhnjHgok0FqDpTUNUI3do98G9jOCTAvJ
	 KbiBb+ril+iaQ==
Date: Thu, 24 Apr 2025 14:01:12 +0100
From: Lee Jones <lee@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: ukleinek@kernel.org, alexandre.torgue@foss.st.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, jic23@kernel.org, daniel.lezcano@linaro.org,
	tglx@linutronix.de, robh@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, devicetree@vger.kernel.org, wbg@kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org,
	olivier.moysan@foss.st.com
Subject: Re: [PATCH v4 2/8] mfd: stm32-lptimer: add support for stm32mp25
Message-ID: <20250424130112.GD8734@google.com>
References: <20250314171451.3497789-1-fabrice.gasnier@foss.st.com>
 <20250314171451.3497789-3-fabrice.gasnier@foss.st.com>
 <20250404144006.GB372032@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250404144006.GB372032@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_060121_926514_DA6C8A62 
X-CRM114-Status: GOOD (  19.30  )
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

On Fri, 04 Apr 2025, Lee Jones wrote:

> On Fri, 14 Mar 2025, Fabrice Gasnier wrote:
> 
> > Add support for STM32MP25 SoC.
> > A new hardware configuration register (HWCFGR2) has been added, to gather
> > number of capture/compare channels, autonomous mode and input capture
> > capability. The full feature set is implemented in LPTIM1/2/3/4. LPTIM5
> > supports a smaller set of features. This can now be read from HWCFGR
> > registers.
> > 
> > Add new registers to the stm32-lptimer.h: CCMR1, CCR2, HWCFGR1/2 and VERR.
> > Update the stm32_lptimer data struct so signal the number of
> > capture/compare channels to the child devices.
> > Also Remove some unused bit masks (CMPOK_ARROK / CMPOKCF_ARROKCF).
> > 
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> > ---
> > Changes in V4:
> > - Add DIEROK, ARROK status flags, and their clear flags.
> > Changes in V2:
> > - rely on fallback compatible as no specific .data is associated to the
> >   driver. Compatibility is added by reading hardware configuration
> >   registers.
> > - read version register, to be used by clockevent child driver
> > - rename register/bits definitions
> > ---
> >  drivers/mfd/stm32-lptimer.c       | 33 ++++++++++++++++++++++++++-
> >  include/linux/mfd/stm32-lptimer.h | 37 ++++++++++++++++++++++++++++---
> 
> At least the Clocksource driver depends on this.
> 
> I need Acks from the other Maintainers before I can merge this.

Suggest you resubmit the set as a [RESEND] to re-gain traction.

-- 
Lee Jones [李琼斯]

