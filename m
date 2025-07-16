Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3589C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 10:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQlDAciNH/akhUfWSpPc2Tt6dyMOL6MZi6d97cEjPrA=; b=Q3RZZJ5dFvx3kB6waqn5UvzOKq
	WqSe4FYqK8+Q1jlqT78ov1KsQUkoLUuzdDumM7iX4BJav49wgWkv2cZ2m3v4c3i76NGDfqZyE2N6g
	pSB5oNY4RAspimYs8ZoTPqu7AF825dtscN0ARE6AIO2H/aCgx2xO7zoSS6NmXPyv5+PxGMLRtW24u
	9rwGjXt8LYv7znZ+P8tjBF1nc5zdjjPF1TjhpKgLL7+JWgOmEQtUnmqEr8XmLnV6OuJe52TG7DVub
	UJOOAyYcghefUZDDyy6nCvRoqXJunfsRk0G6l4oXu32y9vhoWIvHtQzp6iOj1ohD82C6s/pMR2lwW
	eW5qSrxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubz3O-00000007Mg2-3yhK;
	Wed, 16 Jul 2025 10:07:58 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubz0w-00000007M7C-3dMj;
	Wed, 16 Jul 2025 10:05:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=KQ
	lDAciNH/akhUfWSpPc2Tt6dyMOL6MZi6d97cEjPrA=; b=gLxfdPGtjj30TmRgD2
	TGAFOYl8IcadIk8vos81oIZ0np5PI/itvwnJA/2H4FKNL05rw9OI0S0r61fS9OLQ
	g+FD5vtOHoh23vv0muh0ikRjVmDPmZKC9zuOA3lPYRjvYSOGzhJc+ADReGVNSCm1
	ZN9jwA11ggF68GD97ND3gcNfQ=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAH0s46eXdoG0BuFQ--.1985S6;
	Wed, 16 Jul 2025 18:05:00 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: hjc@rock-chips.com,
	mripard@kernel.org,
	naoki@radxa.com,
	stephen@radxa.com,
	cristian.ciocaltea@collabora.com,
	neil.armstrong@linaro.org,
	Laurent.pinchart@ideasonboard.com,
	yubing.zhang@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 04/10] MAINTAINERS: Add entry for DW DPTX Controller bridge
Date: Wed, 16 Jul 2025 18:04:31 +0800
Message-ID: <20250716100440.816351-5-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716100440.816351-1-andyshrk@163.com>
References: <20250716100440.816351-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAH0s46eXdoG0BuFQ--.1985S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrW8uFy5CFy7JrW5Xw4kCrg_yoWDurc_C3
	WxZ34xXr48GFn0krZ7Aan3Ga4ava1xuFsxu3Wkt397C3s5AryDta92yr17Gw15Cr4UGrZr
	ua4fXa4Ykr13ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU82ZX7UUUUU==
X-Originating-IP: [103.29.142.67]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkA6MXmh3dCSN7AAAsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_030527_223548_3869EB19 
X-CRM114-Status: UNSURE (   8.46  )
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

From: Andy Yan <andy.yan@rock-chips.com>

Add an entry for the DW DPTX Controller bridge driver.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v5:
- First included in this version.

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ee2ef9d9db2ab..f0552f7075c62 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7880,6 +7880,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
 F:	drivers/gpu/drm/panel/panel-synaptics-r63353.c
 
+DRM DRIVER FOR SYNOPSYS DESIGNWARE DISPLAYPORT BRIDGE
+M:	Andy Yan <andy.yan@rock-chips.com>
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
+F:	drivers/gpu/drm/bridge/synopsys/dw-dp.c
+F:	include/drm/bridge/dw_dp.h
+
 DRM DRIVER FOR TI DLPC3433 MIPI DSI TO DMD BRIDGE
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained
-- 
2.43.0


