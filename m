Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8C9109C04D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 18:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCkaHroi7JtzDDzze2vqbAGbk2FNNhsqXTmz4G6Yku4=; b=BZ3hB/UQYZhtyuuVaIaWrA+yEa
	O4p9WufYpXqGajQI0uWPuKqWzOrvl9ew5EHwm0KmdKxsfPlo/f1LuOgcZCcSONidKV3oWccQRn4JG
	IhaeBt4JQtGDYykIrfYoVxp1dKFi+y4vAM70v4cIQscB/YzG6bMNWtAEhqG9jforQ+PrKYB9mfKr1
	v+HDDBBhkE99bpdxt5uzpULTvA+9zQrjkctBCgmQ+CCnYrdpzvTg29Y/x8iY47Gb7sOPLNWlTWHQ+
	ASCW6PVkqTF8rVUXK2+d5TphhpNHOYOqJyyEnnSBpJ58nzkt1UQVfLhWSANHWsxWBnMHr79ii+KeU
	cb7ufksw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Sh5-0000000431c-0YPo;
	Wed, 25 Mar 2026 18:11:03 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Sh2-0000000431E-3vAM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 18:11:02 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 85DE4201FE;
	Wed, 25 Mar 2026 19:10:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774462259;
	bh=PCkaHroi7JtzDDzze2vqbAGbk2FNNhsqXTmz4G6Yku4=; h=From:To:Subject;
	b=HTPL/eybTJsPutz99rLH2Kc9XS4yCKQ9tVvt21D/Dny52UiEPN0dwgsarYfUsCclo
	 HUEZrkXRQ3dWgbNIfhphDb1MDgEBR3uTaC5SvK6gQUs2m/kaZtPBT7DBrAcieKcSLp
	 6qR9DUeyTDM8T6cQ1VaR//JHQLsvD2YG/0FT6l6q9cEEgtmM4GW61ReIkxl5vk+pe4
	 VCl7KK32sRv5RtZLa1rpNi//kTvBnN00RZywG7SHxqPhEVNnsXMY3auZHlwSqfjuKM
	 j5xt4vSS3t+FFhFhwxchbv/INVOC9stGTSGlNFEMMvOpGFxU03EmKid9TGJgwwlQgP
	 j3ancjOf701Yw==
Date: Wed, 25 Mar 2026 19:10:57 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@nxp.com>
Cc: Franz Schnyder <fra.schnyder@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Franz Schnyder <franz.schnyder@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH 3/3] arm64: dts: freescale: imx95-toradex-smarc: Use
 gpio-hog for WIFI_UART_EN
Message-ID: <20260325181057.GB2972@francesco-nb>
References: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
 <20260325115513.707914-1-fra.schnyder@gmail.com>
 <acP3NiGvRCc1SgjE@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acP3NiGvRCc1SgjE@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_111101_134152_8A14225C 
X-CRM114-Status: GOOD (  17.25  )
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

On Wed, Mar 25, 2026 at 10:54:46AM -0400, Frank Li wrote:
> On Wed, Mar 25, 2026 at 12:55:11PM +0100, Franz Schnyder wrote:
> > From: Franz Schnyder <franz.schnyder@toradex.com>
> >
> > On the Toradex SMARC iMX95, the WiFi UART signals are shared with the
> > JTAG. The WIFI_UART_EN signal is used to select between these
> > two functions.
> >
> > Configure the signal as gpio-hog and drive it high to select the UART
> > function by default. Add a label to override the hog in derived
> > device trees.
> 
> gpio hog have problem about probe order, are you sure gpio device probe
> before pcie?

This is not about PCIe, we are talking about UART here. Specifically the
module is a combo Wi-Fi/BT device, with Wi-Fi over SDIO, and BT over
UART from NXP.

In any case, this DT is going to be used also by the boot firmware that will
configure the GPIO hog way before the Linux driver probes.

The DT files from the Linux kernel are used also by other projects.

> I have not seen any place refer to wifi_uart_en.

There is none (as of now). This is there to make it easier for a user
that needs access to debug to adjust this node enabling the JTAG
functionality.

Francesco


