Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2389BFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 08:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyDIYHJXgNKhMRXdo/iFCt4f1VH6BEZMlIUPf9D7eQk=; b=dEwmKy8hsF5SJpqcmp3F+Osrqa
	BX1h3ges7oWz/H/Pzoxt416ofRpshpbHaqkJKobUP4+YN0wAtkCXrNaLeSAsQW+fJeMnBKeBeyizp
	Kd1vfzCii73gnzjLmAcLL91QVk6rs6uUPJWHNmibf7qDqW2Mm7rfVDTkobr6A66WLaodtqNjszSpE
	oXLD+W9PImLkx4uCxAq/eOIwIhIVcDtCw5+mQyMLJQFK+Z9Ujofh3If2lgGVgSBJBnKck2CYuGmAn
	jNWPdnmwzFbb3zhwo9DFfmqJpB5u9a0Nmk0tTyRGo1ZrHijo6merrF3kwYUkcDb35pv9HR9QLmXBH
	GG6bDn9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMOQ-00000004xIw-1vRb;
	Thu, 30 Apr 2026 08:05:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMOL-00000004xI6-3yQX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 08:05:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 488C341878;
	Thu, 30 Apr 2026 08:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C95C2BCB3;
	Thu, 30 Apr 2026 08:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777536301;
	bh=7nNKR94jeY1+8VKy4ZEGDpWJaACzWqalOpA7Fj7cfVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jrFXUzp9bDp0CSbhaP2uFQGbo//AE5QuvYcezv+XHTmTjXwuj2u9/OjHFdoWNEj6X
	 NVzQZfFaHCwyyNBVvqnakuGlj11iO2AYhwYXX0zPCcUeTZ46lcwy0mtTUPdq7S0cAX
	 XEjMP0DdIbIDIR+e34ArJJ9EkAYnAZ7LA+JsuXBKimcbImp1lycOqKLtMB4s6Ttg3t
	 9OsdxEoICc1ivrQLtftCFYDlys4UZgVOesx4Hz/9kX+MMQNptOKGFmS/WzLQgSU/Lq
	 K9CQo2lFVGpTyYd1mZpDeXiJzAf/5XEwymN1lquWyKkEvWWPGXIa/FoaESmFU80SGb
	 86T1x7IKvEViQ==
Date: Thu, 30 Apr 2026 10:04:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: imx95: Add dma, intr, aer and pme
 interrupters for pcie{0,1}
Message-ID: <20260430-adaptable-wonderful-hoatzin-e1056f@quoll>
References: <20260430050954.3467984-1-hongxing.zhu@nxp.com>
 <20260430050954.3467984-3-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260430050954.3467984-3-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_010502_014924_C7FC9DAC 
X-CRM114-Status: GOOD (  12.48  )
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

On Thu, Apr 30, 2026 at 01:09:53PM +0800, Richard Zhu wrote:
> Add dma, intr, aer and pme interrupters for pcie{0,1}.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 71394871d8dd0..6896d9c15bf53 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1861,8 +1861,12 @@ pcie0: pcie@4c300000 {
>  			bus-range = <0x00 0xff>;
>  			num-lanes = <1>;
>  			num-viewport = <8>;
> -			interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "msi";

Why there is no fixes tag if this is here for two years and you claim
that IT CANNOT work without these interrupts?

Best regards,
Krzysztof


