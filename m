Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B3BCE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 08:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PS1qTdUOygVVm7VvPDfOm7LaoDEY6wBLJnRzN6N5OJ0=; b=fen/KC3UaB38osjslafCHRCfQR
	mTMbN/0b//SUA/qqPpbiz6Fex7440gbP7tbKml5SXVpVXRv8gSIL826j/ELKhtuy37B7vlZkgcNzh
	gDhpl3x4/swaVMrAe9ZG3hMbOpfZP5byC0Mjkgl6h7YJvGb4RGgqAsxZ7dooTmh4LeXoQfNyXdnCK
	cXPscv5Na8WHtcbF30XfhRA6AnBXgT9GtNWuVYnCoFeQe/u93ZhB9UQXuB1h2HQbXt5ghXCEUCkhz
	u4agfuRF5PqSYddE5z3ytyVJKf1f0DVv432BzvibGiJgXJv2Ij9sQ5J7eNKxhMO7kK79KdIAl6GRg
	mRaHNhSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKuns-0000000FhqC-1PLR;
	Mon, 17 Nov 2025 08:41:40 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKunp-0000000FhnS-1qGW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 08:41:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=PS1qTdUOygVVm7VvPDfOm7LaoDEY6wBLJnRzN6N5OJ0=;
	b=R5gUl/NYK+xZ/RZB1DcK/YVAlx5YpvKrfPCg3/Wc4J71uBLJwBd37Ou6zTq2y1
	pdnp1z7DYWM6iFvsTk2blseLmZIkBD55eGDrRhg+CJMAMcJ6bjSEUqvsuTnRp2Yn
	PQx5nZehdsm2j6sSjwkw42vqhSXjsvr9DYwAp71wp8qU0=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnXIiW3xpp2wsmAg--.8275S3;
	Mon, 17 Nov 2025 16:40:56 +0800 (CST)
Date: Mon, 17 Nov 2025 16:40:54 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/2] arm64: dts: freescale: add Toradex SMARC iMX95
Message-ID: <aRrflpeTAF3VtuPT@dragon>
References: <20251111151618.70132-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111151618.70132-1-francesco@dolcini.it>
X-CM-TRANSID: M88vCgAnXIiW3xpp2wsmAg--.8275S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF13JF4UtrW7Gw4kZw1UJrb_yoWDXrX_CF
	WrW348uFs7JFWaka17K3WfZrWxGrWjyw1ft3yxXryfJa4I93s3tFWDKF1rA3Z7G3WaqF1r
	Aas3tr4Fvw4UCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1pnQUUUUUU==
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNhr+ZGka35p0vwAA3L
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_004137_869860_6D2DD44F 
X-CRM114-Status: GOOD (  10.41  )
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

On Tue, Nov 11, 2025 at 04:16:12PM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> This series adds support for the Toradex SMARC iMX95 SoM and the
> Toradex SMARC Development Board.
> 
> The module consists of an NXP i.MX95 family SoC, up to 16GB of LPDDR5
> RAM and up to 128GB of storage, a USB 3.0 Host Hub and 2.0 OTG, two
> Gigabit Ethernet PHYs, a 10 Gigabit Ethernet interface, an I2C EEPROM
> and Temperature Sensor, an RX8130 RTC, a Quad/Dual lane CSI interface,
> and some optional addons: TPM 2.0, DSI, LVDS, DisplayPort (through a
> DSI-DP bridge), and Wi-Fi/BT module.
> 
> Link: https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-imx95
> Link: https://www.toradex.com/products/carrier-board/smarc-development-board-kit
> 
> João Paulo Gonçalves (1):
>   dt-bindings: arm: fsl: add Toradex SMARC iMX95
> 
> Max Krummenacher (1):
>   arm64: dts: freescale: add Toradex SMARC iMX95

Applied both, thanks!


