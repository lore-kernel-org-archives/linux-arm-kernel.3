Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8A6606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gmOXVDdC;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jGZPZspX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NHDV0dfETVzr0Td0ndrjnRkd4XpFGPgc0UC2tibzLAw=; b=gmOXVDdCueWk57
	Kp2WxVrsL2OaM1n3ZQ0E5G/958aV2Nx5YgYGaMyXzsgrlQrcYUArwl3ge66m6fsj5RBDZAvPL77XK
	4xeCxW72SUkERDJUSfRoUZkA5kj40MNHvOQ/iNi5qMrDZvG3OugvlD4jbJGFNoDVAZ86H9y+6BOAn
	ru36NXmADJPacHACpQhHbDndG7jF+093BapBXyKlagU0MX8isepvK6mHQVLiqAAFLODL72348sc+f
	IjjskEMmnRPlGY4JdUvIUdnFrG9oSATamRsKUlXFnhtik4vyf3om/k+OOVqEKIxSpGPt8qkMy1BdG
	QbWWiiGIz2CYpIQYIP/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6QY-000000014oD-2wtt;
	Tue, 03 Nov 2026 04:47:18 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6QV-000000014n8-3lmJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:47:17 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-3514b90bb89so7794399eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793681235; x=1794286035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHDV0dfETVzr0Td0ndrjnRkd4XpFGPgc0UC2tibzLAw=;
        b=jGZPZspXiTkU8CSJmoQxB/NbuuEgaECpICVRJS3r1KWXoqWrhATvIiGt7/FMsxxYRU
         2mh/jcbCDw18tHbkBU6NKcqklhNHgk6CXctwLxa1MbFq9FOjdUCZPntxqWbx5ubZZ//y
         tLemI9QX6mTV7u4JJ4zVQ1pCbqZVY89+dpyf/0l/OCdPkv5HHH3a9dZNiKFbZBAvC3ig
         Vc1Npkw+ffXMsn6guKS1VK1PPUNfJLYIdMtPWaGHzs/0xYz4SRBkTVqiNcW8/8zR1HGb
         EyRTdcNj4/LXfSqT7qcY57zv35TtqKTA1P8kgs94Kcddwm1wwavnITuzAUbzCRQ145lP
         6tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681235; x=1794286035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NHDV0dfETVzr0Td0ndrjnRkd4XpFGPgc0UC2tibzLAw=;
        b=QHokvP7EnjGUSR6lZKXuy0Cg6WZPv/GYXvK3ESk8wKzGcbkWu1MsBelj2uIEJ5/3Dq
         sSYnYNG/1/WU5DRqzj53CAYxyUx37TVv4R20/Y6+2DYs8a6pDHS90LG8jEh0t/7Lo9LB
         lKLm/hT9wl2jUCTm/YwcFjTSPnW25lyvx0M9/yyh5NqMAJCD5jjoBgUG7iQnY1NGSW/a
         acHrUoQ/c7eZePeIxNvsY5LNush87T5Kcy1/kVpX6CSF9NBeh4lNGx1P9LkGpo7LOBnH
         Uzyk/NwW4teSVNvh2X532H0z24izIU4NdLDCY0R4Z6d+4mGix8p59ro9AFbyUlUJ/Li8
         9tBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWlesV5nJfzIRcRXQ2vVv+Tv4uOm1YVqcNk3DgMLWG/hD6QHDz92Fj/nBMn/li4DpSh/KcXEqeZUlJujm1USLd@lists.infradead.org
X-Gm-Message-State: APuU4Z/EFt0hLj8HB1oC7eOoESBjgUYGPkNeg23r4T/HyKGthX8XgGdz
	m2EwTsTAqGCyHrzBumMOVHXWGxlRBCVp2LRpxipNrOSqxa4bmQCsBfDO
