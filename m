Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284CAC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 12:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGCDPYHLD2sVpKzQwhCQJA73K42vpqoI0JgYqKeQ2S0=; b=PZCsFZAV2uKMZk+lGKNo1QNdlj
	boAYLOVBKzolOEa3Ri9eNHNQsTZXMCLnrffKRXCrLYIIrr+7/Rf+cRPLoPEfVZW9WOZb1W0wlTp16
	EkdmbpAc7vSNFteStS+b2gIVaRhDoLfsBYkm/oVvd0In4ahqf4j+lckD9TNkmq3v3j/bg024IC4JR
	znZGbTW7UYf1c1pWthd88sTt8HKGfjnGhCYWSJQnLRRHLFWJcEEHdOnGXOaukbR1dcFWaXZAjglf8
	cRnszrYjuZtkXGWwgMImy7fZWGuOoD+6nDi7GgrakVnh+KtAbJMQsc/kiTK5dZUq5WCtOyLfRRZJW
	A2Eoe50A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGA5-0000000D9Sf-4BwS;
	Wed, 28 May 2025 12:45:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKG29-0000000D8Nn-10ES
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 12:37:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD8415C40C0;
	Wed, 28 May 2025 12:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DBEC4CEE7;
	Wed, 28 May 2025 12:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748435844;
	bh=eUA0BDfpbYKOu7zRQ2U4yKvk2szX91xJ+8ngKIX4azc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jazg0UmCvQ2wV++PyxuX/XABwG1uLNgiyt9I+MfXiFIAD6pOYtbF4Vr79wA4pE8hH
	 fEWhbdCgSvmh43nXEUtRK0Amq7+8UrVQ1mNv9fnTcHQ8tHwLWG1Rrj3tdHYIv1KcEe
	 7gzDcSAYWtZR9gz0Pd9Y8qEHAVXKt5H2eB6SegyOgbvfntjP49qrHfgqsS3DJa6WOa
	 QKi4t8b5Ve9hmIIBvuIbFEp0EoEYmPdepve4eFn0mlP/GGxKoLr4JyvAnBW05UvBXG
	 lTngUL4DUoFWPpS2hgMdeijYRw64b6suDmK5eGzP5kMCIIUqvS5fAhHHZUHQJ+YEvq
	 QlfAE5S3nVhjg==
Date: Wed, 28 May 2025 07:37:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>
In-Reply-To: <20250528105821.158140-1-umer.uddin@mentallysanemainliners.org>
References: <20250528105821.158140-1-umer.uddin@mentallysanemainliners.org>
Message-Id: <174843567453.3636707.847885249011261450.robh@kernel.org>
Subject: Re: [PATCH v1 0/1] Enable CMU_HSI1 for Exynos990
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_053725_320377_190D5053 
X-CRM114-Status: GOOD (  15.84  )
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


On Wed, 28 May 2025 11:58:20 +0100, Umer Uddin wrote:
> Hi all.
> 
> This series enables a new clock block (CMU_HSI1) for the Exynos990
> SoC. This clock block provides clocks for the DesignWare MMC
> Controller, PCIE subsystem and UFS subsystem.
> 
> This patch depends on the following series:
> 
> [CMU_HSI1] https://lore.kernel.org/linux-samsung-soc/20250528105252.157533-1-umer.uddin@mentallysanemainliners.org/
> 
> Best regards,
> Umer Uddin.
> 
> Umer Uddin (1):
>   arm64: dts: exynos990: Add CMU_HSI1 node
> 
>  arch/arm64/boot/dts/exynos/exynos990.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> --
> 2.47.2
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250528 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250528105821.158140-1-umer.uddin@mentallysanemainliners.org:

arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/clock-controller@13000000: failed to match any schema with compatible: ['samsung,exynos990-cmu-hsi1']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/clock-controller@13000000: failed to match any schema with compatible: ['samsung,exynos990-cmu-hsi1']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/clock-controller@13000000: failed to match any schema with compatible: ['samsung,exynos990-cmu-hsi1']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/clock-controller@13000000: failed to match any schema with compatible: ['samsung,exynos990-cmu-hsi1']






