Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023C1C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GIyxzcyxu4KX8Kz+gSWClSAe1DI+cNRMQZqfJq0aSs8=; b=F0mJrJ6fIxtEbZU4HaVsRLex+C
	TZS143HnD8r3/KINM5vGMsnf1wRHDjR8MOhc1UcJFeov77MI/EWZx1lmmY7OstutDeJ24Xe4nKWch
	44ZS0KNj8XGMayartgeUH2/gW7QOSEigl5RdqePjaemawsTOEAYIiQW/cSLW9zJS38ZUhjgNG3Aze
	U8eMy+DyXCN2Bx3oo1xzHtv84TAFb1iAV0foC4HOrzK0WjjDr6KBqyHd74HBuHesVpj5F5avJXBtb
	ROVzAUP7x3/TaHGHW3RLCitdljr6tUf2HTmtzzTgernvKGHWUZJmP5G8yi/mrj5mUhkuBQYDd537t
	lmbFr/XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYvG-0000000CAgJ-2Nk6;
	Wed, 22 Jul 2026 15:31:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYvF-0000000CAeq-1sFu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 15:31:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3334E4075D;
	Wed, 22 Jul 2026 15:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C301F000E9;
	Wed, 22 Jul 2026 15:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784734309;
	bh=GIyxzcyxu4KX8Kz+gSWClSAe1DI+cNRMQZqfJq0aSs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n+340JMPz/zTCAh5G/JqDfLBZUH2uIZvcYJqmXeoeSYOUvEnNmO7OqyT5NDw+0p6e
	 9Qsm5FGpI049dzqa+orfFdWQ6A2neWodoftVuqU6dmX4q+6PCwk3ojSq74aCyn3Q2m
	 EYYPRbA2KlSOjTOKmKgcsfx7CVWNjpAK48jzG2PdnYCzu7epepfZvG1Yi31hZnNSoo
	 t1Wx7EYsuut7tejcms0vK6w00eXUbKyXjOsYkyN+xhsgDktMQC5ThtmZLURtFqqoR7
	 gvJojV+goKw0euj96kaaEUATb2Ypzcz/QHaAEcy8Js6oM09YzOARHmks2fupKjqmq8
	 YAI4FuFhg7d6g==
Date: Wed, 22 Jul 2026 10:31:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	kernel@dh-electronics.com, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: stm32: Sort the document
Message-ID: <178473430598.971819.5105666655246477441.robh@kernel.org>
References: <20260713232440.120352-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713232440.120352-1-marex@nabladev.com>
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


On Tue, 14 Jul 2026 01:24:14 +0200, Marek Vasut wrote:
> Sort the document, place STM32MP21 before STM32MP23, and STM32MP23
> before STM32MP25 . No functional change.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  .../devicetree/bindings/arm/stm32/stm32.yaml       | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


