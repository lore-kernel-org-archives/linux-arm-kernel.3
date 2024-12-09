Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D632E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 11:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0ACcEk1UOUwykRvtHfGsibvZAQHV7WF85gca/fgXtU=; b=LUb0bC/804gtSR8twaDJAemNaM
	rvRPP85S0F05BxVZNyILSGTY2RHKHYVfKn2159wK3LOcBVyUobL8FnbIVKpRw6dlBN2mr+H8UqllB
	mKUcCHdVef7+BQqSQLIFtPQe4H1DJ3n2m34hGnLLAZ5OPxNiG5Zl/EjAmXmeHDfGFiboXAr474Jdx
	Ofo9Q4wBkG2eT1TKYy2Z+BvuazeYh/0kBvYjvrOhPceUT6TVdU98jjT4orVJ7wLe8SqlxIihcVrgv
	Q92trdOmSOFBiO9Y4TR6+5yu6LxzfZwCW0CO8qCySB+3pr4qMtQkWmjCmbG455bqJatoJpAyfY+e2
	hfcaMXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcNB-00000007aL1-3PaZ;
	Mon, 09 Dec 2024 11:56:21 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcJk-00000007ZHU-3IIt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 11:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=u0ACcEk1UOUwykRvtHfGsibvZAQHV7WF85gca/fgXtU=;
	b=e8BjV0Gdm8xg1RQT7gFdCEfIB2hmYXk2RxcjvizBiZwTERVncWc3lYh8fh7ESe
	I4ZQ6uzmY2DIi9zRnUCR/Qt4MFonfQuPf5OjgM+0Ema9B1r/ofvoUvE7YtYjnTCP
	dOdwwzXOYsSwA1QrysrBu3zXFFRxzHIA/8jqP6rFtl7yQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBX33HV2VZnbrePBA--.47878S3;
	Mon, 09 Dec 2024 19:51:51 +0800 (CST)
Date: Mon, 9 Dec 2024 19:51:48 +0800
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
Subject: Re: [PATCH v6 6/7] arm64: dts: imx8mp-evk: Add NXP LVDS to HDMI
 adapter cards
Message-ID: <Z1bZ1FvPmjPr3LU5@dragon>
References: <20241112100547.2908497-1-victor.liu@nxp.com>
 <20241112100547.2908497-7-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112100547.2908497-7-victor.liu@nxp.com>
X-CM-TRANSID: Ms8vCgBX33HV2VZnbrePBA--.47878S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr45Cr4kuF4UCry7CrWruFg_yoW8JF4DpF
	Wjg3y8Gw10vFZ5Aw1v9w18WwnYvan7Xry8XrnrJw1xGasFkFZ5JrsakF4vv3Wqv3ZxCw1k
	Xwn8X34rGas8Cw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7xhJUUUUU=
X-Originating-IP: [114.218.218.187]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAGwZWdWx209gQAAs3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_035249_138308_71CB6602 
X-CRM114-Status: UNSURE (   7.52  )
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

On Tue, Nov 12, 2024 at 06:05:46PM +0800, Liu Ying wrote:
> One ITE IT6263 LVDS to HDMI converter is populated on NXP IMX-LVDS-HDMI
> and IMX-DLVDS-HDMI adapter cards.
> 
> Card IMX-LVDS-HDMI supports single LVDS link(IT6263 link1).
> Card IMX-DLVDS-HDMI supports dual LVDS links(IT6263 link1 and link2).
> 
> Only one card can be enabled with one i.MX8MP EVK.
> 
> Add dedicated overlays to support the below four connections:
> 1) imx8mp-evk-lvds0-imx-lvds-hdmi.dtso:
>    i.MX8MP EVK LVDS0 connector <=> LVDS adapter card J6(IT6263 link1)
> 
> 2) imx8mp-evk-lvds1-imx-lvds-hdmi.dtso:
>    i.MX8MP EVK LVDS1 connector <=> LVDS adapter card J6(IT6263 link1)
> 
> 3) imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso:
>    i.MX8MP EVK LVDS0 connector <=> DLVDS adapter card channel0(IT6263 link1)
>    i.MX8MP EVK LVDS1 connector <=> DLVDS adapter card channel1(IT6263 link2)
> 
> 4) imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso:
>    i.MX8MP EVK LVDS1 connector <=> DLVDS adapter card channel0(IT6263 link1)
>    i.MX8MP EVK LVDS0 connector <=> DLVDS adapter card channel1(IT6263 link2)
> 
> Part links:
> https://www.nxp.com/part/IMX-LVDS-HDMI
> https://www.nxp.com/part/IMX-DLVDS-HDMI
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Applied, thanks!


