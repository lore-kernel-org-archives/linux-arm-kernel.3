Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37B1C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 14:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JDKNWWDVJ0F96y39Qt0qKo7Qs8udR9dK4eAPleDLbFM=; b=DHa+SOrFcNOapBfKfluJ+Eyj7l
	wz5YcKc/sfXZksBrOe3npRhg6qwM+F3AJ9e4Nu0AFv/8Vch3APEn0ZIbo1K9phDOiV7uA2/8+6DfZ
	XCOupCgaWP2A+7JWbRZpPyBoxZe1ME/xEK4JapWdiC+JRxuwLdtm7KGYim/bxs/wyOPrYHA+YMy2N
	uaf2LS+XGQT1xhtcfMpWMiW31xXPOySJeOaOvA2ve/RK0bDBpHCLGNJ98JJ5zdHGdXDFxhOiOtFHs
	DOFZ99+iuenz13Qn61RbEQyCLt1RJKis+Agje70x4TRHBVo7Vq4JMHvsh9kkS4aUh230ex4+UXw9C
	ODdYlMVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0iU2-0000000C4Ta-1yk2;
	Fri, 04 Apr 2025 14:57:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0iDN-0000000C0km-3eku
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 14:40:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5972EA47624;
	Fri,  4 Apr 2025 14:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C24DC4CEDD;
	Fri,  4 Apr 2025 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743777612;
	bh=/RZ9Jsfr5r/ynHY5LjHn47dZxf3iZyn2PfuGAOJz5PE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Es+r2Jc5llwE6fe/0G2YE8Tfxo8QLszDIi+FELtIsScuyexbh7Ua23Tg3UkzVbiaK
	 Dk7CB4DvhEbYh0HIb9k3xUBvhhoBWQLEjGBeNZNTJ52NyjceFMVdYe0BS1EX3pyVY0
	 CzjXkIlAuhJ4JHEBU9qRjLtvu+Txbqe+pb87yWDbJk6Tnys0UwneBEpjog4YrET0iv
	 p6UHblTneFfbN8LAeZ62rHqSSCJMCmuoSqaaPaUCPgcqZn057vcZREwk9tQYYurXf8
	 58qiPPyYRSTLGAEeT1bt1kSoMIAl4JDMr63DwcVHla27uTPkP2A06Za4Sw+z9bMiRl
	 SKwbcDwFUGcbg==
Date: Fri, 4 Apr 2025 15:40:06 +0100
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
Message-ID: <20250404144006.GB372032@google.com>
References: <20250314171451.3497789-1-fabrice.gasnier@foss.st.com>
 <20250314171451.3497789-3-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250314171451.3497789-3-fabrice.gasnier@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_074013_978677_B228238A 
X-CRM114-Status: GOOD (  15.98  )
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

On Fri, 14 Mar 2025, Fabrice Gasnier wrote:

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
> Changes in V4:
> - Add DIEROK, ARROK status flags, and their clear flags.
> Changes in V2:
> - rely on fallback compatible as no specific .data is associated to the
>   driver. Compatibility is added by reading hardware configuration
>   registers.
> - read version register, to be used by clockevent child driver
> - rename register/bits definitions
> ---
>  drivers/mfd/stm32-lptimer.c       | 33 ++++++++++++++++++++++++++-
>  include/linux/mfd/stm32-lptimer.h | 37 ++++++++++++++++++++++++++++---

At least the Clocksource driver depends on this.

I need Acks from the other Maintainers before I can merge this.

-- 
Lee Jones [李琼斯]

