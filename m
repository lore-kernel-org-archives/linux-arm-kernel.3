Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A101606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 10:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OciioqUu;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YYQioDVA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=; b=OciioqUuja4rFK
	E79ugnxSF+aNYKXRC95OTm/NdxiU3kzcaji5Cqt0fxER29tW2DtT9UZYSDCxmJz2FZx8lRG94Culp
	9e78KjKMHTPuYJ4YVRFiRKGRWd2iqC81HjBdJ3M4L4X97N/5RKowOr/ycZifCHa36l554Z1RTYLeh
	Vr0QQU74P/ABA4tYPA0oHluoakXBAhc+R6MctUm2QYgzdbO7K5CdejFcgKDPw1SfQv6XxJjrKERam
	Sjvguyj/yscMAMKXLPi8Ji9o1mkRZEy+q88x5hf8X1p+k8PqW9yqcnN1MZ8laTRfdfQSnPa2QvvaP
	CppMCd0GfreWSSpyJfFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHqE-00000002Fwl-0r0T;
	Mon, 26 Oct 2026 10:22:10 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHq7-00000002Ft2-0aak
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 10:22:04 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so15648795e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 03:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010121; x=1793614921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=;
        b=YYQioDVAlBa8Ag8vBGIhsxysiel7bfOUPSv/ZuGXEHv+I2iKgdD8P7r70jnLk07G8m
         lyQSV7SCPw/Mz748U7LdIWcc60RAc6CDw49/DF6s3DZVkNClUgWUeAt83p9eNpPAKD92
         FgHQRkunQVdYtDb/KRSDmUJT76S1fw4eo1XlJFMqh3mHCUul2lLl3VYUQmrA5aeSKMmI
         G/pnxwrs9lQvI/sBgASTPPcafa+opW4xcnS0/uJFkiFhDbFNNcJ/9pqQxvizVUW9aDp+
         7TfLzTC6dF8eD1FwxTF7XvgMZZjAX38QY0LXPtOoV6T7ReJW1a5L611heVxH9sF38kmN
         xYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010121; x=1793614921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=;
        b=piEoOzf35ixsoenfbx8yuxCaNx/WKMKr8jBKDpT+xcLSyxt6lBtVz+k/waLm1mXb+Z
         C4uHFoTVIYskQVz7FlIQA29XSIu4sy9PZ71TgQqyGm/IqW9MTbCuis62Kzd74XBmAyA1
         SHJcHLDDOLwowsNfBXONcgy/f/TRaHsBuRD98hK7D1SM26KL6wxuYrDIdMMB/OdOmtDX
         pLA0VIi7uG7L9mmXR4ec3T5uWFrM8peBVoGTHD1UxAmAODGf5jm+d110R2tgf6IV6AX5
         35y/kR619c6YuIuCWTpIQ+hMzG4Q6iw7nSqCFoUuM6ytEACKumC3YZuxF5UuEGVsMX31
         nFxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKGZog8H+1ymvqi7E5lb/kyw9kctYHpOMypCCD0bXUjFLunbfdGmCDuRMA3tEhC4PDu4VPQVklk2nQtbnDGoBe@lists.infradead.org
X-Gm-Message-State: AFq9FYKNpAHswHPpC3aX389ABZIuyLYd4PEU998DmKJ1bPD1Z8uEuIQK
	jk/8u9OybkrMFTQnoRBS4rvC/vY1ilGfS5ckgaQnBrGnWCsLB+8KKdTu
X-Gm-Gg: AYBFou1edvTKYW/F9WLwCNEWZzNACbrkwEmBZAfaZvSbrw50fN1fMru71mcrgtcYCi2
	9VH9V89SCrkdcM1VvzVkkXCXx779sDV3mn1p1/EZfw/k09u0pt7OWo47YeVQKyWiYO8A/4kpK/d
	qLVt+dznrslKU4OqEbvFODb9CTwgPae0vY75YYNegmhH6geP+VwjHQW3Agqn3MSn/a+WHbZt8uU
	OCDqm2ADTeTjHgXGCFlWwyNMHZ8ZeliuyhcpH18kSNOVU6tju6c6uQF8Ig2s0ieR/sWIQQQxfv+
	CGm6jfeWRG6RrjsHhyT2DmrtHuZUb4kwgX4eUrwwuHCotGNiJkBOfvJ1FiuYz/CCPONh8cPrjry
	ChiS4acu5p32gH2f/dpWdoWuTGaM++pC2E3db563ifKFJxgdntJwHaJ2WaBfP1vgvOFQK3FiyIL
	bx1HAhvJ5ZaliuESGTGFxsLVCDUHnzpZykshv05IWIMRfo648M7oIiCCGJOYW8R+XgGoOXtYT6b
	RZ6vkeabKd2D1CpJzvejg81m5P0fLuDv6cv7Uu5VVUvmUk6UeY+Usqb3Xoo5QOyLPC4NACGRvgR
	M59XXH6L9JBSVlXs/UhzlOh5UBe/pMuGpZJ3vUN9kuNzXk63xUrqhDvE1RQq
X-Received: by 2002:a05:600c:a106:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4a35aea23edmr84243625e9.9.1793010121069;
        Mon, 26 Oct 2026 03:22:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3932sm16762876f8f.18.2026.10.26.03.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:22:00 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 2/2] mmc: mtk-sd: Add Airoha AN7581 MMC compatible
Date: Mon, 26 Oct 2026 11:21:37 +0100
Message-ID: <20261026102138.36786-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026102138.36786-1-ansuelsmth@gmail.com>
References: <20261026102138.36786-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_032203_190736_E4EEF953 
X-CRM114-Status: GOOD (  11.47  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add dedicated compatible for Airoha AN7581 SoC that implement a dedicated
MMC controller based on MT7988 with the difference of having a single clock
controlling it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mmc/host/mtk-sd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 5b160fdad3f0..736cff2783e2 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -713,6 +713,7 @@ static const struct mtk_mmc_compatible mt8196_compat = {
 };
 
 static const struct of_device_id msdc_of_ids[] = {
+	{ .compatible = "airoha,an7581-mmc", .data = &mt7986_compat},
 	{ .compatible = "mediatek,mt2701-mmc", .data = &mt2701_compat},
 	{ .compatible = "mediatek,mt2712-mmc", .data = &mt2712_compat},
 	{ .compatible = "mediatek,mt6779-mmc", .data = &mt6779_compat},
-- 
2.55.0


