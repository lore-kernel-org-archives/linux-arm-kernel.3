Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBFCC5B569
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 07:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0u9zoBG533ZYG/6qOcrTg4c7ySWLDkFmqyyTVZY0Fo=; b=vlZcl5sbma2JillTayrc5cIiTL
	P9d/jsEpZIBhJIqdaE6xodvkaPjfM+wuCqGIK2QMhS1QNjVbzfRMMyeEUa7fQcuL8b2qJOk30B0Tu
	HP6i6CYK88TLSs9wMs3TNlPKcH562lDLk66EeoFSKw9kMD6bvXTad/rOB3H8k2kLOpi294cVzXHQN
	sZvqzaq+nchfTis2QIGf7frBCReI8ZzMJEhEGA0j3K//u58N1yHDq3XYVkBFajPvTcrc5wQRpQofF
	AQIp7ehLoRDit8eVsZXj+Q3fQZFeqB3FokMeMpNY94lKfGV7NdJuAcl5O22HtXn5ens+AZkqzenu2
	OrSHScGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtghB-0000000DUj5-3eMC;
	Tue, 11 Aug 2026 07:14:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgh9-0000000DUgB-2de1;
	Tue, 11 Aug 2026 07:14:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F08C844043;
	Tue, 11 Aug 2026 07:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4763C32782;
	Tue, 11 Aug 2026 07:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786432482;
	bh=MqxExXUarY1v5ejap/smzcDumYmeKzgFttH5TV4bZGc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XbndWgatSFottIo/F0yTAUUYs/CDjNo1KUGozgmux2IzpjpwHsb/Rhi2w3uB276GP
	 sB+S+Z3g1l7hW5SsjHckmMjhaxJgQsZ8OkH9IL8bReZXyqINi/y6eqP45ctkGRsB7V
	 WmN0SRwTwnWi+w4CxckbA3rbIKV1UXIrnGhZXobOHSlpvaEkgFkmccM+rAs0qowS+H
	 FOu9KKUK26UkTmUGgHRewsKNVQNWgUdoNnDv3O7XbTqoWIpukDgNVh4DCyZmqkI+Ny
	 UuxxG1CcC+/ydI5+q6Bpvp2YSXxuYtjQ3FvM3QbrP7RY9sX/BZEkGg5HFCvO/knKb2
	 zOqwbKwRaXycg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33A8C5B574;
	Tue, 11 Aug 2026 07:14:42 +0000 (UTC)
From: Jack Wu via B4 Relay <devnull+jackbb_wu.compal.com@kernel.org>
Date: Tue, 11 Aug 2026 15:14:29 +0800
Subject: [PATCH v6 7/7] net: wwan: t9xx: Add maintainers entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-t9xx_driver_v1-v6-7-2c969fad57c6@compal.com>
References: <20260811-t9xx_driver_v1-v6-0-2c969fad57c6@compal.com>
In-Reply-To: <20260811-t9xx_driver_v1-v6-0-2c969fad57c6@compal.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Sergey Ryazanov <ryazanov.s.a@gmail.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Jack Wu <jackbb_wu@compal.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>, 
 Shi-Wei Yeh <shi-wei.yeh@mediatek.com>, 
 Minano Tseng <Minano.tseng@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Robert Yu <robert_yu@compal.com>, 
 Jeff Chang <Jeff_Chang@compal.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786432480; l=899;
 i=jackbb_wu@compal.com; s=20260526; h=from:subject:message-id;
 bh=6MpjgGzXcGI3PS41xWiOq6mWrN6ZuUsiO+32dtE4ZE0=;
 b=2m97pkv5qgyJNL2LjE0BGHoX6krzmCBtsm3Uz/xHwiTO1kG2/LKUf9Btkvq3D7IQs1wAKFyn+
 Ox9tUnH93i9DzS/PukWK2Azgh4NJiDe941HmSUqE+EdygJJAx1UgXbA
X-Developer-Key: i=jackbb_wu@compal.com; a=ed25519;
 pk=VH1prTWixNl8OEUPPSfII3p46MzJpQN8J3+ecE1tZXg=
X-Endpoint-Received: by B4 Relay for jackbb_wu@compal.com/20260526 with
 auth_id=793
X-Original-From: Jack Wu <jackbb_wu@compal.com>
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
Reply-To: jackbb_wu@compal.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jack Wu <jackbb_wu@compal.com>

Add MAINTAINERS entry for the MediaTek T9XX 5G WWAN modem device
driver.

Signed-off-by: Jack Wu <jackbb_wu@compal.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 461a3eed6129..8f13ef7440ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16494,6 +16494,17 @@ L:	netdev@vger.kernel.org
 S:	Supported
 F:	drivers/net/wwan/t7xx/
 
+MEDIATEK T9XX 5G WWAN MODEM DRIVER
+M:	Jack Wu <jackbb_wu@compal.com>
+M:	Robert Yu <robert_yu@compal.com>
+M:	Jeff Chang <Jeff_Chang@compal.com>
+R:	Wen-Zhi Huang <wen-zhi.huang@mediatek.com>
+R:	Shi-Wei Yeh <shi-wei.yeh@mediatek.com>
+R:	Minano Tseng <Minano.tseng@mediatek.com>
+L:	netdev@vger.kernel.org
+S:	Supported
+F:	drivers/net/wwan/t9xx/
+
 MEDIATEK USB3 DRD IP DRIVER
 M:	Chunfeng Yun <chunfeng.yun@mediatek.com>
 L:	linux-usb@vger.kernel.org

-- 
2.34.1



