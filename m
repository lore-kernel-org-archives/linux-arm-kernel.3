Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0D7CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 14:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f8ksrreibEDx1ydWLSjaks7SLTKcK9oFAIsdMwlQ55U=; b=JGf/w7mFnCXuLoRbnCNGz8NwYr
	DkDe1QSN8QOTp4FoGtE0AQSNV430Cm8na4AeXlg+6v1sDLrLMegXTPukMhWhyWdzO9LtFIavrqgst
	/EznbHbk1wUck1VY4e/wH9d6Xz2R7mM7tv5vubjNz9H8Rl5umeVBD7ntIYO/1FgkCPEwpKe4ncFTo
	VBonZmD4tPHKBp+X4AQdqSeOsij+SQR2K7ESLC82DmUhZMTQ6YUpA7y44xW95fS7+D/Ef6igjjzW2
	BK/mN4YAL9bpgqrfFsKJPQV6FC6Y2KZz1AMAS2s74U2gXgkTH1o9kGOR/KSwa9CmQo5Ox/uO5xo+z
	4NhJCvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA7ep-0000000A00K-3IaP;
	Sat, 18 Oct 2025 14:11:43 +0000
Received: from mx1.wiredblade.com ([162.216.242.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA7em-00000009zzz-2Z5L
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 14:11:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=psihoexpert.ro; s=dynu;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=f8ksrreibEDx1ydWLSjaks7SLTKcK9oFAIsdMwlQ55U=;
	b=AGNYPmlkUzr4J8DpQCZ7aTY3k7br3iQcjjtNCAMAQGHqYphqSQ+iQ/L0DruTzvJMXK4empjj+qXHICxjbRXijb1tV7F4pSTQcgsSpZZo+HDWpAPEXIAGu/6pT2TJNt55RjZ8WKRMXelEf99Xof/FoMBCvWzfC0syDQ64hsw95cnBmWEr5Z2IGY177Ei+Z0r2jIQCwqSOXp/hG528HhvFSrsBegnPtRMMux2+yrMIPdNUmdaV2rJT1xEE+h
	gUZJFzpwr1pvZmZAbu5JjH0908aUGK2IlEi0XbaNj+4Z18u4WdS8kkTCEbOc7GoSaQNsMPRv3Gzt9y3LVfi0A1nafI9w==
Received: from TkB (188-24-192-7.rdsnet.ro [188.24.192.7])
	by mx1.wiredblade.com with ESMTPSA
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256)
	; Sat, 18 Oct 2025 14:11:37 +0000
From: Marius Dinu <m95d+git@psihoexpert.ro>
To: linux-arm-kernel@lists.infradead.org
Cc: Marius Dinu <m95d+git@psihoexpert.ro>
Subject: [PATCH] drm: rockchip-dw-dp: add missing dependency on bridge_connector
Date: Sat, 18 Oct 2025 14:11:30 +0000
Message-ID: <20251018141130.13170-1-m95d+git@psihoexpert.ro>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_071140_801111_860E1788 
X-CRM114-Status: UNSURE (   7.84  )
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

Avoids this error:
  LD      .tmp_vmlinux1
  ld: drivers/gpu/drm/rockchip/dw_dp-rockchip.o: in function `dw_dp_rockchip_bind':
  /usr/src/linux/drivers/gpu/drm/rockchip/dw_dp-rockchip.c:108:(.text+0x188): undefined reference to `drm_bridge_connector_init'
  make[2]: *** [scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1

Signed-off-by: Marius Dinu <m95d+git@psihoexpert.ro>
---
 drivers/gpu/drm/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index b7b025814e72..d335bb12a369 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -11,6 +11,7 @@ config DRM_ROCKCHIP
 	select DRM_ANALOGIX_DP if ROCKCHIP_ANALOGIX_DP
 	select DRM_DISPLAY_DP_AUX_BUS if ROCKCHIP_ANALOGIX_DP
 	select DRM_DW_DP if ROCKCHIP_DW_DP
+	select DRM_BRIDGE_CONNECTOR if ROCKCHIP_DW_DP
 	select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
 	select DRM_DW_HDMI_QP if ROCKCHIP_DW_HDMI_QP
 	select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
-- 
2.49.1



