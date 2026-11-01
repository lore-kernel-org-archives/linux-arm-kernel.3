Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFC9606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 20:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wA3EDy3q;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTUT6C8e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=r/raweGofl46CtJCMVWjd1et4wuYTKczZRtzeHYjdwg=; b=wA3EDy3q4J/6RwVDWI3XQDBfQX
	qrOdVcfHOcao7zMPm0K8n/4vqog6nnTOEIkKcJHSgXgw6BauuURjCf5EvTXqZwkNHtgzNQoaCJymV
	o+mN+rWxEOG8bAObRkN+77eTQpgk3af9LnMZ1R9rX6L1vMDVEWe3vLueEDRlotkHEPKXO0uy8YjE6
	PHHInwgTRjiEr6RLjYFJXIkM2C8Yso/cplvREVaSKnlkVWb9C/AAuziQuF/fboxxYYQCG578NnIgz
	TVxWKLWHJoRPLkda9oUNX1RQG9pCbb3QaVCh0KykPUsHn4rvN5Ft5su/xEg1VtcEKg7tEHtlShdEo
	l2dkAxfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNcFK-0000000Esl1-2psE;
	Sun, 01 Nov 2026 20:33:42 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNcFI-0000000Eskd-0xcA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 20:33:41 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48dee593f18so2123244f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 12:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793565218; x=1794170018; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/raweGofl46CtJCMVWjd1et4wuYTKczZRtzeHYjdwg=;
        b=kTUT6C8eYyfUQeewF7LWSPBztGPfxy273xdhdjPL/wJLKNIQQmWCEnhKTHS9Qi4jHi
         sYvVLwmFBLKAne5onujXbokwQbYRqhLKWSKml6IO/FzSVuqKPOcp965KcRr/7Q6ABhBe
         ZTyMlMeO5pNF1QIOJhWGnQ9LaIgJRKIsZbxsijcIB87pCz6Ijc3BbN+XWUR1KDCi/U9w
         Negw5Md1J7opo5lj028LJ7Q2XPrc/77TWYdVRTpl3W15yPCxzQissctgUxTo3jxMzWiy
         n/v1XoQd6/z6VGmWcjMXc0YThhEAGhMYX3HPDAEnYkf0QR5QIuZ0h3YVu6SUITC6+Rmo
         KOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793565218; x=1794170018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/raweGofl46CtJCMVWjd1et4wuYTKczZRtzeHYjdwg=;
        b=vkJd4UoTjC9Yz9dTve9P1lgnQWmyYNf0z+cMnkt5YWSAdmuEoa7ehuSbtlIrWNLxF+
         rddhGNx9tqkM4SLyUYieG07rAicHv6R02NDwo/AJyYgJ9PLTMIzBKGGuQL+BtB6pXIn2
         lR4Gq90+r31yMgmuZAiiULZBuV4ocztYJImCWb14pc2zGNXMyxIdoFkt0lM/mZuiBLnz
         pW4KsY7iErN8gajGM1Hjx0EEhvSiSOpJClSjxJ7c0BlYjAOL6q+EYvK824qLeUwfYugb
         aghDGfN5NJIiwFqDf3uRRBGKDyILGSnf0QvwqoqeFg9BThRXi24blGhkyYKCxGo26Bvg
         2ztQ==
X-Forwarded-Encrypted: i=1; AKwUvBwl7WdOLrZCoe7GsyAMB5HxTIc40KTrJ2bUbZpNybXS+5kfnheTjGxqzcKuizV6HRxyRYje3nuQJWJI+GMFP7X9@lists.infradead.org
X-Gm-Message-State: APuU4Z89XCrFVbuCZThy/OO5XkB9KXkbwRVxvAuky7lIrgkDpD4s3eXU
	+wGrWJFi6JbBOsUJKnSt0CpABP9KpC+wlAlhDOWQ+yrLUd3t2v5HmtVf
