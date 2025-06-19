Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D05CC71159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 06:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18Q33uiXFviW8mwo3GHO1W3hkitH238h+PF/RLg6pMk=; b=KoeOva3v30Hov2PZl38qHz+IFR
	FT4cRJa39kbNVbbG7GcOIcewgx9cJLvTZa/XxR/TXBg/UEMt0k2leGsOuKp+2L3vR7anb32ZBhvwK
	MOam1EKgkqVoTVVhxWBoXspTUyr2ZQLsn3v8Li8mYLU7kl/V1ta0f9GjBHBvZmzyWxneuBhnJFEqd
	z0BD4VZ7oNEHltCcGzdl2DZBLsUGPwBbxzR+TrWBOtJqdV/Ws4mdhNMTmFXMnSIB9uRkcfexrOZSO
	xAe9VVMRIUA1n8HCiY0LGzTV0yMuq3S2oFBck8Ht+VOIjbcGwtEyLMSRd/KxedRHGvpobxwKbi+Nx
	JWRK7kuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8vg-0000000CApP-2EkW;
	Thu, 19 Jun 2025 06:39:20 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8a3-0000000C8jc-3xu1;
	Thu, 19 Jun 2025 06:17:01 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so323160b3a.1;
        Wed, 18 Jun 2025 23:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750313819; x=1750918619; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=18Q33uiXFviW8mwo3GHO1W3hkitH238h+PF/RLg6pMk=;
        b=YgZZNsK83Yo/hacMkgyTn63NC//mZwVsSX/FOMQV+D1DovgyxS8GGozmUdW2ijKM2v
         IN4Sqj0xwEKuQEumdiO++zig8y1iv1h4chlMWt2Uhnuxc56jsfpQ4D8gwoV3rFuGZDSW
         h+zY5FThMTKRanoPkx3COzaqoJ2uZWlwfiNOT/EtFcKTODBXCmZSDSwDROHXsVmZku0u
         wUYsv0cx0CzblEQeFs28T9QunkKQvhK2tGA++feR8JktXWHuI9OQEmGoP0z6V6ks/+LY
         SrmhUr6IKzu1tSAzsWr1gTv89wMf1yWZifGEyiuFbSo+obEVfo4+hfBjgAjl2mH+++wK
         NKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750313819; x=1750918619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18Q33uiXFviW8mwo3GHO1W3hkitH238h+PF/RLg6pMk=;
        b=BZEKYjsWzW6sS/QOjtHwo46rvEpSF3x06/NKepWqie6oQqJR5Bv9lKhqh0mcJh83ns
         hACKysGvd8b0VegRiw4//nL5mtZ6N3aI6CU/0ZyNSsDtVf0IZIYbGnbkKjypiXJ0uBS7
         V/KtOCpIgLbOMeqDdQeIy9MmAVGVZtMG8FbUo/UO45GmcS/P87CSqim0VTIk+ZZ2EvB+
         cbfwJqIE+uGltr21MYxEQDR7RpxwfWvuHckvC3JYTXXDpdCgkgnuqRO4ScQAf5EYw7qS
         5upOU5Jt/MPMjDwNiSY+UWT+W9RqY4LFviWFZcA2wYL1hkdnS129MfvoAK6nhn4Jlv5T
         onbw==
X-Forwarded-Encrypted: i=1; AJvYcCUVDxq46PecWuT1J4MDfgMiyzT/7n7l5IXVA4lwFWBbgciHwoub1Zem6k1hnqyOMBtm3im88hYLRHYafEw=@lists.infradead.org, AJvYcCXjpgcuVKpN6WTeK3A3dStFukShDGObM9ClgA/gd+gQpuoIYY85Fp4SBl0qC+1LxaaOHQJmoBj1G4z4TMyszHb/@lists.infradead.org
X-Gm-Message-State: AOJu0YzH0m2Z0JvjQKkwPrzmzoNgdgSYmM+l5l2oncWt2Er1lIHfgWly
	GDircaY0Du9vhkXm9LhLHa6bP+OCAQiwcqAuO/6BgMMs+wRbzRwCUmVQ
X-Gm-Gg: ASbGncukC5QUUWCYUnIeSB2s2DmvSS+i3O8qcsOyY54kehPSnFpOmwiFTRh/Rx1gkOm
	kaP+93QzqsQSi9SDJfLeJzdEqDVOBZT4z5Pv4+Q6c1K80/JzKjJz64+zr+81d4qLXvFKFtAu5AT
	+Rbg90b55Uq9THC4qi2U2eDgSUVh1VGNS8oUJqphUYou88a1dX/TgGDfcO0eKHLR+8z7vGanrLO
	DsbgkwK5JNNOFrzo03O290W2HHRZUxtebwFfq4L6EuoxE8SGYly8rmxh9VL+EQiM0S4VEZodlmv
	9jfVt6nxwObwPn07pKhvVdC/dTu+qX+DmZl6Gj+dW7Qj5AvRb0Aa7P32oBnqEg==
