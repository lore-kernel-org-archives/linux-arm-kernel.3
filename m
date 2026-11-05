Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113B3606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a6tL+iwb;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xRJyInyI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sNeCcAcnq+kq7Knv2crVqvIQp/nQfPFY9SZmNDJttrk=; b=a6tL+iwbNKbrqr
	YbBlXlH4LYaqyH5DsgIWS7t1L2jFhyVTKyX+XGvPxscoDpD9OYwkpMMJM+faaOs7rp3/Q12xVqkmB
	4llmcWDlsNpg+Y/qKaxPOpL6qGuVfuRhs8ZvnscFvR95zZpFakNXXRWc+gWhC147Fr4lYButXvsM3
	w0ybcDTbFy0BJWLFZQAHQzhUscLNpf9ewZG/NxJtne1Iekp7gSHO7brIUnFiQTIg9IL3qGFK92/Jk
	9X0q/4cdCHw6KT8FeQtHXsn7Id0q/baEQr+dSnEbsNfR7mXdmjNLEine8ee5lTiY2OgRKGYTP2qMU
	2ephjOau0MTLUSLLU5kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzJq-00000009OSL-2BxS;
	Thu, 05 Nov 2026 15:24:02 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzJn-00000009OS0-3H77
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 15:24:01 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-15ea896ddc8so3375189c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 07:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793892239; x=1794497039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNeCcAcnq+kq7Knv2crVqvIQp/nQfPFY9SZmNDJttrk=;
        b=xRJyInyIgRJmN6zTNWfJp5BL9kxMKb1SA73k+6v3jGQzfw5X+BxjD5ZW5oMYL4Hr2e
         P9GxG21udXaiYgvLWKOMGfn59dEqjGnB2sYYxKJDNa4tIikhwmHyiVOVnKF6037TeIDr
         nzveveyVwQZNKacbqDU8n+kzBvpFFWTfcR69ITCKkLHSzkPaj4FQd+h3c0jgvJ9CUF24
         ERtP7MwJL+Pq2oajcMiQB4M+NfnnJSkos8YCSm9fpwNQ2clbXjs9ZeMiqLB+7OaYyojG
         jhYP9Zec8/0A02WpmEORN7icCr1W+AAa5C1IbkQjM0GfIPQex/UiHw3cS6hUYJaQVu2c
         QXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892239; x=1794497039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sNeCcAcnq+kq7Knv2crVqvIQp/nQfPFY9SZmNDJttrk=;
        b=ucazMgK65Ts1vn3qxh0pcPuDavC6HmIU8KrJu0OZnm0aOJwOaMv6EzNfH5uNb7px4x
         spGXu7CWAplu3+fPZLMOarBo0tH5a2lV+kU9cxW1kvjPD+Yl7yerLxGQ4iwF2Vjlntz7
         4enWNFM+dsDrJESpaXRFqHcvihuo+7BL7GYtLJQQtcQ7s8HRcSUCmZst1wNAkbyuKsBQ
         AaLOAraOP1irWMf6BPzISwG7T34WuKD4wPnABt/Wa24818OCMxDHj3X0dD1Ulmi85cvT
         N7SSTn/irFWDb5iAsUBEWYyI18YXFaonbcxpWdX5IYOvpjIK9AID3LBgURyZOs9AWz18
         Ca1g==
X-Forwarded-Encrypted: i=1; AKwUvBxjamS78ZzuzbaDa+8zgTSyq3oQ3SrAHHGEVnIplzrAo4Oh3uIEihM0PM18AlTHL5iG0KWEVoIqKVFew9lzfTtZ@lists.infradead.org
X-Gm-Message-State: APuU4Z934AkUQDXw2tsTq/T7/gMiAfRmcXWOEwk1laogmOoiCtJJihxj
	ewmiURo33oF8QHyqb5qJt8S63eRpLWGt8AiAWRwTekZWMl02FFSFs3dA
X-Gm-Gg: AYBFou2jWivfMuOwA5IObW1DdUj7/Itvosf0uSekV6ymvQlDfEf+kR+awc8JqvikSX5
	pSCoroX1Vyyzs6gYvRTCLs0nM5quXItgEOytCZ+FvYhG3Hk6z5wZwMREna2R3GBPcAoxTyGH642
	Qyf3QtoJt2FPLl0T8fHFpdkeQ6pHRmN0r+JGTkbELR2Xeh4GiScfJV+PuagVDxOZNFZkiFRrHK1
	/Q5mHitDYxVOQQUhBFDBls3VQ1g9mnrANckcDNArF+WMUATO+icz/JkEawTv71CRRJZqMuLJfqe
	bpj+IS7tuRrXJXiEOuJj31+h+kw5RZDI6a9uLyjbnZad+IGebtmDQUQUSSSvcs3dVTSSgUT4Xif
	91cv5ZtXaARhb2Kf2noKJiZNlrwkmnp1GN3VJUmZEnRxVq6QPbymv+j9sCRi4d5Ovg66x1txQ1G
	aDM6zLzJ4LhU9iJHZbSwOVNgyaylx//r5TurntmklfmHy6sPzoY0uKO3UR1UOOJIB+skRFYQDyq
	jrK+iKxdARqP+7UwjhlHUj3JeDfl1tTwsv36CEKRwhlb6pMlM5xsrrLbEL6Np5kSoAOeCIMUY/6
	2pWB/nRdjF/3PY2WJf1ce+Qq3KX1pyuNVl+qPM7zQrr6Wg==
