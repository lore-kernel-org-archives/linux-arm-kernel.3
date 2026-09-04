Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C48C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uoOzDZAWnJsWiO6JD2emY2QKQ6LRtpmLOtpWO9+xJq8=; b=BzsROrmrKzKAPZgUUpMJLf5qBQ
	4RlkLMLcE3C/Ey59zwIjtGnsQL08+C+g4IoEM7feqLCuEUihPwc4eaqB8ZYv1ddyN8IJ2p9CZ4agT
	Z0fTHzRSCnfvaPkxoPIZDgcbEN5G/TJaWYinW/5SnLIgkFoFCytOqfZMcgED30lgFMzbjxMHLHzaz
	iUBn3Uq6CbsMAyE3ptrBanfJaewledwI2qEYboonRKPiH1xjOSbSRgklsKQSMBTh1q13shM3JMS5I
	6EjzraSc6/Ca1C9G4z8lfQ0uGKbyk+ueHJNxcJyJhr1ojyDvtFk/5FsW33d62SwvqjhVx0/vV221Y
	PhPeamUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Qkb-00000001bzs-0GmR;
	Fri, 04 Sep 2026 10:02:25 +0000
Received: from out203-205-221-202.mail.qq.com ([203.205.221.202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2QkX-00000001byq-38wb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:02:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788516134; bh=uoOzDZAWnJsWiO6JD2emY2QKQ6LRtpmLOtpWO9+xJq8=;
	h=From:To:Cc:Subject:Date;
	b=wVlWozzEeHit9IYGEMHlTPXJfCEx6K690QjWoK2aiG3kA666Xb5W1iHW6kLT5MW+g
	 CvSVUiHlHh3yQapOK42f9WWBlJ8yUiAhsn8EWrqgsHydg+j5KVJ34yoeKLpWrp6Wds
	 89pFq5U3gD89nnw2zhmz5uCuj6K/3uoZ7/9GRvvA=
Received: from ws006419.mbzu.ae ([5.195.0.150])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 679E487; Fri, 04 Sep 2026 18:01:39 +0800
X-QQ-mid: xmsmtpt1788516099tz2afw6ez
Message-ID: <tencent_B0189529F550458590E3BA614EAB800FBF08@qq.com>
X-QQ-XMAILINFO: MqrcRCpyXC2G804zZZefQ1CweJmOuOcT296XVGv53lkvPGThFIeOAQvAZexdZT
	 ZF2Q8MdzCBXv+rWpJt9uV6wsp7j1a5NIkhCleh2p/sGxft71k04XZkV+aUnGGLQkfZUbg0YbI2CA
	 D+ROGP0+oxW0aRzbxtMqncStyzmmDh4v1EvaXmuhHyNHpTANKRfFct3JsDMWJrQd+QkuxkE2ujf1
	 NJRvE5dXY20JeH+eGz1qd/sQb3x2X+DVn2fxvMGiuRAkSHKiTZaBXFtV+RA91RKuH891/ZD6Is5U
	 DB4e1cqV95LAVSc1GIQVN5A5brsb8mKiC3hcE2qq/GZ7y+uEGV8Ne0W6QD649yqYsZ82D51ShChC
	 P+GP58j4Kjq9zukp+C6/F/rPQmPP2lSNXsAko1VXHbXUuGk6dP/iEAFIxCfJiZ6dNDRsZMC/xPb9
	 UYEzbbsWQmdRC/Cw84q3YhquUfL+sai+SkzjNJFCvrkMEX6caVJRxaY13NUUh4imNxFNYkpD9Vxl
	 3pjhzLutPE5qjcMf3xMAfqsp3/B6MFBFqSA2cZKZL2ocmiM4nN0h+7WxAqMQp8hS97dWpOrdLyJw
	 4GbljK6gAGTDe7eWr0Fj0+CKJUwn0kXHJwBI+JxR4HluNxAEWHpR3M+IT2IDywExrgk0zp/pBRQs
	 FoVR/yk8GLzVkycEvLziQwoJkfw4CNGnsMrwmQJN7ozD/kTQ7gz0cmbL1CNyJ28SidTlMRn5gHqv
	 fCKCdIf7kcoBpQnQbG5/JLzm6vMmL0tLXmeVG67IsYQrN05MR4V6LhmcjH4BLRBoNbZGzfczAwUg
	 2pVNTp9fle6GE/HXaJ0udOOVuNQzFhQAC9ZKcHuL/buI5wermR1IvMegFmeZnu6ct4yge+3rSAqb
	 Z9hUYpPIr3OdTqRip6dKE87o8jZ2XtjzN5ASjJFmhnGEaWLc9tWEiBW4gmzGox9nArXcQYw0xbBA
	 ALc8sIdQ3H2+EqSDsF7OWXUuLtx9bvROpQ/ecf59uBpMcXv5oA9MLDbT8wPastSOJiXHuZlUqw01
	 tFWfbVQ241n1p3FAKqbhMpw8e784O1VNKMZPg2PA==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Jiawen Liu <1298662399@qq.com>
To: Lukasz Luba <lukasz.luba@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	stable@vger.kernel.org,
	Jiawen Liu <1298662399@qq.com>
Subject: [PATCH v2] memory: exynos5422-dmc: handle clock enable failures
Date: Fri,  4 Sep 2026 14:01:35 +0400
X-OQ-MSGID: <20260904100135.251091-1-1298662399@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_030222_097322_B55E6AEE 
X-CRM114-Status: GOOD (  11.50  )
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

Check the return values of clk_prepare_enable() for fout_bpll and
mout_bpll.

If enabling fout_bpll fails, propagate the error. If enabling mout_bpll
fails, disable fout_bpll before returning. This keeps the clock enable
count balanced on probe error paths.

Fixes: 6e7674c3c6df ("memory: Add DMC driver for Exynos5422")
Cc: stable@vger.kernel.org
Signed-off-by: Jiawen Liu <1298662399@qq.com>
---
Changes in v2:
- Use the full author name in From and Signed-off-by.
- Add Fixes and Cc stable tags.
- Generate the submission with git format-patch.

 drivers/memory/samsung/exynos5422-dmc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
index 788d49c688b1..98c319552583 100644
--- a/drivers/memory/samsung/exynos5422-dmc.c
+++ b/drivers/memory/samsung/exynos5422-dmc.c
@@ -1297,8 +1297,15 @@ static int exynos5_dmc_init_clks(struct exynos5_dmc *dmc)
 	if (ret)
 		return ret;
 
-	clk_prepare_enable(dmc->fout_bpll);
-	clk_prepare_enable(dmc->mout_bpll);
+	ret = clk_prepare_enable(dmc->fout_bpll);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(dmc->mout_bpll);
+	if (ret) {
+		clk_disable_unprepare(dmc->fout_bpll);
+		return ret;
+	}
 
 	/*
 	 * Some bootloaders do not set clock routes correctly.
-- 
2.34.1


