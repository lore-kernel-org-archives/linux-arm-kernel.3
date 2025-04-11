Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49CBC369A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 12:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jaClsTO2lfONRXtl31ldVRO6E5Z4LL4DqzPB/eVnS7M=; b=E/cW9vgmpTIs4/ybwzNXbG87LW
	INCzR3+PFkCgwWwxNQgdg5Ryn19pQjtmusZl9LtOfTE/zfqLg5zliu39ZGvGfILPFDH3lyOGxJZVe
	LEwWdqqEVnnVs+7GvI1Io90B4Jwp1z+ituSB6pnD3XHokHpNy0TkDiUTvJh9kKZEibeNGuEgekqwe
	SAur3DA5r5hN+tVG6bZJRBz9rAOx6ZHCarXjqjsUYtuBE4c/mYenEOZfM3eair8tEthHiEZzdXFJ8
	iKirGPJbLCyZEtASGjCr0raFfazK8nkZIYk4XLxt1X/Mi9xSrf3kaye2ErTQFaSe+ap4L9Y2REe1v
	8RqBqnVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DRe-0000000DjPy-3bev;
	Fri, 11 Apr 2025 12:25:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DE8-0000000DgiG-1HuH;
	Fri, 11 Apr 2025 12:11:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B36068459;
	Fri, 11 Apr 2025 12:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A5DC4CEEC;
	Fri, 11 Apr 2025 12:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744373479;
	bh=12U8A9tqFraTkbX8UucQrHYVXY0lsm8Dl+Z4zRDU7+M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K3dSX4tRj7rJ9O1JP0isV71y1pRkYOkWhdxA4/IoSEK64MYcwp+4fRUgs4XuosURC
	 FJ+eVvLwRBH/Xmz4HsgLa4bMNianpOCI+1O66a+ekF5/AkNzXrzzt5h1nxS0ASDF54
	 X6pa08EMqcgJvIZJQp0EJZPkQLX8YvbtdvAKHlUQ2ZE2VBdtUCCDew4Bk6M+g5HXbX
	 X9+QYoUY94VJuma7WoS7l7Vv3fOsbLjPmaLHgkE3M71MsTcvmAsm8z6duGH46ePTIh
	 ukJZUFxvECbyl6MxIm/kK0tV1+SKSPH5KhZQRoxIj4Ey+hkEoxQtPq2VkBQD9c3dW6
	 yJUZQmyGxClgw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250318-phy-sam-hdptx-bpc-v6-0-8cb1678e7663@collabora.com>
References: <20250318-phy-sam-hdptx-bpc-v6-0-8cb1678e7663@collabora.com>
Subject: Re: [PATCH v6 00/14] phy: rockchip: samsung-hdptx: Support high
 color depth management
Message-Id: <174437347571.673939.550787962753296084.b4-ty@kernel.org>
Date: Fri, 11 Apr 2025 17:41:15 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Tue, 18 Mar 2025 14:35:34 +0200, Cristian Ciocaltea wrote:
> This series relies on the new HDMI PHY configuration options [1] (patch
> included here for convenience) to provide high color depth management
> for rockchip-samsung-hdptx, and to introduce a proper solution to setup
> the TMDS character rate on this PHY.
> 
> [1] https://lore.kernel.org/lkml/d1cff6c03ec3732d2244022029245ab2d954d997.1734340233.git.Sandor.yu@nxp.com/
> 
> [...]

Applied, thanks!

[01/14] phy: Add HDMI configuration options
        commit: 10ed34d6eaaf86e301a8f2dd190d26dfbc9799bd
[02/14] phy: hdmi: Add color depth configuration
        commit: 3bb9286f4ece6acbc1fbaa9f192a82645d30efbf
[03/14] phy: rockchip: samsung-hdptx: Fix clock ratio setup
        commit: 0422253ac1919fea8292381c85f11a9decff1bb1
[04/14] phy: rockchip: samsung-hdptx: Do no set rk_hdptx_phy->rate in case of errors
        commit: 1f4d382769e3b38dfc498c806811dae856e40f31
[05/14] phy: rockchip: samsung-hdptx: Drop unused struct lcpll_config
        commit: 6218c3fd6702a5bc4ab323fed25714cde127684c
[06/14] phy: rockchip: samsung-hdptx: Drop unused phy_cfg driver data
        commit: bcd61d182618c6a77d0841fcdc3333e125725360
[07/14] phy: rockchip: samsung-hdptx: Drop superfluous cfgs driver data
        commit: bacf2fe750dab6bc7ed50556aaadd3ab107fc643
[08/14] phy: rockchip: samsung-hdptx: Avoid Hz<->hHz unit conversion overhead
        commit: 0edf9d2bb9b4ba7566dfdc7605883e04575129d9
[09/14] phy: rockchip: samsung-hdptx: Setup TMDS char rate via phy_configure_opts_hdmi
        commit: c871a311edf0ebb1b934946a84a6c532cac0c035
[10/14] phy: rockchip: samsung-hdptx: Provide config params validation support
        commit: 2392050a2cb94ff3397949e109e4b9f0285ee085
[11/14] phy: rockchip: samsung-hdptx: Restrict altering TMDS char rate via CCF
        commit: 6efbd0f46dd8ae1d2b91b41d98c2800c60ab1f5e
[12/14] phy: rockchip: samsung-hdptx: Rename ambiguous rk_hdptx_phy->rate
        commit: 37f335dbfd028c008d0a7940ca5a270d1e2f6b81
[13/14] phy: rockchip: samsung-hdptx: Optimize internal rate handling
        commit: 45b14bdcf4acfd483d9890396197c35c23821124
[14/14] phy: rockchip: samsung-hdptx: Add high color depth management
        commit: 9d0ec51d7c227c3ae837e22832eaed219e25f126

Best regards,
-- 
~Vinod



