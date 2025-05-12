Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E131C3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 13:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7TPmz56+bTrrWezkI50FNZkhcBlfYF3xYROFZ7Kqfs=; b=sqL55JNiR1OPv1rIeviDQ0Sslv
	pibedm5XNLawXXkCmKDtaTtr7gRFoL9mdMsfZbKopE/OMGVfqIYVytVqfgxFcQ+RUfD0fKKYgYMWg
	YubHkLPQ/Tey/KKJSlRVL4Hkm7C1SuffhcmEa2siOaEukJilUdSzqC6pHEjLFEfk6bMdU6v6naDOM
	MG/hoxphunsw6ISt9JJpj5E7uglfmcKPUARAI29Mgj4grKIVmhvu/JaXHlR0BSnzWLQ7J09yaQRfA
	gZHPcVUnBxo9s4ZKstdWs4bjNluaWrtvph9n4I43qncjaKEir2CD5dj+JsEq9Q4CWOLm9DONzVBg8
	vuqiwK+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESuY-00000009UT3-2pnp;
	Mon, 12 May 2025 13:09:38 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESZ0-00000009QZA-3y8Q;
	Mon, 12 May 2025 12:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=W7
	TPmz56+bTrrWezkI50FNZkhcBlfYF3xYROFZ7Kqfs=; b=lOTRFDuXOP4BAUVjSJ
	Q5rFUAdtQVwhl+9Oy5tf1kT/m+Q15aatk3A68LAvdmjYUk/VffXx60htnqnZFgA5
	y5A4OwVLiFBQJ2u9NaTRu//C6LQFMBXIm2LaB7b8lya5lpKa3ET70Kdj/x1f6g3M
	edxutcQHwPPygDzQFfmwK414k=
Received: from ProDesk.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3chWY7SFoQ+_OAQ--.62400S12;
	Mon, 12 May 2025 20:46:31 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: jonas@kwiboo.se,
	Laurent.pinchart@ideasonboard.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	hjc@rock-chips.com,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 10/10] MAINTAINERS: Add entry for Innosilicon hdmi bridge library
Date: Mon, 12 May 2025 20:46:11 +0800
Message-ID: <20250512124615.2848731-11-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512124615.2848731-1-andyshrk@163.com>
References: <20250512124615.2848731-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgC3chWY7SFoQ+_OAQ--.62400S12
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFyUKrW8Jr48GFy7AFykuFg_yoWfWFb_AF
	1xC3y0vr4YkFWjk397Ca1fW39Ikw4xJa4fX3Z5tws7tas8AryDtwnY9Fy0qr15CF18Ga9F
	qay5XFyakry3WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0a9aPUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBNLXmgh6hVNRAAAsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_054723_316752_2E7F9C73 
X-CRM114-Status: UNSURE (   7.91  )
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

Changes in v5:
- First included in this version

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 81b81cc68ca24..3718e570b4739 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11694,6 +11694,14 @@ M:	Samuel Holland <samuel@sholland.org>
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