X-Gm-Gg: AYBFou2Mb0shScfHJXnyJKnn2hRB54/RV8TgT6eJ7MAB6viEenFJnj0tmz0GK1Gy8uU
	4JlPksmMLt3qHr38C8fUEFbClOVPWzSs0OTaWtOvy/lu/25LyvT4ib8gyYk1BLidXUUOHpRvMPP
	ViXm4LfJM+ctPpkQPZYEVT9W8qeKi/dL2Fcp0xd0/gKUF+3F4atzYwrVc5VJr4Fa0xEs2Nr5vu9
	zMich3MyTeauJuEbsrEVWbRYXyDNJ+OHwcBGWG+TbiddZ4UoIkaJmSf4rvHc9trplmhT3iviwjJ
	oNoh6IJBwF0GpzcXOEO4ZCrHQnRCiKw07g5qu6fF195ZcsEHmCH6xh+wJDi4O6M4008D3TGqoNM
	MiCvrD1DAPKow46M7UYFaXAk8e6lW5S8dr+LJQ+WlbIKhHR2mgraHCWLXIyUcdJukvt8Z22LIYB
	jns9eZM8RRQkCiD5t99MbYTK9kmQrR5bzrIwyKpcwQldAkZHnTDTvov1MWyWDYLgFkcHW5fyx7j
	99KWe/j241dxYz9iBLX+I6pcOiEp07FCLpjUxF7agtLUkeqAd9lyA+3F7RxnZV1Yhtp7EuypLUR
	uex6gn+23cbnQrgXuhNPU7AzbIwo72DBricsYjnWWSHchyEIyiPktjgMeR4LDjzuiT+hACY50oB
	dS6YNVPJiOSit3ORSDY2kaYDzTeZLJuSHxwSt6vxPKiNJiDmwBYTQMI0SejU003uZPg==
X-Received: by 2002:a05:6000:310c:b0:48e:5cd4:aa60 with SMTP id ffacd0b85a97d-48e6e2fbc14mr20001368f8f.42.1793565218073;
        Sun, 01 Nov 2026 12:33:38 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:849f:a468:4121:a85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d5dfsm18722895f8f.3.2026.11.01.12.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:33:37 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH] clk: sunxi-ng: nkm: avoid 32-bit overflow in rate calculations
