Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E51CE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 12:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YFBKvdle0l8WYYtUgX7JaCFYCO3nh7exjS+lwB+V18=; b=4Przfc1MxMvkx812r4ntROxNIm
	MHo3/ATzyjVEP9b52wd9P2DvhdoCp+hL4Z0/Dm23K7zHJVcQ3nNEdXOnm0otJ5ESyHydoGDQyIjxE
	dNbeYQLK/pOBdLPp/4FoiQiMz/Lb5luFgojWZv2vj5bRynPKutG/gnCyh3SacjsDxKqErbAuUoYc7
	l9XgSygoLFfDuGWfUhFKEQl9BtwM81Ih5pc17ZV3KqtBxG3UZgNYSI51gFcg/M1Jw4JyqwkSrl2iE
	LYTbrAakRv+oH4375hCIUtvGkQb0+acyY6oa0Wp3a3BF30T4hFWpRqabuKgcE4K51cxYFXOYmr33A
	C+96I5pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcTG-00000007br1-1AWc;
	Mon, 09 Dec 2024 12:02:38 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcL3-00000007ZjO-33Io
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 11:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=9YFBKvdle0l8WYYtUgX7JaCFYCO3nh7exjS+lwB+V18=;
	b=pPMT6aczMRxqEoN5iIcFKQZ2Rcche8mg9BHFtGM2py0ENvhf5/YI66MtzJWYhL
	hST/2Fz5B56swjXNtVHCH7Vf85j4ppB2zopIucpRaUrnM54v9ytADTRz07YKNPmt
	rqiIVl1h/WdqYgeDDw6kQdKRmghczxih3miBe8rZU8lV0=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHbODn2VZnjriPBA--.47417S3;
	Mon, 09 Dec 2024 19:52:10 +0800 (CST)
Date: Mon, 9 Dec 2024 19:52:07 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Liu Ying <victor.liu@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, quic_bjorande@quicinc.com, geert+renesas@glider.be,
	dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
	marex@denx.de
Subject: Re: [PATCH v6 7/7] arm64: defconfig: Enable ITE IT6263 driver
Message-ID: <Z1bZ57fn/upwHWQ5@dragon>
References: <20241112100547.2908497-1-victor.liu@nxp.com>
 <20241112100547.2908497-8-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112100547.2908497-8-victor.liu@nxp.com>
X-CM-TRANSID: Ms8vCgDHbODn2VZnjriPBA--.47417S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUr2NtUUUUU
X-Originating-IP: [114.218.218.187]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAGwZWdWx209gQABs2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_035410_126988_16DAA919 
X-CRM114-Status: UNSURE (   6.66  )
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

On Tue, Nov 12, 2024 at 06:05:47PM +0800, Liu Ying wrote:
> ITE IT6263 LVDS to HDMI converter is populated on NXP IMX-LVDS-HDMI
> and IMX-DLVDS-HDMI adapter cards.  The adapter cards can connect to
> i.MX8MP EVK base board to support video output through HDMI connectors.
> Build the ITE IT6263 driver as a module.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Applied, thanks!


