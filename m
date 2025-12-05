Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF14D2F7C7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 09:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWVCttJ3N0wzxtgjbf0mm45mtDVeyRhL6tZGZtc79+8=; b=x3j5e05/fmwz5iNAGk3h0DVpyc
	so60wNfFvKm+84/B5rJyChR+qQEhOHrl5yS2+/Jogikxx8FOSTbPEdlQGwppxmpsa0SomtLldW8RQ
	3mugcJuagcK07nz3WDgRQjRqvx81mvIXcdVL8Dt9Ix0GQWOs98lwWN7dBzUDvQyCKM/sbbv2CFWZy
	wsz529JEJAW4q/TvdD9qUGJpyoX2+f7Q5tgTZ6tB3RcTs0swei8Qek+4IxOUwtySJtzYzqvIa2fML
	Rbgaj4bAlVJJ5g68q0/yhSP5HyCYUtqQAC+9mTYRLnLUEgtasnlP3msBjV3KvzOfkPqrJ8P3eR56Z
	s/SygKIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRRjh-00000009FoC-1Giy;
	Fri, 05 Dec 2025 09:04:21 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRRjc-00000009Fnr-3kNv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 09:04:20 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 3AB291FACE;
	Fri,  5 Dec 2025 10:04:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1764925452;
	bh=OWVCttJ3N0wzxtgjbf0mm45mtDVeyRhL6tZGZtc79+8=; h=From:To:Subject;
	b=gmrugcFr6zF9vLqczcZo25Vq5XjHo9gZ2tCRVk0g2oXJxDfZudHRt7NCum17i+Rit
	 OuajVABdsLS86g6GBxtTZS0YSC9us2b9MDCJbSsYLPdfgDMcmsJbhxXAx88xy0Xfq3
	 kt9aX+ysptYL0mWQx3Yx+ztZsNp7Wh+8WmhJXUthlI1eqUiCPedxj+J9OxGr0/S7ru
	 GVBQvuLHwkFsXv9q3BcAvxvlZE91Gv2frgPW8lTjTTfcRtCt07yQMpz8cjNMCm10kS
	 JzEs6KrklCzudeK/OtAuknZvbCaeYaPVngIlmb+i1g45wjr1wS0EQEtMqJicKjgGvH
	 YCQxeShMu95/w==
Date: Fri, 5 Dec 2025 10:04:08 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: "Yanan.Yang" <yanan.yang@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, qijian.guo@nxp.com,
	justin.jiang@nxp.com, Lei Xu <lei.xu@nxp.com>,
	Xiaofeng Wei <xiaofeng.wei@nxp.com>
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board
 support
Message-ID: <20251205090408.GA48399@francesco-nb>
References: <20251205-imx91s-frdm-v1-0-afd6cd01c299@nxp.com>
 <20251205-imx91s-frdm-v1-2-afd6cd01c299@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-imx91s-frdm-v1-2-afd6cd01c299@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_010418_492036_B7EF1BFC 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

On Fri, Dec 05, 2025 at 05:03:59PM +0900, Yanan.Yang wrote:
> Add DeviceTree support for the NXP FRDM-IMX91S development board based
> on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized variant of FRDM-IMX91
> and differs in memory, storage, Ethernet, and PMIC configuration:
> 
> - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> - Single GbE port (FRDM-IMX91 has dual GbE)

...

> +
> +	aliases {
> +		ethernet0 = &fec;
> +		ethernet1 = &eqos;

Single ethernet port, and 2 ethernet aliases. Please fix

Francesco


