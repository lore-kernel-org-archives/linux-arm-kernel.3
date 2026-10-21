Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70F4606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 21:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S5fVTkre;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cro+LQPn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+e9kTl0gTJdhkEEUdGkZ8+xd5uH94iYTy0NqVjeDG4Q=; b=S5fVTkreiveQMGk37IUH56nybE
	vzjNwWC+ap0zpnnCPOg0n+o7L3Y9xlNvLVaPowtaczJDpRkwEk2bH18v+CYeD4ocI7ld0rJZvlz8c
	xBKqGUKZOoAapXDM763fCfEz7mE70M+6+CiUtwLmRFSQFWUcXRKXtjDV+PzQLAgBewskqsKK+Lohh
	bsklzw9Vdz04AMA0vIgH6gi8epfi9oOEgr/m98YO5EugSjVqlYzPNVGCipBFkXIZP/+YBunaMhlXA
	6kzxi1+caj5YJTc0P8mzH9lejuTywi5zKL2t4I+JzkrF020gORwODuMKdUhE1fPMIc4snJA2V2nq+
	y5ByTLcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJeEI-0000000CxCZ-3kau;
	Wed, 21 Oct 2026 21:52:14 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJeEG-0000000CxBX-0Y4E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 21:52:14 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so1621175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792619529; x=1793224329; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+e9kTl0gTJdhkEEUdGkZ8+xd5uH94iYTy0NqVjeDG4Q=;
        b=cro+LQPnAlWWxyBiuiteajoG5wEM80ys77rgVocWgxC/70/RgQid6aqnHeoiopENHd
         M3xS59w++rLo4u8dxsc9vy5OQIh+K4wlkj+aw5ShPKe9cqcpdrwip2NgsUy6xeSHIGYg
         n4JN+ovwNIGQOZOcOimlwprE7bb22LVBSeBAgcPEqsH/OBYYWniAImwIv3ls9IaCUhr8
         +t6oDSc00h1ZBBCMFh9rJuurYNuRhCtgrFfTWu7D8xwLXH7DZcx5se+R+gDwBJTL0/7P
         6H4Wok/6CWDTje44zp0JgJ6WqFr/wwfil98S17Rq6nWUnW0KnD1NVFK2WHBGKiF+D8Jd
         PdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792619529; x=1793224329;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+e9kTl0gTJdhkEEUdGkZ8+xd5uH94iYTy0NqVjeDG4Q=;
        b=mE4Wk6Wui3EHQBosOu6rmZf5gZVwwkPv/5Hg9YG/ruVIeq5l4JJKXd/3m9aUcuX7vE
         JVwD5JR0399W4UexX/sFc9egRNwqTGeXzU49JsMawtQFmOnB5KpzjPS074ZAoTm6hJcW
         OJn7pkFHv+Og0A0QBe7b2D0mRrSPDDeHF22FystxVGviFuo2iD1y9D0PktAvM7IJ3ws+
         CCxhPIKt4eIrzCM+EIJMfZNLsFTbCoLMtpgOq3lEWxp7r/0gLu/tmH8BHGTy3DHL+eGf
         oJrfFUDp7goeLJhIPvesKIwqHbKu6Wj0fhewpM0HMFiNMNH6Q8wbdvGpSiqLQ/z7N7Q2
         Muvw==
X-Forwarded-Encrypted: i=1; AKwUvBw3x2oV2ZkE5faYvAl4priejHb5kma3exdmK5tDIBpFiXr1H4GKhmUeJWJCDpyaYt6bUyhpcH7yuYkvGOkoGl3I@lists.infradead.org
X-Gm-Message-State: AFq9FYLgTLc7+TxVQ/CY6ub5iZvWT6CM2g4Dr1nfFq9BxqaPOP+N7Bnj
	47d6rTYusAJveQk3UMIrjoDg4gcPYUt+qs1B17wyXEvMJkvffhxtL5y2AAx8qRbgo9g=
X-Gm-Gg: AYBFou0WUigeboCnkH/iO/CupoP2jttS1cBDc/ZOl1QFopVswWn2khaxPtl57sA0EWD
	TtIaKI/iCRmpnPNHPUz6HEFQ2ja/F4ys/RSPs0EmwoSAx4LdOPbAUzI9YzQURq9Q+Z9ukbAfmx+
	E/2o2hloXjnBcSBsR3sKtlKkU17B5J88cA2Cg/gMJpu1NakTbsODmO4Rar0xr++LszmHXBgGwmx
	qoB46TbpFLP2xXhV4uGOJ3U6U9lDnw7AOXA82JNlgiCjm8EI8Z3mU9Jq2mQoj7VT8nT2AHJmgs9
	puKZR/V2AY8PYbKFW/GiGpZuCB1E1c7xMPLY4UU42mVT1L0eSUZKW2CYVTDKyyzKi1/sv0LklLH
	T3btrsC34Mw6kdB54ulTTB83uu8iUkElFQcez4JjYWS+30EBvflfZdyGT047wn68n/wl0XfaqSM
	w07QswgnpKc3EoDjVmbsE3Vj96l1emZG65KqNaiEegR6olClQgilDUqvP8xbXNecE3T+WX6ouIL
	FTcoJBCtAjrL/ltk67Kj/2cR8GP/wYVLVb9DlJgTnc69URIuzV5mA==
