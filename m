Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528F5C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 11:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjW/S1wj+bsZEprtcW0AfkkvqS+OgAoSKYgQyE7SjV4=; b=2zMFsZIawUH5HFmr8TGbheCQ3l
	+KdCBoVv1nByM2kO156B45vGzYGkbijgWJzRLjJcmNcZqA96LmGyq01VFBFjGUC1/i53mzE/2vn1A
	lJYfed1STDuk4n1/TWZn9QcoEiFn6s7WFq67MKhjEz1bAMLztMjtgHZQRc1UtNTDi79y+xwrdzyMa
	wKz1BShOEWHj2izj114g4AS+22Fd+HtXTbng6aPgMSYdPG054+oYBcM70WMMguupLbj1G3aLMOavI
	ItfKrR8RB8eX1iveab8JXYwr69Eau/IXwc0rdZ3aK1C0kYXsjxxHZFZGy5fvAPHwTt/nbrhQBshNE
	+hcfm7vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBX8V-00000005Djy-0IxT;
	Sun, 04 May 2025 11:03:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBX4k-00000005DTT-1H5f;
	Sun, 04 May 2025 11:00:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=VjW/S1wj+bsZEprtcW0AfkkvqS+OgAoSKYgQyE7SjV4=; b=cExt7QZ9//sJx6sNHJx3b66viV
	JeCAQajhqriJs2/S2c1ru6cIX5GEke8nF5FjkwJ8Rpyx01+75MPOGtKDQRxkm7JmaY7EEd3tfCuAG
	6M/OazxmoCR8pLCspg4HoSBrjDg64J5EaRcornEsIZSGTUqmzvfqina+ranhIWl+dX3V6AnqBZ9t/
	Ia3B9QTk3B4G9hKrIP6xrT4ldPW24pdNmdwPD7O57RLcMO9MJNeZX9C4FwYMU7FToEq0f43brcftj
	RwT3qu/3lMCR2CQ+TqD0RZeU8EsZdxXzyQTJQDzAKBXvbwF1SUZOYVUVnmi5ipjIBAf/uJK83h9jW
	EvaIunVA==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBX4X-0001M5-Nx; Sun, 04 May 2025 12:59:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	hjc@rock-chips.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com,
	knaerzche@gmail.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v4 0/7] Convert inno hdmi to drm bridge
Date: Sun,  4 May 2025 12:59:39 +0200
Message-ID: <174635636712.1068615.12087879387464324976.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250422070455.432666-1-andyshrk@163.com>
References: <20250422070455.432666-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_040002_342100_6D2B29B2 
X-CRM114-Status: GOOD (  12.24  )
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


On Tue, 22 Apr 2025 15:04:39 +0800, Andy Yan wrote:
> When preparing to convert the current inno hdmi driver into a
> bridge driver, I found that there are several issues currently
> existing with it:
> 
> 1. When the system starts up, the first time it reads the EDID, it
>    will fail. This is because RK3036 HDMI DDC bus requires it's PHY's
>    reference clock to be enabled first before normal DDC communication
>    can be carried out.
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: display: rockchip,inno-hdmi: Fix Document of RK3036 compatible
      commit: c0673bb356557136954b6725bf5fe327b94c6233
[2/7] dt-bindings: display: rockchip,inno-hdmi: Document GRF for RK3036 HDMI
      commit: e0c93980d293b6e6eb7483fd5d665f84e725b518
[3/7] drm/rockchip: inno-hdmi: Simplify error handler with dev_err_probe
      commit: 31b4403c6c523a710205eadb9ca75c6cfe1478ab
[4/7] drm/rockchip: inno-hdmi: Fix video timing HSYNC/VSYNC polarity setting for rk3036
      commit: ad10b82c2bcac7f87ac6eaecfca33378b43425ee

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