X-Google-Smtp-Source: AGHT+IEXzCCiubt81RW1wi6RFEHYltK/oaPaOx3dmFCiO+oaQEWxGttGT69QR500LAaVhusnkX27aQ==
X-Received: by 2002:a05:6a20:9f9b:b0:21d:98c:12c9 with SMTP id adf61e73a8af0-22011301db3mr3894104637.21.1750313818767;
        Wed, 18 Jun 2025 23:16:58 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-748e82ec1cfsm2985599b3a.91.2025.06.18.23.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 23:16:58 -0700 (PDT)
Date: Thu, 19 Jun 2025 14:15:40 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	sophgo@lists.linux.dev, soc@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jisheng Zhang <jszhang@kernel.org>, Haylen Chu <heylenay@outlook.com>, 
	Chao Wei <chao.wei@sophgo.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/6] arm64 support for Milk-V Duo Module 01 EVB
Message-ID: <u3lfltybaxk5uwilajx3qx2xh4b6izrjzduzepbyn27sym2kqz@trabsvy4mdl6>
References: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_231659_999419_066F7591 
X-CRM114-Status: GOOD (  27.83  )
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

On Thu, Jun 12, 2025 at 03:28:08PM +0200, Alexander Sverdlin wrote:
> This series adds very basic support for Milk-V Duo Module 01 EVB [1] in
> arm64 mode. The SoC (SG2000) is dual-arch, RiscV and ARM64, the latter has
> been chosen because the upstream toolchain can be utilized.
> 
> Sophgo SG2000 seems to be a continuation of the Cvitek CV18xx series, same
> peripherals with an addition of ARM64 core. Therefore it would be
> beneficial not to copy-paste the peripherals' device-tree, but rather split
> the most suitable riscv DT into ARCH-specific and peripherals parts and
> just include the latter on the arm64 side.
> 
> This series adds the device-tree for Milk-V Duo Module 01 EVB, which
> in turn contains Milk-V Duo Module 01 (separate .dtsi) on it, which has
> SG2000 SoC inside (separate .dtsi).
> 
> This series has been tested with Sophgo-provided U-Boot binary [2]: it
> boots from SD card; pinctrl, serial, GPIO drivers are functional (same
> as for RiscV-based CV18xx SoCs).
> 
> Partial SoC documentation is available [3].
> 
> This series lacks the support of:
> - USB
> - Audio
> - Ethernet
> - WiFi
> - Bluetooth
> - eMMC
> - Video
> 
> Changelog:
> v8:
> - moved sdhci0_cfg and uart0_cfg pinctrl nodes from module into board .dtsi
> - dropped Inochi's RB tags from the patches affected by above changes
> v7:
> - dropped all reset stuff again; it will come independently in [5] and is
>   fully compatible;
> - rebase onto sophgo [6] for-next (3a8cef361be5) (almost v6.16-rc1)
> v6:
> - rebase onto sophgo/for-next (108a76779829)
> - dropped first patch refactoring RiscV counterpart (equivalent present in
>   sophgo/for-next)
> - added cpu_on/cpu_off properties into psci node
> - added reset-controller node, compatible comes in [4]
> v5:
> - PSCI node in DT
> v4:
> - minimized patch 1/7 (cleanups dropped)
> - cv18xx-cpu-intc.dtsi instead of cv18xx-cpu.dtsi+cv18xx-intc.dtsi in
> patch 1/7
> v3:
> - &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint nodes
> were moved into cv18xx-intc.dtsi to reduce code duplication;
> v2:
> - dropped all patches related to the new reboot driver and corresponding DT
> and bindings;
> - grouped DT-related and config-related patches together;
> - added patch moving sophgo.yaml from riscv into soc (to share it with
> ARM); added SG2000 SoC and Milk-V Duo Module 01 EVB into it;
> - other changes are documented in the corresponding patches;
> 
> [1] https://milkv.io/docs/duo/getting-started/duo-module-01
> [2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
> [3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf
> [4] https://lore.kernel.org/sophgo/20250609230417.620089-1-alexander.sverdlin@gmail.com/
> [5] https://lore.kernel.org/all/20250608232214.771855-1-inochiama@gmail.com/
> [6] https://github.com/sophgo/linux.git
> 
> Alexander Sverdlin (6):
>   dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add
>     SG2000
>   arm64: dts: sophgo: Add initial SG2000 SoC device tree
>   arm64: dts: sophgo: Add Duo Module 01
>   arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
>   arm64: Add SOPHGO SOC family Kconfig support
>   arm64: defconfig: Enable rudimentary Sophgo SG2000 support
> 
>  .../{riscv => soc/sophgo}/sophgo.yaml         |  7 +-
>  arch/arm64/Kconfig.platforms                  |  6 ++
>  arch/arm64/boot/dts/Makefile                  |  1 +
>  arch/arm64/boot/dts/sophgo/Makefile           |  2 +
>  .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 76 ++++++++++++++++
>  .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 40 +++++++++
>  arch/arm64/boot/dts/sophgo/sg2000.dtsi        | 86 +++++++++++++++++++
>  arch/arm64/configs/defconfig                  |  4 +
>  8 files changed, 221 insertions(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (81%)
>  create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
> 
> -- 
> 2.49.0
> 

LGTM, I will merge this patch next week if there is no other
comments.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