X-Gm-Gg: AYBFou0gG96mjAgcanmx/fCDhyppqqv1Fpqegtrj1y1TbvGorB/1yU1XxmxXm+vtPYe
	vvYVvBFDOF6PuVAThud44gn4ZIkeBLvtL5Q6X50RX3IXRFFJ+lY50sBF9wrHA1Lf0Ke2lB4HeT8
	UT4rP+gIZdU4DJG8St2E9PZhDbgSVd3clrbNz8AueGSMjPzdXb/VlJoz49fYQNkTHusDFs8BOgp
	sCiI5ZYLYxp7MRtwT+CTzvrihqjmliIYPhjLBaDfzbYsE8gqIBJWTYn4DxW1Tgr9laMGlUEbNWF
	nB8spN5a+GVvVyMNL7zKxlHhM32X8wIoxaik8Z+0yGkcet7RbDbanMVVS3hBim6PR/twsOf7YEz
	hpQ7Oa/fWUYaw1X+InKSAojcZ0j/H06D1rGx8FeETdFLtbHCRK33x42yMKdF+Toevw3195Bws5b
	OkX0mDyvfUTZURD+ZMVmTLKcNYWQmRTON7jJw+haCUAGlbOZkYEITHExHyH9MZlrYy1AKfkgP46
	oa/8vBf/DpR6pBrkqZPXdlVEJR6sKlLufM7mXjUoifuPvSfc+P0dEEfliJSFfWWxKJ00z/X9a58
	C5jf8tUmyp9xsGugs8H2cX5h5XKMhURj8bBuk1jnb1B8jXHKkdmdbpFYy5UbctAoggpVCvDkhxI
	pwLxDuHqIuAV3JEVV
X-Received: by 2002:a05:7300:c730:b0:36a:43d9:f2a5 with SMTP id 5a478bee46e88-36a43da454emr17661523eec.32.1793681234531;
        Mon, 02 Nov 2026 20:47:14 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:98f:6bcd:858b:7a64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm48385807eec.11.2026.11.02.20.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:47:13 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Val Packett <val@packett.cool>,
	Hendrik Noack <hendrik-noack@gmx.de>,
	Ferass El Hafidi <funderscore@postmarketos.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] Input: touchscreen - parse touchscreen-x-mm and touchscreen-y-mm
Date: Mon,  2 Nov 2026 20:47:04 -0800
Message-ID: <20261103044708.2461481-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
References: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_204715_944968_3AAF9177 
X-CRM114-Status: GOOD (  22.37  )
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

The touchscreen device tree bindings define common touchscreen-x-mm and
touchscreen-y-mm properties specifying the physical dimensions of the
touchscreen in millimeters. However, touchscreen_parse_properties() does
not parse these properties, forcing individual drivers to parse them
manually or fall back to arbitrary resolution values.

Parse touchscreen-x-mm and touchscreen-y-mm in
touchscreen_parse_properties() and calculate axis resolution in units
per millimeter as the coordinate count (maximum - minimum + 1) divided
by the physical dimension, rounded to the nearest integer. Guard against
zero physical size or invalid axis ranges, and preserve pre-existing
resolution settings when the properties are omitted. Apply resolution
before early exit so callers passing a NULL properties pointer still
get axes configured and so coordinate inversion and axis swapping
continue to work seamlessly. Also add KUnit test coverage for resolution
calculation.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/tests/Makefile           |   1 +
 drivers/input/tests/touchscreen_test.c | 209 +++++++++++++++++++++++++
 drivers/input/touchscreen.c            |  18 ++-
 3 files changed, 223 insertions(+), 5 deletions(-)
 create mode 100644 drivers/input/tests/touchscreen_test.c

