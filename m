Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E81C5DF84
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 12:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m5rcVtiQLnt3VEN2AX0Md5NlpG4+1sGiLWVrJiGlP7w=; b=wFzWHua9KhzKcO9PrO8cGk6zRm
	NzoyTcKoD60Wz59d3wkMTgqXD5AU4nLtpj6gaduwZVRcOO5RPTXNO48QjJRp/GnsyiLnK3HdbU0aL
	eTX2HZvI/JI1o8UjXwdJJkb2XWeVHNuFJRZbvv4lDsvE2MR9OgAhDqzqN1x19+/vt5IVTTAGHHXMa
	HK13/KDmEbenS0O+I3/1QqhhY6ObNyekjrooROrmZkMuVOmQxvDFqM+yMBLeI7+3jePz0eWNq5pNJ
	zC9nOvF+/HiSAgVvFp5+5Jbahz183gDw84n7Bj45hKCcQ8bTr1rPrmWfL1BDqEcryUlgQu1s3sDlY
	LOJPv1pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJ86-00000007wyR-3R2L;
	Tue, 18 Aug 2026 12:41:22 +0000
Received: from out203-205-221-191.mail.qq.com ([203.205.221.191])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJ82-00000007wx7-488Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 12:41:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787056870; bh=m5rcVtiQLnt3VEN2AX0Md5NlpG4+1sGiLWVrJiGlP7w=;
	h=From:To:Cc:Subject:Date;
	b=abDWP8b8eJ1fIsmYAwYyrz2ck3kfvOzih6DUMC4wc++5b9OtTP/MR+AsEx/3XsL92
	 2kE2a9aiY/vw+afDm9kZQFHFKi0xLfRjsA6CYkgLjcQj3NLhHxzXgwWaCE5eesAeYL
	 dSeEE5yXveFI9VnaswkhwHFBBSXBx8HkgVC48usk=
Received: from ws006419.mbzu.ae ([5.195.0.150])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id A461E274; Tue, 18 Aug 2026 20:41:06 +0800
X-QQ-mid: xmsmtpt1787056866t8cwa492e
Message-ID: <tencent_989057BAD94EB58027BF7E9528F59A458608@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+ns0JZzteoZ2m+ovoHlih6Hs9bsSfJ+vpOD0RYPBtLOZLQmATCy
	 8MTR7O0d5LH682Mrpm4ItUB4P2TJYiBqtpWGU9CG3vVlz7CoNQ4VgIV/dcxVRm6KCp+/0BCas+HK
	 WC7ocWsxgBXfXNJec0WroTxpuMHR7adfUdpn/XEbP7Cm9+luQNI/p17/0t5ZFr0l9cX2nOQtbJZw
	 80BWyKDPi7K+ibmOkNMf48FIg383cjW9uL/7QxlD6lmH6BuqintZUaCGH8lM35ZGK3gDvlmo9+W1
	 VR0QMh/pcVKr8f6WXj754X3t3+O80Fm/t166fPLpM3vx1JPRUybJKLlaloAArwV3EWhQ01y8iCdf
	 uJHMlieWYH34b+CRxZlV8r8cNhVY7qX0pqFL4p/XXGi9IC9NX7xXb3KNJqFLnbIa9rFB8mI0fNJt
	 JacfcqfV7KMjrClnAfQonS8cFRJKK6ArWW82PiobWXc1pKplGzIyUI7RA7S+frfpexBJXP3V2Of9
	 scVZT2RReMDlt1yZTijAxPuxtWMeMYAE8HXdLUMd0DkxYgxEcFdFycrybPKmJ7sajZ2GAFsHdk5C
	 ZU7nigR+TxdeEKW0APQdPeyW42D8EM4ncDW7ShgA/F3mCcJskXt7TCliUKgfqHeDmz3BiIqT1TPf
	 7YPop1hJZqx+27NzhkVtnfMMC9c688i4rfQaqtblYlCGiHQUA01ex+apPz+rvcWf1aVO4l1iE3Qz
	 vCOrIVf5Hlac2y25/t+avMYvzaJPQxGYv/XwuKW2LtP271nKMSfKwClHRvpgOdiHF8xIiDsD3CVF
	 mLnHRxD31V7AHhsrcnOuhcMbBdS54OZL8clvYmT1EihZFT7oey6O2twqhKvVlXboLdTXQNImokC7
	 x1MIVkoOzZc7zHY1jcEBIL+X8dLu112GF/NDQwZyyyMUgDsOzgyCwTWZKp0t8iE0nnWM5tzpFLGJ
	 A1T5VIMgVjAnmgVPSEZvp1Zz77FJPztBud30CH/0Hw3l/eY7OIZjxseNpO8xMHO+yZso+fT69dRK
	 8R1i18k95BE89HKPLsxGK3sTKhrvs=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Jiawen Liu <1298662399@qq.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	jiawen <1298662399@qq.com>
Subject: [PATCH] drm/exynos: fimd: fix clock leak on resume error path
Date: Tue, 18 Aug 2026 16:41:05 +0400
X-OQ-MSGID: <20260818124105.246447-1-1298662399@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_054119_337779_D0E1E969 
X-CRM114-Status: UNSURE (   6.32  )
X-CRM114-Notice: Please train this message.
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

From: jiawen <1298662399@qq.com>

exynos_fimd_resume() can fail when clk_prepare_enable() succeeds for
bus_clk but fails for lcd_clk. The function returns the error without
disabling bus_clk, leaving it prepared and enabled.

Disable bus_clk before returning the error to keep the clock state
balanced.

Signed-off-by: jiawen <1298662399@qq.com>
---
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -1325,6 +1325,7 @@
 		DRM_DEV_ERROR(dev,
 			      "Failed to prepare_enable the lcd clk [%d]\n",
 			      ret);
+		clk_disable_unprepare(ctx->bus_clk);
 		return ret;
 	}
 


