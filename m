Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864E3CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 09:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ckwd49jYJbZJlSP55GshI+aFNobeJwdz0Kh7cY8e4GE=; b=L9ZBUj1WcygUlVa88b527nGayy
	wEHBtAOPq1xcuv+7DUUc0IcSGIynKkf1uf9gm3KCsTIWU1VQxHO3lAfLPktGzYjQnourcRWYl2Pko
	jFPZCiJ8Cub0akINLB92ZOjjbeUxC+vRdANZqYxuhZNw0FPNDIKm309qQVOiqNwhYjghkhTnIUs1Y
	fSDhmxYKZSjo+4Xn1Ne0FYqCkCvxDWzf3pmHkOZOTLUZpvqRpKwQHuIXeePd++ccM9N7tvbSe/u+u
	yeE9EzQ90iLIBzWpR7PaDYmRQbn+WTjsEU8h9YPyihyVM3cUqCeMPbLqz/2cIv4tk6b4j4ugtOn5u
	1iMRSbrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDwF-00000008rOA-2MTp;
	Fri, 24 Oct 2025 09:18:23 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDwC-00000008rN6-0Skv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 09:18:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 438A714894D0;
	Fri, 24 Oct 2025 11:18:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1761297493; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Ckwd49jYJbZJlSP55GshI+aFNobeJwdz0Kh7cY8e4GE=;
	b=TEU/zPnV4c8AEBQz3MYoLSoN10mHgvhAEYUSFXvLwHE8dIxLF7KDDY67si78n/UFfDcgdj
	AALhGtb0kKPBZ6qJkiyy9loEmLvd5pgXvM1l8ZJGvsgwgLv5anadMYgvLxOcVv82VxNuFr
	C27y5PEZucslpDMLOvSaexj9e4G7F1USgzEQNIgV2K5QkQEiUlwok7c/3UKXO78HQJiiIf
	AGojkwl5qJuO1hvFD4N0jTSVxFT4K7+tOHMERjkLY4JDpbJibZYwetgHSA4kfu0nCl0r8n
	AcNRZG5oc9XpPrBqeSLM9CVp7wWVXNoFx342VUCX/zgHZ3W5yMJjJGHYJzO/Ow==
Date: Fri, 24 Oct 2025 11:18:03 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Richard Cochran <richardcochran@gmail.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Josua Mayer <josua@solid-run.com>
Subject: Re: [PATCH 2/8] arm64: dts: imx8dxl-ss-conn: swap interrupts number
 of eqos
Message-ID: <20251024-backhand-disallow-75be98bbeea3@thorsis.com>
Mail-Followup-To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Richard Cochran <richardcochran@gmail.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Josua Mayer <josua@solid-run.com>
References: <20251022-dxl_dts-v1-0-8159dfdef8c5@nxp.com>
 <20251022-dxl_dts-v1-2-8159dfdef8c5@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022-dxl_dts-v1-2-8159dfdef8c5@nxp.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_021820_607705_22CD2734 
X-CRM114-Status: GOOD (  16.85  )
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

Hello Frank,

Am Wed, Oct 22, 2025 at 12:50:22PM -0400 schrieb Frank Li:
> Swap interrupt numbers of eqos because the below commit just swap
> interrupt-names and missed swap interrupts also.
> 
> The driver (drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c) use
> interrupt-names to get irq numbers.

This catched my eye, because we are using a SolidRun i.MX 8XLite
System-on-Module on a custom baseboard which uses that SoC.

I had problems with one CPU core stalling when doing network traffic
over the 'end1' interface, which is that eqos interface here.  All I
could see so far were an excessive number of hardware interrupts in
/proc/interrupts for end1.  With this patch this behaviour is gone, I
could not reproduce those lock-up anymore.  Thank you and FWIW:

Tested-by: Alexander Dahl <ada@thorsis.com>

Note: I applied this to v6.12.  The patch has a Fixes: tag, so I
assume it hits stable once it got merged without further action,
right?

Adding Josua Mayer to Cc because it might affect other users of that
SoM.  Josua, would it be possible to upstream the dts/dtsi files for
that SoM? O:-)

Greets
Alex

> 
> Fixes: f29c19a6e488 ("arm64: dts: imx8dxl-ss-conn: Fix Ethernet interrupt-names order")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
> index a66ba6d0a8c05646320dc45e460662ab0ae2aa3b..da33a35c6d4660ebf0fa3f7afcf7f7a289c3c419 100644
> --- a/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
> @@ -29,8 +29,8 @@ eqos: ethernet@5b050000 {
>  		compatible = "nxp,imx8dxl-dwmac-eqos", "snps,dwmac-5.10a";
>  		reg = <0x5b050000 0x10000>;
>  		interrupt-parent = <&gic>;
> -		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
>  		interrupt-names = "macirq", "eth_wake_irq";
>  		clocks = <&eqos_lpcg IMX_LPCG_CLK_4>,
>  			 <&eqos_lpcg IMX_LPCG_CLK_6>,
> 
> -- 
> 2.34.1
> 
> 

