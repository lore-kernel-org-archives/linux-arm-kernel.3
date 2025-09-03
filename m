Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5717ECA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 12:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c0/SBiSXOOl6HFr+JmOjCWEmu3pstjSyRziH55Av6WA=; b=ygWTxRUSkP5fLN2zKTzNaTyGxp
	UMKpDKmm63NXPwqLTA3wuGquX5hixFgMf/TkWOzSWFGSSp7Yb7BDSv1rzcnzDDfFQJ9nM1SH73tjh
	UfEEy0v7jalu0Rq1oBQlmZOG0xwRvJ0NPW0ufNfQsytsPtAnRUoMGdDSQuVhw4ciPFFi5SnagB3NU
	EceKU6grIAKRLswMbGwFD+YWOMfRVXEMQHj55qyPIRvKvzylBvfn8jut3qSBldHYFDz0GLESQ8Ry2
	TlRVrIp0rtosN62k/kgAY7+I1NWYsm6UesE4Jf2E1B42XDIHs0PkndFQpMQx7fqPFLSrkFtPdqTLj
	xyEfTAHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmcv-00000006OEf-207k;
	Wed, 03 Sep 2025 12:30:13 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlMi-00000006BU5-05ed;
	Wed, 03 Sep 2025 11:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=c0
	/SBiSXOOl6HFr+JmOjCWEmu3pstjSyRziH55Av6WA=; b=pzmGJUW5GsUD0zajgM
	1dLJ5xfepWw+5r6dKHs8FqtSnbSrW6yE4YGJJgieet+W9uNB1cCZPLY2cMlHAziF
	CeAW/sq3nKyZtSTjyQ6nN4BdM4UVJOfciEZrD2to83lqxyMEtbXujEgp3CHn79sV
	nTWuDvNnkqHafHOXA5tRWUOXE=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wC3ZLuqIbhoXAZsFw--.3268S4;
	Wed, 03 Sep 2025 19:08:34 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: mripard@kernel.org,
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
Subject: [PATCH v7 2/2] MAINTAINERS: Add entry for Innosilicon hdmi bridge library
Date: Wed,  3 Sep 2025 19:07:39 +0800
Message-ID: <20250903110825.776807-3-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903110825.776807-1-andyshrk@163.com>
References: <20250903110825.776807-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wC3ZLuqIbhoXAZsFw--.3268S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFy8uFyxCFy5Kr17Zr48tFb_yoWfGrX_GF
	18JrW8Zr4jkFWjy397Ca1fX3sIkw4xtF1fXFn5tws7Jwn8AryDJwn2gryIgr15CF1xGayq
	qayUXF9Ikr13WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0iqXJUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEAO9Xmi4H7lLfwAAsy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_040924_360399_261C8B65 
X-CRM114-Status: UNSURE (   7.73  )
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

(no changes since v1)

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 88851907b6725..d4b5eea84cb9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12085,6 +12085,14 @@ M:	Samuel Holland <samuel@sholland.org>
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


