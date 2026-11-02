Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39035607B45F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 15:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qEVz/kF1;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oz7EGdYi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OQxrJVTSX9yU+997aECUavgu21v7JWvUGozeyzoCeIM=; b=qEVz/kF1YWyt5g
	H+C2DIjEQKbKtctNq11wodjICh02sqr3XWOyOuIwCmbXLVM5y7TPEy17okGqk0y36GNpR2IOy2iA9
	fqhTXF+2NsfB4C643qGs09Btr804wcfGRmv908FX2oeG2aM6ykz8DOis2tN3uG6ACA7xWto5Vl39r
	Y2M9HgwGVKG1i3mQdBu44Iq2wRqrXMz18V7944H5nmI/oNRq+SsIUjvGKRxgRtEKB3H76fEdGAOG2
	1Uy2XVGQtkZnUYutrlC0IopPLHCKvC0aUE1K83aNVPLCnNMS7zbvdwsBRxobQKPAmj9eKCoB+Ehiy
	4zj7IRUH/VWq7xJstEeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuMh-0000000HDUs-09wN;
	Mon, 02 Nov 2026 15:54:31 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuMb-0000000HDQt-2mMi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 15:54:29 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so30620955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 07:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793634864; x=1794239664; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OQxrJVTSX9yU+997aECUavgu21v7JWvUGozeyzoCeIM=;
        b=oz7EGdYiYTIWUirCvNkWrwQ78Y1kRBzyHxCCCg4+oUzGVfgLMwqt6xVLp9sb19yfu5
         aN5cz2UCgwWMl0u8Ja71P936yvvwd/m9QsObkoPhC87JMTycgqcgL9oNGWNJeEqjG1AX
         C++7gygyloD2eWp8K9UYyf1Tth5DiAo536l7r6kaUxvbUFydsTRIN4m6Fc1XsRrZeySH
         vGBzsF5bsBA6PqadAy+t7ngj8CLVeZoROCypUFizDYRjQLG4WWnc27JSX8MH+BPvFHIH
         i8i9wDRhdOseq1rRltlycQJ2mFgoATeOXwuCXGRJSoDsj3kDmXavIO+PqzuAZZv5YaQC
         kMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634864; x=1794239664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OQxrJVTSX9yU+997aECUavgu21v7JWvUGozeyzoCeIM=;
        b=vdag5O0/50l+uKkkThe2SKjhpEnMpxaVgsYD445XJ0USf3yQyM8IK3fppxcQjalhmz
         HBcXVrWNz39HP66BNLiYMjxTZ4na1k7nAq9hoD4h21dCvfZI9q3ULE2FzBP0OJEEoKOt
         HjjDahqAbVZEUiDjmRTMiIMKElWSdXHMpKhS5xbB7Nw2dzuPiQPXZmWoU9VQqJQUGZ6D
         8LfYqNTluS5R581wKqsc7OLxBwifRmzp/xw1w9A2/GMPU90fgM6gm+x54mk9em8wp6hA
         pBIo7fuNl50mJJb5r4qpRwm/REPVQlDDdxtYVwEemvcK/gEGCM+U9XZS9bbyLKrm5MrS
         YBkQ==
X-Forwarded-Encrypted: i=1; AKwUvByXPdVnE6/XAjMirxwkP81yds4uqiwUSrOpjkLWVN7aGzo1r3igZtSUioTHSDN2gTwtYbOOV90aANkXVkypUYSV@lists.infradead.org
X-Gm-Message-State: AFq9FYJzD4TRXAfuy+r88Hs9nfbpDr9mHb28lQ6a8Qtz7OrzKcpBmf68
	S9/hyy1QXxrLbcFpphk13jPUbc8/ghoqzXUI5/1ugTCCaeqL7HWfoh49BxiSjYXVrTVuzhTth/k
	v6CAo
X-Gm-Gg: AYBFou1jsLfCDsACpsP3VqPLzpV+zln82mUTYzL0ULeeEeLQP6GzawLvrnXLfU5A3tn
	nPawLpxwitokIYU9w3ES1H0qCqcnBY7pTwfv8kh3RUNj5Zmlav5BnTJZUE8cCg8pxkvTHmyxYVP
	t40M86C8CkIMcporZ1v8OTlLC4PH/mQ4xqBeiIVdgQEXI+QS8FA4SNfbK2IeaSmUuzodiCyWwQX
	FnJaLjM/mFHHZZEwXONHTz9Wgjh4BDU0Y1N+W0rhF5YH02/rN7R8K32HamZcO1+YTC2q9JyMUoR
	i+Ag4jTWeipqpm/W81XCvesUm3WTnNEaK6Ic4TbmLqWrk2FBc82ZB4mrC2Z4ntzavkMuSYrToUj
	XePNIIPHX1Yan7WW5rO+vJr3A9zChfxCrevyL7JT7d0uwH4tUZuVjeKNroBq9BklF1PzyrD9hq/
	IH4MoGKjfsgzh0g5jBqh7k1r3C3YmW7dg8Mwa0F4aFyC6rs4ba4s9t88/kL6zR7ZAYY/XjfBcC7
	PkBP4OD6E58+FQUWFe1Ktx1MWFBdGzZ8t4LMcHRGXfynB0PGeLSueT8tJbYi0t1R1PkPUnMNL+s
	vj31ryFy6UUQ8PAfndngMqZ0AvKL001BclU7lJlN/k2ri0ugXmm4iw7V
