Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81391D6DDE1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 13:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+qj7oh9KNg4cPkW2m+Q2tqwjODFyQtNZoavOVJ3o1s=; b=S5n8zUnUtec1znM8D1RHY5cJJH
	JYR9oAmhNQep4TtqzEQuewKGJ7IFZAg79C+7EH31vm1LTlFjmSU8GABV7PuKpr4QxQYytZhLC9Zkh
	DMiKhdMwrkx64pYcy+aWUklM2mpgF1C0uF34mIbFa9PRzqNbhYlfY014yLOQgjsIXZsB7EkzQzZ4+
	DYF4T9+3uy6hBkGEvamfbYMwfaeEAeOZXGH1ePdywgynA/qZamGa+OyV41tXH71aAbdw0i3Tds94x
	7qf4Dkw9V2wfQ/ZhZ+5rrjyMKQgHC3JCZk4V0gtIrAWxyDPDEDvUvQo3Ef8Cg550vkIRay46354jM
	UFjPzhXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwS9-00000002puU-2WdJ;
	Fri, 15 Nov 2024 13:33:37 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwRD-00000002pj9-3ReO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 13:32:41 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9F1578933F;
	Fri, 15 Nov 2024 14:32:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731677557;
	bh=H+qj7oh9KNg4cPkW2m+Q2tqwjODFyQtNZoavOVJ3o1s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=x/yKgXzt5wXdAhX1heSr54ECEMtwnb7KeIjmhCnEFKsCmW55rEtnTUDRTOYa6DgOl
	 1q4lxu/oPO0lQDqPj+7YqFaNctKqkC00ktQpuyapcEsphRjU/baM0WTsMMrkZEq+YA
	 J912rP2jKFVOMTK4V5tEQmqdbkZlr9rvC6QDxgsqFr3gCYfBGDm5fh/7qrf2Bugb81
	 exqm5vFPCgl6dyhT9hNJYpZyr0FU6OZXzfOR1dLJO7L+Bf6BnXGmp03BYdgi6iqUBQ
	 83EefnCuEz9o3BwHN6cmXG155y1UAHVRX4OsR7mWlhJxRzelXyltN/PZJJu7O9K6Fy
	 8FID/dPGlBYww==
Message-ID: <df6ebdde-65f8-4aad-93c7-b1df695bd2ef@denx.de>
Date: Fri, 15 Nov 2024 13:31:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] Revert "clk: imx: clk-imx8mp: Allow media_disp
 pixel clock reconfigure parent rate"
To: Liu Ying <victor.liu@nxp.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
 sboyd@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com
References: <20241114065759.3341908-1-victor.liu@nxp.com>
 <20241114065759.3341908-3-victor.liu@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241114065759.3341908-3-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_053240_165457_B398496D 
X-CRM114-Status: GOOD (  13.78  )
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

On 11/14/24 7:57 AM, Liu Ying wrote:
> This reverts commit ff06ea04e4cf3ba2f025024776e83bfbdfa05155.
> 
> media_disp1_pix clock is the pixel clock of the first i.MX8MP LCDIFv3
> display controller, while media_disp2_pix clock is the pixel clock of
> the second i.MX8MP LCDIFv3 display controller.  The two display
> controllers connect with Samsung MIPI DSI controller and LVDS Display
> Bridge(LDB) respectively.  Since the two display controllers are driven
> by separate DRM driver instances and the two pixel clocks may be derived
> from the same video_pll1_out clock(sys_pll3_out clock could be already
> used to derive audio_axi clock), there is no way to negotiate a dynamically
> changeable video_pll1_out clock rate to satisfy both of the two display
> controllers.  In this case, the only solution to drive them with the
> single video_pll1_out clock is to assign a sensible/unchangeable clock
> rate for video_pll1_out clock.  Thus, there is no need to set the
> CLK_SET_RATE_PARENT flag for media_disp{1,2}_pix clocks, drop it then.
> 
> Fixes: ff06ea04e4cf ("clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure parent rate")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
Uh, I almost missed this revert between all the LDB patches.

This revert will break my usecase on MX8MP where I need to operate two 
disparate panels attached to LVDS and TC358767 DSI-to-DP bridge and I 
need accurate pixel clock for both. Not being able to configure accurate 
pixel clock will make the displays not work, so from my side, this is a 
NAK, sorry.

There has to be some better solution which still allows the PLL 
reconfiguration to achieve accurate pixel clock.