X-Received: by 2002:a05:600c:84ce:b0:4a1:e84e:e38b with SMTP id 5b1f17b1804b1-4a204beaabemr9343955e9.11.1792619529563;
        Wed, 21 Oct 2026 14:52:09 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581eed3sm8840888f8f.12.2026.10.21.14.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:52:09 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 21 Oct 2026 23:52:04 +0200
Subject: [PATCH] ASoC: meson: gx-formatter: change stream lock from mutex
 to spinlock
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAM02WoC/yXMTQ6CQAxA4auQrm3CVELUqxgXMHSw/syQdjAkh
 Lsz6vJbvLeCsQobXKoVlD9ikmKBO1Tg710cGWUoBqqpdTU5HBcMSd9dzqw4G6NNEl/JP5FO5/7
 IxE07BCj9pBxk+b2vt79t7h/s83cI27YDiy5IKX0AAAA=
X-Change-ID: 20261021-gx-formatter-use-spinlock-289b3e2e46df
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6431; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=JmRd5q70Ih5GAyDXoaeuH8rg99srkjjU5+Roj8RNuXY=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFk3TVgrPsseYNlbFfzT5cq6NWnHI+9bpW4V0L7TcP+7/
 8Y9Oe4rO0pZGMS4GGTFFFlYpt/7XVCq9tA44WQBzBxWJpAhDFycAjCR1ToM/6MM7+31tMsTVfht
 Xu6XyFvGbmLPEGt/YglTRfWuFSrOFQz/KzPaXc+fXLfW2v7plm9/O+9Vq/XPWGM6aU5grWH6qRY
 +dgA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_145212_216185_3250FDB4 
X-CRM114-Status: GOOD (  21.54  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently a mutex is being used in 'struct gx_stream' to serialize
access to structure data. This was inherited from the AXG design. An
important difference though is that in axg-card dai_links are nonatomic
so callback functions like 'trigger' are allowed to sleep. In GX instead
dai_links are atomic.

For example, starting playback from userspace with
'CONFIG_DEBUG_ATOMIC_SLEEP=y' results in a warning message like:

[ ] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:316
[ ] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 272, name: speaker-test
[ ] preempt_count: 1, expected: 0

due to the following call stack:

snd_pcm_do_start (called with spinlock taken)
  dpcm_fe_dai_trigger
    dpcm_fe_dai_do_trigger
      dpcm_dai_trigger_fe_be
        dpcm_be_dai_trigger
          soc_pcm_trigger
            snd_soc_pcm_dai_trigger
              soc_dai_trigger
                aiu_encoder_i2s_trigger
                  gx_stream_start (takes 'ts->lock')

Fix this by changing the lock type from mutex to spinlock. This is safe
on GX platform because all formatters' functions only perform MMIO regmap
calls that do not sleep.

'spin_lock_irqsave' is used in 'gx_stream_start'/'gx_stream_stop' because
trigger runs with IRQs already disabled and stop can also run in IRQ
context (e.g. in case of XRUN while executing 'aiu_fifo_isr').
'spin_lock_irq' is instead used in 'gx_formatter_attach'/
'gx_formatter_detach' in order to prevent IRQs on the same CPU that might
end up calling 'gx_stream_stop' and therefore deadlock.

Fixes: a295be8d6210 ("ASoC: meson: gx: add gx-formatter and gx-interface")
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
This fixes a pre-existing bug, present since v7.3, reported by Sashiko [1]
while reviewing the series adding I2S input support for Amlogic GX
SoCs [2].

[2] depends on this patch to address Sashiko's comment.

The commit message provides all the details of the fix.

[1] https://lore.kernel.org/all/sashiko-outbox-176054@kernel.org/
[2] https://lore.kernel.org/all/20261018-audin-v5-0-4b8cc13a1b22@baylibre.com/
---
 sound/soc/meson/gx-formatter.c | 21 +++++++++++----------
 sound/soc/meson/gx-formatter.h |  4 ++++
 sound/soc/meson/gx-interface.h |  3 ++-
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/sound/soc/meson/gx-formatter.c b/sound/soc/meson/gx-formatter.c
index 2d3218cce426..6b4155f9f05e 100644
--- a/sound/soc/meson/gx-formatter.c
+++ b/sound/soc/meson/gx-formatter.c
@@ -61,7 +61,7 @@ static int gx_formatter_attach(struct gx_formatter *formatter)
 	struct gx_stream *ts = formatter->stream;
 	int ret = 0;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irq(&ts->lock);
 
 	/* Catch up if the stream is already running when we attach */
 	if (ts->ready) {
@@ -74,7 +74,7 @@ static int gx_formatter_attach(struct gx_formatter *formatter)
 
 	list_add_tail(&formatter->list, &ts->formatter_list);
 out:
-	mutex_unlock(&ts->lock);
+	spin_unlock_irq(&ts->lock);
 	return ret;
 }
 
@@ -85,9 +85,9 @@ static void gx_formatter_detach(struct gx_formatter *formatter)
 	if (!ts)
 		return;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irq(&ts->lock);
 	list_del(&formatter->list);
-	mutex_unlock(&ts->lock);
+	spin_unlock_irq(&ts->lock);
 
 	gx_formatter_disable(formatter);
 }
