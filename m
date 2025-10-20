Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF14BCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfyNeX9E/nPanq5c8uUp93ycFbokasvZq+5ZQgrpmno=; b=fsnX2+s19hcLotmjKJ1wCBLfLI
	KTBLUQMUNpMyth3kssieb54MkRGJ9yLGxE1P0aI7e2EM09ZWKGEpaOGgTUjAh2H4lcdKmoB5M0yTR
	hDRVl2JbaBWNVMuKA+gH9PRmly0lKwCsnyt6uWh6YfXniTdXsmW/PRtDBb077WHxnsseb0qqxr1zB
	WNZuFmD6c8Qqxvi+QSr/KB/VFYlBI2bRd7qYBcG4H0tFxaTiMh6leBrqecuIbzPOi+9Udef4FV8X1
	LEJWHXDmMCr/IlG2nv5O62Zf4ZCoSwkrf+3D4iNer3bvX9OHcMkW8UBJEE29UDCR5V3HcrBwu0lsT
	RrX4lowg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmfb-0000000CguW-2fkU;
	Mon, 20 Oct 2025 09:59:15 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmfX-0000000Cgtl-2uDR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 09:59:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=AfyNeX9E/nPanq5c8uUp93ycFbokasvZq+5ZQgrpmno=;
	b=DpsFs9oGajK/aJ/9GIguYCW9Y7AOtN8UB/IQvh7Ol3bq0p0VPqSoxIid1kHb68
	QbJBznXnl22LY/aDJARewDbl4SC6w7/zR+hJw8+aK6iYn88lrS0RTMAIsrknUFtK
	xqIX2zEpGNHFJGb6reHpYHgfCXsUDdYauyb6VQcpagGhc=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgC3x3rOB_ZoAQJSAA--.25208S3;
	Mon, 20 Oct 2025 17:58:40 +0800 (CST)
Date: Mon, 20 Oct 2025 17:58:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 5/5] arm64: dts: imx8mp-skov: support new 10" panel
 board
Message-ID: <aPYHzulJa5wpzyZ_@dragon>
References: <20250922-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v2-0-abbb759cf8ef@pengutronix.de>
 <20250922-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v2-5-abbb759cf8ef@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v2-5-abbb759cf8ef@pengutronix.de>
X-CM-TRANSID: M88vCgC3x3rOB_ZoAQJSAA--.25208S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUrWrWUUUUU
X-Originating-IP: [121.224.201.6]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhDsZWj14CleTAAAsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_025912_032821_3680E5ED 
X-CRM114-Status: UNSURE (   7.93  )
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

On Mon, Sep 22, 2025 at 01:10:56PM +0200, Steffen Trumtrar wrote:
> This board is similar to the already upstream
> imx8mp-skov-recv-tian-g07017.dts but uses a different 10" panel with a
> different touch controller.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>

Applied, thanks!


