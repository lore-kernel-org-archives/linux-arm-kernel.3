Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2889C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 17:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tws58Jov7D0tr1UeFv3C8yKbD6Gfp0yCO2S/geWm9U=; b=k7oMkgyrsMlIJ7yVmjMEUi1/vX
	rWrTy6EEYJ9kqNQ0o21TTeJpmZEhpv/tBjCN/qZDcRfFpvlztBoew9VyassXJFVzoaEbXHBAZ92QC
	ycDltNh7Q4pPVMLNXVShAXCcqFkp3GrMNH2OL+VUPLQVc8bZkFZiCWL00FQ7/33Ex+WtPj5tOSyB8
	6vOgFDM32G8XrIpyL7yWk0FYUoFCJh0MxlZm9NQv78e66x4XhArpedx0MblPsea8oC2NVGMkkNUrP
	5v2QV1wCFA/qPT62xngATse1+S97mMPMcG59StWndu1pL9i0S3GzDQbQCUqUsF3GRxLkxXMVCdmXT
	VsDhdNKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm9O-0000000ByGO-0eBh;
	Thu, 13 Mar 2025 17:15:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tslbT-0000000BrUa-3rJi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 16:40:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4166DA477B2;
	Thu, 13 Mar 2025 16:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124B1C4CEDD;
	Thu, 13 Mar 2025 16:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741884014;
	bh=p8AVcBEQ4JH4wcFU3EvZQIw+okBDu/uodFFvEyHDmr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gUBDOc9w3N3QjozeGeQIILT8Mbe5q45yfDahRhGlWKbXa6cAbkX28apn5101mzy0q
	 r71b8K0QrswxlVM5UG8sxjOtJficURk0jRjeStTWrQAhljkS3N/XvAkSp3G7BRRDq/
	 jEfUNBcPn6VkQtJRHV2qR0sVlTt5RQcALX5skRPgStcridDEVUtZ/yRLq/L7zoOjR+
	 nu5W9LqomCOD6KOvsgQkcVhAb/5Q30CknG/rSnlFTV+go2RSYFjLNHbzp8kZaub6VS
	 HKRgHske4Yf60+FjEutO8HFykny5ohBDeyE/ExZDr83PIdcqsrK+PWsgOds4njbUY1
	 PWqLQw+Gk8mMw==
Date: Thu, 13 Mar 2025 16:40:08 +0000
From: Lee Jones <lee@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: ukleinek@kernel.org, alexandre.torgue@foss.st.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, jic23@kernel.org,
	daniel.lezcano@linaro.org, tglx@linutronix.de,
	catalin.marinas@arm.com, will@kernel.org,
	devicetree@vger.kernel.org, wbg@kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org,
	olivier.moysan@foss.st.com
Subject: Re: [PATCH v3 2/8] mfd: stm32-lptimer: add support for stm32mp25
Message-ID: <20250313164008.GC3645863@google.com>
References: <20250305094935.595667-1-fabrice.gasnier@foss.st.com>
 <20250305094935.595667-3-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250305094935.595667-3-fabrice.gasnier@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_094016_019076_717B47F7 
X-CRM114-Status: GOOD (  14.70  )
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

On Wed, 05 Mar 2025, Fabrice Gasnier wrote:

> Add support for STM32MP25 SoC.
> A new hardware configuration register (HWCFGR2) has been added, to gather
> number of capture/compare channels, autonomous mode and input capture
> capability. The full feature set is implemented in LPTIM1/2/3/4. LPTIM5
> supports a smaller set of features. This can now be read from HWCFGR
> registers.
> 
> Add new registers to the stm32-lptimer.h: CCMR1, CCR2, HWCFGR1/2 and VERR.
> Update the stm32_lptimer data struct so signal the number of
> capture/compare channels to the child devices.
> Also Remove some unused bit masks (CMPOK_ARROK / CMPOKCF_ARROKCF).
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in V2:
> - rely on fallback compatible as no specific .data is associated to the
>   driver. Compatibility is added by reading hardware configuration
>   registers.
> - read version register, to be used by clockevent child driver
> - rename register/bits definitions
> ---
>  drivers/mfd/stm32-lptimer.c       | 33 ++++++++++++++++++++++++++++-

Looks okay.

>  include/linux/mfd/stm32-lptimer.h | 35 ++++++++++++++++++++++++++++---

Assumingly this patch is not independent of the others?

-- 
Lee Jones [李琼斯]

