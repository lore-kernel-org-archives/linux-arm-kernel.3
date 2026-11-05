Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6CF60720F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pEJfZOVm;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Da0wH/cG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sXVdw7vU5ofz/MC7RbWYsGV4+QyERagQ3Me77tggaqA=; b=pEJfZOVmHD25Ux
	kuhEHNcnKI0e1yxH8d3K8BIXK/29/Zy0oN3GtuOHW5hYau+74qb2TyU8WmgpEVPfRSXA2Ck2/K+uf
	IdkPYNCtX5fFcczdFghDw3WTk71Sbxp7pHGVKTbz/POe4i/7ae1zb5BwAzUvxmeLyY0Ch45ps8bqn
	vcEru5wyf1VyvOySxSoOJqm7X8htESvxgwCIxNYUUFhA0LJK/EfP+n2+quzYugINWqM83tBDQQOoQ
	yWYaGHiYv9Rp8k5ObrDKIiX1FRYOGF6u2ond7Fprl0Bmoerr+TIbA7kD9q6I79YfyTb0NpmHfcPlZ
	cN8vCHl2y2JLnWCc7mIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzpS-00000009UgP-4Bva;
	Thu, 05 Nov 2026 15:56:43 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzny-00000009Tjt-3Lgz;
	Thu, 05 Nov 2026 15:55:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793894005; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R7uf2llnfIu0oqpbnc9sVETu5emQPBr69ahcUBhDgAgKf7TgqdbSkw+oYDyF4JOdNOKwBuwVfsZI/d9c/nE1eLBKB/NlVeC0O1QiIL+b6MtkQHBqEDg2M6TlFyJUF6jont21YyNmG66ZBR/zOaqPDIamx321zrfI5keTmIM2qcc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793894005; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sXVdw7vU5ofz/MC7RbWYsGV4+QyERagQ3Me77tggaqA=; 
	b=DsNrNti6LrJiJzr7cUcac6V2ny95DWA5mJfQ8d5ezJgpFH7oRH80dMv+w3fB5M7XGgUWvGvQ0RHH2Vk8deSwxwJe94UsoQXQUgx+wHJ99iCXsL1e+xAaOwbOhabVhk2IiUNM8zkOyD4P6NIqaEOxCf6MHpnj1gGdro+XUuK4y3M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: a=rsa-sha256; b=Da0wH/cGyb1nyuZoG2Y+e2i436r0rCOAR3nUQui+vXs3iDVpWmjqAxKTNDi/II5cva0TJDNNg3LnWDDADgT9cTrh3Zon0XUYukoaE6OSqBkPWArm4iJ26EJ69jV0vU9Az86uzcr2gHr3f+eXo4vhmRtcXl2EhnNg8cBEezQmHbo=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=sXVdw7vU5ofz/MC7RbWYsGV4+QyERagQ3Me77tggaqA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179389400272574.3566153246461;
	Thu, 5 Nov 2026 07:53:22 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 05 Nov 2026 16:51:59 +0100
Subject: [PATCH v2 08/27] drm/connector: Add
 drm_display_info_is_vrr_capable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-vrr-limiter-uapi-v2-8-55f4215be2c2@collabora.com>
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
X-CRM114-CacheID: sfid-20261105_075511_492877_B944C7AA 
X-CRM114-Status: GOOD (  12.09  )
X-Spam-Score: -2.1 (--)
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

Add a function to return whether a sink, as described by a
drm_display_info struct, is capable of receiving VRR signals.

For HDMI sinks, this can just check the HDMI specific vrr_cap.supported
field, which is set by the EDID parsing code. For other types of
displays, the generally agreed-upon method appears to be to check
whether the monitor range's minimum frequency is above 0.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 19 +++++++++++++++++++
 include/drm/drm_connector.h     |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 65c14b6e47a6..a44afba8c5ff 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1378,6 +1378,25 @@ int drm_display_info_set_bus_formats(struct drm_display_info *info,
 }
 EXPORT_SYMBOL(drm_display_info_set_bus_formats);
 
+/**
+ * drm_display_info_is_vrr_capable - Check whether sink is VRR capable
+ * @info: pointer to a &struct drm_display_info representing the sink
+ *
+ * Check whether the sink supports variable refresh rate signals.
+ *
+ * Returns:
+ * - true if variable refresh rate is supported by the sink
+ * - false otherwise
+ */
+bool drm_display_info_is_vrr_capable(const struct drm_display_info *info)
+{
+	if (info->is_hdmi)
+		return info->hdmi.vrr_cap.supported;
+
+	return info->monitor_range.min_vfreq > 0;
+}
+EXPORT_SYMBOL(drm_display_info_is_vrr_capable);
+
 /* Optional connector properties. */
 static const struct drm_prop_enum_list drm_scaling_mode_enum_list[] = {
 	{ DRM_MODE_SCALE_NONE, "None" },
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 9df745ecff92..5b6920c1a996 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1078,6 +1078,8 @@ int drm_display_info_set_bus_formats(struct drm_display_info *info,
 				     const u32 *formats,
 				     unsigned int num_formats);
 
+bool drm_display_info_is_vrr_capable(const struct drm_display_info *info);
+
 /**
  * struct drm_connector_tv_margins - TV connector related margins
  *

-- 
2.56.0


