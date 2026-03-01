Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC64FD0058
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 16:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5liPz02K/lYoLFf1mUMxvj4T0v/e7rdsEUFCIuzEG0s=; b=o0c1VRshcGPahs0FjFTsH514qZ
	M4SCtH06YS5tBt6zoUsU0eCnwCOmF6ip5D38fSgP/5jeaL5Yx7Lg0q2VtuRRByqTSEaKMwLuzkGJZ
	5N83sYhcZkX9uR2jcZHmDmrVQZwUroAnV9Yu7zXUW1A9xSIWWoOJ1HJLswfksYtyP0toEQq1MR0Ig
	8QlHnP9C6eRZ58BQ0mBjz5EpGsGhqGLNHBsz/qTj/RNAmDAxmvXuPXoU8iABtgF8bLoHJw97uN1+i
	obfTqCtA53ZcbY8UHj2Fc8be1KVRxmFWvVsOJJPzuNXymIY9Xs0zzDajuh6vtYTcnOyn16WAWAxC+
	VnbVXnDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwjVg-0000000BeOd-2jbl;
	Sun, 01 Mar 2026 16:19:12 +0000
Received: from out203-205-221-233.mail.qq.com ([203.205.221.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwjVd-0000000BeO4-3quX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 16:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772381939; bh=5liPz02K/lYoLFf1mUMxvj4T0v/e7rdsEUFCIuzEG0s=;
	h=From:To:Cc:Subject:Date;
	b=f6KVdx4gYAYfZLto6SEQyJam876MjZ7P4rbQnNNco/b7+2aDUlsyNMHDjBhVT6uQC
	 ecl7jArbOXRx1YbkaPXJdVc3u6tPXKBszw6JgsqWAQP/il7IVV+KRUe7lVAqcRFAjY
	 K0m8paZw6R8qXtWPDmDXNJPUtQeE56gw5PShOXRw=
Received: from admin.. ([2001:da8:205:20a0:6eeb:b6ff:fe15:94a7])
	by newxmesmtplogicsvrsza56-0.qq.com (NewEsmtp) with SMTP
	id 4B8274F8; Mon, 02 Mar 2026 00:18:56 +0800
X-QQ-mid: xmsmtpt1772381936tjjb1lzzu
Message-ID: <tencent_416C0B949035FA7EF2B7F614AFEFC0D64807@qq.com>
X-QQ-XMAILINFO: MJf32pulH481em/5h9D47rkL+37KUrbISGmIWj/owSIF7ixbNkHqy6/UnHNWk1
	 Br+U9A8s+islJ6EOlSu1DFZVDIb6i/0K8mWQBB5ekdU07rm01+5kUyhxYViVXUDIBGSm4+1HXPM+
	 ae0A/yQ0c8dX4ax2Rp7kLVtJxL0fPXIfiIhv/EEFBItEU/twF1XduH3h2Jbjwt/Ix8dN+lIXb94C
	 83tMcIFYiLtZBBIpsoNfaOzPw6iTdUQxddwxXhUXgq1ot8nrr98mtUkbXXXoODiElfHllPT7hfrj
	 nQ27loWW1tt3vHVpj8h59kjhMb5SEsj6LvyEAPMxuw9DKiWQz++3qlkuyDozp7X+XswqVLvTZ98b
	 mbZwyGRIMA+RazxIVqH3A46HY6R2UTZfU8MoveKodoCkCjp3PZGVgLvEy7L2NqvmLF6C2o95PS08
	 yaaEWMkMCWofzHuDpDYMAOskfQumWCvvWk63YVCx0fIez0JQj7yzid0K6w6+WawtZqtfWyCqPWuM
	 nn3mwCDX614jdYnGFprV8oepbHdVYguV3uF3O0MGJfrR2/6AXA0doGORRrO78PT4auWWzIbrdgtm
	 9lt65xqlVe6FNPB6Wh8J8yyx9tAQLFNxdsYvkZ0UvM6mRGI4a0V8cLXi0Yvru+hZA1bjRJZTjTQl
	 81DASkGyIJSOQGPYJfNfGLmgevfFWN+XSBTOog06GKqBoi6Eo4I/nIj9ZchxQmDw/Y+f1SH5NYqX
	 28tvnqLn8tjTbrFcyczZ2LSUtK752MWWKWOA/vQufofrM0AQLzytX2xieak9IsgzHEnz+Ebsa+3A
	 dCrX07gBjArMxbSfmDjNoqUIW6QgLTxozBrR5/X99igiAFGCFTQUCQzR7jHzkPFXd73tUj/gOhFN
	 JK0XoSfLUINLL874SRxOTaDw/P9pVn+kB903N2SmVq8xxS6v+z8/fO6WLyKq+lsfFDx3+0g8924n
	 LPFo+ThtvuOFGCxlqanCGVo6f19MW9DgW+DSBzSpKraX5/URwn+Fv004nqMxBSSJpFBCZgqpEUpl
	 9RcygpInzr1LQelPbtOIXmBTCH4qD980Xu4q6oj6+nW/GnvhHw4td0qllja+3nGF19c69cIg==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Zhaoyang Yu <2426767509@qq.com>
To: s.nawrocki@samsung.com,
	mchehab@kernel.org,
	krzk@kernel.org
Cc: alim.akhtar@samsung.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhaoyang Yu <2426767509@qq.com>
Subject: [PATCH] media: fimc: check return value of clk_enable in runtime_resume" -m "In fimc_runtime_resume(), the return value of clk_enable(fimc->clock[CLK_GATE]) was not checked. If enabling the clock fails, subsequent register accesses (fimc_hw_reset() and capture/m2m resume) may trigger a bus error or undefined behavior.
Date: Sun,  1 Mar 2026 16:18:54 +0000
X-OQ-MSGID: <20260301161854.266277-1-2426767509@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_081910_295472_A52D43CE 
X-CRM114-Status: GOOD (  11.48  )
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

Fix this by checking the return value. If clk_enable() fails, return the
error immediately, preventing unsafe hardware access.

Signed-off-by: Zhaoyang Yu <2426767509@qq.com>
---
 drivers/media/platform/samsung/exynos4-is/fimc-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-core.c b/drivers/media/platform/samsung/exynos4-is/fimc-core.c
index 2c9edd0a559b..57e573949e54 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-core.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-core.c
@@ -1020,11 +1020,15 @@ static int fimc_probe(struct platform_device *pdev)
 static int fimc_runtime_resume(struct device *dev)
 {
 	struct fimc_dev *fimc =	dev_get_drvdata(dev);
+	int ret;
 
 	dbg("fimc%d: state: 0x%lx", fimc->id, fimc->state);
 
 	/* Enable clocks and perform basic initialization */
-	clk_enable(fimc->clock[CLK_GATE]);
+	ret = clk_enable(fimc->clock[CLK_GATE]);
+	if (ret)
+		return ret;
+
 	fimc_hw_reset(fimc);
 
 	/* Resume the capture or mem-to-mem device */
-- 
2.34.1


