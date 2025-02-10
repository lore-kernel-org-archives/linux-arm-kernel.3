Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CB2C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 05:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agclTjP7fEfHE9ZbA7+HDdh1UA82ZmbjCh5m/2fX0Tk=; b=h0ujzRG+7vgh0Z+8R9xOPDGxxT
	jYDp3mP8wacCXQuihsk+Lz+UUkVhzGg248ScgAsA11cHPBc5yrUnTsSahBK/6VClbeioJj4zS9dMn
	hxB+aCuFM+6UpdjCu7L25SWJW/U46cNOkOsPKjjCtreuoG5qYssTpvSbSPC+KWp0Kebh4aXAxrGRj
	hHv2dxuAbOy2JctVfQb/ZrfjYSpavFVQG45VNrsrg9qCYAVdWdPN0lQaLVEiUbvU76ILkdl1K90t9
	xFLcb7V0zfX1Ic6feaxb9uxEog6m8IzBo8du3HetuNrONSza6NV8kZZGMCdM/h1QCDvkGhTpf+5Mv
	izBecMgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thM8D-0000000GF4u-1zAX;
	Mon, 10 Feb 2025 05:14:53 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thM6n-0000000GEuM-46BZ;
	Mon, 10 Feb 2025 05:13:27 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-471953acfe8so5260231cf.2;
        Sun, 09 Feb 2025 21:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739164405; x=1739769205; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=agclTjP7fEfHE9ZbA7+HDdh1UA82ZmbjCh5m/2fX0Tk=;
        b=DYwd43nBEynQQAhqbmL7X1c0DokyZlisgpq+5k7lGb5kH/cHyuLSTJFBNpXQoa3qu8
         B3E5/iFcXEZnalzegNihZKcPu09MBByzWJkimpIGGLClNZQc9HbcKYLZLuti4K0+whYf
         Ifw0D56XiD+HV7gW1Ms11LLPT/fbbyCjCo+xaFLT6YkZqBOFDIpwJKAU0E7vtzF39w3h
         u+1vFBHvZ+PpJ5To1PvEJ7exSeCNUPqYIYCi0VyqZtpj6B5ZLQ+HktQWiGtrWGMyhWWZ
         PmX/Jn6zYLY3/O5KW1K9Dp5MPvBCffzSxkKRN5DFLb3IEKo5Ufr+jnsrFaieYEh07zdv
         Mb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739164405; x=1739769205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agclTjP7fEfHE9ZbA7+HDdh1UA82ZmbjCh5m/2fX0Tk=;
        b=rxYTejjYHhstNSy5ll7pSMkmGeRI9QiJw6EUC50RW5hJXExUI0t+nETYzY6r4vTDuy
         DfAYfq5PfJzyTrLTp6CIpW3nJ/KWe9K2pGPdhDyF+QRz2Uuwy+f6qDMxE6y5Ed+QlZCJ
         NqBq/m63LKo6ulcHjnhLdrQbfsXVT7I/3CJX4YU8ys8OR1M5pH+0K3Px177voWFowKvx
         Qv9imwmNecI/nHYIh16G/KYzXjaPJ69NDbxIK6mejMiKepijcTTFhlMDf3CTy5MsfhQD
         rnn/vAnXPjbp+ih6snAY/J6ZdmtHtBEZkJQnCRKSLdx4JvwdH3ffCZKFRuh0aWeYOGXn
         Bjuw==
X-Forwarded-Encrypted: i=1; AJvYcCUU2NMlzAggWs7aNMGooMT1ZRSbHa8d7/GEMlSxxTqjqkRFAxbl6D91j9TnaRbeTo+x3ha+4TfakPQ0OA1Pmosa@lists.infradead.org, AJvYcCXCX3zk67ovFPvpTyaW+7nBXYQ4aygklkAE05dANItILgslXwJakZzs9GLYnlj8O81I0fHCd3wGUkXLx/E=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMhjHlMCCrdkVDlVBVv6Wi9a/UqwTg8ElF+6CUkNKzolOJXILT
	tam/yDPOvqC5ilAGhfjBCvOgK3MiL+mYk1UkuMCEJTEdh690iv+j+lH8bw==
X-Gm-Gg: ASbGncuUgreIfsBWfqTuheDilp/HgpikfT3dTke7ZM9g8AF2y7Jsy++1j/4JYt3H3s4
	8m9NxdXD97uug72KwhIPhZeQkBeIIyRfOwQawCAo3NJmHgNeJ61n7yK7fkBHHH2i7r2muNr3KSa
	WOHybxvOx+j0h7TRRyOXcXqqwk98TMuPmYCn1wB7zu5VIputbcfjMrWY1Urge1eO2f3ve8GEiWQ
	PJkHAxWMkMMRNoUjkXwaiYpgh0tK2Me9Qv7MTS4KoNgAkadmY8HotdkcDsSx553c/U=
X-Google-Smtp-Source: AGHT+IFb5+9bUDyZ2/KMakoA1ZjQWacjX2m04FzqnilqR+JO1e76blKltvPbpM5FBk/hlumRWhF7cQ==
X-Received: by 2002:ad4:5d6c:0:b0:6d8:d79c:1cbd with SMTP id 6a1803df08f44-6e4455fa8bdmr169993666d6.15.1739164404767;
        Sun, 09 Feb 2025 21:13:24 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e44715a9cfsm34485256d6.104.2025.02.09.21.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 21:13:24 -0800 (PST)
Date: Mon, 10 Feb 2025 13:13:19 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, Haylen Chu <heylenay@outlook.com>, 
	linux-arm-kernel@lists.infradead.org, Sebastian Reichel <sre@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH 08/10] riscv/arm64: dts: cv18xx: Add sysctl and reset
 nodes
Message-ID: <h73zitljaig7nrccd3f23i655imswv54tf667dhq3dord7rxsr@unqncqlorvc6>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <20250209220646.1090868-9-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209220646.1090868-9-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_211326_018250_0E893F03 
X-CRM114-Status: GOOD (  14.74  )
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

On Sun, Feb 09, 2025 at 11:06:33PM +0100, Alexander Sverdlin wrote:
> Add reset controller node and required sysctl nodes.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> index 53834b0658b2..d793b6db4ed1 100644
> --- a/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> @@ -309,5 +309,21 @@ dmac: dma-controller@4330000 {
>  			snps,data-width = <4>;
>  			status = "disabled";
>  		};
> +

> +		rtcsys_ctrl: syscon@5025000 {
> +			compatible = "sophgo,cv1800-rtcsys-ctrl", "syscon";
> +			reg = <0x05025000 0x1000>;
> +		};
> +
> +		rtcsys_core: syscon@5026000 {
> +			compatible = "sophgo,cv1800-rtcsys-core", "syscon";
> +			reg = <0x05026000 0x1000>;
> +		};
> +
> +		soc-reset {
> +			compatible = "sophgo,cv1800-reset";
> +			sophgo,rtcsys-ctrl = <&rtcsys_ctrl>;
> +			sophgo,rtcsys-core = <&rtcsys_core>;
> +		};

I think these node is not suitable for riscv. It should use SBI SRST
extension to restart.

Regards,
Inochi

