Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CFE606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 04:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fRd34CUr;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m4vYM6NG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vsYzKlYUxjQ8b2ns7gpXlBY/1SUDj1EiftmKZurRAuk=; b=fRd34CUrIxkZtXOSERHoEPgW1P
	QXBIl89KcmNQvt+rceRzepE+Ezg7p1sFCi2ASYhYPrKxXmaPFguRQFUWBx2JbRyvjagu3Sw2jusVN
	nIvDhQCkErsdQhmWg4fpvVJ2KXlDNKsURZNDpDPvD1ksgG8h8D9Uf+9Ww9deVHlRi5lRZWUZMLtYH
	x8f5ZqKORvO8Xi1gGC+RLjqyE05H0CQuG4W8WuDIVVZTSeSMY6+4UOCL5gOeRBDzYo/FLupQCtfkV
	1bxwaR8He9keNXrx5KF0ZXhXAEKvGu3ftECtICC4fNhf9VqW6m80xYoer1l/X8P0HBkJYLTkL94hD
	WTIzcTyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLv6Q-00000006Gbz-1APn;
	Wed, 28 Oct 2026 04:17:30 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLv6N-00000006Gau-2Ito
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 04:17:28 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so448683a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 21:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793161046; x=1793765846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vsYzKlYUxjQ8b2ns7gpXlBY/1SUDj1EiftmKZurRAuk=;
        b=m4vYM6NGzrOeYYtod5TKMZnbjp+tmGsAHLLd7eWvtgji6+Nq0Dqc7Qb8ATROfwKUDS
         h89lRnhFEq5XY2i81Yvetgur+CPzZECRgczbs0HIHmQzC4KHaYw32JcjVxtaggLc61Q3
         ebLSzcPSWkeMOcMzH2aD2RFguA+GNilvM3cDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161046; x=1793765846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vsYzKlYUxjQ8b2ns7gpXlBY/1SUDj1EiftmKZurRAuk=;
        b=VrZKrahV7UCKE4Z1LD2zvlLosVxfKPO7JqCfJr4kAXU42Nt4dTFIINKfQ+pJ1F8aW3
         174AXCxrLmuetd933FgGaJ30a8854nfAW4NWj4Ei7osHK7TfJ1Kd9VKpn+ubscHmhRY6
         lV83Gp6yL8ZRM/JCZYJxbfDJPtdBpANeNHnVL78u0hXcmn+Sm9muJwifsAI7zvvZIElm
         Y9gprODG+5HauP2WdhpkoFndcMTCXVlHg17NMJ3mbrtLc/+Jc8Km7X7oKKWCn4jlWX9S
         yoayD1VzPzFh/1isYDGEQkkemhm+vaYg1afiZyk1d7I+X2tUCX5w5cVSu79aRowqwzmW
         S+9g==
X-Forwarded-Encrypted: i=1; AKwUvBxyCzU1IEuLI1g2BhI1FxE12wZamerXZ0EqrUXOFUV6wrs8niNwG2jQx/aeHDSKQ++GNOyGhizCiLiQzGaBdM5/@lists.infradead.org
X-Gm-Message-State: AFq9FYKDqzLRpDgszCbYx6LGopjmLWUnJl+RoQxsfZBlj/JPWnmYBMcH
	reET7xLB/dMWyhyQhm+G+zkC/rCXFbcWry1wgs7dYpsMa6ALEPxGoJYFMCYlen6Faw==
X-Gm-Gg: AYBFou2oW2azzTmwDXH707lsAvTf8I7hbBOHdoJWNrcPqm0QoLXJn3XqOX0oJv6fwVj
	xeNi/yJc2BMv18wHiD46kb1ulYls8CyaAqll8jnHsSjwglh5bcjpJVuA2yrG0Wx4RFxOlm+rAXr
	MA1uOS6aT60nsLxE8ZPxtwyZ5O6XpqppYIYvL1oiVnt6GhX84AhRPq7ZGlPyQI9GrXc6u0tj4Q6
	r9RlNC0/HH9e2lWhemVbizyDMY3gKXKHeyUD6lkCzPf8/LhCiKJGrq8uKPzIRSrIVhI8znRwTXt
	qSCLiE7obop7w6iD2lRR6lE4NoHOcUPRdIJsr8+glyxLw7F++c0QzsHVPqPONCTMKsU29Pa3LBW
	ccw5CeLckdHbgKI82/y5p5K4/Ez4C8I/qOuPTmjzpAjaOnMdgs27K09lqlvj6Uta5G8m0T8fOfe
	lzCTlpbefB+DQWinViLNxqtQLPj669tF3mMsgl5BdRsNSeHJ2rFlm8zDprbNe65VU7e1FhtYgxm
	3iUCVzNYfhJzb2MKjeZrHJGjHPM2lG7/MxglIINdPoSWvKCoIs2L5gMJ1fPKNz10R8KJSTvlPWC
	GoLHftvpOV/L2RuBtRnToijPUnSyTSO1zFEMgPV4J0SYzpFw31a5APY1FQGr2BA140QpE/kmk2a
	C9iSE4Tiflzf+
X-Received: by 2002:a17:90b:3b8c:b0:3ac:d79f:8229 with SMTP id 98e67ed59e1d1-3ae58145332mr944428a91.61.1793161046607;
        Tue, 27 Oct 2026 21:17:26 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:56ed:2655:ea09:addc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a586662sm969836a91.14.2026.10.27.21.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:17:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Yong Wu <yong.wu@mediatek.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] iommu/mediatek: Track first resume with a dedicated boolean flag
Date: Wed, 28 Oct 2026 12:16:50 +0800
Message-ID: <20261028041651.3201911-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_211727_594570_90A4749C 
X-CRM114-Status: GOOD (  16.33  )
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

In mtk_iommu_runtime_resume(), the driver checks `!reg->wr_len_ctrl` to
detect the initial runtime resume before mtk_iommu_runtime_suspend() has
saved the hardware registers.

As described in commit 35c1b48d27da ("iommu/mediatek: Add
REG_MMU_WR_LEN_CTRL register definition"), `REG_MMU_WR_LEN_CTRL` has a
non-zero hardware reset default (containing the default write command
threshold and throttle-disable bits) and mtk_iommu_hw_init() only clears
`F_MMU_WR_THROT_DIS_MASK`. While checking `!reg->wr_len_ctrl` therefore
works in practice, relying on an implicit hardware register default to
track runtime PM state is obscure and easy to misread.

Add a dedicated `has_resumed` flag to `struct mtk_iommu_data` to track
whether the first runtime resume has completed directly.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/iommu/mtk_iommu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index b52e16b06760..3be1edd30861 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -260,6 +260,7 @@ struct mtk_iommu_data {
 	struct mtk_iommu_suspend_reg	reg;
 	struct iommu_group		*m4u_group[MTK_IOMMU_GROUP_MAX];
 	bool                            enable_4GB;
+	bool				has_resumed;
 
 	struct iommu_device		iommu;
 	const struct mtk_iommu_plat_data *plat_data;
@@ -1529,8 +1530,10 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
 	 * Uppon first resume, only enable the clk and return, since the values of the
 	 * registers are not yet set.
 	 */
-	if (!reg->wr_len_ctrl)
+	if (!data->has_resumed) {
+		data->has_resumed = true;
 		return 0;
+	}
 
 	base = data->bank[i].base;
 	writel_relaxed(reg->wr_len_ctrl, base + REG_MMU_WR_LEN_CTRL);
-- 
2.56.0.307.g5fe7bd680c-goog


