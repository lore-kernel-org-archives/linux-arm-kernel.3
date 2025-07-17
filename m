Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E08C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 09:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FZEPCuqg+j4PT7ny21iPN/qrpZr3fDoK5twCI5iDpE=; b=3QQiMcorHXbutpV+07Xcd4DrtJ
	OYmszDSD0rd3JQJY04bJv8ZD87YzM+lWXE7ZrxOU1ilPIHQhO3Uy/CYalecVoco0w9Ziq2tAzgTpk
	LdYcW8r4MUaMGp1KljhkVf05tYbYlfW5Eu1wrSBHuUtn9ikUuy/ECF7dg353lu1x8sX5CURgoFnbB
	Xul+7/GthiknN36b9eYrrL20ga/4aWdw1jhYPVkrDKbwyvfzqAr9iUunruVoQ8Hl3XtkuNBl4BcoN
	oesO4nymAWE0sGDzAW15ZMwB/DQHkqqbeexdOwZZCmtRXNh1LYYxiKADQEmvTvtDGYK8mp7MmfRPZ
	dKDGL1kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKU0-00000009f1E-40KG;
	Thu, 17 Jul 2025 09:00:53 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucJlJ-00000009YSs-2hqZ;
	Thu, 17 Jul 2025 08:14:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=3F
	ZEPCuqg+j4PT7ny21iPN/qrpZr3fDoK5twCI5iDpE=; b=dOC1rXOu1U0D9+7e+e
	lzeBQSrZJq++NdbuV21sILbGHtcJNc5sQpNSokou6Gak95PKGE4SxIultwM/N646
	du53zl3+WZ3uEY1BjRWO2wzegiZDpcK3N6yf+eA+NGmyNznjimozulMhAKF3LP3Q
	MPevJqYUUvsNOzWFTSIjXS6Uc=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCHFbq9sHhoLS7XFQ--.22249S4;
	Thu, 17 Jul 2025 16:13:59 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	hjc@rock-chips.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	andrzej.hajda@intel.com,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	Laurent.pinchart@ideasonboard.com,
	maarten.lankhorst@linux.intel.com,
	rfoss@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	knaerzche@gmail.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v6 2/2] MAINTAINERS: Add entry for Innosilicon hdmi bridge library
Date: Thu, 17 Jul 2025 16:13:37 +0800
Message-ID: <20250717081344.1355613-3-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250717081344.1355613-1-andyshrk@163.com>
References: <20250717081344.1355613-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHFbq9sHhoLS7XFQ--.22249S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFy8CryxZF1DZryfKr43trb_yoWfCrg_GF
	1xA3y8Zr4UKFWjy397Ca1fX39Ikay8JFyfXFs5tws7tas8Aryqqw1vgryIgw15CF1rGa9r
	Zay5Xa4akry3WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnkWrtUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEhqNXmh4qEf5MQAAss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_011442_019315_E2070948 
X-CRM114-Status: UNSURE (   7.49  )
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

Add entry for Innosilicon hdmi bridge library

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

(no changes since v5)

Changes in v5:
- First included in this version

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d97e091b1742f..f944acf7923a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11945,6 +11945,14 @@ M:	Samuel Holland <samuel@sholland.org>
 S:	Maintained
 F:	drivers/power/supply/ip5xxx_power.c
 
+INNOSILICON HDMI BRIDGE DRIVER
+M:	Andy Yan <andy.yan@rock-chips.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/bridge/inno-hdmi.c
+F:	include/drm/bridge/inno_hdmi.h
+
 INOTIFY
 M:	Jan Kara <jack@suse.cz>
 R:	Amir Goldstein <amir73il@gmail.com>
-- 
2.43.0


