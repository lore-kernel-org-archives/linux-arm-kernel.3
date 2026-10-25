Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376E9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 05:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OXeyHzCl;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oh11t4LW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TTqaQ6jXWlHRRGLaT8kFyXO3lEvorKEGuHWBDmHOqfE=; b=OXeyHzClpnDJWU
	wqh5sEH12RR3derlhpht7iFah7NytfGcAbO0aTrawMZCclop/9zgi16Q0NO/HmvpgTrfvDd0qB4Yv
	4Mr6U740CcFP8dDKU6JtH6yMoQUczDzY4+cihtzDKAExgFz4mV2iZ+BE8rMtoSxYlvH8WvkNoN5o5
	nupLQL5Q/9Ab/Q8hWHtVsWSjA7OJU/J6fmwMkRD83lMioT4hPoi8oxzTHGJHWfXX/bY0ibtgsrQuJ
	N/7h0jpBkvdaXhIstzcUP4UekJGUstuWqemSPEJCOuhWVcM0bL+amLjHnSvJWL9nqSYeCXKy7xF2O
	GtumEZsjA06vT7R95OdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKqOG-00000000jio-3OCl;
	Sun, 25 Oct 2026 05:03:28 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKqO9-00000000jgF-1Y2g
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 05:03:22 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-14fc585291cso721571c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 22:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792904600; x=1793509400; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTqaQ6jXWlHRRGLaT8kFyXO3lEvorKEGuHWBDmHOqfE=;
        b=oh11t4LWgP89UT7uQNhCHdaWat4WeRgKziZcxvJ8VklHbEttdewYXpXYg0WNr2NCyL
         xqgPjJ4Yb5yPQdOhHVyRYaH4PE1OHiTwwm07V3cNqHN9iIPXD7z4V4ckzBP54S+h7g7K
         o+uO2reQd2EdboWZZizKNl0ZPb4Ee1Rr7gsuEezERURrNz1ocXm8/xwkC9JMGUDShI5s
         76ii3hpGx9OA/o3TK5Xm0IUhxAxhL1xWFmA2L+Uf8NzBmwCVhcKIypD9jvNYP3sD59mE
         bVaUXwve1K4VcWmWgRo0kCFswoOf1UbHW4k2ebBG7a/SEJiBodCwMLKF1X5z53W6MGiY
         7gRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792904600; x=1793509400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTqaQ6jXWlHRRGLaT8kFyXO3lEvorKEGuHWBDmHOqfE=;
        b=E+C8ntqooVcZksCL94NdgMXbCJfTHkM7OQdoIheMlwZXneFGQm4Ex1tMh1Vfcp5CaW
         zDM+FPNm8/foIy++lyEACxuZwDn2mIzJ5G+nZZrCXlK1Ou3yS8zcp404K9H2U+XC68NB
         8CtDwrDqd6zZjbgyKdCHdNTkWmj+C7qUg7AUyiswAPSW5CRyv2e6fQZPauRzZ9LFodkp
         EcBESvBfJK/L9r5ZUzj58Uizla8TyRC090qIrCFZNASWeYsHDtNJPW4ZmxmUQZpWwaIy
         toKWL/ygCs6eK3rhyvrJjQ7BN6ZVvOcAmLhwPpbwBID/vD0ZZPExQ9wo1US+GIsqIJ6M
         ANyA==
X-Forwarded-Encrypted: i=1; AKwUvBy9yziPL3+kQyQQsOGqnqra1w+6zetGkXfW+iSu7f82H8U6EwGH2ZLrpz4jKJic/yUHlxYr9xh0D1HeMXy3ExqY@lists.infradead.org
X-Gm-Message-State: AFq9FYJ/LYbaEh0DRywpNt4D5f1XNQPaI2Eg3Vn2/IgkInrKf0GaiRmO
	dy4sF8crKrmPLlwcTO5fCmjBQSiq+CnYPN5pQW2V4pWsKfLf/WDK312Q
X-Gm-Gg: AYBFou211PqAyohB4wlkAnkdPJS4tQhCfYIJxUbHoHx4zfOIwm2gYgQleZSqujcB8T2
	tkxyKVY5naYcYAtd4iA1MX31gsqE734JrFWrglb02W4+eCcZ7QkSv/YHdj+H81bS/aW4GOWjoEL
	mg1WYModamYEBUIeuf1WR4+LYTHN+wHknhbII3daNqJR5cyhfRIuyxSbBz8a4eVMnXhdr/2IRtM
	0DozE7K1CeSUoa2WNifKvbzCFiG7IAWzMgGRjaMh+01wyMKLkQQRWY4Mt5eZyFhiNk5wWvHfWAy
	Xik9Mf2IG2+GAJkexSpesIBBEodkTdEatTiFxRXBlMSBZNN2v4dj9KeaI7LfsFjPacCSFa1BiXD
	tj2/HjrD8N1b2rPfhTLyTkcDcBfW+5nQ8za9McxONtwrJUZ26O8gRMeKi6/swRGUm45CCTZlp6R
	KNJIbZ1LaH5uBSYIJMrR2ft1zGfqUFAh+J61jM5GgOOICZyHC34G8S0dscmqdLoD0PeQ3NWcdcj
	zbhjmVBZIA/FX5VJJCLNVZMbFDmC9MvtwOcoQrdTUiugHu5SF6J9ikOrJ19H0ialbLaGLhVyczo
	YTi36OYCbCQopIYfrStVSbzvVs9et0sAGbuVyQPZ9bU=
