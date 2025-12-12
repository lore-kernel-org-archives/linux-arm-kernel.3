Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EACD3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 03:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlw2biAh27gxpCg6hQSXgZXlsXzzAsGwifRNjUZFg3g=; b=SzxDtBijDJ1qghe1TlGv2wg6cf
	m6a3aliNlnMCbqG9u7mEqrGS4tsD8EiqMKdJ8OJTasIa5IArjc12L5452Mv3RHt75Z+micWZtB+b/
	bbG2CIStyjV2RGtzWN4K3+X1O1dymPM0q/USa+TAKIzdd0gvVSb36AmYQ9xzu3sDTcV7PrqS9D0WF
	zzhpq88TCZxiDQWIw/tY4zBZyx4TrC8OB9Tgn7PH6hZ080tYMq8asaJ9DqMZHB0aEwRW8Q6jNByy7
	FPLjESenG+UZkovAXDfaR4ROCt+20VCc0EKKyBge+xuzMTwMTRG52yBOQpQW38k0mzyEUaGSDbDBl
	INO6sDjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTu0f-0000000027h-2et3;
	Fri, 12 Dec 2025 03:40:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTu0c-00000000274-2jue
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 03:39:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vlw2biAh27gxpCg6hQSXgZXlsXzzAsGwifRNjUZFg3g=; b=m/s6/cZbkRS9f4QZeRi5wRrm7M
	4uFAUEWUwfnzZZVVmeR9MemU4SXI8k3rG7WW6walFA9UPYsvVUuPQm1+EtsGrPT9ZwrlKvXwP1xSt
	eYHOVtHAnIUYwpEz0MIfMgrnf2YXas+OlSdc6RSJR4wdVM1PEdpbTSCogDUMi+mtXCiI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vTu0U-00Ghzh-6T; Fri, 12 Dec 2025 04:39:50 +0100
Date: Fri, 12 Dec 2025 04:39:50 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Justin Jiang <justin.jiang@nxp.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, qijian.guo@oss.nxp.com,
	Tom Zheng <haidong.zheng@nxp.com>,
	Steven Yang <steven.yang@nxp.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: Add FRDM-IMX91 basic
 support
Message-ID: <55fa5159-768c-4785-b0ba-5553193932ab@lunn.ch>
References: <20251212-imx91_frdm-v2-0-4dd6d289e81d@nxp.com>
 <20251212-imx91_frdm-v2-2-4dd6d289e81d@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-imx91_frdm-v2-2-4dd6d289e81d@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_193958_711618_D5264DB4 
X-CRM114-Status: UNSURE (   5.76  )
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

> +&fec {
> +	phy-handle = <&ethphy2>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-0 = <&pinctrl_fec>;
> +	pinctrl-1 = <&pinctrl_fec_sleep>;
> +	pinctrl-names = "default", "sleep";
> +	fsl,magic-packet;

Have you tested WoL?

	Andrew