diff --git a/drivers/input/tests/Makefile b/drivers/input/tests/Makefile
index 90cf954181bc..b5e769d9f8cc 100644
--- a/drivers/input/tests/Makefile
+++ b/drivers/input/tests/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_INPUT_KUNIT_TEST) += input_test.o
+obj-$(CONFIG_INPUT_KUNIT_TEST) += touchscreen_test.o
diff --git a/drivers/input/tests/touchscreen_test.c b/drivers/input/tests/touchscreen_test.c
new file mode 100644
index 000000000000..f8661c349fcc
--- /dev/null
+++ b/drivers/input/tests/touchscreen_test.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit test for touchscreen property parsing.
+ */
+
+#include <linux/input.h>
+#include <linux/input/touchscreen.h>
+#include <linux/property.h>
+
+#include <kunit/device.h>
+#include <kunit/test.h>
+
+static struct input_dev *
+touchscreen_test_create_device(struct kunit *test,
+			       const struct property_entry *props)
+{
+	struct input_dev *input_dev;
+	struct device *dev;
+
+	dev = kunit_device_register(test, "touchscreen-test-dev");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	if (props)
+		KUNIT_ASSERT_EQ(test,
+				device_create_managed_software_node(dev, props, NULL),
+				0);
+
+	input_dev = devm_input_allocate_device(dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, input_dev);
+
+	return input_dev;
+}
+
+static void touchscreen_test_resolution_single(struct kunit *test)
+{
+	const struct property_entry props[] = {
+		PROPERTY_ENTRY_U32("touchscreen-x-mm", 100),
+		PROPERTY_ENTRY_U32("touchscreen-y-mm", 200),
+		{ }
+	};
+	struct touchscreen_properties prop;
+	struct input_dev *input_dev;
+
+	input_dev = touchscreen_test_create_device(test, props);
+
+	/* Driver-supplied ranges: 0..999 (1000 units), 0..1999 (2000 units) */
+	input_set_abs_params(input_dev, ABS_X, 0, 999, 0, 0);
+	input_set_abs_params(input_dev, ABS_Y, 0, 1999, 0, 0);
+
+	touchscreen_parse_properties(input_dev, false, &prop);
+
+	KUNIT_EXPECT_EQ(test, input_abs_get_res(input_dev, ABS_X), 10);
+	KUNIT_EXPECT_EQ(test, input_abs_get_res(input_dev, ABS_Y), 10);
+}
+
+static void touchscreen_test_resolution_multitouch(struct kunit *test)
+{
+	const struct property_entry props[] = {
+		PROPERTY_ENTRY_U32("touchscreen-min-x", 10),
+		PROPERTY_ENTRY_U32("touchscreen-size-x", 1010),
+		PROPERTY_ENTRY_U32("touchscreen-x-mm", 50),
+		PROPERTY_ENTRY_U32("touchscreen-min-y", 20),
+		PROPERTY_ENTRY_U32("touchscreen-size-y", 2020),
+		PROPERTY_ENTRY_U32("touchscreen-y-mm", 100),
+		{ }
+	};
+	struct touchscreen_properties prop;
+	struct input_dev *input_dev;
+
+	input_dev = touchscreen_test_create_device(test, props);
+
+	/* Multitouch axes setup */
+	input_set_abs_params(input_dev, ABS_MT_POSITION_X, 0, 1, 0, 0);
+	input_set_abs_params(input_dev, ABS_MT_POSITION_Y, 0, 1, 0, 0);
+
+	touchscreen_parse_properties(input_dev, true, &prop);
+
+	/* min=10, max=1009, count=1000, 1000 / 50 = 20 */
+	KUNIT_EXPECT_EQ(test, input_abs_get_res(input_dev, ABS_MT_POSITION_X), 20);
+	/* min=20, max=2019, count=2000, 2000 / 100 = 20 */
+	KUNIT_EXPECT_EQ(test, input_abs_get_res(input_dev, ABS_MT_POSITION_Y), 20);
+}
+
+static void touchscreen_test_resolution_rounding(struct kunit *test)
+{
+	const struct property_entry props[] = {
+		/* 1951 / 100 = 19.51 -> rounds to 20 */
+		PROPERTY_ENTRY_U32("touchscreen-size-x", 1951),
+		PROPERTY_ENTRY_U32("touchscreen-x-mm", 100),
+		/* 1949 / 100 = 19.49 -> rounds to 19 */
+		PROPERTY_ENTRY_U32("touchscreen-size-y", 1949),
+		PROPERTY_ENTRY_U32("touchscreen-y-mm", 100),
+		{ }
+	};
+	struct touchscreen_properties prop;
+	struct input_dev *input_dev;
+
+	input_dev = touchscreen_test_create_device(test, props);
+
+	input_set_abs_params(input_dev, ABS_MT_POSITION_X, 0, 1, 0, 0);
+	input_set_abs_params(input_dev, ABS_MT_POSITION_Y, 0, 1, 0, 0);
+
+	touchscreen_parse_properties(input_dev, true, &prop);
+
+	KUNIT_EXPECT_EQ(test, input_abs_get_res(input_dev, ABS_MT_POSITION_X), 20);
+	KUNIT_EXPECT_EQ(test, input_abs_get_res(input_dev, ABS_MT_POSITION_Y), 19);
+}
+
+static void touchscreen_test_resolution_swap_invert(struct kunit *test)
+{
+	const struct property_entry props[] = {
+		PROPERTY_ENTRY_U32("touchscreen-x-mm", 50),
+		PROPERTY_ENTRY_U32("touchscreen-y-mm", 200),
+		PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
+		PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+		{ }
+	};
+	struct touchscreen_properties prop;
+	struct input_dev *input_dev;
+
+	input_dev = touchscreen_test_create_device(test, props);
+
+	/* X count = 1000, Y count = 2000 */
+	input_set_abs_params(input_dev, ABS_MT_POSITION_X, 0, 999, 0, 0);
+	input_set_abs_params(input_dev, ABS_MT_POSITION_Y, 0, 1999, 0, 0);
+
+	touchscreen_parse_properties(input_dev, true, &prop);
+
+	/*
+	 * Before swap: X res = 1000/50 = 20, Y res = 2000/200 = 10.
+	 * After swap: X absinfo receives Y absinfo, Y absinfo receives X absinfo.
+	 */
+	KUNIT_EXPECT_EQ(test, input_abs_get_res(input_dev, ABS_MT_POSITION_X), 10);
+	KUNIT_EXPECT_EQ(test, input_abs_get_res(input_dev, ABS_MT_POSITION_Y), 20);
+	KUNIT_EXPECT_TRUE(test, prop.invert_x);
+	KUNIT_EXPECT_TRUE(test, prop.swap_x_y);
+}
+
+static void touchscreen_test_resolution_edge_cases(struct kunit *test)
+{
+	const struct property_entry props[] = {
+		/* Zero x-mm */
+		PROPERTY_ENTRY_U32("touchscreen-x-mm", 0),
+		/* y-mm omitted */
+		{ }
+	};
+	struct touchscreen_properties prop;
+	struct input_dev *input_dev;
+
+	input_dev = touchscreen_test_create_device(test, props);
+
+	input_set_abs_params(input_dev, ABS_MT_POSITION_X, 0, 999, 0, 0);
+	input_set_abs_params(input_dev, ABS_MT_POSITION_Y, 0, 1999, 0, 0);
+
+	/* Pre-configure resolutions */
+	input_abs_set_res(input_dev, ABS_MT_POSITION_X, 15);
+	input_abs_set_res(input_dev, ABS_MT_POSITION_Y, 25);
+
+	touchscreen_parse_properties(input_dev, true, &prop);
+
+	/* Zero size and omitted property must preserve pre-existing resolutions */
+	KUNIT_EXPECT_EQ(test, input_abs_get_res(input_dev, ABS_MT_POSITION_X), 15);
+	KUNIT_EXPECT_EQ(test, input_abs_get_res(input_dev, ABS_MT_POSITION_Y), 25);
+}
+
+static void touchscreen_test_resolution_invalid_range_and_null_prop(struct kunit *test)
+{
+	const struct property_entry props[] = {
+		PROPERTY_ENTRY_U32("touchscreen-x-mm", 50),
+		PROPERTY_ENTRY_U32("touchscreen-y-mm", 50),
+		{ }
+	};
+	struct input_dev *input_dev;
+
+	input_dev = touchscreen_test_create_device(test, props);
+
+	/* X has valid range 0..999 (1000 units), Y has invalid range 500..500 */
+	input_set_abs_params(input_dev, ABS_MT_POSITION_X, 0, 999, 0, 0);
+	input_set_abs_params(input_dev, ABS_MT_POSITION_Y, 500, 500, 0, 0);
+	input_abs_set_res(input_dev, ABS_MT_POSITION_Y, 42);
+
+	/* NULL prop pointer */
+	touchscreen_parse_properties(input_dev, true, NULL);
+
+	/* Valid X gets resolution computed even with prop == NULL */
+	KUNIT_EXPECT_EQ(test, input_abs_get_res(input_dev, ABS_MT_POSITION_X), 20);
+	/* Invalid Y range (max <= min) preserves pre-configured resolution */
+	KUNIT_EXPECT_EQ(test, input_abs_get_res(input_dev, ABS_MT_POSITION_Y), 42);
+}
+
+static struct kunit_case touchscreen_tests[] = {
+	KUNIT_CASE(touchscreen_test_resolution_single),
+	KUNIT_CASE(touchscreen_test_resolution_multitouch),
+	KUNIT_CASE(touchscreen_test_resolution_rounding),
+	KUNIT_CASE(touchscreen_test_resolution_swap_invert),
+	KUNIT_CASE(touchscreen_test_resolution_edge_cases),
+	KUNIT_CASE(touchscreen_test_resolution_invalid_range_and_null_prop),
+	{ /* sentinel */ }
+};
+
+static struct kunit_suite touchscreen_test_suite = {
+	.name = "touchscreen",
+	.test_cases = touchscreen_tests,
+};
+
+kunit_test_suite(touchscreen_test_suite);
+
+MODULE_DESCRIPTION("KUnit test for touchscreen property parsing");
+MODULE_LICENSE("GPL");
diff --git a/drivers/input/touchscreen.c b/drivers/input/touchscreen.c
index d699b24bb548..05ddb2ea7c66 100644
--- a/drivers/input/touchscreen.c
+++ b/drivers/input/touchscreen.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/math.h>
 #include <linux/property.h>
 #include <linux/input.h>
 #include <linux/input/mt.h>
