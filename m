Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D84C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 13:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4an3GeKBTudslqJaw/NeBqgOS4NHJwbOQHtDOLQOmp4=; b=JUNNGfFNCYsTBhf09dh7zWqfQB
	XA4bI/KrEhr5O6q37SmP1fYSx9HzpYJh7r1XtA+iNLvKPbS33HMmvGIhPvdvUS3VL+W9Vdb6B8dwO
	LfXxLYT+zbR+VqWs+I2kzlwTE8+VmcE1WRY2ZpBWDMe5CHcanAbm/O4+R6M3eIrv41PYdQ53ueHcR
	rUzV+oyrn8Ad5y2kR8Zrs4iD+rRH7EAOubhADuWhYNXn2zeh1/YqV+/ZKVANXLKUgsImF8mWInxwq
	/apH6qcGVj/NkQmkQesROHbpiAQBEuKnMTmOJ+7WtKRo6DuPGW1KcA+4gb4vh/uTghNCNR/ksaxDE
	r2NBfkeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESyl-00000009V1H-1x8e;
	Mon, 12 May 2025 13:13:59 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESZ1-00000009QZP-3dcT;
	Mon, 12 May 2025 12:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=4a
	n3GeKBTudslqJaw/NeBqgOS4NHJwbOQHtDOLQOmp4=; b=cGbEwpQ3urxmguwLZG
	6WqUJ55fUpI4A8g3EOK5ethJ0EKKEzDGOTCHu2yfhS7oAsGJNG+M0k8Klurf5KMs
	ySImhowU+BYn9uCUl7DmhM9dPPTYjJSL/Mq4RGk/kky3d+U+a167QtLHeHeZYMav
	GcZ4J1CR9/DON/oUFHBGpwpj0=
Received: from ProDesk.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3chWY7SFoQ+_OAQ--.62400S5;
	Mon, 12 May 2025 20:46:25 +0800 (CST)
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
Subject: [PATCH v5 03/10] drm/rockchip: inno_hdmi: Remove unnecessary parentheses to make checkpatch happy
Date: Mon, 12 May 2025 20:46:04 +0800
Message-ID: <20250512124615.2848731-4-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512124615.2848731-1-andyshrk@163.com>
References: <20250512124615.2848731-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgC3chWY7SFoQ+_OAQ--.62400S5
X-Coremail-Antispam: 1Uf129KBjvdXoWruw4UZF45Jry3ZFWkury3Jwb_yoWDXFX_KF
	18Wr1rCF48Zrn8A3ZIk3y5ZF9FvayI9F4fuFs5t393JFn7JryxJ3sxCrW3AF9xWF1YyFn5
	Ca1qvr1UAFnIkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUeb4S7UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gNLXmgh5MDGsgAAsd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_054724_275662_26D9A2A3 
X-CRM114-Status: UNSURE (   9.04  )
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

Remove unnecessary parentheses to make checkpatch happy.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v5:
- Split from PATCH 9/10

 drivers/gpu/drm/rockchip/inno_hdmi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 82c62400b2e1e..7b4c952f26922 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -1124,8 +1124,7 @@ static int inno_hdmi_i2c_write(struct inno_hdmi *hdmi, struct i2c_msg *msgs)
 	 * we assume that each word write to this i2c adapter
 	 * should be the offset of EDID word address.
 	 */
-	if ((msgs->len != 1) ||
-	    ((msgs->addr != DDC_ADDR) && (msgs->addr != DDC_SEGMENT_ADDR)))
+	if (msgs->len != 1 || (msgs->addr != DDC_ADDR && msgs->addr != DDC_SEGMENT_ADDR))
 		return -EINVAL;
 
 	reinit_completion(&hdmi->i2c->cmp);
-- 
2.43.0


