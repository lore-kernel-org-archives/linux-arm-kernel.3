Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B44AC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fFhzIq+MX51w32vSTa4ODaYitxoGagZp/jBOQAA+Dc=; b=YJF4zs9EEhpUchHtMGPWrwnP//
	vNs+NbQxRHCHCLQa6m7dxhOBJbstDeh6jT3SByEi0x+CEH4l0tVR9lKQsnEEcSBbGU2c/HRRBc/Ph
	MtcJPMSaA9dv2yoeWZ2Uk+xkwpbtM6t1+JD7ik+T5b3GhZj+aFl0nQPGUc6+qI4hYyvjqs4Ynp4t3
	1nRQMT8ky94sFJgJgaqu+VzoHq6SZqfGJ/jyQUUu/YUZhQWjNgDMotGthKHw55GCGb7WtM6JdcfhF
	6MRPfiIz5BkqnJQ8GIyQz28BE/sW7l+UlEbrwlTbJ0fl+lU9Low5yispl++7k033vUQ8QyurARn6A
	e/3IoodA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKFT-000000083v1-23pC;
	Fri, 07 Aug 2026 13:04:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKFS-000000083ui-2arR;
	Fri, 07 Aug 2026 13:04:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 39B0140400;
	Fri,  7 Aug 2026 13:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE9EA1F000E9;
	Fri,  7 Aug 2026 13:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786107870;
	bh=3fFhzIq+MX51w32vSTa4ODaYitxoGagZp/jBOQAA+Dc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VWcIOhramT7rlH4zrA6e5BFyTjoOlov24iXYDz8kaOJkaDjLfD3eG20QFCXdguwaH
	 MKCTmUk8n/8lSvg7PpdrXY05CiL97s9VmZ43NGAEoRduTA07WhGAUzWhVDv55zRLhS
	 NUpkce6/LgMSqrI0rVV2g5h1EqZt7voXks1iBdI0gF2iDZewmgTHhVvqTbdCSPZIql
	 3DJtcirSnFCw3adO6AodMECcyS38t22JBWXKoP3VbeiOBN9ufewerxS7f5k4Xk9A1Y
	 tbzLXaQUUDuIcqo/9tvflD3rM6mVjIQSR3IzZNbHgXZMPiz0lsochVt+z/07f9pAjb
	 NEnzmNIZUAU5g==
Date: Fri, 7 Aug 2026 15:04:20 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Algea Cao <algea.cao@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Thomas =?utf-8?Q?Niederpr=C3=BCm?= <dubito@online.de>, Simon Wright <simon@symple.nz>, 
	Diederik de Haas <diederik@cknow-tech.com>, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v5 05/10] phy: rockchip: samsung-hdptx: Handle
 uncommitted PHY config changes
Message-ID: <wuoofxrtk3ieb5ukmk4jed3oyeqhyyttdo7fidz7qyingswtki@53vy32pjjqja>
References: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
 <20260723-hdptx-clk-fixes-v5-5-8e786067865f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260723-hdptx-clk-fixes-v5-5-8e786067865f@collabora.com>
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

On Thu, Jul 23, 2026 at 10:41:48PM +0300, Cristian Ciocaltea wrote:
> Any changes to the PHY link rate and/or color depth done via the HDMI
> PHY configuration API are not immediately programmed into the hardware,
> but are delayed until the PHY usage count gets incremented from 0 to 1,
> that is when it is powered on or when the PLL clock exposed through
> the CCF API is prepared, whichever comes first.
> 
> Since the clock might remain in prepared state after subsequent PHY
> config changes, the programming can also be triggered via
> clk_ops.set_rate().  However, from the clock consumer perspective (i.e.
> VOP2 display controller), the (pixel) clock rate doesn't vary with bpc,
> as that is handled internally by the PHY and reflected in the TDMS
> character rate only.
> 
> As a consequence, changing the bpc while preserving the modeline may
> lead to out-of-sync issues between CCF and HDMI PHY config state,
> because the .set_rate() callback is not invoked when clock rate remains
> constant.  This may also happen when the PHY PLL has been pre-programmed
> by an external entity, e.g. the bootloader, which is actually a
> regression introduced by the recent FRL patches.

Don't mention 'patches' in description. Once the patch gets merged, it becomes a
commit. If needed, reference the offending commit(s) directly.

> 
> Introduce a pll_config_dirty flag to keep track of uncommitted PHY
> config changes and use it in clk_ops.determine_rate() to invalidate the
> current clock rate (as known by CCF) and, consequently, ensure those
> changes are programmed into hardware via clk_ops.set_rate().
> 
> Moreover, proceed with a similar fix in phy_ops.power_on() callback, to
> handle the scenario where the CCF API is not used due to operating in
> FRL mode, while the clock is still in a prepared state and thus
> preventing rk_hdptx_phy_consumer_get() to apply the updated PHY
> configuration.
> 
> Fixes: de5dba833118 ("phy: rockchip: samsung-hdptx: Add HDMI 2.1 FRL support")
> Fixes: 9d0ec51d7c22 ("phy: rockchip: samsung-hdptx: Add high color depth management")
> Tested-by: Thomas Niederprüm <dubito@online.de>
> Tested-by: Simon Wright <simon@symple.nz>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS
> Reviewed-by: Andy Yan <andy.yan@rock-chips.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

