Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED84C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 02:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6JdwJlEWwWtngse9JGszpYE1mZus0TKH2ovIgjd1RE=; b=lfj4cuA+jLqxYzpIft0KoY/ZCK
	8DcapLHfvyH3mZ+++8ZbYd/VmgBVKqaTone3xjNTYjJBg9sOmvXm5imHKqHUIxZgkd5AH+++szhEV
	937Y9mD1AKy2/Q/ATDqT+1/LVIGPyqgXLMjJVlv360PZDluebirAJzG+3DcwgAxv24RJNND0nUYLb
	TVvdDbTH+9PhjCNZ7Os27MZRRBAWMQXl7xcgtCrlBx6SvpLc6egGIhCjNe8HrCgYlEtDxIuq6FuBA
	GEF2kas3Co8SLl4XOV7/szOE8wUmF61aqy8IexBbe2KmDLeT50HOMyM8rDaZWomsVHuRmZTndBzbI
	P5zfhJVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOoLD-00000005bc1-0Zul;
	Tue, 10 Jun 2025 02:03:55 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOoIX-00000005bJe-44Pp;
	Tue, 10 Jun 2025 02:01:11 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7c5a88b34a6so482405085a.3;
        Mon, 09 Jun 2025 19:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749520869; x=1750125669; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w6JdwJlEWwWtngse9JGszpYE1mZus0TKH2ovIgjd1RE=;
        b=boT4B9gsMN6pZP+thLScyfIGo57EoUCYMSfKb/X54fYNSOFhAFdx7BTwa5VE9mx+ro
         HFtO4BokAi+nUkSmskRv+srG+JbC/fySSsFDcIZDDcoBUkUgo01Uj4CfNJPsa9HX5sCk
         nR3Q4/AshXRs4piw6+iXS6+B7V3kjDjPW2Ro98ABxFHzg8k3lTMamz3TtB6VWkgD6Hr7
         XGAj/AtKtLnLD9GGbuZVM0pC69abkxOUWq7nL2KsKyMcYloYmmj2N3lOvbT6d/GD3e10
         6wi3/XzvEmox9zPWSBFi4EAHjSSWb7IuKtXwFduBVlhcjXOIQiv72SrZB9XBkwKAVg80
         FwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749520869; x=1750125669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6JdwJlEWwWtngse9JGszpYE1mZus0TKH2ovIgjd1RE=;
        b=p2zi9aDNEMbp3rsLyxCgGnXdacRf+uwWQNaZKhT4GzY/8O4DXgpkx9t10JlV8r3BNj
         3HcdYAZNd19+a/vzFZ+/icPFQnraR7LOlKvdAJ+nXJf2p/uTnTplmmGAZZ7Nce2chrrr
         1MExDd2V908hgiyBzqpKk/UGJZ4Qe29vDqxoahiFoFeBytrwJIzThASqzAYBKPhqbzBN
         jC+jJ/uDo4H88kiqncFgYeLWQMo6yxIVxK2sgy6WVCF50qVyv0+P1jCELyXo+EPpWqWl
         BzAF40uuGLx/jrnxrSwRnvgoA/Ws8h2rdKk42rKDgzglz3IRUROiaC1MjCzDkr3qyPLs
         D+YQ==
X-Forwarded-Encrypted: i=1; AJvYcCV30aVw57hExly/JtG3GslNmz9A4LRDmLyFA+XLdIpG4bbOeH4IQbgWY4uEVV0Wxl5P+dtFjtSnxwhqSqg=@lists.infradead.org, AJvYcCXKZejPyrTspLhGBiE+PyrbVhM/VOl9jKKnzT21jUbQacLfqN0QzzE/zm3ATTAggXUiRQFVMmidU2dRbs//qI1T@lists.infradead.org
X-Gm-Message-State: AOJu0YzgUyeWP9FUQ2JqCLFlfYJOiVXKKvA7vt/EKtOKTt44zGJDu7Iq
	gI+EYpu/FsbbcpWZX/Gdvrb78lMCNyp+Ih15OkrgN2T7obJZChQInEV0
X-Gm-Gg: ASbGncuQSoq8/ujdOT+l6KwcOezMiCc2E+8QVtnU/oDrbTQ2GyuBk0YMegH6ioIHUSl
	NA/ot9eP+hjd8edGaFLMqWwzTj6lHWgf1xBHSrSvVzJZrUUG+J6z7plqcfVh0xScySMZw8LMqYj
	TKz8j1ZMTaM+0zS+hnCW1SYMlipnhq/0pqWV7YKL+Hj6FK5huIlQZgVxdZBy1/kyLpRLIU5IsfE
	DBnCAjvnBjVkNsMopQFu9TrnUeJBNM+JtlGQ28PXhRZ2QU/itwJ75ZEBNQ1HZsQBgJ9VxRcHVla
	kIv6nZFxuBI0zHMwW6vjWwyG5G+ftkQ/x3nMLA==
X-Google-Smtp-Source: AGHT+IH15GV3DBze0O0Pg4+wloDqugMihWd6D/DIzMiu1G03qL/lbAtUUB6hL47UJJsPSF118+iHFw==
X-Received: by 2002:a05:620a:4151:b0:7d2:279d:c18d with SMTP id af79cd13be357-7d2298ec94amr2846349785a.36.1749520868837;
        Mon, 09 Jun 2025 19:01:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d2513357dbsm625576185a.13.2025.06.09.19.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 19:01:08 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:00:02 +0800
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
Subject: Re: [PATCH v6 0/6] arm64 support for Milk-V Duo Module 01 EVB
Message-ID: <yavt4eztc4n74h55ilqbw46df6hxh4j3uwuefbzcsx7vxezrnn@5mpll7lymyp4>
References: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_190110_042159_84123A1E 
X-CRM114-Status: GOOD (  26.44  )
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

On Tue, Jun 10, 2025 at 01:41:11AM +0200, Alexander Sverdlin wrote:
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
>  .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++
>  .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++
>  arch/arm64/boot/dts/sophgo/sg2000.dtsi        | 91 +++++++++++++++++++
>  arch/arm64/configs/defconfig                  |  4 +
>  8 files changed, 226 insertions(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (81%)
>  create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
> 
> -- 
> 2.49.0
> 

With all change I mention fixed:

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

