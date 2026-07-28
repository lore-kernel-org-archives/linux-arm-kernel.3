Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9E1C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 17:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52HnKI6RMBP1UH8Vyoa36nYig1J0z+aSoQ1INqPNZ9c=; b=W3CowPcqcvl+RCH2yuaqwUHRxa
	weyh/TEabysJGX74U+VgQ+mfOFJUKy8Qhn7U/LgPwzdNwQ35KVbLHwLwP69S6g+0jOOCQohECkNe8
	pMnrDGEMAXQhbQ56f6L7Qi15txnKx54lV9vvZfIBj28bsY/8U2zUpEcZ6OjRzZakuevnRT5W4bN/6
	HxstWDhARC9on52gjNk5NK6Z5oiw+xdwnmrxZsd626Cp/DIxM0fWOL6I6dxukb3GFAI5I48F6rRrv
	HLe/zJbf3q5YDBCJfk8wM3ocQzjjebvSFfQPX9peTPyhVDkBa5Gm/UkBf6Xv5nPgsBxl84XrqeOrO
	3vvSeQxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolo0-00000005zfU-2fPx;
	Tue, 28 Jul 2026 17:41:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolnW-00000005z8Q-2GyS;
	Tue, 28 Jul 2026 17:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=52HnKI6RMBP1UH8Vyoa36nYig1J0z+aSoQ1INqPNZ9c=; b=Dg3NqGpxZE1XfgvhYjmVgNzCZh
	7z3UH8AGxpgAdXNn+4582GzS4q2yUSkmcILLzfW4dvPhXJ/59L8G4WUhojQhrFIKI96Ow7saW6dqs
	FtBk2EUrEnaPncmDvz9hGORvH2l9aIw/yGhWyzz9Bn0MOpeO2YE0Qx9i5kRMMAgU3r6ccJ0WHdKTS
	d4CM4QVzBAooqjx1A9Md16Nnnt1Gfpl0Dwt+qmppHjQQIsN8Ids7EUVjDolk6v2L22Sq5yp56uudC
	rPYQtYUXI7e++dyY+OrjlM00GkzcqxR+F4cxFx7X5ISRb6DtdWkFb0dhEloA97ZLglRX+v6QPDg6j
	2B1BdDUQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wolnT-00000005AT0-1Yj9;
	Tue, 28 Jul 2026 17:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785260447;
	bh=k6sF2HKDGpbYJ4giz4Isms+1Pyqz8ej1CUvnf29xAd0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UBwARCCHu6jzLlnY3v9sdyNX0XBl1fffHZOvWGHX0k3hWtgReUB6ErY97P+/rR0UV
	 uGfz30jqJpyXmm97fsDm0tUB4oE2gVdJ57tyeCG1cmXkstFNmpFxqmG89CYxBiy1cI
	 X7e6lZwsk6XwTGr/OSCl5WQlpLIsoE9CePECzax41TiAqBTenvq98IMNicMINyjvCj
	 WRnfChZAXCgUgwFMb/qXQhcoyg6pu362Cs7L23yxcAuKMPr4NyZZCBCwVCbcGPVtiU
	 RGSfFfT7v4kOqnoXq0gIleGuc/or9aklyFm1f5ADsXzBCA45OUy/8KA7aUkNSqtvXW
	 EicDjezGKk6hQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D3F5917E07B5;
	Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1E7C7480052; Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Jul 2026 19:40:50 +0200
Subject: [PATCH v7 14/18] drm/bridge: synopsys: dw-dp: Protect sdp_reg_bank
 from concurrent access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-synopsys-dw-dp-improvements-v7-14-b7640fa8cf48@collabora.com>
