Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE827E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 03:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhjzsZ5DuSkGPzq8vUSDqW2fpa7f+NUoENjEMTPrzW0=; b=sHnRYPBXBlIonQx87RmVdzDbs5
	tii5Zx3Fek6j40IixkB4iEXpxgB/xPfTg7MOy7tU21pYWPyFp9i47yNQTUNa2ci+hfPQLqW6gi27N
	S4dPRgqDRemz2d06GrMZZyT3PgaHyiaLvdxHKh8TcPOA31GlHrArbolzzsNw7JlmMNKqEb4TFdVKx
	YT/eZNsKemfiSJv1xcXwzsxzGdvcRN58kG5UGpvDaKLSB92EaPBKNtEpNWq35/B46fIZAgsv9uit9
	Dh4eSdSTeNCPkYqwtRK3Lje7rs3r1ghVwjH06n2Of1jAXC9eW5Wc7X5FCRocjyUGpWrVOnwpz8FG/
	CrmrHioA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVjFa-0000000AaIw-3XM2;
	Thu, 09 Jan 2025 03:30:26 +0000
Received: from mail-m19731112.qiye.163.com ([220.197.31.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVjD9-0000000AZcE-3Oj9;
	Thu, 09 Jan 2025 03:27:57 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 82c0199f;
	Thu, 9 Jan 2025 11:27:51 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rfoss@kernel.org,
	vkoul@kernel.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	l.stach@pengutronix.de,
	dmitry.baryshkov@linaro.org,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	algea.cao@rock-chips.com,
	kever.yang@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 01/20] phy: phy-rockchip-samsung-hdptx: Swap the definitions of LCPLL_REF and ROPLL_REF
Date: Thu,  9 Jan 2025 11:27:06 +0800
Message-Id: <20250109032725.1102465-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250109032725.1102465-1-damon.ding@rock-chips.com>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkwZS1ZOTh9PSx1KSRhMQhhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a94491aa8b103a3kunm82c0199f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OjI6Cyo4CDIQTBRCLAwvTCws
	KzowCVFVSlVKTEhNSEJISUxISEpDVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFCQkw3Bg++
DKIM-Signature: a=rsa-sha256;
	b=MlgXNWYFDT6XDzeqBAMqAOsi8hsXHu0jGPPfpfwItrhIFrVgLkLe7vK/0JM5cZIEF7cj9/A7cJKk1U/FQPZKDwfr7BsXc+SvAiFS+k04kipaj02AVf4vnrDI93BxP4q3QBc0oysP5NZdcSOTK9FL5zFK4Wxp/XrwFrm1Vy2vdwk=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=nhjzsZ5DuSkGPzq8vUSDqW2fpa7f+NUoENjEMTPrzW0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_192755_999975_E142004D 
X-CRM114-Status: UNSURE (   8.51  )
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

According to the datasheet, setting the dig_clk_sel bit of CMN_REG(0097)
to 1'b1 selects LCPLL as the reference clock, while setting it to 1'b0
selects the ROPLL.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 0965b9d4f9cf..efbea5b67c89 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -94,8 +94,8 @@
 #define LCPLL_ALONE_MODE		BIT(1)
 /* CMN_REG(0097) */
 #define DIG_CLK_SEL			BIT(1)
-#define ROPLL_REF			BIT(1)
-#define LCPLL_REF			0
+#define LCPLL_REF			BIT(1)
+#define ROPLL_REF			0
 /* CMN_REG(0099) */
 #define CMN_ROPLL_ALONE_MODE		BIT(2)
 #define ROPLL_ALONE_MODE		BIT(2)
-- 
2.34.1


