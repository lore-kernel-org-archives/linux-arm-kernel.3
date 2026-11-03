Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58D9606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SaG3Pk2O;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DUCLHqSK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=h2GPV8kPMdAQMoqvFZFNAZKoDNH2JuPpdXamalsnIvU=; b=SaG3Pk2OOUsNO4
	wPmpylh/2jTW4PyVrz+cwiYqU0K4/G4n4JFMYDMltdKVGVeUM1LHj+acQzyGnmM+6s/y/UJjiZ7p8
	WiA1sza2rvCLZtjx03w1UmVJrdUZNDo1rB8aJN7hzqBFS7j8e1QvzcH5GR6zMCfvOKkUqnDjYDwL8
	PeLn3hCmEDYOyyoDWyb/Fy9ETV4TGuvz2J4AI20LbcwZw+5h2sE4eORzpRN9XBB0ZAcr/tg+8la31
	vYcbZ/DwWf8+B3ELjwUwgtZd63Roe9rAhajkIMQqd17OxVCwDiInJxM45Iwuz3Gx5SxkNmxeXVJcH
	hHBmWcUg78tmSovURneQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Hk-000000013vG-0zgo;
	Tue, 03 Nov 2026 04:38:12 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6He-000000013r3-2VEV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:38:11 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso2204027a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680686; x=1794285486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2GPV8kPMdAQMoqvFZFNAZKoDNH2JuPpdXamalsnIvU=;
        b=DUCLHqSKA5I/2yyQ3LxmRID9P0l9H375j85MM42TXvnZVBk+7tHximrMTe0gJdzgrf
         S9DEG0XJsISY0pvKKEuZONU0Nw22EX9pFQM72nqi8fo9f7BtuMPTCBBMrkcPTkVTZ7n0
         PQNGV/OaQDcVAivTI7cWOkXgEDQ9SZaJMxL9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680686; x=1794285486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h2GPV8kPMdAQMoqvFZFNAZKoDNH2JuPpdXamalsnIvU=;
        b=Wnu+WJDpGtb7V9+cwMPzpRrz1IxgIgjVwlJKj65cL5jQhsUyCTDSpDpaQNl7WcJIDc
         c/TL6+8heEArfQd9OXK2LhHGdqyzQV1rocUMssA/PC9seZlD87L0zUwTZyOqhRVQXTAJ
         CI8MJIGY886aCMOuuRf9VNjSaxlWWRedetgBRZmfHf//imYz9SaPXSghPTq7Nk19I0fD
         LwMP73i1OvRlDjhAqcEOTm50j8Cqgac6mcU2yEdIcvVqmioAJ15vb9pCr4IGebs6qASf
         aWBHBfREpMP++qXHfBBEbb76oYvKTIuGBrhXaVpZ/wafiVIgPWxjaLIulllOO/ofBdZm
         Fgqw==
X-Forwarded-Encrypted: i=1; AKwUvBwYCU7pbjyjjjJqXPFOvFDs+7wF0QdM0+IenwbhD02Kb1fjx61jSTX2NuJBOFFASzOwEdi7rZO9Gf6rARSI7KyV@lists.infradead.org
X-Gm-Message-State: APuU4Z/YlggfyIYxLTfoiCg7TC5B6RwHoNflWYutiIJq5C4LoUPj3bJj
	J3fUjo+z+MECQydmwq7ISY0mndiawTUBzx5sok3Fs7NjTpa0bgDzkCjJTovBb+LgtA==
X-Gm-Gg: AYBFou1d9a1Jaww4aKvAOtqJWDiFYsZ4Njveimw1aLexCw3+LipBJ+F/iL45DHOxSR5
	+ufp79RvU8GP324UWeXOPvC4fOXL+L5kB10okJimlNP5nSbBUE7aBBj7e892eJ7wihfNaIzBgtt
	Ud5QnyqTsI3lgsYKMIqLruzwvAgBNEo2XtO0RItpd5kXZKvrKv4DhgEWdjletf/fd/F6Uo8FrJs
	ERA89fDVbPKObSOx0TUUF87u3vtzAKtiZIzNLCKFOzvCLX5bIa/nz063b5uLCTWkBk86MeGXE9P
	P/y3b1Ulr0nGqKC//3m9ykOnktdD5bM27p9aM+TOXrGPcSqzY5ZMQEn52oj6g9SisYOJVCW4mdc
	lKKV50zBBDul1W4kuUvepunav+U/FVvnDXg0siHfLQwJtbZTlHYd95A3L209/lk+n9Fra4DI1te
	kL+51LmilPZmnL4p5xk1Rlg9wHN9mcs6MCN3MiEStX3DZ2MrgWHSSKkBPdUY+PFwcjyt2CEG/BA
	IsDdAkuDOeeQ089HcLktgZSXgB4estqw+NHyXaZldsQaF0sM7paIQQpnYkfsoMtIwo7zqtSy1NI
	h84mWzoe04PQVQajbM3AlesiS6fI94HE0tervlzD4yQ35SUpcr4TqGtrwwkjNgWRPRZFcwjI6XB
	K9pxtK78CPRsQ
