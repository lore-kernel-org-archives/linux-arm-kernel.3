Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65980E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 15:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zf9ScLvIz0iPTPPXoMeWmH83VveQ1xWkqoNIgfP6Zgw=; b=XIsdOvWLqGYzk/7XOwHKRhgxQk
	sZcK3qaVqlHg7y8PEV6FuocPZ8o9bWIRwPi68VV6hWykNErHkhx3C56fKfPn3btQc9EDd6HXmtR01
	b9KqMgcxBnuxhgb/NwEgBH/NsPl5xJzfMQfdM1hvmVnh7X3Z7FzLDzxHqP99aTcLX2daPLlbau3uU
	Q9mZLmp0wxmEhO1TPoEhU1qRWcvKuiY81RXhbJ6mR26M8u7+g97QKHMjaxQDNjeyPpA3KDvQVreNw
	HvCiRQzKWcMSuS3lr+RMtwQbea+zR9Nqr0H0pGshhVg6klHRcBNrXfGcd/vDqIxTcQBm1zIRB6X9N
	+cvylPLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjVw-0000000DGIa-1dhT;
	Fri, 03 Jan 2025 15:23:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjTV-0000000DFZZ-34kq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 15:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EBC175C6439;
	Fri,  3 Jan 2025 15:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6355C4CED6;
	Fri,  3 Jan 2025 15:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735917632;
	bh=OQotMPthgURrK4NyFLK+Ka0bfbaNpftNzQuniOt335w=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=P+zUBjVHiN5LrRa9QQqPpsDY9OUYrl1tUTMJ/I3TPaUNqhpdtk6zy7AMrn44a7Wzf
	 5cBMC8xQZQvCbDK9JXVBHfYeoA2Y5aWBY8vZNYUi4KIw2zeIq1IpysKmkdAB1kSMFe
	 Q9ft+8yR7OfBljWqR8AffuSQ2fOq1I6nUlEiZ7CrHmPZvqQB2sMoQKSMnKaZ94xYRH
	 smPROd6m73XnmPLXgTzmkbSzS9RqnO1X2zFZdiFxn2deJvlXioAdGuQ9Rm9XEztEQ2
	 9bFM276246cnQnJwciZwyq5GPlIOW7vZLz6NcrtOVrGnKVn3PBuCzsfZmtDUvj0woR
	 6TwN/2fbhCxCA==
Date: Fri, 03 Jan 2025 09:20:31 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Jaehoon Chung <jh80.chung@samsung.com>, linux-mmc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250102205846.223955-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250102205846.223955-1-ivo.ivanov.ivanov1@gmail.com>
Message-Id: <173591745832.2305341.4361607015231954485.robh@kernel.org>
Subject: Re: [PATCH v1 0/5] arm64: dts: exynos8895: define usi and mmc
 nodes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_072033_855828_5085E7FB 
X-CRM114-Status: GOOD (  16.81  )
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


On Thu, 02 Jan 2025 22:58:41 +0200, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patch series adds the required syscons for controlling USI, as well
> as defines all USIv1 nodes for Exynos8895 and adds support for utilizing
> the external SD card storage in dreamlte. Due to PMIC not being supported
> yet, we'll assume that the regulators are pre-enabled by the previous
> bootloader for vqmmc. (in our case uniLoader).
> 
> The patchset relies on [1]. I also expect the exynos mmc binding
> maintainer to pick the specific-compat patch.
> 
> Best regards,
> Ivaylo
> 
> [1]: https://lore.kernel.org/all/20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com/
> 
> Ivaylo Ivanov (5):
>   dt-bindings: mmc: samsung,exynos-dw-mshc: add specific compatible for
>     exynos8895
>   arm64: dts: exynos8895: add syscon nodes for peric0/1 and fsys0/1
>   arm64: dts: exynos8895: define all usi nodes
>   arm64: dts: exynos8895: add a node for mmc
>   arm64: dts: exynos: exynos8895-dreamlte: enable support for microSD
>     storage
> 
>  .../bindings/mmc/samsung,exynos-dw-mshc.yaml  |   1 +
>  .../boot/dts/exynos/exynos8895-dreamlte.dts   |  39 +
>  arch/arm64/boot/dts/exynos/exynos8895.dtsi    | 906 ++++++++++++++++++
>  3 files changed, 946 insertions(+)
> 
> --
> 2.43.0
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


New warnings running 'make CHECK_DTBS=y exynos/exynos8895-dreamlte.dtb' for 20250102205846.223955-1-ivo.ivanov.ivanov1@gmail.com:

arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/syscon@10420000: failed to match any schema with compatible: ['samsung,exynos8895-peric0-sysreg', 'syscon']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10440000: failed to match any schema with compatible: ['samsung,exynos8895-usi']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10440000/i2c@0: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10440000/i2c@10000: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10460000: failed to match any schema with compatible: ['samsung,exynos8895-usi']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10460000/i2c@0: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10460000/i2c@10000: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10480000: failed to match any schema with compatible: ['samsung,exynos8895-usi']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10480000/i2c@0: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10480000/i2c@10000: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@104a0000: failed to match any schema with compatible: ['samsung,exynos8895-usi']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@104a0000/i2c@0: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@104a0000/i2c@10000: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/syscon@10820000: failed to match any schema with compatible: ['samsung,exynos8895-peric1-sysreg', 'syscon']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10840000: failed to match any schema with compatible: ['samsung,exynos8895-usi']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10840000/i2c@0: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10840000/i2c@10000: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10860000: failed to match any schema with compatible: ['samsung,exynos8895-usi']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10860000/i2c@0: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10860000/i2c@10000: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10880000: failed to match any schema with compatible: ['samsung,exynos8895-usi']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10880000/i2c@0: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10880000/i2c@10000: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@108a0000: failed to match any schema with compatible: ['samsung,exynos8895-usi']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@108a0000/i2c@0: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@108a0000/i2c@10000: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@108c0000: failed to match any schema with compatible: ['samsung,exynos8895-usi']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@108c0000/i2c@0: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@108c0000/i2c@10000: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@108e0000: failed to match any schema with compatible: ['samsung,exynos8895-usi']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@108e0000/i2c@0: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@108e0000/i2c@10000: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10900000: failed to match any schema with compatible: ['samsung,exynos8895-usi']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10900000/i2c@0: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10900000/i2c@10000: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10920000: failed to match any schema with compatible: ['samsung,exynos8895-usi']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10920000/i2c@0: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10920000/i2c@10000: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10940000: failed to match any schema with compatible: ['samsung,exynos8895-usi']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10940000/i2c@0: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10940000/i2c@10000: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10960000: failed to match any schema with compatible: ['samsung,exynos8895-usi']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10960000/i2c@0: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/usi@10960000/i2c@10000: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/syscon@11020000: failed to match any schema with compatible: ['samsung,exynos8895-fsys0-sysreg', 'syscon']
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/syscon@11420000: failed to match any schema with compatible: ['samsung,exynos8895-fsys1-sysreg', 'syscon']






