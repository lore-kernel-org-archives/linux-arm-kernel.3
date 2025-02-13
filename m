Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BD2C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 08:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=istdbGK1FVONl2XrStI4CyRq2KOV4gHFfWaap2zurPg=; b=2QWPZnkAZwndYpn7rZV9SuTZKQ
	dWTv05lyniExJm81Hzxjs/ebbjQOYwxTBJg+JsbZrgnFv4bruTWHlCthynSv/wnNvhDzOV4P0EvNL
	MlEyMOZbc3/AlL96EyrR8MwWs7fd1Y9PS/1/FLghCK4W5bgXTz3kti6bRTfRH4h7CHIc+SQgN2hwu
	MkVkJ5cYOac6TEuyevCmbMN2lKXigIDhkolfUDsBU1mXYp1FTCkY9JkTB46ZQ380NQ/X7RxZ3pj/9
	aKT8HKGE6aknnxTRgEAv2X9/n4NVRkj0wvwTZU3LpKY+vkDcE1UZldV3Tlx3Ttt6StwFQL5ITuWJt
	oPI+rNHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUpT-0000000AJjD-3OzF;
	Thu, 13 Feb 2025 08:44:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUiR-0000000AIXk-0k9M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 08:37:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 131845C4D81;
	Thu, 13 Feb 2025 08:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72666C4CEE6;
	Thu, 13 Feb 2025 08:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739435818;
	bh=JVjamHUOMR+z4fstZ7q+wxFcrko27vWOwkE+Hpff8QM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fhhCQOg4+qgB6D+JCwx3cFfcXDYidpmtX/QIO34q5fdPwiElEh6EO7dpi4Ro0qbxT
	 ufIBwk7g5Pa5Nl4ifL5RPDUDAxIOhOBsKd49LI9ILyVMRnuxfry++9IzDxg7aD/+sZ
	 +JyeXyuJEAV/LIOcfFmm2Ku4xAUqyYv1C53jBmg2wofcNQKm0qvY2WGaLLFnAH0t2a
	 dtG1kUClU9vnzA8ThAYy4AjUvYy+U17CLICxbeZgeUKqDJVJi5rNJ3UMDGJygjUHAJ
	 gWIfT3TTsiiysm8dfakQuMqoKGX00SeOIAfHoPlvpHedMShnXkQnv1AgqFmFqcrFeH
	 Fk9m3Rw6cgwUg==
Date: Thu, 13 Feb 2025 09:36:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, asahi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU
 PMU compatibles
Message-ID: <20250213-ruddy-pumpkin-lynx-d6ea1e@krzk-bin>
References: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
 <20250213-apple-cpmu-v2-1-87b361932e88@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250213-apple-cpmu-v2-1-87b361932e88@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_003659_267344_9E1D0387 
X-CRM114-Status: UNSURE (   9.09  )
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

On Thu, Feb 13, 2025 at 01:22:24AM +0800, Nick Chan wrote:
> Document the compatibles for Apple A7-A11 SoC CPU PMU.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/pmu.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


