Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE38FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opfO1uNasWbxDk0QOATGHi4cTsmB3lXCvlDICGsJtuc=; b=Okae4OSzRhq8SsHeKhq2jEi/g6
	IWOpIVMr4qq6BneLDdNXrx7WVv/uVFaILpq74J5uWeZT2e21i992Q2jmE90/dgsyZNvwrqiVhl1kd
	u/4aXOGZ8EOQVlCQRfeTMSqvQElskLlLfxanteXWtgjDmo5HNvvL+Y/gvgfwCS7N6KOHH5iqL4xry
	FnuAix9q1jrugEJXsaHzJK/4ugJhCyTDAfu2yiWQKNEouSilKivGNxuj3XFt2p1oi7IAC3CgCun7/
	0m562kdc0WfvedzK2ixuhgKq4Rm5UyEsbqRZmiK+VrRm6ZJYFlpeVPPW6tYwWo3KrYW56MXMuoS6b
	djX4TVRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS7T-0000000G0nb-12ep;
	Tue, 30 Jun 2026 06:38:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS7S-0000000G0mC-0dCT
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:38:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=opfO1uNasWbxDk0QOATGHi4cTsmB3lXCvlDICGsJtuc=; b=E5S3ygV7NTOCU8AqKysogobmg9
	NLVXZV5Y3IO9tGTMs8jAYcrlylfZFLsJOxIvyhV1+n+XTrUDVsfCF3WSyVTMUBm3eFshwuihlYJ7K
	7ptwi3cxrI5kON32pHbX1wfOVqYfVnuDB5aXVgDpUN6ZBHWIHO+dx5Yh6SwzfDVxNBjMJSLA0HjC9
	RVJMjlhulpMDB0HibO+jpfggAwO/uR18NaZx+US6pbWacxkPq1E4amQ4cKpQl2XSxGHg7XlzY+DJ8
	2kL95Y+dn50GHuejEnDefsSwBL1IxZnu2msxSAJ0KpDJtNnDqkpqGT2KcAKTyrPY8r0ktH9qxg/Wf
	iBAN4EJQ==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS7N-00000001ZWL-0fEZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:38:51 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-847a69ba83dso84068b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801527; x=1783406327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opfO1uNasWbxDk0QOATGHi4cTsmB3lXCvlDICGsJtuc=;
        b=LhLedLuYywyqaabEyxekawe95h4rImpCmXFGTk8YPqJJ4iBfNsP3o5yULK8U11cMXe
         3zDfERGMSKZiBxwDkrQSexviJJle+RsvRex3Pm8rKs5/zP56j8gBYoQgUbBx96O5/9nb
         AZhxazWWFzXoGSg3ceIJI6LAiu0n4z7lbci5VrnIAYwH7uMfDSpQenGfUnOJ9H7LP3TL
         YaXuemDeHbUoxiReyw++uA/dwAGZ1e7Z9Deu0taT9ND7noIjvVwzHmy0q0vlmHET8F/r
         +yOMk+BrQSfRIFZ7TKid/DqcuMvbOPD5526xsaWnIKU/pbJY2g0ecVbPBPmsxayHhKcY
         6MEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801527; x=1783406327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=opfO1uNasWbxDk0QOATGHi4cTsmB3lXCvlDICGsJtuc=;
        b=pjwS1NTM+h0GYVK21da83E01ycOWsvK2BPz0tAOoh5UUyPgV82SuxDlgBQaKctt8Vb
         4P/U3xEOhAte0g5M15uSL9f6EDhMt0hLvapAcFrdCkuDevxqijG7XMYRrMAvjdiHvpi/
         wo7+FOmy6YfPpTvhIBdLQryp/3aIYcn3x0n2qLvEACPbvKNuqbuwKDuzjdq+A8Iu6Cql
         rIJuQ99iehA27jkVLR4Jgygv82+nxfqf04PD0zMvRUScO/nv5FJyORQsEQwge/4Jfw3J
         aPKejdqHcT44TIOxEVTGiLlWAuYEcio2aJwzoSOwW+6lYBj9lu/KDjT2XZIKtSd3CUyz
         aAmA==