@@ -212,9 +212,10 @@ EXPORT_SYMBOL_GPL(gx_formatter_create);
 int gx_stream_start(struct gx_stream *ts)
 {
 	struct gx_formatter *formatter;
+	unsigned long irq_flags;
 	int ret = 0;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irqsave(&ts->lock, irq_flags);
 
 	/* Start all the formatters attached to the stream */
 	list_for_each_entry(formatter, &ts->formatter_list, list) {
@@ -228,7 +229,7 @@ int gx_stream_start(struct gx_stream *ts)
 	ts->ready = true;
 
 out:
-	mutex_unlock(&ts->lock);
+	spin_unlock_irqrestore(&ts->lock, irq_flags);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(gx_stream_start);
@@ -236,8 +237,9 @@ EXPORT_SYMBOL_GPL(gx_stream_start);
 void gx_stream_stop(struct gx_stream *ts)
 {
 	struct gx_formatter *formatter;
+	unsigned long irq_flags;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irqsave(&ts->lock, irq_flags);
 	ts->ready = false;
 
 	/* Stop all the formatters attached to the stream */
@@ -245,7 +247,7 @@ void gx_stream_stop(struct gx_stream *ts)
 		gx_formatter_disable(formatter);
 	}
 
-	mutex_unlock(&ts->lock);
+	spin_unlock_irqrestore(&ts->lock, irq_flags);
 }
 EXPORT_SYMBOL_GPL(gx_stream_stop);
 
@@ -256,7 +258,7 @@ struct gx_stream *gx_stream_alloc(struct gx_iface *iface)
 	ts = kzalloc_obj(*ts);
 	if (ts) {
 		INIT_LIST_HEAD(&ts->formatter_list);
-		mutex_init(&ts->lock);
+		spin_lock_init(&ts->lock);
 		ts->iface = iface;
 	}
 
@@ -272,7 +274,6 @@ void gx_stream_free(struct gx_stream *ts)
 	 * are removing the TDM DAI. It should not be possible
 	 */
 	WARN_ON(!list_empty(&ts->formatter_list));
-	mutex_destroy(&ts->lock);
 	kfree(ts);
 }
 EXPORT_SYMBOL_GPL(gx_stream_free);
diff --git a/sound/soc/meson/gx-formatter.h b/sound/soc/meson/gx-formatter.h
index b90b1814d79b..9f5a1720481e 100644
--- a/sound/soc/meson/gx-formatter.h
+++ b/sound/soc/meson/gx-formatter.h
@@ -20,6 +20,10 @@ struct gx_formatter_hw {
 
 struct gx_formatter_ops {
 	struct gx_stream *(*get_stream)(struct snd_soc_dapm_widget *w);
+	/*
+	 * Following functions are called with gx_stream->lock held and local
+	 * IRQs disabled so they must not sleep.
+	 */
 	void (*enable)(struct regmap *map);
 	void (*disable)(struct regmap *map);
 	int (*prepare)(struct regmap *map,
diff --git a/sound/soc/meson/gx-interface.h b/sound/soc/meson/gx-interface.h
index 2a6207e393e8..a6a5cc9e7af0 100644
--- a/sound/soc/meson/gx-interface.h
+++ b/sound/soc/meson/gx-interface.h
@@ -9,6 +9,7 @@
 
 #include <linux/clk.h>
 #include <linux/regmap.h>
+#include <linux/spinlock.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
@@ -24,7 +25,7 @@ struct gx_iface {
 struct gx_stream {
 	struct gx_iface *iface;
 	struct list_head formatter_list;
-	struct mutex lock;
+	spinlock_t lock;
 	unsigned int channels;
 	unsigned int width;
 	unsigned int physical_width;

---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261021-gx-formatter-use-spinlock-289b3e2e46df

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>


