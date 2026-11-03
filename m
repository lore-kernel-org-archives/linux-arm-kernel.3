Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954FC606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NUGZNL84;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JlLclIss
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+m0KRotnRI6Y4M0Q7c+lnB20WP0kpPO3hQuPyKu7qTg=; b=NUGZNL84ZOcaxF
	BrgaWdMbZRsLUkysII8GEmj582k3CT8sJ9XaOGjdxYeojWgr8qME3yoMhqa5ARPjA56woUL6rGkby
	5Lxhh01t0At7Y/no/Avx+4k8ppttclvZ6IhuUNKxuT77TCQxWa7OHPrll0SOEs43+cJscbxS/o/Ul
	80DE+cwWiFPbQtYHAfuTnTgKAvOdm3PQ0x8ozkM8W80cCEDVW7ASc1vLDfeqO3UPZ5kud2v7+ZBuz
	jsHYLbgspYErmSb+I6ARuVHBeWHaB1GgOxMJYERtIqG2ao8gOGQDDZdItHwktsrZNhcCMAAR7nd87
	5e5FFKK/QaQHU+qzExww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6HZ-000000013lu-3xHh;
	Tue, 03 Nov 2026 04:38:01 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6HW-000000013iV-1pPF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:37:59 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso1336442a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680677; x=1794285477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+m0KRotnRI6Y4M0Q7c+lnB20WP0kpPO3hQuPyKu7qTg=;
        b=JlLclIssiiJ8YUZIqkTWVdwifqmeJQEfcl6c9x8Rze6slYVUMJpYKW+ERNATyXDRwW
         WUCT85Yt8RElsShKgBmgmxbToYgsd1/rhkez3xFOQnyORqjksrTu2RLBYhyFfzaMLn4f
         UWf8fM4Ei9Hc8tYRyDBbA2LXdv08A+jeq6GL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680677; x=1794285477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+m0KRotnRI6Y4M0Q7c+lnB20WP0kpPO3hQuPyKu7qTg=;
        b=r/o1YZO789Nzkf055EnkZzikdw7cSK0D4kRtgzJNSo5mekaMUKjXq7gmzsJ5R2lxI9
         2aBmZI+PQJq6fKazfrcv0LttGtuGYLIfCzA0aCfjtEeZe/bd1QbT3tedmh/Hekai/Zfx
         DPFdUgBllhgwgCb3P/QtsKQYggP94zYaHJwj3amhvR51FxVXCM/TOkWHwCN81IpYCXUA
         gAfBI+F6dQnINOQPtuibu8gdgl7o2B2Ib/sxvE/n+RTljo3chnRDy0sK5Hloog2kLL+y
         v90rYl+puHExEiHfSXpuKzFKXr1Af82sfmI7W5jXxavRJwjEVyVixFxzDvletL2+3D3z
         PW7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzIXZq7vdVOcR19rYNhdoKZ4oWpQfGncfnCq6y3Lmeh3YeFvjWJjv80DmkJTb+uvMTkCPV9+OrPckaboIGrne26@lists.infradead.org
X-Gm-Message-State: APuU4Z9IEb54jvhW7eVRjG4uuveSBkfbLO4y7A1akDjI5FSYUMiHU0OL
	8MD4xjlfB6dZPN6Cnc2I0Oq6+AcNgT5iqtUreGzGNULNJBAiI3WA2rksCKsiZJDDlQ==
X-Gm-Gg: AYBFou1tI5SVkkb+nXYE7cIGkbLddAS/mNLf0ZGexDi78mH1FCWF9AxPU0inImaJrGo
	9o5IH65NuzvsKpiyFp0y1CN4O6NttAumV6SfLi2q4GV6nyz07tdKG/Zqb5tJNALDkzrWeuvItUs
	kKCPCsTUDtb+KwcTqkRnu5wSXPgqVPTAq2m+jK8rGguqal/8E7CdPb0BcGCCK7FIgwFbS70KhO/
	Z2LQ7gBPNrNbJcZeYnx2Z6TpXJfMIUua0yCXkNf69fogWCKRdYr+qTXjgWDJ6Tg2ZNX/TS7LP9i
	FtjwSP4qEd4pB5h/KbpEpOichVHbMjSVXb74CG3qroZBgO1cWV2Wq2LfPEL3IrD7O/ZBwi8hmc0
	bsxOElH6M74tLpCZwkKJXapswiwT4zuSDPkvxjWo61yIPFNQwP1+hXc20ScaPNAzqxLlV8Qtpxx
	NoD8Ro1VVFfcr8NrAy3Yrgw6Rz65ozBF3WAryCb1MU6exesEKxeUDXO4wudEqZlpiIlLpKc53Ka
	31g5xtrO59on+9ox0m3QEEcNdNgZhRMC7kT7rCD/C+S3V4apEsyYERelNw+Y3thPYNXE0DWMHKj
	rv83+8jGpqaUhDTs4dQNpcKkMoipUhTOCCUjqzSgfnx854tGQqVVOc39zCuqtvm2CLDd31BKNZ7
	izkh6k2jKOCze
X-Received: by 2002:a17:90b:3b51:b0:3a0:cbe2:9e0c with SMTP id 98e67ed59e1d1-3ae897c8800mr10534419a91.63.1793680677425;
        Mon, 02 Nov 2026 20:37:57 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:37:56 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/8] HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently long
Date: Tue,  3 Nov 2026 12:37:27 +0800
Message-ID: <20261103043734.2179858-4-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_203758_509288_256FEB7B 
X-CRM114-Status: GOOD (  19.42  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On some devices the HID device is powered from an always-on power rail,
or the power rail has been left on by either POR defaults or the
bootloader. By the time the driver probes, the device most certainly
has finished initializing. There is no need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree. This is undesired, as the device tree is not fully describing
the hardware.

Switch to the new regulator_bulk_enable_and_wait() function that makes
sure a certain amount of time has passed since the regulator supplies
were actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_bulk_enable_and_wait() API
---
 drivers/hid/i2c-hid/i2c-hid-of.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 59393d71ddb9..fdaad451e710 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -29,6 +29,7 @@
 #include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/regulator/consumer.h>
+#include <linux/time.h>
 
 #include "i2c-hid.h"
 
@@ -48,16 +49,14 @@ static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 	struct device *dev = &ihid_of->client->dev;
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ihid_of->supplies),
-				    ihid_of->supplies);
+	ret = regulator_bulk_enable_and_wait(ARRAY_SIZE(ihid_of->supplies),
+					     ihid_of->supplies,
+					     ihid_of->post_power_delay_ms * USEC_PER_MSEC);
 	if (ret) {
 		dev_warn(dev, "Failed to enable supplies: %d\n", ret);
 		return ret;
 	}
 
-	if (ihid_of->post_power_delay_ms)
-		msleep(ihid_of->post_power_delay_ms);
-
 	gpiod_set_value_cansleep(ihid_of->reset_gpio, 0);
 	if (ihid_of->post_reset_delay_ms)
 		msleep(ihid_of->post_reset_delay_ms);
-- 
2.56.0.385.gac671c819a-goog


