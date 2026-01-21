Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C92C44502
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 08:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3h5K98mpUaP2HOxH95Iz3m/g1kohTemp9eBgSQV7pzY=; b=sBXzsXkP6H+LMh+43JUce0Uokh
	O2ensDH3Ao5tOJPb+KmA8d+uUwZQFBccOKJpEFPKIWioAMHy+QwvQxb7YXbf7fDKUovahWg/WiPAf
	szwCOC6vDkOutHIcTtlW719DmwVK4EywoZn3IG8ffGZxe+QP/FOp8b+LCr4X1G6qX1xZ9ivFIb7l9
	WeNCzqUBVsX9OtGattoMML2EzHCKzqw4llf+kFgBYQQM5yTtC7calbJHkh0ZUC6gxCoULjJLEMFPw
	MCh9Ox0mWxsD+CWnTngbFHHsYwB/vLHVMO3Gv0/N1UUmwC8UGeOX5V4BNgA9UV04g1VCTUeho+Hl/
	QlHWBbeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTwW-000000057Uo-0rsO;
	Wed, 21 Jan 2026 08:52:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTwU-000000057UX-1IfX;
	Wed, 21 Jan 2026 08:51:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BAEA460051;
	Wed, 21 Jan 2026 08:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7334BC116D0;
	Wed, 21 Jan 2026 08:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768985516;
	bh=b1OkaZbNKUB0kzLe7Q/SqmLQZt0wkkv/yFCuw4NH4Cs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JRox7huEDz8nFWjSs4ZCXM5FZBDddqq3Hbm0Fc8HE36ratOpY588+7QfjRwnqaBcI
	 MJnHocoLBWWAm2tYtnOcO57kCvQ5KdvPjZp7KWpkPN7ruiujb740/53CENj7XQcjMu
	 MAwUXv8UiXZGzarjbnl2opyXRkFC9gAK60D5N4+Rz/BEzq1fuEJauwM5CHWYfeEtza
	 ub2sxpomfTBZmFt06nBF/xrL+XQ4r/IBQCHmN+2HZD8XtPtb7nQ9EgG/qmRvFz4ZU0
	 2M4RM68hgh3K/fBNLWcxNm45GckJf2MFfRonCnhAPBrQEShersIDi0VeEQuBeGtPBX
	 MSPFcXuYROycQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
In-Reply-To: <20251221-phy-hdptx-frl-v5-0-dac390a780be@collabora.com>
References: <20251221-phy-hdptx-frl-v5-0-dac390a780be@collabora.com>
Subject: Re: [PATCH v5 00/11] Add HDMI 2.1 FRL support to
 phy-rockchip-samsung-hdptx
Message-Id: <176898551090.1268719.6685367481494669298.b4-ty@kernel.org>
Date: Wed, 21 Jan 2026 14:21:50 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Sun, 21 Dec 2025 12:46:47 +0200, Cristian Ciocaltea wrote:
> The Samsung HDMI/eDP Transmitter Combo PHY is capable of handling four
> HDMI 2.1 Fixed Rate Link (FRL) lanes, while each lane can operate at
> 3Gbps, 6Gbps, 8Gbps, 10Gbps or 12Gbps.
> 
> This patchset extends the HDMI PHY configuration API to manage the FRL
> mode and provides all the required HDMI driver changes to enable FRL in
> addition to the already supported TMDS mode.
> 
> [...]

Applied, thanks!

[01/11] phy: hdmi: Add HDMI 2.1 FRL configuration options
        commit: 41c6cac6decd5123db1da8ca240a9c808b0ae6ce
[02/11] phy: rockchip: samsung-hdptx: Use usleep_range() instead of udelay()
        commit: 0ef8dd1034e3656e40d020911bb7aa14e7084663
[03/11] phy: rockchip: samsung-hdptx: Fix coding style alignment
        commit: 4f310f180373bd0e68311debee7a0dddb14c1656
[04/11] phy: rockchip: samsung-hdptx: Consistently use [rk_]hdptx_[tmds_] prefixes
        commit: 925f26a4f8c65e5686e1820f0bdc7e0a237edba7
[05/11] phy: rockchip: samsung-hdptx: Enable lane output in common helper
        commit: 8e8aa072b19d0d16afbfd690c8e50628176db3ef
[06/11] phy: rockchip: samsung-hdptx: Cleanup *_cmn_init_seq lists
        commit: df74a964e4354e65fefef60c9c50765ff32cd26e
[07/11] phy: rockchip: samsung-hdptx: Compute clk rate from PLL config
        commit: 3481fc04d969bc1528c2d1f7c02443a9fccf1a83
[08/11] phy: rockchip: samsung-hdptx: Drop hw_rate driver data
        commit: 66d76b6d958d7ca195c8b3f43828b12a206fb731
[09/11] phy: rockchip: samsung-hdptx: Switch to driver specific HDMI config
        commit: ac079c1207e492924237fdfb12c93664265b2e23
[10/11] phy: rockchip: samsung-hdptx: Extend rk_hdptx_phy_verify_hdmi_config() helper
        commit: b14fec4dbda301d61603c047277b4f447837b3e3
[11/11] phy: rockchip: samsung-hdptx: Add HDMI 2.1 FRL support
        commit: de5dba83311842cf208735b37bea84073688d470

Best regards,
-- 
~Vinod



