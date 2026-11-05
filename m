Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F4B606A619
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H0Af27so;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TDQ1I12L;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=IHa4UePH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=D9Q6ltPzRDAGZTP9KvplqGWiiX1MNDXa/TA4BfosyDU=; b=H0Af27so0+zQCS
	XNYQbOkdBQ4hbdDI3Ai90di5b0LEHdpEeL+xEWOursF6hXc4Qe+NVbYB0Qy/xEKUGkIHUm4BfJO5N
	LLQ6eE7PMJDcNdo0qx+65y70nLdeJyPC1twRyAUZhyMan+Vz/zqgslRmS9RDGhnOyWjIsnMYz4ySW
	zqjWasHrZ/VB/f0mYzKdSUm0GtyTLLP+1cmgkp2LuGqEvehnWZ2rc0+KR2z5UDVqdGvwkC/m6AS4G
	pZVsh39AXgcNHCwGpNc3jtenCGyz4i++ibgG6t+mn8aLAG20qH9SSwutpJjTWJhC5HVIZNHLAR9WS
	GZ70+vcircgvUdm7PYsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzrG-00000009VUO-2xj1;
	Thu, 05 Nov 2026 15:58:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzoV-00000009UDY-0Moq;
	Thu, 05 Nov 2026 15:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=D9Q6ltPzRDAGZTP9KvplqGWiiX1MNDXa/TA4BfosyDU=; b=TDQ1I12LBnjEJM6ouaZyNABgn8
	vbESVhgfyGSPO6MlvN4XDCLc+ijzy80cNK8sbev4PLPmpeLn1EMcNoxJ5X23xmVsNcU6qrhgo2YKy
	lK3aCoG/NGqJFET9ZzYBaa/Qzw4Bf0XhQcaBslOz4SqglPY1xv2yNDJt84+pD2HOhKJyniaa8XpW0
	GSwype6FfkS3LlGw9KU5hkX1ZjU8YpPt1Y14qUK6a52kf2Lk8YCtMFxGbl5wh/l6EHvDy1DLt1ENP
	dSVD7TleJdYPoSG8zH8g8O2iH+pvu9+rZhpgmd6heAYz6LmmDOOM0vbkFMf4u35/Xn9u4EvNqvLsT
	ITmi/Atg==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzoP-00000003Ciu-2FAJ;
	Thu, 05 Nov 2026 15:55:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793894055; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NFUXusQC27zP569hLgP0cdoh9f+qrlEtWyONZqM4Gw6pGB2LD5mkHdgot0OmJbrL+w2tTGQmmh1+HkJPNQ2Ox0Gr1FsZheEyCc3U17IQVtBcpExHmfrKBe/67O+gd5GWvo8Hnf+TCLNKug3e3F1+dqyev/OSd/b8ky5Bl+eYNqg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793894055; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=D9Q6ltPzRDAGZTP9KvplqGWiiX1MNDXa/TA4BfosyDU=; 
	b=bm4Ag9jHrBUOrFKjsWWXC+qMjQEmLLKcEm5olUwa8UmIh5L603ZcF4ZKqwgkcJTvkf2nESJcpj41tMrYSPymeQCxRK2Y0/gmL6CS1MosIml8US/6wJTqlfnXht+arSD3GePC0kpgeRX6Wl9kxFEndFjwjLTN0Jq1GQ3oTuSPWM0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: a=rsa-sha256; b=IHa4UePH77lklrOObaKvOF/sEC5UoyvMJ+KdEaVG6EZ2Jq2tUgtQxXm6vA53+czMBs6hGIWcrqg4x5jsV7SEUDbqFiWwD6NR82OoyraR2lAIlkE6KMjO8MWCI+OPMXlZYloeFd594NtVqKltqzpB7rmxxfhLAn5C824Xc3xdhGo=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=D9Q6ltPzRDAGZTP9KvplqGWiiX1MNDXa/TA4BfosyDU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793894054250895.1994089470402;
	Thu, 5 Nov 2026 07:54:14 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 05 Nov 2026 16:52:07 +0100
Subject: [PATCH v2 16/27] drm/edid: Parse QMS TFR min/max flags from HDMI
 SCDS
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-vrr-limiter-uapi-v2-16-55f4215be2c2@collabora.com>
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
X-CRM114-CacheID: sfid-20261105_155537_743330_9C4B3F43 
X-CRM114-Status: GOOD (  14.10  )
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

HDMI has two flags in the SCDS EDID extension that signal which minimum
and maximum refresh rate the sink wishes to use when doing QMS ("Quick
Media Switching").

How to parse these flags, and what they do, has been learned from the
publicly available libdisplay-info source code.

Add the definitions of where in the byte they are, the code for checking
for them, as well as two new booleans in drm_hdmi_vrr_cap to store the
result.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_edid.c  |  6 ++++++
 include/drm/drm_connector.h | 12 ++++++++++++
 include/drm/drm_edid.h      |  2 ++
 3 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index d439928caacc..39b5c01309e2 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6237,6 +6237,12 @@ static void drm_parse_hdmi_gaming_info(struct drm_hdmi_info *hdmi, const u8 *db)
 
 	vrr->vrr_max = (db[9] & DRM_EDID_VRR_MAX_UPPER_MASK) << 2 | db[10];
 	vrr->supported &= (vrr->vrr_max == 0 || vrr->vrr_max >= 100);
+
+	if (cea_db_payload_len(db) < 11)
+		return;
+
+	vrr->qms_tfr_min = db[11] & DRM_EDID_QMS_TFR_MIN;
+	vrr->qms_tfr_max = db[11] & DRM_EDID_QMS_TFR_MAX;
 }
 
 static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 830a33fb5301..4801bb2769e1 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -294,6 +294,18 @@ struct drm_hdmi_vrr_cap {
 
 	/** @qms_capable: The sink supports Quick Media Switching */
 	bool qms_capable;
+
+	/**
+	 * @qms_tfr_min: If set, the sink uses 24/1.001Hz as its minimum rate
+	 * for QMS. If unset, @drm_display_info.monitor_range.min_vfreq is used.
+	 */
+	bool qms_tfr_min;
+
+	/**
+	 * @qms_tfr_max: If set, @drm_display_info.monitor_range.max_vfreq is
+	 * used by the sink as its maximum rate for QMS. If unset, 60Hz is used.
+	 */
+	bool qms_tfr_max;
 };
 
 /**
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index f1e2052cb08b..d339acd9ee52 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -269,6 +269,8 @@ struct detailed_timing {
 #define DRM_EDID_VRR_MAX_UPPER_MASK		0xc0
 #define DRM_EDID_VRR_MAX_LOWER_MASK		0xff
 #define DRM_EDID_VRR_MIN_MASK			0x3f
+#define DRM_EDID_QMS_TFR_MIN			(1 << 4)
+#define DRM_EDID_QMS_TFR_MAX			(1 << 5)
 
 /* DSC specific */
 #define DRM_EDID_DSC_10BPC			(1 << 0)

-- 
2.56.0