X-Forwarded-Encrypted: i=1; AHgh+RqihdAaammIvfEX+IEs3zPta+h1P1GZJrEMquvu8aXg+MqifmEWKsShOLYB6NjTR9uagQZ6z0evm/175hj01Vvi@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcc7w8MmrSv1keq2I56b7PYyA6XU5Xe8qSNraKYbcwd5PVACfU
	MSqFZ3N3JcKAzw9NoJeB0b+zA5kmNFQwi8RF44AcRI4h0rlSEVy0mWuL
X-Gm-Gg: AfdE7cnmwsAoHT3lbsc8wRq1XxX+YqjMx6gYmMxx2th11BmmJ6YzuENxtF7JdVM722o
	IJCCTF++nA5nphv2F+5z3igzas+7MwPmFHTxD+bjqM4JIhQv27qmGfMHdCBwyrR+feYBn5mbhVn
	iNmFyGWdPzc6SkgmDUYMyeEu+m5AHMI0CUu6p6NJEyx7PuOirRXfy5+5PoT85wflmERI9fvSax4
	cXeNrAJLLMliva1COD3clZAwNnMrPgNv4R+cFRappvzKpPzCtz6+533WgMnUBxRTDrcJy55zR4k
	0VgJD0cmYnA7nLhwIkQ8gFOxh5RXdP+Xq+6UAgo4yp1ohYoYfJAUICfmg5WszAvUjStrAejS2Bi
	nTSrV3c5FSfOlHej/hZBDOTTuv/ol1tciBgqXvg+AG23WkBfiGInjpttB4RH9POhUiuRnSeZf9Y
	pKWOXQLWIIGsMEHlA8ISoXRCfgXMeJHvwaj6Rc5hBTNNdJspc=
X-Received: by 2002:a05:6a00:1256:b0:845:bda6:574b with SMTP id d2e1a72fcca58-8479ee84b9emr1943239b3a.5.1782801527316;
        Mon, 29 Jun 2026 23:38:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:38:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 26/27] ASoC: codecs: rt721: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:48 +0700
Message-ID: <20260630063449.503996-27-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073849_964439_5356490B 
X-CRM114-Status: GOOD (  14.53  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt721-sdca-sdw.c | 29 ++++++++++++++++-------------
 sound/soc/codecs/rt721-sdca.c     |  5 ++---
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 02df04a0ddad..f4f7fc306ea5 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -467,13 +468,13 @@ static int rt721_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt721_sdca->disable_irq_lock);
-	rt721_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt721_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt721_sdca->disable_irq_lock) {
+		rt721_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -495,13 +496,15 @@ static int rt721_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt721->disable_irq_lock);
-		if (rt721->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt721->disable_irq = false;
+		scoped_guard(mutex, &rt721->disable_irq_lock) {
+			if (rt721->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt721->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt721->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT721_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index 35960c225224..159c35d19dba 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -5,7 +5,7 @@
 // Copyright(c) 2024 Realtek Semiconductor Corp.
 //
 //
-
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <sound/core.h>
 #include <linux/delay.h>
@@ -289,7 +289,7 @@ static void rt721_sdca_jack_preset(struct rt721_sdca_priv *rt721)
 
 static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
 {
-	mutex_lock(&rt721->calibrate_mutex);
+	guard(mutex)(&rt721->calibrate_mutex);
 	if (rt721->hs_jack) {
 		sdw_write_no_pm(rt721->slave, SDW_SCP_SDCA_INTMASK1,
 			SDW_SCP_SDCA_INTMASK_SDCA_0);
@@ -309,7 +309,6 @@ static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
 		rt_sdca_index_update_bits(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
 			RT721_GE_REL_CTRL1, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt721->calibrate_mutex);
 }
 
 static int rt721_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


