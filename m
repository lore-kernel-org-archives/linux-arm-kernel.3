Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF83CCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 12:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2wa4K0qWIFLcAnfmzypd+kDyosnJxyDAY3/uLjy03g=; b=y/acM5v7+KowqUDi4B8B8h7IoS
	c91d6AahfASKJG6zpGE7z4RUvAumI4Y8aisrQG3Jz+Y/VuDWEDqPg9Or5SDpETeK/tr4ZNQfJBkfg
	wbdlcfFqqh0w9FiPCza1JY1gGVIOEOuFCvWK5CvZw/C+t3CN9yoeS/pElvFfJ4iMuz6wGSPPQZFIs
	lpel77XvBed+fPnYnDetSGgDOQO6bZ0RQGMm8xWYlOooJyvYRt1IOZSyLDuWXZP0Ex8tbvSo23twr
	3tG5eBB1uTCaFoBBXYVYq6dSxCwSi7pXh/CW9Co/x3T9Rvk2kwykdTqowemCl1dzSgVWnzO+iUui1
	pI9sE2Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8e43-0000000GF11-0xxb;
	Tue, 14 Oct 2025 12:23:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8e40-0000000GF0S-3ZCw;
	Tue, 14 Oct 2025 12:23:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=A2wa4K0qWIFLcAnfmzypd+kDyosnJxyDAY3/uLjy03g=; b=DaOYctO2Ib9IIYYgqETAyF2zIt
	0+gdutChlJDPIJbn0lIc0SwMbpflnjgYWoOc7FgRiawhAQkz3x9py/RpPBWx2KjwC06eTD7fneq09
	bJp8jk4J3cRK3O0DZ32q6J+QQnBtn7Yuch+Q5V6lLihMBGmKAPfrwfQwJwNJSINqraC9zCmT40rC0
	AdvyMhuGPULRwEJ7U7cWltvUNxOa67xECIx+3RpFdtsy+6jYWsUbO04FuEhB+0FBHrauAfDjxX6Az
	8eX0hhGCHsZm3ry0U70sKnfyLUXe2QZoTMr6f0tpaMuvj2+vMOCYW47xmewnSGd8YFn+YzsGaDYuT
	cy3bAg7A==;
Received: from i53875b75.versanet.de ([83.135.91.117] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v8e3s-0007Hl-IL; Tue, 14 Oct 2025 14:23:28 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/8] drm/rockchip: Add MIPI DSI support for RK3368
Date: Tue, 14 Oct 2025 14:23:18 +0200
Message-ID: <176044455977.1550590.10827811203766869968.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905025632.222422-1-cn.liweihao@gmail.com>
References: <20250905025632.222422-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_052336_910547_CE1AE2CE 
X-CRM114-Status: GOOD (  11.73  )
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


On Fri, 05 Sep 2025 10:56:24 +0800, WeiHao Li wrote:
> This series adds MIPI DSI support for the Rockchip RK3368 SoC, enabling
> native display connectivity through the MIPI DSI host controller and
> PHY. The changes span multiple subsystems, including clock control,
> DRM/VOP integration, DSI controller binding.
> 
> Key changes:
>  - Update dw-mipi-dsi-rockchip driver to preperly handle RK3368 dsi
>    initialization.
>  - Add missing lut_size of vop_data for RK3368.
>  - Add missing clock ID SCLK_MIPIDSI_24M to the RK3368 CRU driver,
>    which is required for enabling the 24MHz reference clock.
>  - Add MIPI DSI node to rk3368.dtsi with correct clocks, resets,
>    and register mappings.
>  - Add dt-bindings document.
> 
> [...]

Applied, thanks!

[1/8] drm/rockchip: dsi: Add support for RK3368
      commit: 6dd6949c76afbec037a66e6b9bcb6e2c5dee933e
[2/8] drm/rockchip: vop: add lut_size for RK3368 vop_data
      commit: 8e944ab8196e421f20386f51c5ffc43baa145932
[8/8] dt-bindings: display: rockchip,dw-mipi-dsi: Document RK3368 DSI
      commit: 2b756d321bf9f4e93437198d212c6ccec137b295


Moved patch8 (dt-binding) in front of patch1 (driver addition)


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

