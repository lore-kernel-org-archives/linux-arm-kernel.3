Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98576CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 17:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDVJtDVDyMNQJTy/MEwA5WQoa8FIfM295AMnusJxJg8=; b=4YJvWl7wo8S03e2zpAkdpNkDma
	l2zfCTc5kofy8lv7cK4WZWwzdBO+ovh9bf72Ic9z1Iz0WDtunsnpAtWhY3Cx1cj8TAYF/W5xv9ko0
	9UIStEmTJN1+SJdJAEVCzmSSpahlU5ojf8DmmHnXbN831o5eOdCyObPZd8sxeTXb0n5MG7ZG4sTxB
	N/lo1eq22VShgClmDMbNVoHthqcJ+8Y57myHp2ClhAX/A+BPfnKFbyO3fHtHz9pvoX70hWra0yX49
	uSHthSTH09R9tET/Jgg/cCJqhR4BWnwCm1ZLeqKyEpFiaikrFQKNaVhNXgt6Xk4dtAk2HRy+Drs4h
	1tfpI8sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzeW8-00000003br5-1gJw;
	Fri, 19 Sep 2025 17:03:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzeW7-00000003bqz-2baF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 17:03:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 112816013A;
	Fri, 19 Sep 2025 17:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66448C4CEF0;
	Fri, 19 Sep 2025 17:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758301406;
	bh=XonsKYVNSdFYHakbEe/LhsEfPPCqo2ymfS/gOBOQ3ZY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rZ0mR3poa4/HeyiSP/hLHouk1dz6EpDPOIy6nd/gEzyYNrB+ZOjkF8I5BTJk9vFVO
	 foZQsgKvISkJsbzGxpk2PtYlIlo1fmGUj0shQC5+f1YAXEXw+mvaA1NglDfxUEFIja
	 12stfNaqaNwK9+qmQYez2CE8Dii1HTyQET3psYoOuj1GPNgCt1VJFg3dsPhimxpNPS
	 3rdr3xBTH1FQtxZsF7KrwN7ll+5MUBgEK3V+yvZY1GhRbvNJUmfWkCWGA3ee07WCWv
	 eN32ORC9qaxBSfuZxnp0pV39m3qYXvxLlVpDW+WdNY3cOh/MS1O/Z0kE79xxjp81j+
	 PWbxOhRhcMW5A==
Date: Fri, 19 Sep 2025 12:03:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Will Deacon <will@kernel.org>, 
 linux-tegra@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Lee Jones <lee@kernel.org>
To: Shubhi Garg <shgarg@nvidia.com>
In-Reply-To: <20250919140217.10531-1-shgarg@nvidia.com>
References: <20250919140217.10531-1-shgarg@nvidia.com>
Message-Id: <175830104426.1375460.11123738770317069175.robh@kernel.org>
Subject: Re: [PATCH v6 2/4] arm64: tegra: Add device-tree node for NVVRS
 RTC
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


On Fri, 19 Sep 2025 14:02:17 +0000, Shubhi Garg wrote:
> Add NVIDIA VRS (Voltage Regulator Specification) RTC device tree node for
> Tegra234 P3701 and P3767 platforms. Assign VRS RTC as primary RTC (rtc0).
> 
> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
> 
> v6:
> - compatible name fixes to "nvidia,vrs-10"
> - changed dtb node name to pmic@3c
> 
> v5:
> - changed dtb node name to rtc@3c
> 
> v4:
> - fixed device tree node name to "pmic@3c" in aliases
> 
> v3:
> - fixed device tree node name to generic "pmic@3c"
> 
> v2:
> - added alias to assign VRS RTC to rtc0
> - removed status node from VRS DTB node
> 
>  arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi | 11 +++++++++++
>  arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 15 +++++++++++++++
>  2 files changed, 26 insertions(+)
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
 Base: tags/next-20250919 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/nvidia/' for 20250919140217.10531-1-shgarg@nvidia.com:

arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: /bpmp/i2c/pmic@3c: failed to match any schema with compatible: ['nvidia,vrs-10']
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: /bpmp/i2c/pmic@3c: failed to match any schema with compatible: ['nvidia,vrs-10']
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: /bpmp/i2c/pmic@3c: failed to match any schema with compatible: ['nvidia,vrs-10']
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: /bpmp/i2c/pmic@3c: failed to match any schema with compatible: ['nvidia,vrs-10']
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: /bpmp/i2c/pmic@3c: failed to match any schema with compatible: ['nvidia,vrs-10']