X-Received: by 2002:a05:600c:a00b:b0:4a2:180b:3153 with SMTP id 5b1f17b1804b1-4ac185bcc7dmr252990315e9.14.1793634863799;
        Mon, 02 Nov 2026 07:54:23 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm21229288f8f.51.2026.11.02.07.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:54:23 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 02 Nov 2026 15:54:17 +0000
Subject: [PATCH 1/2] regulator: mt6363: Use 8-bit register values
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-rgp-67-mt6363-regulator-fixes-v1-1-420789a3113e@baylibre.com>
References: <20261102-rgp-67-mt6363-regulator-fixes-v1-0-420789a3113e@baylibre.com>
In-Reply-To: <20261102-rgp-67-mt6363-regulator-fixes-v1-0-420789a3113e@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?GIBEOM_LEE_=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_075425_774847_EBEB77CC 
X-CRM114-Status: GOOD (  16.74  )
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

The registers are 8 bits wide, but the regulator regmap uses 16-bit
values, so every access also covers the next register. On little-endian
CPUs, each regmap_write() also writes zero to the next register:
disabling VS2 or a VBUCK rail through its clear register 0x212 also
clears the enable bits of VS1, VS3 and three VSRAM rails in 0x213.

Change the regmap values to 8 bits. Store the BUCK and TMA keys as
__le16 so that the low byte goes to the first key register on any CPU,
as it did on little-endian CPUs.

Fixes: 3c36965df808 ("regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators")
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
I had this patch ready when GIBEOM LEE posted the same regmap change:
https://lore.kernel.org/all/20261101164405.1743177-2-rtx4060@gmail.com/
The only difference in behavior is the BUCK_TOP key: that patch keeps
it as a u16, which a big-endian kernel writes high byte first; this one
stores it as __le16.
---
 drivers/regulator/mt6363-regulator.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/mt6363-regulator.c b/drivers/regulator/mt6363-regulator.c
index aa6a8eb7ac4b..ac79ad6698bf 100644
--- a/drivers/regulator/mt6363-regulator.c
+++ b/drivers/regulator/mt6363-regulator.c
@@ -381,7 +381,7 @@ static unsigned int mt6363_regulator_get_mode(struct regulator_dev *rdev)
 
 static int mt6363_buck_unlock(struct regmap *map, bool unlock)
 {
-	u16 buf = unlock ? MT6363_BUCK_TOP_UNLOCK_VALUE : 0;
+	__le16 buf = cpu_to_le16(unlock ? MT6363_BUCK_TOP_UNLOCK_VALUE : 0);
 
 	return regmap_bulk_write(map, MT6363_BUCK_TOP_KEY_PROT_LO, &buf, sizeof(buf));
 }
@@ -482,7 +482,8 @@ static int mt6363_regulator_set_load(struct regulator_dev *rdev, int load_uA)
 
 static int mt6363_vemc_set_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
 {
-	const u16 tma_unlock_key = MT6363_TMA_UNLOCK_VALUE;
+	const __le16 tma_unlock_key = cpu_to_le16(MT6363_TMA_UNLOCK_VALUE);
+	const __le16 tma_lock_key = cpu_to_le16(0);
 	const struct regulator_desc *rdesc = rdev->desc;
 	struct regmap *regmap = rdev->regmap;
 	unsigned int range, val;
@@ -539,8 +540,8 @@ static int mt6363_vemc_set_voltage_sel(struct regulator_dev *rdev, unsigned int
 
 lock_tma:
 	/* Unconditionally re-lock TMA */
-	val = 0;
-	regmap_bulk_write(rdev->regmap, MT6363_TOP_TMA_KEY_L, &val, 2);
+	regmap_bulk_write(rdev->regmap, MT6363_TOP_TMA_KEY_L,
+			  &tma_lock_key, sizeof(tma_lock_key));
 
 	return ret;
 }
@@ -811,7 +812,7 @@ static struct regmap *mt6363_spmi_register_regmap(struct device *dev)
 {
 	struct regmap_config mt6363_regmap_config = {
 		.reg_bits = 16,
-		.val_bits = 16,
+		.val_bits = 8,
 		.max_register = 0x1f90,
 		.fast_io = true,
 	};

-- 
2.43.0


