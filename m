Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3FC606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 07:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u70BvyD8;
	dkim=pass (1024-bit key, unprotected) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=Ecw7d2ok
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJlSQp8r350iMwIMlHz6kJOY3IIHWCaiqptCoWQnTWs=; b=u70BvyD8qaD/01QhNI903++S3c
	rKS8TqrKlbqNy4rwC47G5SxR7hGj+xLjmc+cwaekk7TVggAMI4kkGWfYB0lLGDOi/R9i5i4KJLFBw
	SRsaKyB8D3Ls6S6WIkOt7zrk5KKewrkZPURGA+EbwdTAf1NVKS08XpRUytCdDQ4y795M/DOsWKX+T
	rNs3su7b0wrEzyh5WVCAzFr8n1bsGQkmmLfGVfetOBQG3B+hN4R4B9W1iN5UYvPRmXNm4XSaJsMQG
	mLCpPMcgxZCsiHyoyaS1tZMui1UCfWvkP/qKmYOl2pkdjT1WtZvlc+o7KQRVjay8tQ5WYD69zEI0o
	RoU/LkFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4IO-000000092Gb-0r2I;
	Tue, 20 Oct 2026 07:30:04 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4II-0000000923f-0NIm;
	Tue, 20 Oct 2026 07:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1792481337;
	bh=RJlSQp8r350iMwIMlHz6kJOY3IIHWCaiqptCoWQnTWs=;
	h=From:To:Subject:Date:Message-Id;
	b=Ecw7d2okmv3MI5PTqvU7ijFiZ6GaLd7uRglRD8ks/FVq//5EOeKHmNgetu5s1uaka
	 y1RygjT3y9Q/clUQCqjWRetzxo/48/eh1qbFcpnnAGvNipBSFKMmWWXjfO8l8VZLmW
	 tfLkXAwv279C4jVbIS2CUFqjRYakApsNPfMIBWPA=
X-QQ-mid: zesmtpsz4t1792481335t9bc8c4d2
X-QQ-Originating-IP: rMyewjLzKncWQnPrp9ri5tZ/Pt41y4HBpk1o+5qM6Fw=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 Oct 2026 15:28:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11522251199344246924
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v8 3/7] drm/display: Add soft depend for aux-hpd-typec-dp-bridge module
Date: Tue, 20 Oct 2026 15:28:12 +0800
Message-Id: <20261020072816.180-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261020072816.180-1-kernel@airkyi.com>
References: <20261020072816.180-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: ONv4FG6+I+02HuzVCkn9c1eMWjR1sOgpi+JuGdKA/qUelVTLqUc7tkbY
	RbOH0B0UsLGVQIKwMchojlDv3dIbFEMBnNIoGa4EwXTGHSkLR2+MhnOgZ0KF+6YhZdrH3f6
	9vTPDL8l4BhSMEmQROVzAInVBD/lMtIU5nAL/vbJdcT2zy8mqBZElRRwXOMmqzploLr/fPP
	tZlDSuY41SKs3yltn7mgS9C/IOBSigLbfjWYNJgeCdSqN6+Pie2iGIUKqoC/QVuEkCA7nBN
	UFMgooxaUPKqHqTTwnYwWoF62HwAA1UEB5Ly7lQiEnK1kYDPIXO72StMGf5HJyM23TVm2KR
	XDDUUSD6O13JHXLYWLXZmrtgcdnudofXknaoVWU16b2Pb7+i7bpLQDFkkEcHh1+vsQQxFur
	fr6WMKk0xV86qWDPPvNVefrfz77nYMtfBzcdC6sWsaxAx4qLZXoG9+406wFZCg2t0TG3IhH
	qzn2Ds+XYRvZ3DD92Bpca0LStAm5SNAHmSuti/mBVMmmg2k8FrEsPMoURiGZblqG3suSHwk
	fI7oCVJLpaAhg1BeU/Ia8xkasPezBtRs45Q3pYCnjw1+zO7L5Jp45IBzU0yK9Dk8C3mlKIA
	piQ2Kkj92I12lze9glMPtGzkiwbBPXAItpeNwu3MXFtllSKV1YdtdOceLqP0iV3Ymx8lFQH
	fkHi7g1iaNFy0L4xoyZIumRE6VNH7AFtyDAJ+U4kDxgFyPVRcHM60TpRNLg0BU5DlEACG9m
	TF4xtoETQPXGJ52yUYVDAKEegv1He7r+3YUjneSPStEMVddfGL4b+q+TVdsaFCS2ZxrkDtS
	W8j0Odl4HvbMCrJNk/u0Vgjp7jLd2MK079XzuTS65s2MTCT3eyJ1HF4akUIsabVZCWtgVLU
	EudQ8MhWhqaPtV0Bo5fRnGJOTqPSNTyq8FzoM0Fk9epnXhvW6fMFnzLSI1xvp8v6kUA/hC9
	P+DrtruQCgEUoeA04xThdJ4m+HjIeOGmUGPJaEkEq9g3vTXAXFoksOWLLOGOh6xZeZh36Db
	mWSTVDQLpkquCRSzL1Fvx0Sp3iWCs=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_002958_944754_AADEB0DD 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The aux-hpd-typec-dp-bridge module serves as a generic TypeC
DisplayPort HPD bridge and is not required by any other
module. Therefore, it will not be auto-loaded.

Given that the drm_display_helper module houses DisplayPort-related
helper code, add a MODULE_SOFTDEP() within it to suggest loading the
aux-hpd-typec-dp-bridge module beforehand.

Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
(no changes since v6)
---
 drivers/gpu/drm/display/drm_display_helper_mod.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/display/drm_display_helper_mod.c b/drivers/gpu/drm/display/drm_display_helper_mod.c
index d8a6e6228773..f0152d6b0b2d 100644
--- a/drivers/gpu/drm/display/drm_display_helper_mod.c
+++ b/drivers/gpu/drm/display/drm_display_helper_mod.c
@@ -18,5 +18,6 @@ static void __exit drm_display_helper_module_exit(void)
 	drm_dp_aux_dev_exit();
 }
 
+MODULE_SOFTDEP("pre: aux-hpd-typec-dp-bridge");
 module_init(drm_display_helper_module_init);
 module_exit(drm_display_helper_module_exit);
-- 
2.53.0


