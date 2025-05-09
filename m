Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44EEC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozfwuFVEUTDToHBc2ETkpFdylwQ3tcpGJCK/felzs/w=; b=y9aOf4a3IsIShKppF6YsVNIA2t
	rhkTDqug9gqiTaaBLA2EjlpN/W8Q/p4BhKAOqYq2YpRGQ2Na+51x9q+dJ47doi3xV8HWrLWcn6zAq
	3BOuwUpdv8CrQmQNd3Ppgpwi9YO6GqlQ3lmdYIH3vU46bngm9LcqSGhU1nqgll8QdF2uvJptybQcS
	D3sXtb7mkn4z5WPLt35SJy6QFKkn1JMFAFwZELhKznHtmHxE3e2eywsDUZ4VnhIB06ZZiVtk8Wzqq
	YToAnpxRw2Lp50L6U8AcMFv8n7gYttOdvZZtWqEW82UvALWSo938QzfNo5Mgc3HhRW9RrmUmFd8f7
	voFqCnIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNEM-00000003eVg-2eyq;
	Fri, 09 May 2025 12:53:34 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMSs-00000003Wv5-2iim
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 12:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ozfwuFVEUTDToHBc2ETkpFdylwQ3tcpGJCK/felzs/w=;
	b=bTSWlaQdJy9Bsv9fnjqq9LEg0I6uljrRGlf6Kp2Dz0BsRNfrT1BVXJm0BI4/KT
	lMUm3j8dKIthxDKC/u5Dg2534izQ7DwnmvKIGN2HzYo1cWVBpQcULHQxQJsvXKTS
	LSyfx2OzDl0sONOQNwbNctjjd9ArnFebHo/8c0WMYFpNg=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3L_8V7x1oHuWmAA--.37606S3;
	Fri, 09 May 2025 20:03:35 +0800 (CST)
Date: Fri, 9 May 2025 20:03:33 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Peng Fan <peng.fan@nxp.com>
Cc: Jacky Bai <ping.bai@nxp.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Aisheng Dong <aisheng.dong@nxp.com>, Frank Li <frank.li@nxp.com>
Subject: Re: [PATCH v6 2/3] arm64: dts: freescale: Add basic dtsi for imx943
Message-ID: <aB3vFciYEIIITRHv@dragon>
References: <20250421065139.3073232-1-ping.bai@nxp.com>
 <20250421065139.3073232-3-ping.bai@nxp.com>
 <aB3Pll3A/0XGCLlQ@dragon>
 <PAXPR04MB8459189E9DF97A15DB7386EA888AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459189E9DF97A15DB7386EA888AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CM-TRANSID: M88vCgD3L_8V7x1oHuWmAA--.37606S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU289NDUUUU
X-Originating-IP: [117.81.80.76]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAhIZWgduuzANAAAs2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_050431_046722_27842977 
X-CRM114-Status: UNSURE (   9.83  )
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

On Fri, May 09, 2025 at 10:35:40AM +0000, Peng Fan wrote:
> > I forgot to ask when imx95-clock.h was first introduced.  But how will
> > clk drivers use these clock IDs, or will clk drivers have their own copy of
> > definitions?
> 
> We are using SCMI for i.MX95/i.MX94. Per DT maintainers,
> the IDs should not be in dt-bindings, they are SCMI firmware
> defined IDs.
> 
> clk drivers is drivers/clk/clk-scmi.c, this is a SCMI generic
> clk driver, it will talk with SCMI firmware to get IDs.

Ah, nice!  Thanks for the information, Peng!

Shawn


