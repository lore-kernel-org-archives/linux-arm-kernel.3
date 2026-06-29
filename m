Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15284C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 20:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zassGxIWJP7K2eqm0Cz7ERtaJxDHIdjK3ECDalvfM5E=; b=rO6EtTpqkRnINkrnuyiyZ8n0bq
	w0r8S24N+eKJO9BzsxsvBufFkPYnHswjZKtmZ6ASXg+WRoaYnlVZqDpx+jueTFsGy4X3LQVcAgWFv
	8VZpf/rLIwLm4kFpzjzS+EpaGr4VA9Jk2jT3A2F/8w8+6HwircLP3oTgFmdE5ydD2VcMzyaCpiBKT
	sWyPA/eA40ByHWHriMaHKGEdcpQkIs0w/lua5SdbEYMJ6wiRxRbcRaXg2cV9M+/cGBjCT7CtsyGwa
	b1btsTl6x0hRmPt0XN2PYv2caDDsOOdgbsqChXVwfq7Tq7supNaw7Fc7U82cZoRxoo6WJdHeUPWsF
	bv+sHBKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weIVb-0000000FRY6-05wv;
	Mon, 29 Jun 2026 20:23:11 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weIVX-0000000FRXS-1mIh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 20:23:09 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7D7F8D4;
	Mon, 29 Jun 2026 22:22:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782764541;
	bh=6BGCtWCSnzscsVLSmkOHT0KynDhANaGbAaBhMOXMItI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HqmG60kJwrakddc5jSOxRNmE+QEGp5nvtf1vHx/Bk1W8vyTxkgxP6QvWpNTB2dDAi
	 C7MfRVTI29fqj5uHKnQ2OquAWNYAjgLfdjkxZ4yfe0fAURC0BT+vvD8+VKwr7R0AP7
	 9/xyQQI6Wu4/tC3+N6MVsCpUZqMcMrdJfHiAfXfk=
Date: Mon, 29 Jun 2026 23:23:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: (subset) [PATCH v5 0/2] media: nxp: imx8-isi: Add virtual
 channel and frame descriptor support
Message-ID: <20260629202302.GK3054459@killaraus.ideasonboard.com>
References: <20260521-isi_vc-v5-0-a38eb4fcd58e@oss.nxp.com>
 <178276214766.2429861.1950641421457268519.b4-ty@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178276214766.2429861.1950641421457268519.b4-ty@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_132307_614356_8E678413 
X-CRM114-Status: GOOD (  10.25  )
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

On Mon, Jun 29, 2026 at 03:42:31PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> 
> On Thu, 21 May 2026 17:10:03 +0800, Guoniu Zhou wrote:
> > This patch series enhances the i.MX ISI driver's with virtual channel
> > support and adds frame descriptor capabilities to the crossbar subdevice.
> 
> Applied, thanks!
> 
> [1/2] media: imx8-isi: crossbar: Add get_frame_desc operation
>       commit: 3e15a3510908c990ee352aa206d5f9c23d4b216e

Is this a mistake ? Patch 1/2 has no R-b tag, and you're not listed as
maintainer for this driver.

-- 
Regards,

Laurent Pinchart

