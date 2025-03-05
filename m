Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF06C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 16:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dS1pjd9BRKiYmHDxCBkDO8/FjZh16bxe2m+P5F+L0ZA=; b=bzzR2JvyAm47ISwh98qPg9t/m8
	BpgtsgfM8NgKM+t85DEROWQgo+Chqtc3HTB38932+7Brk09aA+bF1dU5eeZsoj/sGjb+1dE5eagEN
	v799dUr9Bp98SdFp/R0SAM4z9wJpCn03zXeQHWDmdHKIOucnRjyJD4Gz4UJlWOaTNYUqCvoXUZ4CU
	JHW781Fw8s5w2EFxJPtN6znFbgb2ySpEuykSe6+s/fmgBHQZjMyJVoFwxPozZijvkawCDySJtug9T
	RWarkEdUoSBdhfp0Zp8P002ZVtLe8aEc0KcdZiVRVlgIvfTM5U5ZZmeHIg0M1pdn7HK85q6fxTWZs
	wA7SLIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprwu-00000008j4J-1t1e;
	Wed, 05 Mar 2025 16:50:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpruh-00000008icp-3m77
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 16:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dS1pjd9BRKiYmHDxCBkDO8/FjZh16bxe2m+P5F+L0ZA=; b=JuOLmhLZ48Tmfb38yq4HS/SP4f
	B3mp7i1Kjr85Uhk3I+vyE4jJMT9XMH524EDR+cf6amD1Ly7QGmRWw4oy9EhIHw3MTbCIlXgaEQ6gz
	lqjw2NDoNpeqSTA8p3vu1HgzmLOrSKTmuSuoOpUtQGTm1Sa5jOfg2uxd5g0kQQvbhL/Rp5T12Xko4
	eOaDslEhmSrOgDHvfFs4mjBk+tFZikbttgZB68VmDLkIDiWzCm8JamsK4XcMzCCmqnFUYuk+aP3dk
	YGcnMXTd92Rs9D4cBHX1dsFOq7quj32Ce4D4vmajKscwsatdykRjnT5ysCMI8stIJ8csYER7uzxRB
	WtVduutg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tprue-00000005tUO-3ash
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 16:48:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 253F75C65EF;
	Wed,  5 Mar 2025 16:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF23C4CED1;
	Wed,  5 Mar 2025 16:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741193280;
	bh=q9RwUsahZEDzg4kp8X6VT0iwUQxY7NE3PJQxq7dtK7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ekxy6gYheu0ogt41k4byYBhS5G+HBulFW9+/8nNtHsUEpaPQzVOLHbNwBNQpBsGw1
	 Lzcd5JprYDUUkdqDdjHeKwTAR3egKNc6w1ijwkEqKdF6R3R/GylpaFbwx4WV4qOPDh
	 PLpsU3jz+VwnZxMSJViOKAN+d524dJiTEClfQiOoGiuIMHzl7N6M95zHN3ys17K6Vq
	 L+tBaPLWV6AbJDbOINBy/E2uovpIta2UATL4CFIzYreKNPdnLFLRQXLg2Vk976H0tZ
	 yW7JtQksdVCo7do/dY7B5mwoaiyObB8LqHJiCjp4llrX+RhCOnnnrB2ApdUbjcLssY
	 9wKadFzvDCdYg==
Date: Wed, 5 Mar 2025 10:47:58 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: jic23@kernel.org, catalin.marinas@arm.com, linux-iio@vger.kernel.org,
	linux-pwm@vger.kernel.org, olivier.moysan@foss.st.com,
	conor+dt@kernel.org, wbg@kernel.org, lee@kernel.org,
	tglx@linutronix.de, krzk+dt@kernel.org, daniel.lezcano@linaro.org,
	will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, alexandre.torgue@foss.st.com,
	ukleinek@kernel.org
Subject: Re: [PATCH v3 1/8] dt-bindings: mfd: stm32-lptimer: add support for
 stm32mp25
Message-ID: <174119327848.2121305.11563216194052431018.robh@kernel.org>
References: <20250305094935.595667-1-fabrice.gasnier@foss.st.com>
 <20250305094935.595667-2-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305094935.595667-2-fabrice.gasnier@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_164805_166026_BB4CD136 
X-CRM114-Status: GOOD (  13.84  )
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


On Wed, 05 Mar 2025 10:49:28 +0100, Fabrice Gasnier wrote:
> Add a new stm32mp25 compatible to stm32-lptimer dt-bindings, to support
> STM32MP25 SoC. Some features has been updated or added to the low-power
> timer:
> - new capture compare channels
> - up to two PWM channels
> - PWM input capture
> - peripheral interconnect in stm32mp25 has been updated (new triggers).
> - registers/bits has been added or revisited (IER access).
> So introduce a new compatible to handle this diversity.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in V3:
> - Fix yaml indentation issue found by Rob's bot
> Changes in V2:
> - Use fallback compatibles, along with stm32mp25 specific compatible
> - trigger identifier can be up to 4 (e.g. from LPTIM1..5)
> ---
>  .../bindings/mfd/st,stm32-lptimer.yaml        | 40 ++++++++++++++++---
>  1 file changed, 34 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


