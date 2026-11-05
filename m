Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FEA60720E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NQ0UzZQd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=c88713/A;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=QGh8+D0s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZsJGxCYDJBtgZ7PbKgRI/o6Iaz0hRbnKlktFoA+H35M=; b=NQ0UzZQd6Jkh/g
	jgXHm2/zLswEmRCN2iyPs14fRVOBzHDQdyfwFXc2mv0kNpsjJ+73+beWqotE8jDn0C5Y5eJtTYH+m
	MPhzBSFt1fQ1Oo67JtOax3Ub33F9817D89qKp7P0paxvq2bZlJtrdcz1n5RglwyrMVMvQv5802hFh
	ElN2lx61Dbt3PRsOL2gqFZ4EDG3W5a96l1d4g5xvhzYtxO1IV/ErbqBSHXS9NH2SNlEYgWmwGZL/q
	F2ZjOEnP6hkvKCmOCaP88zpKJozAs77YNOZJMfI141k730Hpbk8VrVdDwE1ymYNrjheHg1dd0S058
	yTVgCIcL+k4aYMqTzRtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzpV-00000009Ui6-1F2d;
	Thu, 05 Nov 2026 15:56:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzoC-00000009Tr9-2Tsw;
	Thu, 05 Nov 2026 15:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZsJGxCYDJBtgZ7PbKgRI/o6Iaz0hRbnKlktFoA+H35M=; b=c88713/ABRUvFteVhUDoQNnQT4
	RyTmA0DAoMxTNBjDn/EHxE08oPzpImB2iVd5c3jCm2Kua+lH30DrosqGWMlv6VBRT1/ev8YYeQ2+k
	95Idj8ed/R92dTwOLTZivqYmPS8ckRn3REkvn2bl3C7zLoMufYuXHlBvG9DpSCB90r9aEbFqGbyAR
	SQiAR9GjsElhIS+fifsu0ZNXcyooXQm6/5qx3v/AKOKe58RfhOKZZsa7DwhLk8magpMHguHrUO0cw
	G29dZE2nsYkJs+H+20qGVB0lCQAreU/UQZdTk0UKiqhRp/vp5CrKXPjsoRIxOq86k3R7BDpNNJtxp
	ZGXPuMTA==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzo8-00000003Cfp-2RxU;
	Thu, 05 Nov 2026 15:55:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793894049; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=igjwL76ycM1L/XPcKwK03cwIOheRnkepJ5YN3E4hC+0CbQFVDDgRlnuVtQukFdWyCN2KxuDSlRBQSNVEH5iApDDRz8jTrXX1e7M7pzpx9ELOP6AH6g8V0v7jKwV0D+DXnNmawTAmG+nbinOTcgwQbePOfmR7rSyLXbr8+QQWq9Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793894049; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZsJGxCYDJBtgZ7PbKgRI/o6Iaz0hRbnKlktFoA+H35M=; 
	b=OKvKHyQ8LpQyWO+0F3ZQFjiq1QDch598myawKpHryQeOi98S0nKAVPVyKGcolNcQg0iodwCyMcTkTNLqQUrfgUeLH2h2ERlycFfL0HKe92H79p5hoG41/3veNxoEv6ryjG9f5y4ZDMdYSCZ2vq1SktKKUjggNlYIvmGe8dWQTKI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: a=rsa-sha256; b=QGh8+D0stNKdIwJFTAYChBePG0mT95bYJ//TTLFpnzP69Mr/EL6tLE9D+YlAyVbJcIIJbOJuWcyUZCGNhSp7/x/1Rmh92oj7wTOnlW5tzLLbzuAZtI67rNlw3gmoUs2fMN+3GkAJxo63Rw82fmGpJNnPJDrzYXvyjyQKPVxmHZk=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=ZsJGxCYDJBtgZ7PbKgRI/o6Iaz0hRbnKlktFoA+H35M=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793894048143143.84427994378188;
	Thu, 5 Nov 2026 07:54:08 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 05 Nov 2026 16:52:06 +0100
Subject: [PATCH v2 15/27] drm/edid: Parse QMS flag from HDMI SCDS
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-vrr-limiter-uapi-v2-15-55f4215be2c2@collabora.com>
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
X-CRM114-CacheID: sfid-20261105_155520_608743_36EC3BBA 
X-CRM114-Status: GOOD (  13.21  )
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

Thanks to a GPL'd source code release from a hardware vendor that shall
not be named, which has since been scrubbed off GitHub, it's now public
knowledge how the HDMI Forum EDID extension communicates support for QMS
("Quick Media Switching") on a sink. Bit number 6 indicates support for
QMS in the same byte that also contains the CinemaVRR flag.

Add this definition to the EDID header file, and parse it to a member of
drm_hdmi_vrr_cap.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_edid.c  | 1 +
 include/drm/drm_connector.h | 3 +++
 include/drm/drm_edid.h      | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 3148038747b6..d439928caacc 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6224,6 +6224,7 @@ static void drm_parse_hdmi_gaming_info(struct drm_hdmi_info *hdmi, const u8 *db)
 	vrr->cnmvrr = db[8] & DRM_EDID_CNMVRR;
 	vrr->cinema_vrr = db[8] & DRM_EDID_CINEMA_VRR;
 	vrr->mdelta = db[8] & DRM_EDID_MDELTA;
+	vrr->qms_capable = db[8] & DRM_EDID_QMS;
 
 	if (cea_db_payload_len(db) < 9)
 		return;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index c0865a2547fd..830a33fb5301 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -291,6 +291,9 @@ struct drm_hdmi_vrr_cap {
 	 * VRRmax values having correct values.
 	 */
 	bool supported;
+
+	/** @qms_capable: The sink supports Quick Media Switching */
+	bool qms_capable;
 };
 
 /**
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index a2617aa34edf..f1e2052cb08b 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -265,6 +265,7 @@ struct detailed_timing {
 #define DRM_EDID_CNMVRR				(1 << 3)
 #define DRM_EDID_CINEMA_VRR			(1 << 4)
 #define DRM_EDID_MDELTA				(1 << 5)
+#define DRM_EDID_QMS				(1 << 6)
 #define DRM_EDID_VRR_MAX_UPPER_MASK		0xc0
 #define DRM_EDID_VRR_MAX_LOWER_MASK		0xff
 #define DRM_EDID_VRR_MIN_MASK			0x3f

-- 
2.56.0


