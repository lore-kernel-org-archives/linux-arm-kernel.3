Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA584C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZacv51gxt+tIIzFGsfReIvqxR8pwOcZnpHg3jeGf+M=; b=tlfq0TVYoVtHMlDg7ekncsBjTh
	MsHyMeCJWvAltXqWEv+jTAoBUN8yE9+L/9Orgxlsr6UgV6HIBvIW2xzCYlsieT4j+xhX9UQpo3bSO
	pCeg6xR8hCLVlwY5WJWd5iD3nTfChEWQBgVNCqwxlzn/qUcFFpm4kQuvxcjfRNBeywuWnmbrG7pcR
	VZMQUeTVqz+UsBLUNvSdjqgI/7xN+IGDtR6rdihPk2QFMNhG8XfhNVBcOwLuAAxeHppSahuWt8L6O
	Lgp6HXEbRZmda0gCdLeDuDmczLuo9JDP+Vq+d6FyDypjBYeZKMBJTdrc8ysx6OQR3n8+eO/ePBSv6
	bIwCANhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nd1-0000000AEEm-0oHi;
	Tue, 29 Apr 2025 16:16:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mC4-00000009zjU-49ad
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 14:44:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 42BEE615CC;
	Tue, 29 Apr 2025 14:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14C7C4CEE3;
	Tue, 29 Apr 2025 14:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745937860;
	bh=4rr0S3mSjoui4D8DbAX2wTbORXf1cAmtg5M9HmjHuhU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=d3YUk0Ov4iLTp8IvzNdV/ZNp8XRfU0tpb5oO11Ch7TeqYX980y0eKGMK/tSkiZdHG
	 vKKfoEdkR1s+NYjN7a+AJ5LIM2s8BnXPc1k9zkOx3UAgsn7GdLXMskG8pcyMg6PZjr
	 hnW+l0awaOZdLhL+FF6sOcWJBst8YDQPRSyQW//eEcvnLFRkEHcFbRJrI4NtMZ4/5s
	 9oXWECSmFA4F6IcyherLCLXt/f8gFvTWDlZX+lIkLCg2rPK6y/rBhahA2HfK5II7y2
	 TITnqai63Vv44JqE0pz38xD3AqDqqBaPCzJM4ILcDM3e08c2AK0fAgXs+F+HIJjvhE
	 S2Zreml59gaJw==
Date: Tue, 29 Apr 2025 09:44:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
In-Reply-To: <20250428-upstream_omm_ospi_dts-v9-0-62522b1b0922@foss.st.com>
References: <20250428-upstream_omm_ospi_dts-v9-0-62522b1b0922@foss.st.com>
Message-Id: <174593770361.4057747.4332961101566967821.robh@kernel.org>
Subject: Re: [PATCH v9 0/3] arm64: dts: st: Add SPI NOR support for
 stm32mp257f-ev1
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


On Mon, 28 Apr 2025 10:40:20 +0200, Patrice Chotard wrote:
> Add SPI NOR support for stm32mp257f-ev1 board by adding:
>   _ Octo memory Manager node in stm32mp251.dtsi
>   _ OSPI port1 pinctrl entries in stm32mp25-pinctrl.dtsi
>   _ Add SPI NOR support for stm32mp257f-ev1.dts
> 
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> To: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Changes in v9:
>   - split patchset by susbsystem, current one include only DTS related
>     patches.
>   - Link to v8: https://lore.kernel.org/r/20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com
> 
> ---
> Patrice Chotard (3):
>       arm64: dts: st: Add OMM node on stm32mp251
>       arm64: dts: st: Add ospi port1 pinctrl entries in stm32mp25-pinctrl.dtsi
>       arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board
> 
>  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 51 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/st/stm32mp251.dtsi        | 54 +++++++++++++++++++++++++++
>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 32 ++++++++++++++++
>  3 files changed, 137 insertions(+)
> ---
> base-commit: 65954899a157832f68536b488194cf698248a26e
> change-id: 20250410-upstream_omm_ospi_dts-04b97cc02e52
> 
> Best regards,
> --
> Patrice Chotard <patrice.chotard@foss.st.com>
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
 Base: using specified base-commit 65954899a157832f68536b488194cf698248a26e

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/st/' for 20250428-upstream_omm_ospi_dts-v9-0-62522b1b0922@foss.st.com:

arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: /soc@0/ommanager@40500000: failed to match any schema with compatible: ['st,stm32mp25-omm']
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/ommanager@40500000: failed to match any schema with compatible: ['st,stm32mp25-omm']
arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: /soc@0/ommanager@40500000/spi@0: failed to match any schema with compatible: ['st,stm32mp25-ospi']
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/ommanager@40500000/spi@0: failed to match any schema with compatible: ['st,stm32mp25-ospi']
arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: /soc@0/ommanager@40500000/spi@1: failed to match any schema with compatible: ['st,stm32mp25-ospi']
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/ommanager@40500000/spi@1: failed to match any schema with compatible: ['st,stm32mp25-ospi']