X-Received: by 2002:a17:90b:1b0f:b0:3ac:a5ff:2cc3 with SMTP id 98e67ed59e1d1-3ae8957d4f8mr10310774a91.8.1793680685963;
        Mon, 02 Nov 2026 20:38:05 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:05 -0800 (PST)
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
Subject: [PATCH v7 5/8] i2c: of-prober: Let cleanup op know if a device was found
Date: Tue,  3 Nov 2026 12:37:29 +0800
Message-ID: <20261103043734.2179858-6-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_203810_302358_47BFF378 
X-CRM114-Status: GOOD (  19.28  )
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

The prober's cleanup op may want to do things differently if a device
was found, such as wait for the actual device driver to pick up
resources.

Add a parameter to the cleanup op to pass this information in.

Also fix up an incorrect reference in i2c_of_probe_ops's kernel-doc.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v6:
- fixed typo in commit message and comments
- fixed missing parameter in cleanup op type declaration

Changes since v5:
- New patch
---
 drivers/i2c/i2c-core-of-prober.c | 8 ++++++--
 include/linux/i2c-of-prober.h    | 7 ++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index f9f3c0ef93ff..97ef58bb4c04 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -130,6 +130,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
 	const struct i2c_of_probe_ops *ops;
 	const char *type;
 	struct i2c_adapter *i2c;
+	bool device_found;
 	int ret;
 
 	ops = cfg->ops ?: &i2c_of_probe_dummy_ops;
@@ -159,6 +160,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
 	if (ret)
 		goto out_put_i2c_adapter;
 
+	device_found = false;
 	for_each_child_of_node_with_prefix(i2c_node, node, type) {
 		union i2c_smbus_data data;
 		u32 addr;
@@ -171,12 +173,13 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
 		/* Found a device that is responding */
 		if (ops->cleanup_early)
 			ops->cleanup_early(dev, ctx);
+		device_found = true;
 		ret = i2c_of_probe_enable_node(dev, node);
 		break;
 	}
 
 	if (ops->cleanup)
-		ops->cleanup(dev, ctx);
+		ops->cleanup(dev, ctx, device_found && !ret);
 out_put_i2c_adapter:
 	i2c_put_adapter(i2c);
 
@@ -388,12 +391,13 @@ EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup_early, "I2C_OF_PROBER");
  * i2c_of_probe_simple_cleanup - Clean up and release resources for I2C OF prober simple helpers
  * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages
  * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
+ * @device_enabled: True if a device was found and enabled.
  *
  * * If a GPIO line was found and not yet released, set its value to the opposite of that
  *   set in i2c_of_probe_simple_enable() and release it.
  * * If a regulator supply was found, disable that regulator and release it.
  */
-void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
+void i2c_of_probe_simple_cleanup(struct device *dev, void *data, bool device_enabled)
 {
 	struct i2c_of_probe_simple_ctx *ctx = data;
 
diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-prober.h
index bb6d47f50ee5..11f3a05ce881 100644
--- a/include/linux/i2c-of-prober.h
+++ b/include/linux/i2c-of-prober.h
@@ -45,7 +45,7 @@ struct i2c_of_probe_ops {
 	 *
 	 * Only called if a matching component is actually found. If none are found,
 	 * resources that would have been released in this callback should be released in
-	 * @free_resourcs_late instead.
+	 * @cleanup instead.
 	 */
 	void (*cleanup_early)(struct device *dev, void *data);
 
@@ -53,8 +53,9 @@ struct i2c_of_probe_ops {
 	 * @cleanup: Opposite of @enable to balance refcounts and free resources after probing.
 	 *
 	 * Should check if resources were already freed by @cleanup_early.
+	 * @device_enabled is true if a component was found and was enabled.
 	 */
-	void (*cleanup)(struct device *dev, void *data);
+	void (*cleanup)(struct device *dev, void *data, bool device_enabled);
 };
 
 /**
@@ -131,7 +132,7 @@ struct i2c_of_probe_simple_ctx {
 
 int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node, void *data);
 void i2c_of_probe_simple_cleanup_early(struct device *dev, void *data);
-void i2c_of_probe_simple_cleanup(struct device *dev, void *data);
+void i2c_of_probe_simple_cleanup(struct device *dev, void *data, bool device_enabled);
 
 extern struct i2c_of_probe_ops i2c_of_probe_simple_ops;
 
-- 
2.56.0.385.gac671c819a-goog


