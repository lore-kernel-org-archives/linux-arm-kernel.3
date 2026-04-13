Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC60EBFD30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 10:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HabY2i2E1+ddRtoi01o8V7PD9YzY5+x/Zz9iixg8p/8=; b=RloXFPs7psNsCvv8vtb6ZyAtFe
	BzX+pwSKPOUOI5+yuSzNmj+cuz6exG4UsmRMip+1lnu8/S1cl1aPnu9ZybSRYPk6P7+aWV0qFNd53
	wT8TDK2cXKHHULzfwcjchK7r2MEKa9N192odjAQacYRDtU05TgmHmzTTCAQXpF9y1aNCbhOOMQEAK
	5DjWbk+QCepqv+xEYgQTTC0C+jFaVlYGRmQnjUdlueOHWJnN+Ttf3EDtmryRtfizaMa+yRJkdbqRr
	TMV0dEdR4rM9pE2YGgxzJAbRvJipMiN7KW9n2WCacNKOmsV28AkMeUwezIJgehG7mz7GLvG1oPAFv
	DT274EIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEF4-0000000FR2X-2aoc;
	Mon, 13 Apr 2026 10:10:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEF1-0000000FQyU-1G4P;
	Mon, 13 Apr 2026 10:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HabY2i2E1+ddRtoi01o8V7PD9YzY5+x/Zz9iixg8p/8=; b=bD+lsINYSnUI/fy2w0wdiGdSEc
	4cRYORCYPDU+ErqIcKUKVwb0ciyIYpfqBuCCeD+DmlWvBigcR0eRr0qu2R/lYTm5rATike/4/qAAk
	HEsX0vq+9vJZTtfgmTJ/p67ma19xNqT1VtrknJ6bnhkTpohNM4p7ZoRZnNUT/SkTW0CFh0lOhrSUF
	pfxNKBxUuh+U2WmJDDdZBy4bIcGdsibQFCAbpFTh1kj/NrJsbcYmpQufIZ8z6AHuiD87xnbQYjO6C
	SmOgFD69v90u5xIk7MUP5Z5u/3DQQWBRmzY7eo1HvsKDwdZMIk9QvY+N4mTNyEdxbSDtLs1/UwC/n
	BPecRVdw==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEEx-0000000GYd1-2Wdn;
	Mon, 13 Apr 2026 10:10:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1776074961; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EcJt6K/xuIAJzQCorLQEqBQf1auVZeJ0HMKfs9eKPrm+ea3bh+Wy7Dgl0gQhcVF1tTOD778qGmh6+49q9YkV9cEcm0ZqZMlegNFyntRYUVioGLgJcyHp0LGZCYFn8UsTUB7Z5UPVpWSFni1flPxJAJV3xAIgYpCSUbAmm9xRNHo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776074961; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HabY2i2E1+ddRtoi01o8V7PD9YzY5+x/Zz9iixg8p/8=; 
	b=ElAKk9Xwk38aNIbhwcCzF02vllUZSPplXKtE5Hv1dT3Csi0++lpDvUGegFlWnUXhNbEPBaz6T7NcqIW7rvjj0sV0BC8MeNhI/6utVKfqAa1u2lnvsRKKePoZEXcvCiBKegm525Uev6TcqQi51YXCQ0QN/rjc3x6I4d4KAvlSchY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776074961;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=HabY2i2E1+ddRtoi01o8V7PD9YzY5+x/Zz9iixg8p/8=;
	b=ALHZ5JNdoOdmSnU2+Y5fNYTOYycTHDkGmqdXunyZ41pDMd3wiY5wyIl0etaM06dV
	MIIx+NcfGhVpKOGC6P/XGtfCytqJKVeahWIPf6+byLWDPnBRtvdURauzpbhfyjoQjWo
	B49MtoE0AsXsC42JJlqFmvQejuAlYzajBuQyeiLo=
Received: by mx.zohomail.com with SMTPS id 1776074959034215.85803249771402;
	Mon, 13 Apr 2026 03:09:19 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 13 Apr 2026 12:07:25 +0200
Subject: [PATCH v13 11/27] drm/i915/hdmi: Add YCBCR444 handling for sink
 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-color-format-v13-11-ab37d4dfba48@collabora.com>
References: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
In-Reply-To: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_110959_957720_9BE681C8 
X-CRM114-Status: GOOD (  10.71  )
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

In anticipation of userspace being able to explicitly select supported
sink formats, add handling of the YCBCR444 sink format. The AUTO path
does not choose this format, but with explicit format selection added to
the driver, it becomes a possibility.

Check for YCBCR444 support on the sink in both sink_bpc_possible, and
sink_format_valid.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 874076a29da4..5ab5b5f85cde 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1966,6 +1966,8 @@ static bool intel_hdmi_sink_bpc_possible(struct drm_connector *_connector,
 
 		if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR420)
 			return hdmi->y420_dc_modes & DRM_EDID_YCBCR420_DC_36;
+		else if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR444)
+			return info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_36;
 		else
 			return info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_36;
 	case 10:
@@ -1974,6 +1976,8 @@ static bool intel_hdmi_sink_bpc_possible(struct drm_connector *_connector,
 
 		if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR420)
 			return hdmi->y420_dc_modes & DRM_EDID_YCBCR420_DC_30;
+		else if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR444)
+			return info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_30;
 		else
 			return info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30;
 	case 8:
@@ -2038,6 +2042,11 @@ intel_hdmi_sink_format_valid(struct intel_connector *connector,
 
 		return MODE_OK;
 	case INTEL_OUTPUT_FORMAT_RGB:
+		return MODE_OK;
+	case INTEL_OUTPUT_FORMAT_YCBCR444:
+		if (!(info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444)))
+			return MODE_BAD;
+
 		return MODE_OK;
 	default:
 		MISSING_CASE(sink_format);

-- 
2.53.0


