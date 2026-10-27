Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F36606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 03:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ehwLE5xM;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Ic3OyrLY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DiTPXO5xVu0vGg/SOQMr/bg19yBbPJ0qj2Y96BQ/D0w=; b=ehwLE5xMVNF2Tak6KjmXGu3RRN
	cn1PjlcIb8Fm/YJgiUvRqvI2pYRlrbObuw4vi3NG6PrKqlRk1onmqwAhzve0PtPFnRozaSKlNuLBl
	03sOgiLCD2B+CRyZDuuEE179NHMaK69DYKTsRLv+5jiQa/JMBoZ8AcObshwgs+0xHhmrAQjHheC2V
	moklIOlWvKjO1tZbWxPjZ1lx/FswCJK1pRppufKZwMV56VWvroJNVd45bV4xOi99E65Bcf479s0eO
	Ry3MTzFvEUVb7H3G2u9PC4uDde0Xt9lmPOIzjJsm1HzkFSg65jk6W1jdLysh7+bPbfxG76HczgHtU
	ML0pz2fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLXm6-00000003guy-0uzV;
	Tue, 27 Oct 2026 03:22:58 +0000
Received: from out203-205-221-233.mail.qq.com ([203.205.221.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLXm2-00000003gtN-0lEi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 03:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793071367; bh=DiTPXO5xVu0vGg/SOQMr/bg19yBbPJ0qj2Y96BQ/D0w=;
	h=From:To:Cc:Subject:Date;
	b=Ic3OyrLYxyoXcCpOxbkR5LLt90d9yaJ6tb3/LTN5pKTAb55ZwmhTtKh3E2mOExNdP
	 Ew+GIlX09fyIA1QWsLYJbVqa6crW9zLZw4uxEhyZNc5J1YlGDTRJNiSKv/EC5nfDwN
	 RLb7EifbSA7vDWlpoDIDUYVDGIbirpb1x+SdtM00=
Received: from kernel-lab.tail5e91bb.ts.net ([2409:8950:57d:63:ad3c:addd:6586:2a94])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 5AC19A76; Tue, 27 Oct 2026 11:22:44 +0800
X-QQ-mid: xmsmtpt1793071364t85lw5a1y
Message-ID: <tencent_592E3D2D89322E934E28FE593E67826AAC09@qq.com>
X-QQ-XMAILINFO: Npb+f4q7yCDRDd/jO7WSCn6CUiMMevd6fSeZ1TZYAoiOzwH3/m5M0kUczkRqnP
	 gPmSuV4rsoB1Gz6YA90xTuGXt3ao0QRQbsSYpUY88KiowXNMSvABKGGy+Y4bxOI2ZOMPVOzJdiHW
	 dXI1ejT+A7imFZH61+7pa/glZY1YDRue0LIpE/Xuu2YyfitQqKMgAUkGgSAfXPh3hs9yXdH/oHU/
	 4EkE/Wr11sbqepjqxGrEBMP/1tVhRBa3qKg1dWbrAnpYSM96JxOdC9hOVnif914MPhsbDF0PM8oX
	 IXKkIuoVQLAqS8+sIPVlb587zuLZfL8ttGh2xheDl7oD45PgzAyl0U++JW+8IDm40xqbdMA3Hgqg
	 1aCrInPM7kCOhQ7WRT5js8sIxLMnxVZ+SVRUCE17Psbb336j37pWIvZsku5+GStqxOeOQ+cELDZj
	 DntZeYbdFT5tuXAGTolmHdiGFbFTBuyqtcXJyQeEIgeqz/GwS06cZgmtF5Uyr+F09QnDwHHYVcCE
	 zUf9+CHY0HSGydrnrwZ+cHqRv5lZ8Fm3xByh8D9XaLfv4Op3xjkl75aticRE75MTpLieUiLw9oGP
	 l7qDjFoW/tkxX91+vD5GuFlPu7v3IBxDJU2n4xh2xOk+hxtLsdkceZ2lTUBft9CLwXdzThTC8zDA
	 zMM/Ft3G7LZKB7/IyscQnCF4N85UfliOrSsB+A4r+Qx006kDIi3ObBU0mlQ6Aqx0pN4Aan//VRoZ
	 kaapLMBT1j88tpM6GYiVYcnjDZPefxhMXA3XH0ShxRRWw6cMQa2ujwS+FjjSRcdKarVQeq9DhqRS
	 cN6Kndb3yQZ8BFEGh6p0E0CwtRUQiIVKVmwoQBGWWR9Npfxzig3PLJtJs/OsYeml9mECRuItzTJk
	 j7/AMUBSIIQkbbeDsa3+qBaOc82SqW7l230vGlYhEKRe99LHP6Vsv8uuaSm5KPAb+E7rtZTotYrt
	 gwnDagVVv6zClwHPFTpxrxwwovwqCP0/wMJghAt5QlJ5WXQL5fJoZgmGbjHTfioAR1UkYxnyY/l1
	 /G9jkqdwgKyYQFQNUn4oc3wfGEUxoai2D7KKD1JQ==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Yingjie Wang <1075151112@qq.com>
To: will@kernel.org,
	mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bbhushan2@marvell.com,
	gakula@marvell.com,
	gthiagarajan@marvell.com,
	stable@vger.kernel.org
Subject: [PATCH] perf: marvell: Fix DDR PMU polling period unit
Date: Tue, 27 Oct 2026 11:22:44 +0800
X-OQ-MSGID: <20261027032244.3333338-1-1075151112@qq.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_202254_529857_AE177026 
X-CRM114-Status: GOOD (  10.67  )
X-Spam-Score: -1.9 (-)
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

The poll_period_sec parameter specifies the overflow polling interval in
seconds, but cn10k_ddr_pmu_timer_period() multiplies it by USEC_PER_SEC
before passing it to ms_to_ktime(). This makes the interval 1000 times
longer than requested: the default of 100 seconds becomes 100,000 seconds.

The driver relies on polling to handle counter overflows. Delaying those
checks can leave programmable counters frozen at their maximum value and
lose events until they are restarted.

Use MSEC_PER_SEC to convert the parameter to milliseconds for
ms_to_ktime(). This corrects both the initial timer expiry and subsequent
polling intervals.

Fixes: 35a43326a9e3 ("perf/marvell: cn10k DDR perfmon event overflow handling")
Cc: stable@vger.kernel.org
Signed-off-by: Yingjie Wang <1075151112@qq.com>
---
Built drivers/perf/marvell_cn10k_ddr_pmu.o with W=1 for ARM64 and
x86-64 (COMPILE_TEST). No Marvell hardware testing.

 drivers/perf/marvell_cn10k_ddr_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/marvell_cn10k_ddr_pmu.c b/drivers/perf/marvell_cn10k_ddr_pmu.c
index 9b68d6c1c31cd..31641a21e3792 100644
--- a/drivers/perf/marvell_cn10k_ddr_pmu.c
+++ b/drivers/perf/marvell_cn10k_ddr_pmu.c
@@ -516,7 +516,7 @@ module_param_named(poll_period_sec, cn10k_ddr_pmu_poll_period_sec, ulong, 0644);
 
 static ktime_t cn10k_ddr_pmu_timer_period(void)
 {
-	return ms_to_ktime((u64)cn10k_ddr_pmu_poll_period_sec * USEC_PER_SEC);
+	return ms_to_ktime((u64)cn10k_ddr_pmu_poll_period_sec * MSEC_PER_SEC);
 }
 
 static int ddr_perf_get_event_bitmap(int eventid, u64 *event_bitmap,

base-commit: 652ab8ee0d27f21a5f402a0b6ac227c8bbfdd64c


