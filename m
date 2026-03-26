Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F8910AB827
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 21:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YBzB71dE0pdJ+dnfdQvKEhgr8lOJNALH/5GWipiMeLc=; b=eL1N1A0HY42niv0Nx3ujQdUVJ6
	e/fUiUa3vCQp4AaT7V4n3xlpZ2fjqJdyCLSI7lH29kCl4liP5pLn0/dSNi1/09sC/sjP8uGXjgCW6
	gjxXUOe4Vv+USsgLnuzxQ30RxlyTUp95US3b+8pD2pfzps4oViRqeqOlXKX+gA1RX7nre3T/r7c8/
	aqmrXC+goIG4LaEknxZ5YQe5o2Kw3WOI3TsWXXmFGuxsItx/QoOhH8fWVQzGPOE9CRjz+3214Uy8h
	s6v0KLVGPza6h1vO5KkK5AzHpL8go2XygWpn9hfiZ7crdL7es1TyAWVnpPl5Yo0WAR3ypQu7ovYjk
	5GKWuBhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5sL0-00000006Fow-0Qr3;
	Thu, 26 Mar 2026 21:33:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5sKw-00000006FoC-1v5k;
	Thu, 26 Mar 2026 21:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774560830;
	bh=UJ7IfM+4HsiYwurKznVZ8C5jmeOO2cQyvqn4AUUAfMw=;
	h=From:Date:Subject:To:Cc:From;
	b=ogaLryjX5Zm1JANA7OZREG/2D70qzHjon1WgxLw0HlvUblbSmtaKuImbs3WsU6ZAw
	 ojh2RThZiHvbbZDIBFi7RivDWH4AjH7H0Uu49GAUADQPVIJL7AgACLhsV3Ygh5NnSe
	 X5W3kGPF8VLAygGZEJ05c9aNz7/0z8gyoN3bFvE45Wt0YXEipw056xxE5anGz3CaJk
	 TuM0gyxzzdVjX8NkGZFVqjiBRi8wHOk5FNR0zpf6KcUxJsUGpKTt6K/mVJlTUfqxag
	 9hEd4EzDsw0mtz/77FRtGP6vukVuTBdRTNwtWd+frHJq4nRO8sIMf5QgvpbMxVPCeZ
	 5AlUiJ6K5e/Qw==
Received: from [192.168.0.15] (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 519E717E5200;
	Thu, 26 Mar 2026 22:33:49 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 26 Mar 2026 17:33:25 -0400
Subject: [PATCH v2] arm64: defconfig: Enable Rockchip video decoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-rkvdec-add-defconfig-v2-1-d65c296da9ba@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0JmbQ0t1Kgr72FYTKdTqCI1LTYaw
 t0FPIDLl7z//gSJo+cE52KCyNknH4YF1K4A6nBoWXi7MKhSHcpKaRHv2TIJtFZYdhQG51vBiFK
 ikbWTDpbpM7Lz7y17bX6cXubGNK6t1eh8GkP8bL9Zrt6fiyyFFMcTam0rYzTVFwp9jyZE3FN4Q
 DPP8xdOSqikzgAAAA==
X-Change-ID: 20260325-rkvdec-add-defconfig-eaa11ab14f1f
To: linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 linux-rockchip@lists.infradead.org
Cc: Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_143354_694362_F87D154F 
X-CRM114-Status: UNSURE (   7.83  )
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

The rkvdec driver is now out of staging and can be built by default.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Changes in v2:
- Update commit message
- Add missing CCs
- Link to v1: https://patch.msgid.link/20260325-rkvdec-add-defconfig-v1-1-89a55d3bb5c4@collabora.com
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..4b3f31cb4a94 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -931,6 +931,7 @@ CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
 CONFIG_VIDEO_ROCKCHIP_CIF=m
 CONFIG_VIDEO_ROCKCHIP_RGA=m
+CONFIG_VIDEO_ROCKCHIP_VDEC=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m

---
base-commit: bbeb83d3182abe0d245318e274e8531e5dd7a948
change-id: 20260325-rkvdec-add-defconfig-eaa11ab14f1f

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>


