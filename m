Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116A3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzs61HZr2e08vLjlcHcnU81Qx3P3Xyhgqf6PYo21bZc=; b=34QKsrM9PwqAMOWOaMw5B7qW/S
	Pb8FbT2xYLeyLZgmCFmrTxKTHTwD2n/q2MoaFezOFHeB4NaU9tFUWmdiKv8frJQ1YopuezbgJCq0Y
	/WKhsD+dQV0KGRhPJwziDO1Ji6LjX1bZ3Zc9tLK6kIGmMxHIJunpiNLCgTMcfGmh7Dg9/dJZIqkBY
	mq7gqiVlFiKTJLFUYX+fuQdnoMLQ1faXNLbmbt0fGj4C+Sl8oTECsk6KTq49qY4/JBFuTtH96v+Y9
	1iXTN8ZVMVz+u9wzFAPKn5Xd9XijA3HzZ3lWoNo/08O3FedHCJkNxWwnkGQlZyUQydd0NjVYLrRhg
	zminThYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVT-00000006rvx-2YKm;
	Fri, 03 Jul 2026 11:56:31 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVQ-00000006rs7-2k9v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:56:30 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c8b49639fbaso370287a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 04:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079788; x=1783684588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzs61HZr2e08vLjlcHcnU81Qx3P3Xyhgqf6PYo21bZc=;
        b=MLzp7V0FkR/aiioqiRw/RhTtPfVNJ3AavyeXzhvM0xbrkJpwmDqjJTIWITNlOJhXO7
         3okSdzylaZjvSR1Cw+NAEIPGm5AVCAs/DjP7JrHbl9dU3MHv2yJ+I/jt+RRfE+Tl4pua
         r7H7mRGm0PibBTiIu8yJLXRpGTkG6+n2Ieju0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079788; x=1783684588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gzs61HZr2e08vLjlcHcnU81Qx3P3Xyhgqf6PYo21bZc=;
        b=bYgDiPSKraEiLHFXxtWBIiTcgRPuHkjTxkwArVLttuFpJX8LAJVGgPu3kRCXdz5Hlj
         ofcWrsJaQP9NdXNjH7ONQu8oCf3TYJd/er+yoc66ak+GCNZ96PFKkyEs9dCCHvh+Ob4U
         rH8j9pPqHgFp0Egii2fM/sQqU5dgyx2Uos+g8KpJq8mAKW9Vw4/Ws5yfiZWf1aC3gF9n
         F/Q34qEpm54wKdjZcozO+uG29fi+dQ1RqWzBBWQff8KJZWByxUbTrHmpDIlEciq+gbd0
         4MKgcr209gJpf3MKKiI0HL8XReiSCaUabEa2yRhhtLY8M9SD4lAizTvAi5r74jAQt/74
         pffQ==
X-Forwarded-Encrypted: i=1; AFNElJ95pvu+wNe8inY/cGr2n6QalxvgXMM72OWwNlhQRhSpYqhJffBmmYnPzrtmO25XoCcSeBTazMsmxJvxTnja/piO@lists.infradead.org
X-Gm-Message-State: AOJu0YyzsEOKrImGsM545NQ94pPSlI/JPTlKltwXUVElCWYBgWyAVlh+
	CVjycgOw3kKHKunDocdp9KeYiYobH0MV0qZodvaT1jTwqTcVd/RXrqKEInbwVcw2eg==
X-Gm-Gg: AfdE7clt4dPjbWSMpuHM5lz1IHzR8deHJIdb8I+cXHtc5fNsJnvmg6er4LwSQURFoil
	Ouh+ydBOYJsE8M1CP7R/v/EtqJRV1Q2pU1CSUvIiikx3pk3lhS+lMFpsnphBq4T4olF3lqLmpUI
	zOAyie133KusOW9Kw8K2/B0RpE0G44eLdweJ7daSJKdaS8XF8LqXuazxr0fGhK6Gn9dOVl32sW0
	fYj+KDHq26BMKq7ECpbNsUwSYSlVhEA8RnBybJmPfu1zjyfhD/BHxj9ppNfxExRgGIJ7jNpB2fc
	5uDhnGm7Tw/Mt5HKkJVgqKQlUe1aiIrQRzhF9g2v+At3vApRYOckl15Q0zozNmtjvHteMtnp0l2
	MIzfFHm5jHHW6NCLe5kinJ3qWbRysncjR4+koxRWvjHIfsG8YEgrCQsy4EGbRXJq+/LBzb7Q6WX
	5ocuYmVzBipgj3h0IETkJd1ATj7dL/WfFejc4figV/NlvIkR7hMWId15/8cGAfFO+P4Wdt9A==
X-Received: by 2002:a05:6a21:1f84:b0:3bf:77d7:667d with SMTP id adf61e73a8af0-3bfed47019dmr11801134637.28.1783079787514;
        Fri, 03 Jul 2026 04:56:27 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:27 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] platform/chrome: of_hw_prober: Add delay for hana trackpads
Date: Fri,  3 Jul 2026 19:55:58 +0800
Message-ID: <20260703115601.1323491-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703115601.1323491-1-wenst@chromium.org>
References: <20260703115601.1323491-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_045628_711692_3ECB7CF7 
X-CRM114-Status: GOOD (  17.97  )
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

Up until now, the MT8173 elm/hana device tree has set the dedicated
regulator supplying the trackpad as always-on, simply because the Elan
driver was missing proper delays. As a result the delay for the
Synaptics trackpad was also omitted, as it was not strictly required
under such a model and delayed the availability of the trackpad to the
user.

The Elan driver recently gained proper delays after power-up, with
adaptive skipping of the delay if the regulator was originally
on. The I2C HID driver and I2C OF component prober library gained
similar adaptive delay skipping. The device tree will be fixed to have
the regulator not be always on, and proper post-power-on delay time
added to the I2C HID device.

Also add the post-power-on delay to the ChromeOS OF component prober,
so that if the regulator is off at the time of probing, the prober knows
to wait for the hardware to initialize.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index 8562a0e89dc6..54d8941617e2 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -70,10 +70,8 @@ static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
 		/*
 		 * ELAN trackpad needs 2 ms for H/W init and 100 ms for F/W init.
 		 * Synaptics trackpad needs 100 ms.
-		 * However, the regulator is set to "always-on", presumably to
-		 * avoid this delay. The ELAN driver is also missing delays.
 		 */
-		.post_power_on_delay_ms = 0,
+		.post_power_on_delay_ms = 110,
 	},
 };
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog


