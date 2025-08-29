Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA99ECA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 19:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SMf1sxaTRjt5cY9Fd34oHpq48zKKVjE/pILZGSKIA1E=; b=cbyMqD9OjruE2wSHE786X17Z2g
	Lljd0b2pT3/keE/yJJO0DEGhjpaE3BWtqo5CW7N5+3Ws897MXZQyf62NKJc+n9uO4XnmC416euyXV
	zGWfIwXIyhRj+PIsYuVvql2hpa/FLOR5fIBq1RWoZkjO7WLLoGDt2jL6c3yDBb375ty8V7kDpOB1l
	MMT5z8ywcifbTEM+5uauJMBZ2zTDm2U8PfgNmMlRbHLXNSQW1pi+3fGLn367yFewv2kd99Y2kjqtS
	rSVn89qbSs3bFwNiTvR/2iwRTcUhct8UtcgJO/S/Ge6o3jRhpJtWJO2UHUKNzOFPdwNU6M/7P+xt1
	Ff6tcQbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us51Q-00000006nTO-3jhU;
	Fri, 29 Aug 2025 19:44:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us2VO-00000006U1g-2K7x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 17:03:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 01F0E43E4C;
	Fri, 29 Aug 2025 17:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58EAC4CEF0;
	Fri, 29 Aug 2025 17:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756486993;
	bh=mg00hAcdTEKrZbDjJvlMNVxsmu4kekuMMAOA3bFgL+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LTLItRslDoL24OhCDEqAdoRxD2ix+zqQ7YEiFTOKmfu6YZT8f0P4X2bkM80DnA2U5
	 egq7/J0XFJhqNegZH+GBlCa39LTyegzI22SA+cJSJpRc7reYQmgmM1CXAyCZwh3W4s
	 WRs+K9sL4ub/kWZSRjZfAefUvbHgW14v6G9duzjKL2YEbX8++spoaifZuPb6FvvKgo
	 PgXvM8C4paWUf8Wa5P7gO7ZnTelCsoJixU+yRu72Cq3SPGqkPYfRhkP0QgpGwSFPEg
	 uAy3Wg0KHn+iW9mrNsYZ6X8V3QABHKovLLrW2eFdJTYHd8xgEleZwt9aXTkwoYJO5X
	 plDIVPWjpoPRA==
Date: Fri, 29 Aug 2025 12:03:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	"A.s. Dong" <aisheng.dong@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: fsl: fsl,imx7ulp-smc1: Allow clocks and
 clock-names
Message-ID: <175648699220.1015931.794754455912475003.robh@kernel.org>
References: <20250827212446.94571-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827212446.94571-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_100314_614395_0B9DE747 
X-CRM114-Status: GOOD (  10.40  )
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


On Wed, 27 Aug 2025 17:24:45 -0400, Frank Li wrote:
> Allow clocks and clock-names to match existed dts file.
> 
> 'hsrun_divcore' should be 'hsrun-divcore'. But use '_' to keep old dts back
> compatible.
> 
> Fix below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/imx/imx7ulp-com.dtb: clock-controller@40410000 (fsl,imx7ulp-smc1): '#clock-cells', 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/arm/freescale/fsl,imx7ulp-pm.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