References: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
In-Reply-To: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2444;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=k6sF2HKDGpbYJ4giz4Isms+1Pyqz8ej1CUvnf29xAd0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpo6Z2AGJLeE3hrxzZ6A/40rWPxeBi/HIfR+
 AA3Wc341MW6mokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqaOmdAAoJENju1/PI
 O/qaq0YP/2z3MS7BUW4ZpNYzgGIleur8LZHDRUEYYR2z0ye2vP1lfVvmYlxuNQ1PpUnZzAPpXo9
 Pz+O3pVSqmvN4Ind8fzmZA+lcHjjSrDeoLriMr+2wC3Xn7GKKVza/CW8+EveG0qqJBO6DgaybrZ
 zGWKhNGr3dl4PkUpxBFYRk6xPNmJDhaBXXo34J63/dCJlOqjkaXI8uHPRs4dkLw+lHbvlFgrIht
 RGvWdTYTzEiONrMuoneHQbwoOHLOsureXAlpdKZkhIJyfhVQKz1gXsfd4JRUTfYAXUfuB/OLVag
 eMcSNDSSnIktFAsk7navbKDOWJ0t74EdTWjbAbwOrgct5HVYdDBQo0usSOOktP+cfMjNmGFOxRf
 MABSTnCgPdC23VyG89PQmifLSvpBmXhIcj7Ir/WgjzURLpds+SsTmDls6Abfz5mfZk+jQImsNtA
 D2IYMpshXBgPl6rKG8TRo4wkmaUhJwSQhkymYgL6cQ4c+gXNCJGIWki6QYNouXX97qqBGTDYD5h
 QSKjqVDbLPFc4/MeYGUj1Ks0lVAfFl1kioclZ9G+FUS1+DnXOqZmFAjmz1w2GiGm5eoY55OA0Pv
 3lRonEa3XsLYSTspqf/967e5M6X0S75BzmTx0Fsdv7Y5V3xsxx8kX/WulCkqvWgKxy6nHy4Y33V
 qY+BY9FxfUq4+Rb8oijEt9A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_184055_707303_08F24FAC 
X-CRM114-Status: GOOD (  13.28  )
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

Right now sdp_reg_bank is only used during atomic enable/disable and
thus there is no risk of two threads accidently claiming the same bit.

This changes once more SDP users (like audio support) are added, so
introduce a mutex to protect concurrent access to the bitmap.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 8b650f904575..50eb7a467932 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -322,6 +322,8 @@ struct dw_dp {
 	struct dw_dp_hotplug hotplug;
 	/* Serialize hpd status access */
 	struct mutex irq_lock;
+	/* Serialize sdp_reg_bank access */
+	struct mutex sdp_lock;
 
 	struct drm_dp_aux aux;
 
@@ -1047,11 +1049,13 @@ static int dw_dp_send_sdp(struct dw_dp *dp, struct dw_dp_sdp *sdp)
 	u32 reg;
 	int i, nr;
 
-	nr = find_first_zero_bit(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
-	if (nr < SDP_REG_BANK_SIZE)
-		set_bit(nr, dp->sdp_reg_bank);
-	else
-		return -EBUSY;
+	scoped_guard(mutex, &dp->sdp_lock) {
+		nr = find_first_zero_bit(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
+		if (nr < SDP_REG_BANK_SIZE)
+			set_bit(nr, dp->sdp_reg_bank);
+		else
+			return -EBUSY;
+	}
 
 	reg = DW_DP_SDP_REGISTER_BANK + nr * 9 * 4;
 
@@ -1691,7 +1695,8 @@ static void dw_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
-	set_bit(0, dp->sdp_reg_bank);
+	scoped_guard(mutex, &dp->sdp_lock)
+		set_bit(0, dp->sdp_reg_bank);
 
 	ret = dw_dp_link_enable(dp);
 	if (ret < 0) {
@@ -1735,7 +1740,8 @@ static void dw_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	dw_dp_video_disable(dp);
 	dw_dp_link_disable(dp);
-	bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
+	scoped_guard(mutex, &dp->sdp_lock)
+		bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
 	dw_dp_reset(dp);
 	pm_runtime_put_autosuspend(dp->dev);
 }
@@ -2204,6 +2210,10 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = devm_mutex_init(dev, &dp->sdp_lock);
+	if (ret)
+		return ERR_PTR(ret);
+
 	res = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(res))
 		return ERR_CAST(res);

-- 
2.53.0


