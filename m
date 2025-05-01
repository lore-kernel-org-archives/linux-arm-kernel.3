Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49784C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 13:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQdc39CNpfE5SklFj5Xz5fGlZqhAO1uTaTeD3Myk49U=; b=3wD5SboP6sfOuIqu6uKkYzU6+V
	LOW3XFELnV/42Aez8yFfgim5NW2lXsq2V4R2van+Pd+S/dXHGztyOUgxTQ9UJtw43ZS16DTMD3+r0
	3dxVnmCVboY4t2YnjmQkJxMVUI0SwsGUyYAcTvs9v5b5kyC9GGuIyONQ/TrY0WpYb+/T8G4NuMSy7
	5Xv+2E1OtvJRPWM1yT44kCH+Do/Mxjqr0BNEmjHvqT0GDAjPT8gsXUGZ/laH833F/fg1rDxdWYqC7
	+dCPs/wBQYYX6aperoR7MKCQUA2iuqhbKu0Tw31BdeH/VvgbTxeupApWbX6ZjZYTvRM7EH8E2+12B
	9t9jfrSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATme-0000000FnZt-1MFd;
	Thu, 01 May 2025 13:17:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATkk-0000000FnLc-03VX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 13:15:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F76A49C7A;
	Thu,  1 May 2025 13:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA3CC4CEE4;
	Thu,  1 May 2025 13:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746105300;
	bh=6ptm9e4+N5Xyo1RCMVV1pfCM3SsY2ZQgu3Uh/K4ek1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J58UFm9gNYOlLCrcSO6OxX6RPkPjwASSoVPejxOPQtMgK6DVbO37HkxQPsLZz+kRv
	 PAinzrv821hFUBbMok1HnTGoVqSxpm069Q2Pi2ZzbL4rtMQedEhK25DslHGQZtgGin
	 Y/mhgOiRlU82tjDVUpLtpGYrufX6e1BP+38x2QYbY8P8rolHG4wcoVaToZxhb8iLSN
	 mTm1I0OLFr4lrPW3fIz/8zYoGlqO5vAnzcqWkzgM/jmRZKCSPzxYs3JpX0fa7mEsPI
	 ztfSGRgj3gDV7zwepeaIbQh78A2YmIr+AAS65Xo4LQ/btBt5PkjYrhB5GQLLzAOifi
	 XOJ+FUPGOvwmg==
Date: Thu, 1 May 2025 14:14:54 +0100
From: Lee Jones <lee@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: daniel.lezcano@linaro.org, alexandre.torgue@foss.st.com,
	tglx@linutronix.de, ukleinek@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jic23@kernel.org, robh@kernel.org,
	catalin.marinas@arm.com, will@kernel.org,
	devicetree@vger.kernel.org, wbg@kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org,
	olivier.moysan@foss.st.com
Subject: Re: [PATCH v6 0/7] Add STM32MP25 LPTIM support: MFD, PWM, IIO,
 counter, clocksource
Message-ID: <20250501131454.GO1567507@google.com>
References: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_061502_092436_13D0D2E3 
X-CRM114-Status: GOOD (  20.31  )
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

On Tue, 29 Apr 2025, Fabrice Gasnier wrote:

> This series adds support for STM32MP25 to MFD PWM, IIO, counter and
> clocksource low-power timer (LPTIM) drivers.
> This new variant is managed by using a new DT compatible string, hardware
> configuration and version registers.
> It comes with a slightly updated register set, some new features and new
> interconnect signals inside the SoC.
> Same feature list as on STM32MP1x is supported currently.
> The device tree files add all instances in stm32mp251 dtsi file.
> 
> Changes in V6
> ---
> - Fixed kernel test robot warning
>   https://lore.kernel.org/oe-kbuild-all/202504261456.aCATBoYN-lkp@intel.com/
> 
> Changes in V5
> ---
> - Add a necessary delay in clocksource driver, when enabling the timer.
> - Add collected Acks
> - Dropped IIO trigger patch as applied by Jonathan [1] (no dependency)
>   [1] https://lore.kernel.org/all/20250331110435.26157ebe@jic23-huawei/
> 
> Changes in V4
> ---
> - Simplify IIO trigger driver as per Jonathan's comments.
> - Rework clocksource driver: encapsulate mp25 changes in separate function
>   after Daniel's suggestion.
> - Add some definitions to MFD header.
> 
> Changes in V3
> ---
> - Yaml indentation issue fixed, reported by Rob's bot
> 
> Changes in V2
> ---
> - Review comments from Krzysztof
>   - Adopt compatible fallback in dt-bindings and driver
>   - drivers: drop "st,stm32mp25-..." compatibles when unused (e.g. no .data)
>   - counter driver: no update (patch dropped)
>   - defconfig: only enable the necessary config for upstream board
>   - add lptimer DT node in stm32mp257f-ev1 board
> - Add missing management of IER access for stm32mp25
> 
> Fabrice Gasnier (7):
>   dt-bindings: mfd: stm32-lptimer: add support for stm32mp25
>   mfd: stm32-lptimer: add support for stm32mp25
>   clocksource: stm32-lptimer: add support for stm32mp25
>   pwm: stm32-lp: add support for stm32mp25
>   arm64: defconfig: enable STM32 LP timer clockevent driver
>   arm64: dts: st: add low-power timer nodes on stm32mp251
>   arm64: dts: st: use lptimer3 as tick broadcast source on
>     stm32mp257f-ev1
> 
>  .../bindings/mfd/st,stm32-lptimer.yaml        |  40 +++-
>  arch/arm64/boot/dts/st/stm32mp251.dtsi        | 177 ++++++++++++++
>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |   8 +
>  arch/arm64/configs/defconfig                  |   2 +
>  drivers/clocksource/timer-stm32-lp.c          |  61 ++++-
>  drivers/mfd/stm32-lptimer.c                   |  33 ++-
>  drivers/pwm/pwm-stm32-lp.c                    | 219 +++++++++++++++---
>  include/linux/mfd/stm32-lptimer.h             |  37 ++-
>  8 files changed, 537 insertions(+), 40 deletions(-)

Is it just the Clocksource Ack that we're waiting on now?

-- 
Lee Jones [李琼斯]