Date: Sun,  1 Nov 2026 21:33:36 +0100
Message-ID: <20261101203336.1360239-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_123340_351771_6364DBAF 
X-CRM114-Status: GOOD (  17.60  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The N-K-M rate code computes parent * n * k / m in an unsigned long,
which wraps on 32-bit ARM as soon as parent * n * k passes 4.29 GHz.

On the A33, pll-mipi (parent pll-video at 297 MHz) with N = 14, K = 2,
M = 14 runs at 594 MHz, but 297 MHz * 14 * 2 wraps around to
4021032704 and the code computes 287.2 MHz. ccu_nkm_find_best() then
picks these factors for a 288 MHz request, and clk_get_rate() reports
287.2 MHz while the PLL runs at twice that. On a PocketGo S30 (A33,
ILI9488 panel on one MIPI-DSI lane) the lane ended up at about
594 Mbit/s instead of 288 and the picture broke up.

Do the multiplications in 64 bits, saturating at ULONG_MAX, in
ccu_nkm_recalc_rate(), in both best-rate searches, and for the parent
rate request of the parent-adjusting search, where rate * m overflows
the same way.

Without the saturation, a candidate above 4.29 GHz in the search would
be truncated again on return and could look like a valid low rate.

64-bit kernels are not affected. On 32-bit ones, every N-K-M clock can
hit it (A31, A23, A33, R40, H3, V3s and F1C100s use them), whenever the
parent rate times N * K goes above 2^32.

Fixes: df6561e60244 ("clk: sunxi-ng: Add N-K-M Factor clock")
Fixes: 3492e4f6db5f ("clk: sunxi-ng: nkm: consider alternative parent rates when determining rate")
Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Notes:
- Testing: built with W=1 for arm (multi_v7_defconfig with the A31, A23,
  A33, R40 and H3 CCUs) and arm64 (defconfig), SUNXI_CCU=y and =m, no
  warnings; on arm the 64-bit divisions go through __do_div64 (no libgcc
  helper). Tested on a PocketGo S30 (A33) running 6.18.54 with this
  change, without the ULONG_MAX saturation (same results for rates that
  fit, which is the only case the hardware hits): before, pll-mipi was
  programmed with N = 14, K = 2, M = 14 (594 MHz measured as a 2x lane
  rate) while clk_get_rate() returned 287216621; after, N = 15, K = 1,
  M = 16, 278437500 Hz in both the register and clk_get_rate(), and the
  panel picture is right. This version, with the saturation, then on
  the same board on 7.3.1: pll-mipi again programmed with N = 15, K = 1,
  M = 16 (278.4 MHz from the 297 MHz pll-video0) and the picture is
  right. Not tested on the other SoCs.
- Tool disclosure: this patch was prepared with Claude Opus 5.5
  (Anthropic) as a coding assistant, in an interactive session where I
  asked it to bring up the PocketGo S30 display. It found the mismatch
  between the pll-mipi register and the rate the clock framework
  reported, traced it to this overflow and drafted the fix and the
  message. I reviewed and understand the change and tested it as
  described above.

 drivers/clk/sunxi-ng/ccu_nkm.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index 401fbb7524..e5a8f22d50 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -6,6 +6,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/math64.h>
 
 #include "ccu_gate.h"
 #include "ccu_nkm.h"
@@ -30,6 +31,26 @@ static bool ccu_nkm_is_valid_rate(struct ccu_common *common, unsigned long paren
 	return true;
 }
 
+static unsigned long ccu_nkm_calc_rate(unsigned long parent,
+				       unsigned long n, unsigned long k,
+				       unsigned long m)
+{
+	u64 rate = (u64)parent * n * k;
+
+	do_div(rate, m);
+	return min_t(u64, rate, ULONG_MAX);
+}
+
+static unsigned long ccu_nkm_calc_parent_rate(unsigned long rate,
+					      unsigned long n, unsigned long k,
+					      unsigned long m)
+{
+	u64 parent = (u64)rate * m;
+
+	do_div(parent, n * k);
+	return min_t(u64, parent, ULONG_MAX);
+}
+
 static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common *common,
 						       struct clk_hw *parent_hw,
 						       unsigned long *parent, unsigned long rate,
@@ -44,12 +65,13 @@ static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common *common
 			for (_m = nkm->min_m; _m <= nkm->max_m; _m++) {
 				unsigned long tmp_rate, tmp_parent;
 
-				tmp_parent = clk_hw_round_rate(parent_hw, rate * _m / (_n * _k));
+				tmp_parent = ccu_nkm_calc_parent_rate(rate, _n, _k, _m);
+				tmp_parent = clk_hw_round_rate(parent_hw, tmp_parent);
 
 				if (!ccu_nkm_is_valid_rate(common, tmp_parent, _n, _m))
 					continue;
 
-				tmp_rate = tmp_parent * _n * _k / _m;
+				tmp_rate = ccu_nkm_calc_rate(tmp_parent, _n, _k, _m);
 
 				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate) ||
 				    (tmp_parent == *parent && tmp_rate == best_rate)) {
@@ -87,7 +109,7 @@ static unsigned long ccu_nkm_find_best(unsigned long parent, unsigned long rate,
 
 				unsigned long tmp_rate;
 
-				tmp_rate = parent * _n * _k / _m;
+				tmp_rate = ccu_nkm_calc_rate(parent, _n, _k, _m);
 
 				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate)) {
 					best_rate = tmp_rate;
@@ -154,7 +176,7 @@ static unsigned long ccu_nkm_recalc_rate(struct clk_hw *hw,
 	if (!m)
 		m++;
 
-	rate = parent_rate * n  * k / m;
+	rate = ccu_nkm_calc_rate(parent_rate, n, k, m);
 
 	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		rate /= nkm->fixed_post_div;

base-commit: 5243bd55dfe63a5f806622878f6fbdd78172fac9
-- 
2.43.0


