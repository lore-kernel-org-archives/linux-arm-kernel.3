Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8598AC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 08:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqjXYECwTIlYK1+KpcgkIFGuqMqCZ7EdGrNP+ZWSYZo=; b=ya0MMR329fmMW/pEyDuaZNwZyR
	/lhaNPYiytDw0aWzabhKIbupBcDfPcKpem9SfN3GpoO6IBdeumXMMRsuuk6Revsk23SKYQYv0323R
	d+2+xHNFGyPBu66vkb+JfRW+t5dE0GhjFgNvpuOiyTHUqHhy3/g9A/87dLyKGQ+h/TexH7lCJ1VuY
	o3/YEc+UZdnfajLB9SFqDPq/PrZZmvnwLj2btNleudL/XvVCWPZ99ZP+gGB/iyqb3FgqBCM7EfJiD
	WYh28B0ZtS3bH6dutmuebsXbEEnMBUo80BJD1UUrGti15n9dw5/4R2Z1ZhC4qM+11cXHKcYyt8Z7u
	osONyieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWiu-00000004TPW-0thv;
	Tue, 01 Jul 2025 08:52:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVyY-00000004MdI-3S15
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:04:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2C111A5128D;
	Tue,  1 Jul 2025 08:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCAD7C4CEEB;
	Tue,  1 Jul 2025 08:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751357061;
	bh=+nn4mynfVncLnfXsLNW0CJkiDB5PX367L7nyfXb/Cnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dt0PJLkAnO5XXRxaKU/+MBh0mj06IYi2I9TYuxJAOgkM/LurIHOjtv3xmZ336T4iO
	 hV30SDjShYSqvhuBxdxJsrBcqhcgdSfyQfCKgrN/K0bWMgJkyq4CaPkI64Ni0ROoAc
	 G3Qe/gwpq9lOtzvExJBjpfVKBW5EjQ4s+/kRrqdSBgvmFnOcJ6WLWrt4uu5/+2qjo1
	 CTNEhuvkKjbVfnD9Frqi5bxJCR7sWntp/EEsUqyNCvDYEqPzpEgoFI+fxgrTV/cMqo
	 /sUfz/uYDEr8uYNodWml9XwPFVnVlS1CTWW0cAu6K4JOeE/CZg6g4XwlvLqYAH4cT5
	 FH6ksZJeS9wzg==
Date: Tue, 1 Jul 2025 10:04:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: imx: add dts for the imx8ulp evk9
 board
Message-ID: <20250701-quiet-hidden-terrier-ff0ad1@krzk-bin>
References: <20250701002239.972090-1-laurentiumihalcea111@gmail.com>
 <20250701002239.972090-3-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250701002239.972090-3-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_010422_934630_B261365C 
X-CRM114-Status: GOOD (  14.06  )
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

On Mon, Jun 30, 2025 at 08:22:39PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add DTS for the i.MX8ULP EVK9 board.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>  .../boot/dts/freescale/imx8ulp-9x9-evk.dts    | 69 +++++++++++++++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 4da7501ece17..4b288b324d38 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -322,6 +322,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb

You got comment about ordering, so it applies here as well.

Best regards,
Krzysztof