X-Received: by 2002:a05:7022:2513:b0:196:7742:3928 with SMTP id a92af1059eb24-1991b420832mr7262785c88.0.1792904600247;
        Sat, 24 Oct 2026 22:03:20 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm4710287eec.15.2026.10.24.22.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:03:19 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 22:03:12 -0700
Subject: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
In-Reply-To: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_220321_418918_BE00D2D3 
X-CRM114-Status: GOOD (  20.74  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Allow passing software nodes to wm831x DCDC regulators via PMIC platform
data. This is useful for non-DT/non-ACPI platforms that want to
associate device properties (like DVS GPIOs) with the regulator devices
using software nodes.

Add software node pointers to the PMIC platform data and have the MFD
core assign them to the buckv cells.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/mfd/wm831x-core.c        | 47 ++++++++++++++++++++++++++++++----------
 include/linux/mfd/wm831x/pdata.h |  2 ++
 2 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/wm831x-core.c b/drivers/mfd/wm831x-core.c
index df8e76e000cc..c4793be419ba 100644
--- a/drivers/mfd/wm831x-core.c
+++ b/drivers/mfd/wm831x-core.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 #include <linux/mfd/core.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/err.h>
 
 #include <linux/mfd/wm831x/core.h>
@@ -1449,6 +1450,32 @@ const struct of_device_id wm831x_of_match[] = {
 };
 EXPORT_SYMBOL_GPL(wm831x_of_match);
 
+static int wm831x_add_devices(struct wm831x *wm831x, int wm831x_num,
+			      const struct mfd_cell *cells, int num_cells)
+{
+	struct wm831x_pdata *pdata = &wm831x->pdata;
+	int i;
+
+	struct mfd_cell *local_cells __free(kfree) =
+		kmemdup_array(cells, num_cells, sizeof(*cells), GFP_KERNEL);
+	if (!local_cells)
+		return -ENOMEM;
+
+	for (i = 0; i < num_cells; i++) {
+		struct mfd_cell *cell = &local_cells[i];
+
+		if (strcmp(cell->name, "wm831x-buckv") == 0) {
+			int id = cell->id - 1;
+
+			if (id >= 0 && id < WM831X_MAX_DCDC)
+				cell->swnode = pdata->dcdc_swnodes[id];
+		}
+	}
+
+	return mfd_add_devices(wm831x->dev, wm831x_num, local_cells, num_cells,
+			       NULL, 0, NULL);
+}
+
 /*
  * Instantiate the generic non-control parts of the device.
  */
@@ -1620,15 +1647,13 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 	/* The core device is up, instantiate the subdevices. */
 	switch (parent) {
 	case WM8310:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8310_devs, ARRAY_SIZE(wm8310_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8310_devs, ARRAY_SIZE(wm8310_devs));
 		break;
 
 	case WM8311:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8311_devs, ARRAY_SIZE(wm8311_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8311_devs, ARRAY_SIZE(wm8311_devs));
 		if (!pdata->disable_touch)
 			mfd_add_devices(wm831x->dev, wm831x_num,
 					touch_devs, ARRAY_SIZE(touch_devs),
@@ -1636,9 +1661,8 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 		break;
 
 	case WM8312:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8312_devs, ARRAY_SIZE(wm8312_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8312_devs, ARRAY_SIZE(wm8312_devs));
 		if (!pdata->disable_touch)
 			mfd_add_devices(wm831x->dev, wm831x_num,
 					touch_devs, ARRAY_SIZE(touch_devs),
@@ -1649,9 +1673,8 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 	case WM8321:
 	case WM8325:
 	case WM8326:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8320_devs, ARRAY_SIZE(wm8320_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8320_devs, ARRAY_SIZE(wm8320_devs));
 		break;
 
 	default:
diff --git a/include/linux/mfd/wm831x/pdata.h b/include/linux/mfd/wm831x/pdata.h
index 75aa94dadf1c..d5d9d9600756 100644
--- a/include/linux/mfd/wm831x/pdata.h
+++ b/include/linux/mfd/wm831x/pdata.h
@@ -12,6 +12,7 @@
 
 struct wm831x;
 struct regulator_init_data;
+struct software_node;
 
 struct wm831x_backlight_pdata {
 	int isink;     /** ISINK to use, 1 or 2 */
@@ -132,6 +133,7 @@ struct wm831x_pdata {
 	struct wm831x_status_pdata *status[WM831X_MAX_STATUS];
 	/** DCDC1 = 0 and so on */
 	struct regulator_init_data *dcdc[WM831X_MAX_DCDC];
+	const struct software_node *dcdc_swnodes[WM831X_MAX_DCDC];
 	/** EPE1 = 0 and so on */
 	struct regulator_init_data *epe[WM831X_MAX_EPE];
 	/** LDO1 = 0 and so on */

-- 
2.56.0.257.gf7497c7d27-goog


