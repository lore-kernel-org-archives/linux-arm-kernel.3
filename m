Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE3BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 05:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1Q2ZAACDmm9BgC/Dl9QUXwfEDfb/wUplzyKr9XTzT0=; b=EG/mE2V09kyp55m7BB6J9hbkrJ
	TpWTM2o6v3c/59LwE7nEFCp0990585F38BuSCAMFz/5TpDuPh/lMR4UW/MqovHLda+mBXf2eMpGTm
	rbZFVWipcVxkqPF8nha18TRyks3Ld+C/PXjimQ/5SJCYiTn9AmVsKAJ3fXx42dI/M+B06IHxPiyn6
	qD8fc5qjAMvhvcIIDF/hAyY7dOpaQ6xWKvnrFxgDKrgWhcGAT0qAwlM5i+bcSv2cpAWDeETTLdBZB
	s7oZJFymdE1zUGUN13pJY1v4QY31UOFdgzfmQmakZxOvFJTUyj4C5er3FQ/iOpahdV1X6w0GNilue
	hI4DDINA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkGBe-00000006rIB-1ckc;
	Tue, 18 Feb 2025 05:30:26 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkG40-00000006q9z-1fLf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 05:22:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=t1Q2ZAACDmm9BgC/Dl9QUXwfEDfb/wUplzyKr9XTzT0=;
	b=lV7pAGufsEqDS4Wn8koleP35rEJndfog8Xn+PJZWwqbwLn8mmxBt5KLkqPwpY0
	QWVjEaP5m2RjihT+NiJX0rlr413fXo7NWYDrVHR379fH09z8J8qYZD873RsSHdIH
	BHoHjvayNME3q/Qsmz+YXRTae5z28ngjgkdxCjB1rsJDY=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3XsnnGLRnBT02CQ--.18551S3;
	Tue, 18 Feb 2025 13:21:45 +0800 (CST)
Date: Tue, 18 Feb 2025 13:21:42 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] ARM: dts: imx7s: Move csi-mux to below root
Message-ID: <Z7QY5sLOoKFLm6Z1@dragon>
References: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
 <20250107094943.518474-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107094943.518474-2-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Mc8vCgD3XsnnGLRnBT02CQ--.18551S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwNtIUUUUU
X-Originating-IP: [114.218.218.231]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhj3ZWe0E1YVmgAAsB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_212232_755672_9704BE2A 
X-CRM114-Status: UNSURE (   8.10  )
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

On Tue, Jan 07, 2025 at 10:49:41AM +0100, Alexander Stein wrote:
> fsl,imx-iomuxc-gpr.yaml only contains the mux-controller but the actual
> video-mux is not part of it. So move it below root node.
> Fixes the dtbs_check warning:
> arch/arm/boot/dts/nxp/imx/imx7s-mba7.dtb: iomuxc-gpr@30340000: 'csi-mux' does not match any of the regexes: 'pinctrl-[0-9]+'
>   from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!


