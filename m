Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF23B10A3D96
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3QV0jsfQP7a4wQAQxnfo7uKsL0aVR/nISEKAyiHSWA=; b=CHDg4L7LrcFzEQs2r5A/ty+4rC
	ivL5msNo54FNVKVt7YSKWvNr8bRL3CYoTA5qTBGVZg2h5w7HE99fvjUVqgbNk54ftAs6RyL/XlumW
	4M2xZ/tqi64nzIi6hbZgLHHtaDWtk1wYd0PQjwTabrd3A9ehkVSunZVLtaaWVOAUZawCgq2Nv8CVQ
	KBq4TfH73pNJBoxLgdp0gcGqXSA5m3Dxq3ZFWE1Yppwv5Q9gP2gtFXjmwPlwbwPegjqtv9vV9sXki
	lNYhZNw4fs7cTXbobtbtOPyOC2KwpJYBrtrcwYIuTo+GqBvgjH6HyK+p7qc2tsg6m/p7O5vC7v/ul
	pqbSO32w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mJs-00000005iSK-4AVm;
	Thu, 26 Mar 2026 15:08:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mJn-00000005iRl-2F6D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=g3QV0jsfQP7a4wQAQxnfo7uKsL0aVR/nISEKAyiHSWA=; b=vVe2fRZMGFaglz06obL1vTyeOq
	z7YYeRQ0T9P/6tjSMUS/5MvhVfZKLlW/yFhXfTf/BWuvoY3jefkzOOSh5nNIb3wWDBUerjiz0LfC/
	Uu+PxtrpfeksXmQc37RTH8hLHKOy0aQQgO41KZs7mI0q65jK7XtPDMpNCMN777Q0Hahg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w5mJi-00DUx1-DM; Thu, 26 Mar 2026 16:08:14 +0100
Date: Thu, 26 Mar 2026 16:08:14 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joy Zou <joy.zou@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] arm64: dts: imx93-9x9-qsb: remove unused property
 clock-frequency from mdio node
Message-ID: <b57996d1-8722-46f6-ac0e-a73cdca1c401@lunn.ch>
References: <20260326-b4-imx91-qsb-dts-v2-0-b991b81639e6@nxp.com>
 <20260326-b4-imx91-qsb-dts-v2-4-b991b81639e6@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-b4-imx91-qsb-dts-v2-4-b991b81639e6@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_080819_567847_19F73DCA 
X-CRM114-Status: UNSURE (   7.77  )
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

On Thu, Mar 26, 2026 at 03:51:40PM +0800, Joy Zou wrote:
> The clock-frequency property is not implemented. Remove it to clean up the
> device tree.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Thanks for these patches.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

