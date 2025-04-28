Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3F7C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 22:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/kdZu5lZfOsUl8WyU/NEfAG1LYXxMtniBa4sTIJjM8=; b=FvtJvGJ1AepCfCNGH6b147m9f7
	SRfMLYKvZIz5QcWN9EiPKYSH98ZpsIWPuWnnzbeeynJiDnsuU8VtzqAA9VW0oMsB74nBV9YsUC18M
	FjBRB43LEOlYcDL+8U/g4SxzkpGpNG9aQsvSqfNbClr7HiXwB+P7xGurbeJ6M4HdSChX4Y3ZI4X+o
	svmQa/IYMmfMixNL/qbSS96P2L6+KITny88EMMqpIEn85A4iB/fZkujmkUoDkQ37WHufosaTTuvTw
	rLr2MzNDOHQ0NPdpyQXbfSoB8GWhMXySZROY2QZR1NTks/VUQBbPCOsUbwskDgPpTEMQ8SoF8x2Wz
	0pRJy48g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9X6p-00000007jbi-3AWu;
	Mon, 28 Apr 2025 22:37:55 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9X4q-00000007jMT-3Dxc;
	Mon, 28 Apr 2025 22:35:53 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-476a1acf61eso52577931cf.1;
        Mon, 28 Apr 2025 15:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745879751; x=1746484551; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X/kdZu5lZfOsUl8WyU/NEfAG1LYXxMtniBa4sTIJjM8=;
        b=VKuZP3AWR8B9oXmyeR5BYoJDtDb+PraMmlJ+mxx4IJ64VcarJnx3v969WTYzDvipoB
         InIozjW9axXIDSwa+kWpfg9/hMm2OS5S9ZeeuXsYeEUKxUCivUscXx7B3Yblze+ksoI0
         FiEZA2Qtk3u3/mQ8odND4ZAcxrQ83V8JFGPYL6OKxZjgaAd79l/nuPUINePpzHL1r1HL
         HNtJOGkfU+NovI+TE1IaC4kNuKizp6+1xXjopqneZl9bhGfYWjFMu3nCfLxDHgqmDxmX
         mwmztg/CsJ9lcg7ZfvtpUpi3Mgivofh8DHRYDtiKnJngMlE/GflIyo+YmGN3XhyvMPSU
         dnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745879751; x=1746484551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/kdZu5lZfOsUl8WyU/NEfAG1LYXxMtniBa4sTIJjM8=;
        b=i7FS3vcrxsklXwA6IpU2StTlsgw6H5qm0lXXhufr+DjOoN8wa1UIMaOf9KyoTckd0+
         T4MEqdbtY5TXrz35dUjOoXR4SK5ZKUEfBFdC6NvPrRqpKDgrvA+CgvC2Syw2/s3cHMkm
         zSE1oAQvBOhMeUAmQQqkizhYdoM7EUOB62DyvokwZyrifK/CcXUYF+OrVuHqHBg95vKK
         897+rJXdA9KxIXJDKfzBUTrEyxI1IP5MVN+cMcy5VVA6aXThi7vzdudbVSxkVHPr7M7/
         v9xg3OFhMY/EDJM+7KHPCbQm3epM3ckljWiJwpHzBR/L9umIdhNylqQPm08XdJlxU4FI
         xsPg==
X-Forwarded-Encrypted: i=1; AJvYcCV9Nl8xCWzSr4s3hYy3/upHUt2SCqbMZdSrnRJt43DDJQL8KP6QLb1ytrTRhJbj/xPzP3jJIdkn1416myU=@lists.infradead.org, AJvYcCXU6CUcRunjWPzp/CT64Xh+4R4QoV3+3I12Qy+lkzXP46pY72i+vctHa0L51CgVn39X8JniZN0AYBIYObaBKiOg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+wTBq53QHufH+Rcp47WRHP1ztIIMHCkxWU4RV8cpP5+85JjHJ
	o9Br8yJAEMcUNUwMGhVoCyzEqo0clCxXv0S2VWsOrNdBqIB0qVb4
X-Gm-Gg: ASbGncteUi7syNZBhg5QoVVH9metcnWAdHEWtC1UePQja4orhReD0brTUO1boa1eG5R
	8/hdiFlybO4s28VSZ8OHkU/DfB/yu69ogHSIXJl5GyUr4nLmqPae1KYFkw6AUbALb0fzvNeDWr1
	EzBoAFjTe3tWEFCDHZPqT3VUpYHGNZkZwaxixUIe0QqxddDyDE5Kg8BBZ0zUjS3OXqIAH5/33im
	794R5UQx049dRPu26p7IKXpW86fa3lQO3sChCNMwTR5XSf57hPYdONF2AS3HCrUxcqpC69JmQ3h
	yP8LhX2z7MFVpSYV
X-Google-Smtp-Source: AGHT+IES8nRDFDh7fd98mGNj9hoSaWm8gTLVtNkYmiW/3xaJ8gUBVINczQj4gDLHG/EkZEFrUlpH2w==
X-Received: by 2002:a05:622a:1f17:b0:477:6e8e:138e with SMTP id d75a77b69052e-4886ff51bafmr17662271cf.2.1745879751334;
        Mon, 28 Apr 2025 15:35:51 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47e9efda2c0sm73859921cf.20.2025.04.28.15.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 15:35:50 -0700 (PDT)
Date: Tue, 29 Apr 2025 06:35:36 +0800
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
Subject: Re: [PATCH v5 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
Message-ID: <6wlgfvc3rkhv4s3ou67fjl6j4a26vocqck5727cg6muxlz2erj@kivndcjcqc7m>
References: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
 <20250316185640.3750873-2-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250316185640.3750873-2-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_153552_807963_331EFA68 
X-CRM114-Status: GOOD (  17.42  )
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

On Sun, Mar 16, 2025 at 07:56:31PM +0100, Alexander Sverdlin wrote:
> Make the peripheral device tree re-usable on ARM64 platform by moving CPU
> core and interrupt controllers' parts into new cv18xx-cpu.dtsi and
> cv18xx-intc.dtsi.
> 
> Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nubering
> into "plic" interrupt-controller numbering.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> Changelog:
> v5:
> v4:
> - cleanups dropped
> - cv18xx-cpu-intc.dtsi instead of cv18xx-cpu.dtsi+cv18xx-intc.dtsi
> v3:
> - &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint nodes
> were moved into cv18xx-intc.dtsi to reduce code duplication;
> v2:
> - instead of carving out peripherals' part, carve out ARCH-specifics (CPU
> core, interrupt controllers) and spread them among 3 SoC .dtsi files which
> included cv18xx.dtsi;
> - define a label for the "soc" node and use it in the newly introduced DTs;
> 
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi       |  5 +
>  arch/riscv/boot/dts/sophgo/cv1812h.dtsi       |  5 +
>  arch/riscv/boot/dts/sophgo/cv181x.dtsi        |  2 +-
>  .../boot/dts/sophgo/cv18xx-cpu-intc.dtsi      | 54 +++++++++++
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 91 +++++--------------
>  arch/riscv/boot/dts/sophgo/sg2002.dtsi        |  5 +
>  6 files changed, 93 insertions(+), 69 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu-intc.dtsi
> 

It is a hard time for now to do some change across the cv18xx 
series, and it has become a mess. Due to the fact, I think it
is time to do some work like split some device (clk, pinctrl,
plic, intc) from cv18xx.dtsi to avoid override, and make room
for arm64 device.

Since this change contains some change similar to this patch. 
Would you mind me to take content of this patch, and add you
as the a co-author?

Regards,
Inochi


