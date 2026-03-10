Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF9FFD2D62
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 12:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dAaAL2bSaHFST8Z7y7B5rVa7Pqgb3PRmEPcRCp/FoW4=; b=BbFTDRe9QnmaTpG9XcEzAUUjGc
	319iez1h6BIRkaE0HAGVkv5wquLWLvjRfurwtgn7zGO0vKOjz/ByskNFW2c3hu8A0P9O+Dr8X869n
	izifiAEBzfwI+/4DZ6ssSPlGgsJm4gjBUCfo75t4vVEFfsOfITM0LTItp1KiHETGORZv+PXvfhV8l
	+SSM7A/FY7JKKoQlpbuOAIgWi7QRNREB9Hpd/blru/dignsTllTzWRae/idkSSozRO+qUIIN7aWT/
	/QWv19VXfKjIa2booehJkb+6roTplyahQJchFG5gQ4twG+PefO1Ouyvu00zMU8B2x+CMVfXS+GXYU
	o9dGo4jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvvu-00000009SO5-253w;
	Tue, 10 Mar 2026 12:11:30 +0000
Received: from out203-205-221-153.mail.qq.com ([203.205.221.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvvq-00000009SNT-3rQj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 12:11:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773144681; bh=dAaAL2bSaHFST8Z7y7B5rVa7Pqgb3PRmEPcRCp/FoW4=;
	h=From:To:Cc:Subject:Date;
	b=iZOBWadU9HQUupzCULzgof97sJeTGwEZStwV3dHyKW7zz689kglZ2MKKnVun3ZLfN
	 nI4bNaq5swOLMjcVmSuTt1KYrC27buA4s3lc1abZbAIzg9BLNKp4+d+WWpSUbXbI6q
	 IeQieKut+UNgmnra3naqj5nio2/8dltExSuC8Rnw=
Received: from June.localdomain ([123.121.145.35])
	by newxmesmtplogicsvrsza56-0.qq.com (NewEsmtp) with SMTP
	id 2D22C8B4; Tue, 10 Mar 2026 20:11:18 +0800
X-QQ-mid: xmsmtpt1773144678t5qus6dj6
Message-ID: <tencent_770FE404794D670E2ACDFA144EFDA35AC305@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJBOgVfCMaPom1z1vdwQSoYB1zGpFNKYpnXZmwXGoubgpCDvQClD
	 joVU98FQEheYN78vjc8/kNxRrDf7yWqDNYcuDV+Ddw17EqXPyHMIYLFy2f4qAobGbOmtKXODuJCo
	 n2SbtZ3YmvccWa6+vuGoo1ZZWmVBUK4A6K3ui3HL7ozotj+qgesAnXJZ8RWe533ym3V7mAM4t8En
	 01O7gAitaotAN2/ljZc4B5mg4k/G0cP86SGDqzz3u9YlEemcguUESI6SJ34Q7i+tBdZNC9GMlSxx
	 GoPYs64mk0pyDc5kdJwyPrzZG5t5Vd+MnMOilA4tVpG9biqCIMBgmweYvRZOdDETi0U3ghJQ3Qcg
	 dq5+2lBMh+nZvXMJbNgZTLXFT16RHPwcJhhYEqhHMC6GClhS/K48wFBkOBJUeZNGrwBbX3ep72mn
	 p+PWIoXMVRQy4ogaAA5Imq9Fx6Ms+DP7Ua6sI58T/P/8SyRFe9qZl1Jchc+qLZOV8MrFCfmGivmr
	 boDQ4TK6kF9AIDxIuJl65doHM3fYCQlyzvwnxfY0N4pR68kcfmzmKPBYxZqjnGFmMZZw5DdNvgUL
	 NLKsSdCDlE/RT2jhG/9neuL9IzXkNz9LpoUwz+2jeWo80Y/XiITymbVlPUCQcd0KCMxFufwDjdly
	 SxASAOxuK9gER8iW+Mknal1aH6GDN9/iWhzkQwEJ7LnZ0hyRZTHwek+i4nAiRAUnz5BF9LRjkndr
	 qf9zxyBGLFJqABAPd+B8p+ng50xsaqwq3iLrBheG6BQhGmdoXY988tpoin1ETEqUyxQKeFziHdE9
	 ZZIdK7Yk0rB+x24Pvtnwn4Uh9v1FHMZLz9dabK/QMbkg9TnSvDBGxF/om4AWb+vw6/V1CNNRoboK
	 sYkWhmrxK7XRFwaw+b+OZMahMYt4ohFSeX8jpySl+zfOejl5pd8mltOR3BaHlPoxbMHQP/1IVk6P
	 rppfGd+0UCJb6eVU61NYVMuvwgN7Jj5ybEhsbsMZF8/VrrKaLjU/3UEKrUdnIsSCj8biywlcjHgM
	 hQd+Vc3HWWpgUUCbSzO3JMHVR65i4iP/h/i5FTp0JwCLdCo3BB6oLSmKPg2PZNFUA4bLgXCg==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Wang Jun <1742789905@qq.com>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn,
	Wang Jun <1742789905@qq.com>
Subject: [PATCH] soc: fsl: qe: Fix potential NULL pointer dereference in qe_reset()
Date: Tue, 10 Mar 2026 20:11:14 +0800
X-OQ-MSGID: <20260310121114.34906-1-1742789905@qq.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_051127_315598_87AF1B9E 
X-CRM114-Status: GOOD (  10.26  )
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

The function qe_reset() uses qe_immr without checking if it is NULL,
which could happen if ioremap() failed earlier. Add a NULL check and
perform ioremap() if needed; if it still fails, print an error and
return to avoid crashing the system.

Signed-off-by: Wang Jun <1742789905@qq.com>
---
 drivers/soc/fsl/qe/qe.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
index 70b6eddb867b..6dcfa340970a 100644
--- a/drivers/soc/fsl/qe/qe.c
+++ b/drivers/soc/fsl/qe/qe.c
@@ -86,8 +86,13 @@ static phys_addr_t get_qe_base(void)
 
 void qe_reset(void)
 {
-	if (qe_immr == NULL)
+	if (qe_immr == NULL) {
 		qe_immr = ioremap(get_qe_base(), QE_IMMAP_SIZE);
+		if (qe_immr == NULL) {
+			pr_err("QE: cannot remap IMMR\n");
+			return;
+		}
+	}
 
 	qe_snums_init();
 
-- 
2.43.0


