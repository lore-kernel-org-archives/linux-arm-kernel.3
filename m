Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5465FE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 11:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahtKyo3umu0l8xANNPbc/omC47RmvAyiOEB98A3zRFk=; b=TZYj3tftnwprIUyKKw0z3jZ7BV
	fP8jK8PRFhv96wefeELhjburoo3V8CF5sq2DanQAeWsP4l2SbsbXAbVp1TltEMNhijv8AfNzZgJFW
	v9/+FVRIFywmX1rqV3pzBMKSeEeanY5twR2+6WFbM+eI8bdna5WY5ajwD5jhGuArDNoQCLL23PdPJ
	kYidW3HBZQoacQe20oAUpORT/iJLsgKC2Y7h4y9xYtLXrFIVyHfgacP3HBB6FOh1VP6LphWqfZNk/
	7gNmPLZ5ty3EeXx8xk39Bcn8isjX9/Y+fjmpCLLo4HdAUV9meLYIF81uJfQci+rIFekGgDckZ38JD
	Bco9XNKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcMB-00000007a5G-0pxs;
	Mon, 09 Dec 2024 11:55:19 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcJf-00000007ZEn-0Ddp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 11:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ahtKyo3umu0l8xANNPbc/omC47RmvAyiOEB98A3zRFk=;
	b=Wl9Uwb3hHHYw1gXSGXz5c9Av0256OS/lw+UeGGnBU2D3FOnTxEqpD+4SYAcazJ
	8I5juTXjI7/sdyKwQPMJmTlJu+06Eu/oX0g6dYXP8lW5UmTc8XpUqOY4QTi9n/nA
	wvO0/C8DCt81JKSI5t46SxjkYeubpjnoyxz2TN8YyiTtg=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgC3ZJi+2VZn8elyBA--.46363S3;
	Mon, 09 Dec 2024 19:51:29 +0800 (CST)
Date: Mon, 9 Dec 2024 19:51:26 +0800
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
Subject: Re: [PATCH v6 1/7] arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Set
 "media_disp2_pix" clock rate to 70MHz
Message-ID: <Z1bZvsGdwd5dlJow@dragon>
References: <20241112100547.2908497-1-victor.liu@nxp.com>
 <20241112100547.2908497-2-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112100547.2908497-2-victor.liu@nxp.com>
X-CM-TRANSID: M88vCgC3ZJi+2VZn8elyBA--.46363S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw45tFyrZr13XF17Ar4rAFb_yoWfArbEyF
	17ZF4v9rs5XFyYkwsFkrZ3Aw48K3srZryUCayUJw45ta47Xan8ZF1S9ry5Wa1UXa4ayw1q
	gFn5Wa98K3sIkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1xpnDUUUUU==
X-Originating-IP: [114.218.218.187]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRWwZWdWsiw1LwACs+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_035243_406530_3F6B0670 
X-CRM114-Status: GOOD (  11.04  )
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

On Tue, Nov 12, 2024 at 06:05:41PM +0800, Liu Ying wrote:
> The LVDS panel "multi-inno,mi1010ait-1cp" used on this platform has
> a typical pixel clock rate of 70MHz.  Set "media_disp2_pix" clock rate
> to that rate, instead of the original 68.9MHz.  The LVDS serial clock
> is controlled by "media_ldb" clock.  It should run at 490MHz(7-fold the
> pixel clock rate due to single LVDS link).  Set "video_pll1" clock rate
> and "media_ldb" to 490MHz to achieve that.
> 
> This should be able to suppress this LDB driver warning:
> [   17.206644] fsl-ldb 32ec0000.blk-ctrl:bridge@5c: Configured LDB clock (70000000 Hz) does not match requested LVDS clock: 490000000 Hz
> 
> This also makes the display mode used by the panel pass mode validation
> against pixel clock rate and "media_ldb" clock rate in a certain display
> driver.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Applied, thanks!


