Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C5CC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 12:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0yohgYkQjzb94VDSiHA83Zz/hS6Vidm1VcQmoIPwK0=; b=S3dJw18C2/p/RjwrHFIGUeGeyF
	+qzNThFil096H0cb5KUYxx+eXrB4DQdbjnPKQysuMqOvhEAS39fXdR43KF4l6BaZvY/iOsV2tVulL
	es+NFDyq5QS5JWvlbHfge20I20BUh24qCUVETCIduVseheRBJ7QjFUJa39GDlv3ECYx6DMARSiOej
	uiTiaqLUE83sI8xhnkUMTyfDebx9ACTk9qExCJxL7AImcCUFhPtVIpr+qZr4eY1cskMuCzsBWlwzF
	eh3xdRisjOkX7kPyeDQvlXpspf187skKIt4IUWJB3+n+0aF+x2bqff3Z08Bwie18jXaStdb9apsR8
	4lOSP0OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfING-00000000Ss8-1xQW;
	Tue, 04 Feb 2025 12:49:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfIE5-00000000Rko-0CeU;
	Tue, 04 Feb 2025 12:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=T0yohgYkQjzb94VDSiHA83Zz/hS6Vidm1VcQmoIPwK0=; b=HLE9Up1XqICOkC+jL9X4gMm6OL
	1q/7bToo0a6/MWpzWe9D+n6HjmCtN4fHEjqymUqrTEbvqnu4TYExCv+zGIbzltQzBMFd3lWl96qJW
	AyMbo6Yd1lSr0rLJCzcZl9BrLF7LKsdIn8effNALH+W6BxG6owYUi2evVZQAnKvdRhcXkb5kKRYkW
	bBq1RKUHVfqtn8uMKmg2vepFoNtLmReR3tvtbygLLdfODbccDCGx786ec0ilVx9TCYV2beDZzoyhn
	qBNrvSK50mfDzOzj9rL7BV8g5XHIWqpCEUwXEarJasf1Vxnqb3Mq/Q8MTl0MR/hz8NMpzdbxnN9dP
	LFbKflug==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfIE1-0000000GIvj-3gui;
	Tue, 04 Feb 2025 12:40:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738672815;
	bh=+lrETwUWImzgNwi0/PC9cnZAZnFk6zd3T35vyvvzK/g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qgPcuxaynp2S0Bx5f+Zgnuu7LCp4sN6mr+I2PN+WknFqNMUdCUR1/SB1AOjX4Ymzy
	 fuBmX8SR7+au3oK3tHz0LkFLY7/TbCmIQGIS7S3/kBgp4aEidEjFA/qfO+tygE2K2y
	 UpNkV7O8JQXAyU0SN1o57yb5fy0Rxe7RNd79gQKJzmdzW6lh0sv0VQpiN1i+zBrDma
	 09dlbTjPk+pU+uzXyoGpGR/gFESBPS/UoJpvfab28v0PGsEJnwtmNvw+Rq0IyGPiIJ
	 3v1S6w51lfQjqBfC/CkP06OiZNb2Q/WDyMalZkZ+BHgoZGnVYWPjPBJxhJfKDqqmB8
	 wy3/vzfIWlGDw==
Received: from localhost (unknown [188.27.43.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id C164517E0FB0;
	Tue,  4 Feb 2025 13:40:15 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 04 Feb 2025 14:40:05 +0200
Subject: [PATCH v3 2/5] drm/rockchip: vop2: Drop unnecessary if_pixclk_rate
 computation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-vop2-hdmi0-disp-modes-v3-2-d71c6a196e58@collabora.com>
References: <20250204-vop2-hdmi0-disp-modes-v3-0-d71c6a196e58@collabora.com>
In-Reply-To: <20250204-vop2-hdmi0-disp-modes-v3-0-d71c6a196e58@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_124022_136351_93180C2D 
X-CRM114-Status: GOOD (  10.29  )
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

The if_pixclk_rate variable is not being used outside of the if-block in
rk3588_calc_cru_cfg(), hence move the superfluous assignment from the
first branch to the inner comment-block.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 17a98845fd31b5b223b734ae9f72f171230aa7cf..2455d4a55abd6751d54b7c6ecad3dda8a614bd36 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1905,8 +1905,8 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
 			K = 2;
 		}
 
-		if_pixclk_rate = (dclk_core_rate << 1) / K;
 		/*
+		 * if_pixclk_rate = (dclk_core_rate << 1) / K;
 		 * if_dclk_rate = dclk_core_rate / K;
 		 * *if_pixclk_div = dclk_rate / if_pixclk_rate;
 		 * *if_dclk_div = dclk_rate / if_dclk_rate;

-- 
2.48.1