X-Received: by 2002:a05:7022:f108:b0:150:c9c5:1ce4 with SMTP id a92af1059eb24-1ac55960a70mr24069179c88.6.1793892236997;
        Thu, 05 Nov 2026 07:23:56 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245ac2f44sm17862752c88.0.2026.11.05.07.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:23:56 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: linusw@kernel.org
Cc: andrew@codeconstruct.com.au,
	joel@jms.id.au,
	brgl@kernel.org,
	tan.siewert@9elements.com,
	billy_tsai@aspeedtech.com,
	linux-aspeed@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v3] pinctrl: aspeed: Hand over global GPIOP passthrough to local mux controls
Date: Thu,  5 Nov 2026 20:53:47 +0530
Message-ID: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022024314.48623-1-prasanth.padarthi10@gmail.com>
References: <20261022024314.48623-1-prasanth.padarthi10@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_072359_832066_264BDD87 
X-CRM114-Status: GOOD (  22.91  )
X-Spam-Score: -1.9 (-)
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On B650D4U, GPIO-only host power control fails when SCU51C[9]
enables GPIOP passthrough, even after the normal GPIO request path
clears the individual SCU4BC selections.

Transfer globally selected GPIOP0-P5 THRU roles to SCU4BC[29:24]
before registering the controller, then clear the active shared
sources. Leave PWM selection and the strap-source selector unchanged.
Clear SCU510[28] through SCU514 and verify the shared enables cleared.

If handover fails, retain an instance-local error and reject affected
GPIO and mux requests before changing their mux state. Check every
pin in a mux group before calling the shared helper. Retain prepared
local selections after partial failure rather than blindly restoring
a shared enable.

Probe-time normalization policy, concurrent SCU writers and
post-handover registration failure remain open design questions.
Electrical continuity, mixed-pair forwarding, protected-write paths,
PWM coexistence and SCU510[28] hardware handling remain unvalidated.

The implementation passed remote power-on, remote graceful power-off
and physical-button power-on tests on B650D4U with an OpenBMC Linux
6.18.24-based kernel. The rebased version was ARM compile-tested on
v7.4-rc1 using aspeed_g5_defconfig with AST2600 pinctrl enabled.
The rebased kernel has not been tested on hardware.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 145 ++++++++++++++++++++-
 1 file changed, 141 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 85d6640ff..be22a9184 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -4,7 +4,10 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/types.h>
@@ -36,6 +39,8 @@
 #define SCU4D8		0x4D8 /* Multi-function Pin Control #23 */
 #define SCU500		0x500 /* Hardware Strap 1 */
 #define SCU510		0x510 /* Hardware Strap 2 */
+#define SCU514		0x514 /* Hardware Strap 2 Clear */
+#define SCU51C		0x51c /* Hardware Strap 3 */
 #define SCU610		0x610 /* Disable GPIO Internal Pull-Down #0 */
 #define SCU614		0x614 /* Disable GPIO Internal Pull-Down #1 */
 #define SCU618		0x618 /* Disable GPIO Internal Pull-Down #2 */
@@ -2743,12 +2748,56 @@ static struct aspeed_pinctrl_data aspeed_g6_pinctrl_data = {
 	.nconfmaps = ARRAY_SIZE(aspeed_g6_pin_config_map),
 };
 
+struct aspeed_g6_probe_data {
+	struct aspeed_pinctrl_data pdata;
+	int thru_error;
+};
+
+static bool aspeed_g6_is_thru_pin(unsigned int pin)
+{
+	return pin >= AB22 && pin <= AB23;
+}
+
+static int aspeed_g6_gpio_request_enable(struct pinctrl_dev *pctldev,
+					 struct pinctrl_gpio_range *range,
+					 unsigned int offset)
+{
+	struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+	struct aspeed_g6_probe_data *g6 =
+		container_of(pdata, struct aspeed_g6_probe_data, pdata);
+
+	if (g6->thru_error && aspeed_g6_is_thru_pin(offset))
+		return g6->thru_error;
+
+	return aspeed_gpio_request_enable(pctldev, range, offset);
+}
+
+static int aspeed_g6_set_mux(struct pinctrl_dev *pctldev,
+			     unsigned int function, unsigned int group)
+{
+	struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+	struct aspeed_g6_probe_data *g6 =
+		container_of(pdata, struct aspeed_g6_probe_data, pdata);
+	const struct aspeed_pin_group *pgroup = &pdata->pinmux.groups[group];
+	unsigned int i;
+
+	/* Check the entire group before the shared helper changes any pin. */
+	if (g6->thru_error) {
+		for (i = 0; i < pgroup->npins; i++) {
+			if (aspeed_g6_is_thru_pin(pgroup->pins[i]))
+				return g6->thru_error;
+		}
+	}
+
+	return aspeed_pinmux_set_mux(pctldev, function, group);
+}
+
 static const struct pinmux_ops aspeed_g6_pinmux_ops = {
 	.get_functions_count = aspeed_pinmux_get_fn_count,
 	.get_function_name = aspeed_pinmux_get_fn_name,
 	.get_function_groups = aspeed_pinmux_get_fn_groups,
-	.set_mux = aspeed_pinmux_set_mux,
-	.gpio_request_enable = aspeed_gpio_request_enable,
+	.set_mux = aspeed_g6_set_mux,
+	.gpio_request_enable = aspeed_g6_gpio_request_enable,
 	.strict = true,
 };
 
