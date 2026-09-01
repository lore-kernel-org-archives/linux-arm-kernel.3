Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9B2C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 07:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppTKN+ViX0ps4m1x8WbWgM6kLhXVltmE87oNPgspGL0=; b=mOFsDsN62dfQ5w3pjOmLCk5DZ5
	WFvHORuKEHDKW8v2+HZtgzp0N21u1ajPcsbwxTatIzAYiZiuW0uN7EJVW08zmMYxKUXZdl6BMYrx3
	kfCsq85ZlRmfhh2aTAcMDpZdz9huPzKaAh41ADFxjbUrKLNwcmqi5pl2Q8bpaKmBWgVYqGUWQi12m
	EU5gzUw2/uAylU2cheBNkxO2p7MI2/+rglBf+UNL176x/eFTzYQMzpE0NjDdYqQq4rxrSWxZgU38P
	OH07DQDrsNCjCltYLBDFd2HFRWlCBDMsHBuPME5y2EzO3tMWJqItYDOuLi2fiYUXHnPk+fA0mnl0w
	cIv484Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JFr-0000000BA8W-1iXR;
	Tue, 01 Sep 2026 07:50:03 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JFo-0000000BA51-13xu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 07:50:01 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2d9004f39d3so27644955ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 00:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788248999; x=1788853799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ppTKN+ViX0ps4m1x8WbWgM6kLhXVltmE87oNPgspGL0=;
        b=Zin3qQ7sWYv9edWQB9qXqA9I2neZn4n4UsttZylPPZ8zKYP/HhEBkxTVUk5fRTQ5VG
         BAC8lDCP07AyRGVNxe1lWY8+aMjkQoliQcmCd9XFbDuOgiVeVhZG7gENZJ0RUUVWommt
         Qetn5d+GY3fhAAy7bv6JQkzzLPpjmVzMGM80c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248999; x=1788853799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ppTKN+ViX0ps4m1x8WbWgM6kLhXVltmE87oNPgspGL0=;
        b=afWfBIIN0z6iFExS4F48wTVoo2e5dvA/R0rdF2LmWbzgiUAe7iNorBUV883V7O1BEW
         ykHbKlDT+FHcli25sQFJjqCfSraBMQTloPgIUGh2j5B9GXzRzEp910jA0RXekS+qCr0U
         nmrY09f+NsWKXuZoer65fyk/iIhCbDK4lIyixCsB60/OD+piZwVnD9BhYGBp4d9HKxja
         Av1Ns+Qls07r3Qna5xBNhxIi23NYvryu+menCVL5uF62u5VJ1TjKB5djv7i2JH4erQcQ
         SqoRsxFVdbwfaYnWf9ohdD+53mAuP6Gb6DPKWsAucm/oaf85t7LJTGgCu6yHaTyBNniX
         XTBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwr/TJAiIDHQ2AygTdb3sh1/q81YMck/1Twn9pXf5/PH/Vaih/XjrNyfRgQ7/UnXOHKEVCRld/8ZtxNx+61geL2@lists.infradead.org
X-Gm-Message-State: AFuF++kRuyfT0po9PsPcF1hmWlvfAcNMkDR0/utsUG5RE1cfVQOTesyI
	CQVwlzXZn7XECTasGtG2v2RoGXQpvu0IBwBzBRe1fJ/AB3CTyZfv7wWU3iySAoPwNQ==
