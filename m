Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCC9C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 20:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fTnbotTKBrDuh9yFMLlTHsKfcYmOYKw+giMri+h4htU=; b=nLxPqT/jz75jX2cbbXYw69iYb3
	vvCIKU8OWlNAX2qtjALCzV8eiXV0EFuivoyBOObwF/hdQn6X2GjAmvrBTzsrZiC7hgfRuu96HPyQi
	I40HccvzkXZ7lsTYvPxStkwAZE0QJsGTerRiONQ4rkVq+qAlzLTpixifLqb3bik62hIN5K14IPb4p
	2k8tlptGtupw4z37eg7xX1rQn0z7ZmdtHKd0HKZNwiaJCYUOGiiQ8ebb9Gf44iVjMz/txpZExzUs5
	DHn2ez3WQ6ppH6oHkueg8QeQFUjx2cOxIPVSvl+0ooht4kstF/FZBBfbNzleSBnoVcbnTlq+Lp4pa
	Gis7gLow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNdqx-00000000y7A-1nCF;
	Fri, 06 Jun 2025 20:39:51 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNdop-00000000xzG-24Vb;
	Fri, 06 Jun 2025 20:37:40 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-60780d74c85so1580476a12.2;
        Fri, 06 Jun 2025 13:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1749242257; x=1749847057; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fTnbotTKBrDuh9yFMLlTHsKfcYmOYKw+giMri+h4htU=;
        b=M23EYND6aKEWjpt0X/uQycB9ltCgIguzresOJeUU3Y3Yf3vpFbZ4aPo6K2vpPgtUb4
         9+924S6O50CQF4nUnPhfnRpklpsf5N4GqLcUkq/zMgbibi4ogI3Tbat10ZNA4XX7hMgO
         gSXtxNNx4AJUaedcwr1CUtiV+hJbqoC3EH9rUb0KOSyGrtRh5CkE85S/MyUFJ+oKZjXB
         llFBwHe3vfbifJfVZvdy9Y36aPhmGNZZEC0z7LCMSt4KgPdJ2+CanneBaD0hfttPnm8p
         oKf+8lhQ4THgBHTq8LEf3Wt3SJ5rybt4lhBfwIGW30XlYqDOOORZALBu6oC+ZTEKbU50
         YqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749242257; x=1749847057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTnbotTKBrDuh9yFMLlTHsKfcYmOYKw+giMri+h4htU=;
        b=B9E0StYUsK7yu3V9zZnWWqP8CrwoY+UJB0ypIyw4Ymcfa5GRwMeeWV7DrLWPM2zzbq
         BmBQTC5i1PZd0ImnRwnkSomeJOzccm37bmVtV5MMpW+FjnXf0qA2poQU5WkdN2xtmVg6
         eZ/6/7H3O7X0p/tNklWUHuLs6wv79d5F5w5dNaXmqB+nSGUuMsCf94xzIUO4VWIOX7Fn
         op70KNk6aKOE5QkLNWH6KTZjppwBC/+Be6vY6052pojKM+TeBmLHsbkvXFKs4UDAPnVP
         hN1aipoE7yIiCUW8UEciY1mNLdwYvGKl0X6LwZJydz+JYd17NUE2S2gaQToRaeIIoUzw
         1Dng==
X-Gm-Message-State: AOJu0Yx6+jF8h0iBxK5TeE1vo687XQCzfoJoZM6wGPAgVWolnxRn1S54
	oh3cSrR8yRQBLrcO3qWdjCbGSkEnTNx6XINsWxuiTx7AIn/vUbIJwoW/yZVzJw==
X-Gm-Gg: ASbGncsWJN9oS2K79/lRy9v4ypVCeZV6fbGaZRzTfvcBPwblaUUaKgywCpnAJ6O31j4
	h3UzUAsJ3uKjXZkHPULiCkejRNA+6BVGwcdW3aTDIsMqCKaQmal0J2rdL49gnTT1fAUIR+5afsy
	mQ88xKzZt6DJfCr6/hUH9jvX3upa0Qi9G+439HO85m9xkQpbLtq1ZQzklVEiQ/3QUypawRJ3NJ3
	J9+S1HFLXw3rHo3R24v01DmrX1jiPjXNmBMFQ1N/+sbijka53c8aDOXAzGpfEKVmfCLtUUgBEC1
	7iQT271JV6FjKu82Va8LFHx1lXSyhNa2WKMP88+ZTeR7tcQrlPef06Y3bAEXQzuCZySadrU5hyg
	VQ3ldXHiZ5iiUdIk+457tYqET4jVkIA48jX/pIO1p/sJrNJosegFQJ+FWocgbZkus/3gyq8Pw2/
	RCUfUvKXeYDfBMOF+NUK8X7b2CIebpFw==
X-Google-Smtp-Source: AGHT+IFdovf47zA5w77hCKENzRX0iCD+h8wdbY0d2TkUMANo/kiX7t5oGgF0SPw/Z8mbPgOCYyvO0Q==
X-Received: by 2002:a17:907:3f95:b0:ad8:9811:c0c2 with SMTP id a640c23a62f3a-ade1ab2b859mr396798066b.61.1749242256967;
        Fri, 06 Jun 2025 13:37:36 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a016-f000-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a016:f000:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ade1db55f3dsm172072366b.60.2025.06.06.13.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 13:37:35 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] drm/meson: fix debug log statement when setting the HDMI clocks
Date: Fri,  6 Jun 2025 22:37:29 +0200
Message-ID: <20250606203729.3311592-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_133739_533414_190EBDC5 
X-CRM114-Status: GOOD (  12.54  )
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

The "phy" and "vclk" frequency labels were swapped, making it more
difficult to debug driver errors. Swap the label order to make them
match with the actual frequencies printed to correct this.

Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 47136bbbe8c6..ab08d690d882 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -109,7 +109,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
 		venc_freq /= 2;
 
 	dev_dbg(priv->dev,
-		"vclk:%lluHz phy=%lluHz venc=%lluHz hdmi=%lluHz enci=%d\n",
+		"phy:%lluHz vclk=%lluHz venc=%lluHz hdmi=%lluHz enci=%d\n",
 		phy_freq, vclk_freq, venc_freq, hdmi_freq,
 		priv->venc.hdmi_use_enci);
 
-- 
2.49.0