@@ -2778,15 +2827,103 @@ static const struct pinctrl_desc aspeed_g6_pinctrl_desc = {
 	.confops = &aspeed_g6_conf_ops,
 };
 
+/*
+ * Experimental: transfer the global GPIOP0-P5 THRU selection to the
+ * individual mux controls before registering any pinctrl consumers.
+ * PWM selection is higher priority and is deliberately left unchanged.
+ *
+ * Do not undo the local selections on error: a shared enable may already
+ * have cleared. Keeping the equivalent local selections preserves routing
+ * while rejecting affected requests, rather than granting an unsafe GPIO.
+ * Signal continuity during this transfer still needs hardware validation.
+ */
+static int aspeed_g6_thru_handover(struct regmap *scu)
+{
+	const u32 local_mask = GENMASK(29, 24);
+	unsigned int strap2, strap3, local;
+	int ret;
+
+	ret = regmap_read(scu, SCU510, &strap2);
+	if (ret)
+		return ret;
+	ret = regmap_read(scu, SCU51C, &strap3);
+	if (ret)
+		return ret;
+
+	if (!(strap2 & BIT(28)) &&
+	    ((strap2 & BIT(30)) || !(strap3 & BIT(9))))
+		return 0;
+
+	/* Preserve every globally selected role, including under PWM. */
+	ret = regmap_update_bits(scu, SCU4BC, local_mask, local_mask);
+	if (ret)
+		return ret;
+	ret = regmap_read(scu, SCU4BC, &local);
+	if (ret)
+		return ret;
+	if ((local & local_mask) != local_mask)
+		return -EPERM;
+
+	/* Leave the inactive GPIOZ6 source alone in dedicated-strap mode. */
+	if (!(strap2 & BIT(30)) && (strap3 & BIT(9))) {
+		ret = regmap_update_bits(scu, SCU51C, BIT(9), 0);
+		if (ret)
+			return ret;
+	}
+
+	if (strap2 & BIT(28)) {
+		/* SCU510 is write-one-set; do not use an ordinary RW clear. */
+		ret = regmap_write(scu, SCU514, BIT(28));
+		if (ret)
+			return ret;
+	}
+
+	ret = regmap_read(scu, SCU510, &strap2);
+	if (ret)
+		return ret;
+	ret = regmap_read(scu, SCU51C, &strap3);
+	if (ret)
+		return ret;
+	if ((strap2 & BIT(28)) ||
+	    (!(strap2 & BIT(30)) && (strap3 & BIT(9))))
+		return -EPERM;
+
+	return 0;
+}
+
 static int aspeed_g6_pinctrl_probe(struct platform_device *pdev)
 {
-	int i;
+	struct aspeed_g6_probe_data *g6;
+	struct regmap *scu;
+	int i, ret;
+
+	if (!pdev->dev.parent)
+		return -ENODEV;
+	scu = syscon_node_to_regmap(pdev->dev.parent->of_node);
+	if (IS_ERR(scu))
+		return dev_err_probe(&pdev->dev, PTR_ERR(scu),
+				     "No SCU regmap for THRU handover\n");
+
+	g6 = devm_kzalloc(&pdev->dev, sizeof(*g6), GFP_KERNEL);
+	if (!g6)
+		return -ENOMEM;
+	memcpy(&g6->pdata, &aspeed_g6_pinctrl_data, sizeof(g6->pdata));
+
+	ret = aspeed_g6_thru_handover(scu);
+	if (ret == -EPROBE_DEFER)
+		return ret;
+	if (ret) {
+		g6->thru_error = ret;
+		dev_warn(&pdev->dev,
+			 "THRU handover failed (%d); GPIOP0-P5 mux requests blocked\n",
+			 ret);
+	}
 
 	for (i = 0; i < ARRAY_SIZE(aspeed_g6_pins); i++)
 		aspeed_g6_pins[i].number = i;
 
 	return aspeed_pinctrl_probe(pdev, &aspeed_g6_pinctrl_desc,
-			&aspeed_g6_pinctrl_data);
+			&g6->pdata);
 }
 
 static const struct of_device_id aspeed_g6_pinctrl_of_match[] = {

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