X-Gm-Gg: AYBFou1hc26Qx06IfrCAJ7uAWrjo82wxyya+R4x4keSWXYRXF4COIR4VFa1I4L1O48R
	fZfivYljAtVrbtz982PHp27tO1VOzL1n2negAowWZ32QtDRzzbbkteeVao+xx0n2H1amsxmxPpB
	jZF/e1nUmu+w6qEqhNQ8SVvK/k47kPyHPGC+GtMwuuK1XQn83YL/UrLeqwr/68qLm8rfcv1ukYV
	w4Zj65pO3Hlu+H/KTKr/dRalTeVAfVafzOzXlYzur/faLmtw+SwxUfsTHvhYarEjZlwfQboc5qX
	3KocDmD17gzP5fEbUc+fc3LwqBUgYV2EJqcvpN18hJzU5LrdAS3cvaj0DuBs01virkBmDflTYLO
	yvbsQdwznzmEJe5KllNGPu4tS37PGoAlHfbPhSgHRLJXgJM9tn0vORCGsFEcPU/D1EQ46QTIJeW
	izCGjVjAcuuhH0QC7LyBOM0Su5uByUKWi8vpj+t0RUvE23jmypYKoVUVPIUoE7J+IDP+aFGCJK3
	ZMJtKrUoC4e3e4xV4kdQnNEbM2FBuMZgJAtRRpOaDgCuwE=
X-Received: by 2002:a17:903:3883:b0:2d9:216a:cdd3 with SMTP id d9443c01a7336-2d94a93609cmr90196685ad.18.1788248997383;
        Tue, 01 Sep 2026 00:49:57 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:49:56 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v6 2/8] Input: elan_i2c - Wait for initialization after enabling regulator supply
Date: Tue,  1 Sep 2026 15:49:20 +0800
Message-ID: <20260901074930.764550-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_005000_290837_28D88CF2 
X-CRM114-Status: GOOD (  18.57  )
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

Elan trackpad controllers require some delay after enabling power to
the controller for the hardware and firmware to initialize:

  - 2ms for hardware initialization
  - 100ms for firmware initialization

Until then, the hardware will not respond to I2C transfers. This was
observed on the MT8173 Chromebooks after the regulator supply for the
trackpad was changed to "not always on".

Switch to the new regulator_enable_and_wait(). This makes sure that
enough time has passed since the regulator was first enabled, satisfying
the power sequencing delay requirement. This allows the delay to be
skipped if the regulator supply was already enabled by some other part
of the kernel, such as the I2C OF component prober.

Fixes: 6696777c6506 ("Input: add driver for Elan I2C/SMbus touchpad")
Cc: <stable+noautosel@kernel.org> # needs new regulator API
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Added noautosel tag

Changes since v2:
- Switched to new regulator_enable_and_wait() API

Changes since v1:
- Delay only if the regulator was previously disabled / turned off
- Link to v1
  https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/
---
 drivers/input/mouse/elan_i2c_core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index f5e505edbc33..4bbc6cef8be6 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -36,6 +36,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
+#include <linux/time.h>
 #include <linux/uaccess.h>
 #include <linux/unaligned.h>
 
@@ -47,6 +48,8 @@
 #define ETP_FWIDTH_REDUCE	90
 #define ETP_FINGER_WIDTH	15
 #define ETP_RETRY_COUNT		3
+/* H/W init 2 ms + F/W init 100 ms w/ round up */
+#define ETP_POWER_ON_DELAY_US	(110 * USEC_PER_MSEC)
 
 /* quirks to control the device */
 #define ETP_QUIRK_QUICK_WAKEUP	BIT(0)
@@ -1260,7 +1263,7 @@ static int elan_probe(struct i2c_client *client)
 	if (IS_ERR(data->vcc))
 		return dev_err_probe(dev, PTR_ERR(data->vcc), "Failed to get 'vcc' regulator\n");
 
-	error = regulator_enable(data->vcc);
+	error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 	if (error) {
 		dev_err(dev, "Failed to enable regulator: %d\n", error);
 		return error;
@@ -1416,7 +1419,7 @@ static int elan_resume(struct device *dev)
 	int error;
 
 	if (!device_may_wakeup(dev)) {
-		error = regulator_enable(data->vcc);
+		error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 		if (error) {
 			dev_err(dev, "error %d enabling regulator\n", error);
 			goto err;
-- 
2.55.0.897.gb25b4bd76c-goog


