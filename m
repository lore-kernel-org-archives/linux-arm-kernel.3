Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F25606EE9C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fwOQY3lU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=XZI6WoYA;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=kJ6f17vw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=igQATVU1Yc1Mn+dz931w/tbusWSL5LcSoV79LRLrIvI=; b=fwOQY3lUB+xM36
	zKxJqeTpUovVygVqGVwfGRyHBXCmVNkFsbLyQ9UOnOVMsHJWKnYEXzRfbjL4yM6lGssnJyCD5Mj7B
	SuS+pbsNihFPdqnF9uf9oI+Brq1Mrisvydurw1JYYCg7nMW2HalpJ6GD7vRtv5Fx3XuG8XZXMsjuR
	ANIRSh/iNvHJ1nNwIAq4hdMtmiOGwyGwQcBp6xfNsXN1dswP+lsfA/cqiePMQ7UaBsvA9Q53qISvw
	KlqGWkNiwrhmAWbhETvFi0Khom4Bf3EwQhCwaNKKpuSb/E0FOYobmutWxwtjwtNxtZRdD+DksIf4a
	F6j7Z9zFqMTl4AKIIZMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzrF-00000009VTg-3rAq;
	Thu, 05 Nov 2026 15:58:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzoH-00000009TxR-1FJF;
	Thu, 05 Nov 2026 15:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=igQATVU1Yc1Mn+dz931w/tbusWSL5LcSoV79LRLrIvI=; b=XZI6WoYAG+mWZou85k53FzmXtn
	mxovDzagHWRluWLlqPFGfWVmvd2IymjVUh2vOib2VKKbhMXUxt4uCnCz1yPJqSmHWsYwSB+Ah+2uS
	s/IETq9SaJXalcHcOkJH+OnqZtInBSysjqt2UZ5Z6lXDXbVfaX2s2+MW9BJpuVUSWZVUJQX46N7IE
	qO51l3aWeOZdDmCsybsW9l0FP5CCEf7KUCLDfhqaNxo4xFL6ypycXwwIfSxchvml4RMHOR1jLL+T5
	+PHdJK4nFEcdoFZjKZgOnvlo8K3ckZ7TVKzqklLScF+Btr8iDQAU0gbzlSiIEZfWPvs0Wt+me2YhB
	7p6ZCKEA==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzoE-00000003Chd-0gs3;
	Thu, 05 Nov 2026 15:55:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793894085; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VhskGWTmhRP+s548VmCcgGW+MDFRplI3W1sF9BzPT0OBohPMTdFqEPjYnvB5TPTv741uWvGnYRMVAJCmU5K+9eYNdCvNSa/j0aahyGMcY7HRGIQBFvLzr9VjC72Febj93pHnBfADk852RstJlv6Y9T+juGJRdhY3wGcYzcJqtFU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793894085; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=igQATVU1Yc1Mn+dz931w/tbusWSL5LcSoV79LRLrIvI=; 
	b=NGUgAw30ItGE+Kb7RWCydoVWwEgBxhxjdzLz5TUlW022cNoDK/OBPxKPG8OD+RPm+Eajey62DiR3bCLk/TWDvyShghb5SGKQTyGzEpJpFJ8jcFDwOelvu+aN2sP3/DI/Rj/mf00w3dHy1TRKR1STprfRPE4plrRAqsTIRaLvlsI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: a=rsa-sha256; b=kJ6f17vwJuXHaq/0T1adxJqc2OOuiy9DPWOKBi//vAoyjUQRSrp/wZEOFzoco3zytHJmmr4JMrNt4uRkltIjTzsH13FI6SkX3l3VCfgReumNM96fPFRemug4lGJ8Bw3PCjfayyeccPKwOmj249szHdkf4rmqVYxMUif2MB5RRoQ=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=igQATVU1Yc1Mn+dz931w/tbusWSL5LcSoV79LRLrIvI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793894084835140.54892489016675;
	Thu, 5 Nov 2026 07:54:44 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 05 Nov 2026 16:52:12 +0100
Subject: [PATCH v2 21/27] drm/rockchip: dw_hdmi_qp: Add QMS support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-vrr-limiter-uapi-v2-21-55f4215be2c2@collabora.com>
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
X-CRM114-CacheID: sfid-20261105_155526_615979_4D344ACA 
X-CRM114-Status: GOOD (  13.00  )
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

Add the "Media" VRR display mode to the set of VRR display modes being
registered, and set the qms_supported flag in the connector's HDMI
sub-struct. The actual QMS functionality itself is implemented in the
common HDMI state helpers.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index dcde50bca36b..215cf746dc41 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -90,7 +90,8 @@
 #define RK_COLOR_FMT_YUV420		0x3
 
 #define RK_VRR_DISPLAY_MODES		(BIT(VRR_DISPLAY_MODE_GAME) | \
-					 BIT(VRR_DISPLAY_MODE_OFF))
+					 BIT(VRR_DISPLAY_MODE_OFF) | \
+					 BIT(VRR_DISPLAY_MODE_MEDIA))
 
 struct rockchip_hdmi_qp {
 	struct device *dev;
@@ -753,6 +754,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 			return dev_err_probe(hdmi->dev, ret,
 					     "Failed to attach 'vrr_display_mode' property\n");
 
+		connector->hdmi.qms_supported = true;
+
 		ret = drm_connector_attach_vrr_display_limits_properties(connector);
 		if (ret)
 			return dev_err_probe(hdmi->dev, ret,

-- 
2.56.0


