Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C6F10A1E9B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owd16l7+Or4A0xmmYcujKyUBRd8f0q5codg/YsopPr0=; b=PoezaM25tNKnAgHkbNlCe70qqI
	Ojjf+CLLIP9OVmIG4rRaGCJbssi6LnNQMwgxXUMPWNf0oA2jy5tznxtcLZlZLjPpMY5DM7Ymkiv/w
	LPoYFK7bDgrJNWn6fzyEcALDVOLsF1GH5aQU4aYZRrZEcKpo5u7/PAXT5Bd8xsM6QB2EdBSLeMkDI
	AyZu4U8LS4yYFh1YD15tPhEbvChf10t64n+7rhIb5yYuOr5jnuELOdvTwLVE/FYXYZqpFB/Xxw5hl
	fODVMpMV8vsGJ7Nns+b7yIOV8jx1Wfmd3LvcyZ6VonjVDfshMbzYMPZgl2Dsx3xIv5Y1bdXIFsvko
	Qc4tQuPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mIu-00000005iIr-3CM6;
	Thu, 26 Mar 2026 15:07:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mIt-00000005iIO-0hxB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=owd16l7+Or4A0xmmYcujKyUBRd8f0q5codg/YsopPr0=; b=n5z6ZPE5137gKnKIsQiKbu/CHF
	nIS1YevwYFrxeZ2SbSi4e8GXHBAV+AX+uhHXhBjfnSRDJ6iQNG0C1Jsu3HteEzT9NcMfHwMzAYm6G
	fVJpfo2+FWqkrmkmDqXiHjTNlYXUx93goPqmB8uJ/OA2JwjVZrI2oFtrGJdjunDxxEok=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w5mIi-00DUvB-BO; Thu, 26 Mar 2026 16:07:12 +0100
Date: Thu, 26 Mar 2026 16:07:12 +0100
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
Subject: Re: [PATCH v2 2/5] arm64: dts: imx91-11x11-evk: remove unused
 property clock-frequency from mdio node
Message-ID: <309f557b-8008-4c65-8c01-6e1c68028af5@lunn.ch>
References: <20260326-b4-imx91-qsb-dts-v2-0-b991b81639e6@nxp.com>
 <20260326-b4-imx91-qsb-dts-v2-2-b991b81639e6@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-b4-imx91-qsb-dts-v2-2-b991b81639e6@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_080723_222958_7DDAD0F6 
X-CRM114-Status: UNSURE (   7.61  )
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

On Thu, Mar 26, 2026 at 03:51:38PM +0800, Joy Zou wrote:
> The clock-frequency property is not implemented. Remove it to clean up the
> device tree.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