@@ -33,7 +34,8 @@ static bool touchscreen_get_prop_u32(struct device *dev,
 
 static void touchscreen_set_params(struct input_dev *dev,
 				   unsigned long axis,
-				   int min, int max, int fuzz)
+				   int min, int max, int fuzz,
+				   unsigned int size_mm)
 {
 	struct input_absinfo *absinfo;
 
@@ -48,6 +50,8 @@ static void touchscreen_set_params(struct input_dev *dev,
 	absinfo->minimum = min;
 	absinfo->maximum = max;
 	absinfo->fuzz = fuzz;
+	if (size_mm && min >= 0 && max > min)
+		absinfo->resolution = DIV_ROUND_CLOSEST(max - min + 1, size_mm);
 }
 
 /**
@@ -69,7 +73,7 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	struct device *dev = input->dev.parent;
 	struct input_absinfo *absinfo;
 	unsigned int axis, axis_x, axis_y;
-	unsigned int minimum, maximum, fuzz;
+	unsigned int minimum, maximum, fuzz, size_mm;
 	bool data_present;
 
 	input_alloc_absinfo(input);
@@ -89,8 +93,10 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-fuzz-x",
 						 input_abs_get_fuzz(input, axis_x),
 						 &fuzz);
+	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-x-mm", 0,
+						 &size_mm);
 	if (data_present)
-		touchscreen_set_params(input, axis_x, minimum, maximum - 1, fuzz);
+		touchscreen_set_params(input, axis_x, minimum, maximum - 1, fuzz, size_mm);
 
 	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-y",
 						input_abs_get_min(input, axis_y),
@@ -102,8 +108,10 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-fuzz-y",
 						 input_abs_get_fuzz(input, axis_y),
 						 &fuzz);
+	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-y-mm", 0,
+						 &size_mm);
 	if (data_present)
-		touchscreen_set_params(input, axis_y, minimum, maximum - 1, fuzz);
+		touchscreen_set_params(input, axis_y, minimum, maximum - 1, fuzz, size_mm);
 
 	axis = multitouch ? ABS_MT_PRESSURE : ABS_PRESSURE;
 	data_present = touchscreen_get_prop_u32(dev,
@@ -115,7 +123,7 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 						 input_abs_get_fuzz(input, axis),
 						 &fuzz);
 	if (data_present)
-		touchscreen_set_params(input, axis, 0, maximum, fuzz);
+		touchscreen_set_params(input, axis, 0, maximum, fuzz, 0);
 
 	if (!prop)
 		return;
-- 
2.56.0.385.gac671c819a-goog


