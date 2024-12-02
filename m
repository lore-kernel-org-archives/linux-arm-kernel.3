Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B4CE69E8E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 20:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=huREC4F4EjoHDJ8m4jOFEfhoXERfQvxfGR+If3cTleE=; b=PLIKMG7ctyTLoe3Cy9KfwYE8wx
	onuWwSzuzj9Wd1evLByTbHD6Csb1tgUbCosJ4A5i7YSORx+4eo4mOLcVXAh6V/x7ZesW44e3gZmZ5
	b+Om2CmM4CXDzkbadA9tGQ6+GUgbKDGszCutCsH9dliTt521OwMfeOJnbAFWuh/vkFXYerFpJhi4w
	cwwrXRWebLYCFAW5JQ98XPM9Wt755++n6x9/etnbuPV5muNALNXE0xIHJV4RjrqLKR8r5ZRFaOQv0
	uiQySi8+Cq9zFRgLiXAqImi/nHe4oKvTGlPOrhf/67KxXSOR5c6O/ssxTv0YR458uVF7U/yiMyh8z
	W2IpxROg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tICcv-00000007N2q-1Ttb;
	Mon, 02 Dec 2024 20:02:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tICbr-00000007MnK-2ySd;
	Mon, 02 Dec 2024 20:01:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733169688;
	bh=AcS9h9A8rhS7zBTPZQsgnAul4AOihkxYcdRYoDEwHuQ=;
	h=From:Date:Subject:To:Cc:From;
	b=UIHJ/hzXSA65dcl7gpECngWh6Kxj5yyQWmrKTPHhbyigJW2R9mT+dyEah/IC4mpG0
	 yeql7GWzIHHthswYeo0TVyUIfJ67/RrOycoUTy3e8gcn7BJNwcE4Ui+KesOp3/mKzs
	 dwX1lU1rrCtzykx+LSxtMCG83mwGyHecTXCbQCpxUA8NWEQpZwzTWxPAhy5r126fM7
	 ZBHS/8Vx2Y2cxpIk5wiwrLIBCZvNRFVveNKhTNrzIpSd0R+McS7QWbbZw5iMXjQgxl
	 t1go9XUkAB9rooJPyZRKk+B8awPxTZ0Qe23tbazMQuSEQ93BCWfoCBBdOmRRGfW4PG
	 9+XnlmfRYmc7w==
Received: from localhost (unknown [86.120.21.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1D44617E37DB;
	Mon,  2 Dec 2024 21:01:28 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 02 Dec 2024 22:00:57 +0200
Subject: [PATCH] arm64: defconfig: Enable Rockchip extensions for Synopsys
 DW HDMI QP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-dw-hdmi-qp-rk-defconfig-v1-1-38757fc053d0@collabora.com>
X-B4-Tracking: v=1; b=H4sIAPgRTmcC/x2MywqAIBAAf0X23EJKD+hXooO4ay2RmUIF0b8nX
 QbmMPNA5iScYVAPJD4lyx6K6EqBW2yYGYWKg6lNowuQLlxoEzwiphWJvduDlxmJdNs3fWs6a6H
 UMbGX+z+P0/t+xW2wGGkAAAA=
X-Change-ID: 20241202-dw-hdmi-qp-rk-defconfig-dd15747526aa
To: Heiko Stuebner <heiko@sntech.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_120131_927587_F267807A 
X-CRM114-Status: UNSURE (   7.70  )
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

Enable Rockchip specific extensions for Synopsys DesignWare HDMI
Quad-Pixel (QP) driver.  This is needed to provide HDMI output support
for the boards based on RK3588 SoC.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e6158633f07c1f3532fba62f09b31e7448..286a386496014cf6d7d03d1efaa84ef4cffd57af 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -872,6 +872,7 @@ CONFIG_ROCKCHIP_VOP2=y
 CONFIG_ROCKCHIP_ANALOGIX_DP=y
 CONFIG_ROCKCHIP_CDN_DP=y
 CONFIG_ROCKCHIP_DW_HDMI=y
+CONFIG_ROCKCHIP_DW_HDMI_QP=y
 CONFIG_ROCKCHIP_DW_MIPI_DSI=y
 CONFIG_ROCKCHIP_INNO_HDMI=y
 CONFIG_ROCKCHIP_LVDS=y

---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241202-dw-hdmi-qp-rk-defconfig-dd15747526aa


