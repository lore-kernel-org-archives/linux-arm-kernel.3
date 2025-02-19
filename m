Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371AFC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 21:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/GiwpKUC0VtliLMyFOL/35TN1+gb3/FfpGPJqii808=; b=hm6EJlwMU2hoGrum4ZzN1R9zw5
	3TeLrzmZQa+yHnAZIHuB+DsqmnXNTkfaV3j9lqwh1QjFcx7yFLNajoSZpL2Yy+Il2Y9Cif3GPSYRw
	HIAUVvT7BFHOCaLMb4Pb1+nsUXi0/gZskpZxNak/3DKrelurZwrvVKmjuNDNlm5+a4udzxP0G6wf6
	0N3Xju7T19VbEOEhDzKPXuGMUaaESD9nltYAzjJWIGr3eCNjUAu5/zia8hDwAqzORgFjADAOpBWBn
	kazYghMrVxQV+kxvwRpZTxZ84kd/Eg4BDRFluCQQDZD39bur79jWhvpODJKjKIMAPfTyvLYdPMT4l
	rv5fDtpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrC0-0000000F3Ky-0Jkp;
	Wed, 19 Feb 2025 21:01:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkr9t-0000000F2ee-3RO4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 20:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3/GiwpKUC0VtliLMyFOL/35TN1+gb3/FfpGPJqii808=; b=D+w2UoGrSsMdTv0D3jnY/TU3fF
	l8BcDXVL7eyB5AetYcElVPSTZ1jHbRvSgYSNGpRJ5ywGtuVe2GNHmJx8mY7MQPL/k0uxAqWOcMxIB
	PlMcPegfosEysh5UTLw3fMTMyMlPDNc/JY9RyjQ0MULufZPoXKL68hlcQ96Mrn9aPL/Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tkr9i-00FkMQ-FM; Wed, 19 Feb 2025 21:58:54 +0100
Date: Wed, 19 Feb 2025 21:58:54 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Majewski <lukma@denx.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm: clk: Add ETH switch clock description for vf610 SoC
Message-ID: <3cebe152-6326-454c-9da6-5cf5a64f71c9@lunn.ch>
References: <20250219114936.3546530-1-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219114936.3546530-1-lukma@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_125905_855046_A5F8C9E9 
X-CRM114-Status: UNSURE (   8.95  )
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

On Wed, Feb 19, 2025 at 12:49:36PM +0100, Lukasz Majewski wrote:
> The NXP's vf610 soc is equipped with L2 switch IP block from More
> Than IP (MTIP) vendor.
> 
> It requires special clock (VF610_CLK_ESW) to be operational.

So you have a driver for this switch? It has been talked about in the
past, but nobody made any progress with it. Ah, it was you in 2020. It
will be interesting to see what you came up with in the end, pure
switchdev or a DSA driver.

	Andrew

