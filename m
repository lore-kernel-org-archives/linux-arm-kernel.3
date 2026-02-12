Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3FFEB4912
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 11:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mh5XD0Sv8CLYzjUK++48rPfoViiJoHXpXyYfysbOe8=; b=ug4WEIe/cBtTGubjJGIFunA+3w
	49mWg1+uXNUd4Gz1v/zkhcmfFg65y2MCcphlFLWKJZL0NtCf+iQw4sNEniZxwOWvwgmQLduH3INH4
	QlDVRt8/85uuvUs0TtQPvF9oddgw1RgEjDKXWT0daw4m+9md8CqRCPaOggk+e7BLJ4IqvgiJas71s
	aUdDRoBnLjXqg7w/6ht+qlqcCjUDRt+ZLLRjxWPbarph4xLfwBvzq/3JMfwgg/98YzrqMNBhTPZry
	ttxp8ktKvlw/EpxKIZGNS2AVFpbzJBOXkvlaPQA26DS6RPH5v26vsYVDHc8VVcYCz2RE+sDxwgKvL
	xaPvOfCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqVDi-000000022Fk-411t;
	Thu, 12 Feb 2026 11:50:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqVDg-000000022FR-2zhl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 11:50:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB83F443AB;
	Thu, 12 Feb 2026 11:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0827EC4CEF7;
	Thu, 12 Feb 2026 11:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770897050;
	bh=+mExdPYywevcvTVMOl/PdDwU0c7GmCCHMXPzvVMq6UM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gfhq4X7Nd2ol8tYyzTSAp2DJsTjXTg6NnzF49nXm3CiqnOFg1D2UnzKsMukVc2hfJ
	 43rlm9JVEo3sHFFZVAtY6C/noH7tpJjK08akCTRD96BwRkoXeKnBlYXpi6vvmxpOD8
	 aueMn3LZZL9bu6msxr0L42nI14XyVazKBQisY4vxk+1MFhEGB67lbTmv3FuMVohhqP
	 GtCXa+afth+5xWL6xOanccLURNOl1tCVVEXZXdaK5/phYSN7FJoY6VBRd1abG3ENuI
	 ph8AUknVr9XyW4Nm0TYfyI6SyQ9VXfbHn4Zufp7fggTtcrkZnPaLPL4M9V/Pl5+bJm
	 deWCG4G8K3j/g==
Date: Thu, 12 Feb 2026 12:50:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/1] dt-bindings: timer: fsl,imxgpt: add compatible
 string fsl,imx25-epit
Message-ID: <20260212-vengeful-pretty-seriema-9f6b74@quoll>
References: <20260211214947.3705328-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211214947.3705328-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_035052_792916_29AF7671 
X-CRM114-Status: UNSURE (   7.91  )
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

On Wed, Feb 11, 2026 at 04:49:47PM -0500, Frank Li wrote:
> Add compatible string fsl,imx25-epit to fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

I see you are preparing for the next LPC status of validation :). Nice!

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


