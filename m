Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD04C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 08:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlftdSJ2OTiYO7JhG/aereIMge+fk3H4F1gekbfG06Q=; b=3xvOG2tLywyFnUKAcQak+rhaXP
	nib7zJlKTqMbhOJn4jiu1Y1UhxWw6/9Ba5PhMAjY2xkFXRuoWFDfyWHGuQVmbY2sUW4LR05bY/lpY
	ZseSufWMEo+rD8p7+VwLkZ0xyiPpeUG/6E1JCuBq/NAfFBom7SLSTjlprv6C7z9VqbA2A0Kpgdb9W
	ExZTsfXoKNwwuQMDDzjWq8iRh3tRF8kmPPn6KvII4WKcnGk1YNxElfUUtfwtB7fh/syZhl5D61/5J
	Ma4fukM30sYMhY58Q3EDHatnToD1oMHZMeCG3Cxlea407beWe3Cl3jytHqhXS7vsfnsHIk2FuCvbI
	EPlJY9Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uer5s-00000006p2q-2dUr;
	Thu, 24 Jul 2025 08:14:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueqrT-00000006lvA-0nyo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 07:59:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2A26BA55FBC;
	Thu, 24 Jul 2025 07:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F08EC4CEF6;
	Thu, 24 Jul 2025 07:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753343969;
	bh=2sfm/hHQDAv7ek2SA9VP2HbWZvRGZDzU9Rn9vZgZh/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M5k8s8ej1IMlqen1tEoYHXBV+DQZuvo7evitXpUOEh4NoSM8WxbVHfGlkP7NhY/V7
	 fiO4N6T4JpMak8VYK1PfZhitjqE/tl3bh7de3pRfWKKipHtesSiCPCWhRSAg3E6bNU
	 YCWYyxqyVZhq1Udhv+02PVX/OcUtZYcekM4r1sP9yb9zsbs51noSpzgIatXMRF2MOl
	 XXoxEZRcwmm9kP8Ur0dOh3TPk516gufwWmaM2quJM2j0LkScKuBBT4fxEu59HBYLK/
	 PiIkE5Rk+bh1h6u1GPZ4EK0WONhPpmYj+Qf6ByhKZYNewvpJN1Yn+bOTtl/U4AECI3
	 razYpVeLYPGsg==
Date: Thu, 24 Jul 2025 09:59:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shubhi Garg <shgarg@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: rtc: Document NVIDIA VRS RTC
Message-ID: <20250724-peridot-chachalaca-of-progress-a9f2ee@kuoka>
References: <20250723130343.2861866-1-shgarg@nvidia.com>
 <20250723130343.2861866-2-shgarg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250723130343.2861866-2-shgarg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_005931_297992_ACD43E90 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jul 23, 2025 at 01:03:40PM +0000, Shubhi Garg wrote:
> +description:
> +  NVIDIA VRS (Voltage Regulator Specification) RTC provides 32kHz RTC clock
> +  support with backup battery for system timing. It provides alarm functionality
> +  to wake system from suspend and shutdown state. The device also acts as an
> +  interrupt controller for managing interrupts from the VRS.
> +
> +properties:
> +  compatible:
> +    const: nvidia,vrs10-rtc

Nothing improved. You never replied to comments and then replaced one
redundant word into other redundant word.

Respond to review or implement it fully, not partially.

Or add COMPLETE bindings, not partial ones. See writing bindings doc.

Best regards,
Krzysztof


