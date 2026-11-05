Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619F8606A61D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1c0ymGpp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=oZX9uTlR;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=ZCRyGZHx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Uvc1syTMYMFSpAE/jbDqVyGXDVUt+Vo4SRVox0ytqLo=; b=1c0ymGppNdYcjK
	pBpUpNOtJBNYOxe2dhbHQQCMEHaJo0O9txBR4R5XA6vRDxbUhNBekF4mjSHCRb7LXgfICO32aczBu
	LG3+Cl+acBUlilyRpfVKcr9jo4LZIdzdLLAs/JCGiVL6hd8uMFDAW0O6DE1Wqi/Wbt0gGvcNY+QbU
	+Rs3JSYMgiq+3gHrm6cLQ+2P0hEln0rNn8yScjGaVdYoRpKZ2Z29erPQmyoKXNsPx1A8JJkSGGBxP
	qk8/oiyQefE6e7tODCIHbMEMwF8kYzDit/w1JiHA41+yOaMS6IhbYSSEXmWLPSoC+CVUOsQps2hG8
	WmndT4KISBh2h5ugLH5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzrN-00000009VcN-3bZ7;
	Thu, 05 Nov 2026 15:58:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzoq-00000009UMt-2VBn;
	Thu, 05 Nov 2026 15:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Uvc1syTMYMFSpAE/jbDqVyGXDVUt+Vo4SRVox0ytqLo=; b=oZX9uTlRFXF7C+ivTGgWsX5ClS
	FVJfZd5GdUxTbY0mMOU/FkXUCtYLs+1KhWIrjm9ZjfbUcwCMjr5Q5rvHyFNTIOCiqIHwEGhEfvNhH
	Mj+1+vbW+gn1h9qaxpwmvNh62t/PiBf5JeGcECkZO+NtIUvY1fW9eZpddHy2t5q0zWkOSJJ2AEmS8
	GLA7OtndCscQ6b9PeE3e2Om8gdN2qeYtKxY5eGOz/sSvsJHEBHFPel2UfmlPzXIao4mYQQGEiSucZ
	CscPK40CT73kt5rw97KJUKxxHb0G/OtwnoEfj7CMbEOj8xdSKM8Dp/40WFkxLaKRi9Ul6I+PAXzkS
	jR40SiuA==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzon-00000003Cnr-2EE4;
	Thu, 05 Nov 2026 15:56:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793894111; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ka1WdsZYDV7Nc8mJ45DMVednrFj/Ynh/2SabZ2ktijh2mdWr/y3rsvmrW+uvCuEbS3Kq8FKozSEf4eNMV9zPf3CVmGCM8oQI3ONhq+BCt4QjxoII6cjuOCxLjk+OgAOBJDST/gPxrfBsIQHYRM+gqikA3EOK5OdsAp1I2OGcYW0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793894111; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Uvc1syTMYMFSpAE/jbDqVyGXDVUt+Vo4SRVox0ytqLo=; 
	b=d6FAgzzB3SMiLTQgxUroXw1PHe7mS7Nq/0q+KmnjwsRw0Czt224TSb9jhrpb61whFy/Uv2yCgfZIWYNDGnG1MJp9VIqSyPxyayR0iV28pO4WBEHlsxZOCLurHod0sfQS+exRBKir/1CTtgAApn+DRaOpjkxKmjFCUX7fhFq3gyY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: a=rsa-sha256; b=ZCRyGZHx9txJ5/f9hAPaNM9/ummNBIU4meVhihPTHbgDWQE+YQKJ7DsbsaNpSbtHg+I/9TuGds8z9FCPzQ9/A4KUfvF5xBsNAcyhSCVxMtWMgcjUHTUBrf3rLyGZQBzQ+e91Mn37K/Vp9WLY2Zc16iAlzdWx0/dEUhrYbypVYI0=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=Uvc1syTMYMFSpAE/jbDqVyGXDVUt+Vo4SRVox0ytqLo=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793894110107971.9612430908318;
	Thu, 5 Nov 2026 07:55:10 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 05 Nov 2026 16:52:16 +0100
Subject: [PATCH v2 25/27] drm/connector: Fix docs for cnmvrr and cinemavrr
 members
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-vrr-limiter-uapi-v2-25-55f4215be2c2@collabora.com>
References: <20261105-vrr-limiter-uapi-v2-0-55f4215be2c2@collabora.com>
In-Reply-To: <20261105-vrr-limiter-uapi-v2-0-55f4215be2c2@collabora.com>
To: Xaver Hugl <xaver.hugl@gmail.com>, Vidith Madhu <vmadhu@nvidia.com>, 
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, 
 Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>, 
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Daniel Stone <daniels@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Helge Deller <deller@gmx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 =?utf-8?q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Derek Foreman <derek.foreman@collabora.com>, 
 wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_155601_696412_14A26974 
X-CRM114-Status: GOOD (  11.38  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The member names in the doc comments are inexplicably prefixed with an
"m", which does not reflect the actual struct member's name.

Drop the "m".

Fixes: 014da1db5e64 ("drm/edid: parse HDMI 2.1 gaming (ALLM/VRR) capabilities from HF-VSDB")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 include/drm/drm_connector.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 41f272afbb1e..021ab07a1d9b 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -265,10 +265,10 @@ struct drm_hdmi_vrr_cap {
 	/** @fva: flag for Fast VActive (Quick Frame Transport) support */
 	bool fva;
 
-	/** @mcnmvrr: flag for Negative M VRR support */
+	/** @cnmvrr: flag for Negative M VRR support */
 	bool cnmvrr;
 
-	/** @mcinema_vrr: flag for Cinema VRR support */
+	/** @cinema_vrr: flag for Cinema VRR support */
 	bool cinema_vrr;
 
 	/** @mdelta: flag for limited frame-to-frame compensation support */

-- 
2.56.0


