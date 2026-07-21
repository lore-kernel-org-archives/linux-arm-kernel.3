Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DD0C44533
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 07:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HjmAlbOs1MBYQdjObhXrJEH8vF2H5aB6qgUxYH+azw=; b=BdEExr6wd7Gh5pue50WuLs6AHg
	GQiYmaI8+j4wC0i5F3fZm5NgsXgyNMEHK4g0ngRTtxLoyg7lhawOTR1mRzPcQQKvib4Kyna6UXjOZ
	27jA27olEBrLJvC2+IO7RwIdnQJ2bk8w6DZZEIiG2dHpcIFNHCtO7a8GO7sc3kOVDT5x/wf9oNO7L
	HCaA+zZuqXWBC16PJUYRtLWYRcRVpnzWtkTBIVFhL52dkMdv2NkU5ygonmoTTlaK8kMjXlASl7xaI
	nmQISLipkDzsmzyq7fFACp5rrPbDF73Z9WBbtDXtlOzfhyH7UfbFj/asEk9pi3dRT4FyYhcXmMXqH
	gHNNit8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5JD-00000008i9x-0yVD;
	Tue, 21 Jul 2026 07:54:35 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5J4-00000008hzO-0ssz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 07:54:27 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso124148245ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 00:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620465; x=1785225265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+HjmAlbOs1MBYQdjObhXrJEH8vF2H5aB6qgUxYH+azw=;
        b=BdXdPFWwpjgRyNSSSBjR5JLWZdUDq7AHibAwIEGXfugb34s2p0mA+Ope4jbmvOK2gD
         tEsmf4AZzPc+0KrLwu/D3txcoukuQyLKzAdBsJZSCqES45Z66Waa/rSfDqXco9iNsjcm
         SvP3Y9dDMXfz/FZqOI3KuWSY7BZ7nRnb56cG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620465; x=1785225265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+HjmAlbOs1MBYQdjObhXrJEH8vF2H5aB6qgUxYH+azw=;
        b=gY0ydvqS83CJCmGKRnqYySNvb/N49l8g7iJ5lXlbFcUB9qm2djTBYEnxm629XUn2tc
         SjKlz40lgqBVwwrVTXkpLTm2evg5SGplD2QPJ183GBi/phl/nKBdCHkTryIZfOMEddKu
         ozSJ9PTdqDa3yAZ+qFjiFTzszEGT46T3N99q4nTeE/IX/5g4RDY6rxK+rQYiQUMG2hFu
         jenQrP7HGnfaQLc5+BenGLEa4js7L8O7kn8B6+FHBVDaQyqZEsL/p9t0MUn5yJm2A9SI
         wYqsnNhrD7VmiDQs1XvE95wzUDhS4t3M/ONRHXFBKbq1LzkkRqFqPUeMAQPQNJKrfvWd
         +f0w==
X-Forwarded-Encrypted: i=1; AHgh+RqyDUP4TFdLkcPpFEnEsBBqzfejCCbrgG5nam5EPBQ0dGROYVI5bhQiGgAlIvqBdiD5vcBuRSrrYnHgK1F/0Epw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7lgcs73FgIhYEweG7fQeiIXF4zqUPK+kKVwBEaeaGWCyysAmB
	q0eCcEdSBwGgMIBpdh5AWxeFsd/ZzIv6eX2eCDWF2bLRPxuQeYMtnbPNKowZ0cyg8A==
X-Gm-Gg: AR+sD11DUPXRePA5opLAzYPnkU6jinZqL8fhejv8GXGmmIl9OJX4VLAmwNxZyiJ9KVe
	o6+ip5volv34Gh65VEd/V+T4LSqQIdDHc4IBdHkxDFVlaeWZPq8lHJK2uWLBmhkyKchQ8BU/keP
	xlwBMMVfWtI9U0oB8KEO+aYxJCd6JyzW4aJonxKaQf/Pcx9MMhb/EsXyUWxM72VA4EoBJ3zcj1O
	jTjfKh/yTRMEh5DJJLJJMVqHNACJGN7VWok5Kno2A7WBLkf8eGQeiOiavCgxg3x0fp7Qs7J+Eqp
	mA3qm7zE5B+zLsuLqkR+et7iilbFOfhF4102oLbgvg6v0CJCK7wDC56yGJ07Ai2AHS3oaGvWMdZ
	zdCgRVVgYI6V9vq0BBBZciE320V3IaurZvd8/sh+w5WqJ1x3De9OIRqKgfxC3etkz3l5TycWZpY
	Joa13PhMfMaAZHeQWv3L8p5lkDquJuxTwPNM5pwm3L7vVXFliJucdC9UZ+jvc=
X-Received: by 2002:a17:902:ef08:b0:2ca:5970:732d with SMTP id d9443c01a7336-2cf349d0276mr183734525ad.41.1784620465520;
        Tue, 21 Jul 2026 00:54:25 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/9] platform/chrome: of_hw_prober: Add delay for hana trackpads
Date: Tue, 21 Jul 2026 15:52:21 +0800
Message-ID: <20260721075226.2347933-8-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005426_263402_19AE0EF3 
X-CRM114-Status: GOOD (  18.30  )
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
2.55.0.229.g6434b31f56-goog


