Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88322C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 04:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/+rtWKcCLn/Cu93OBLz7j1Rt6rH+SNavHX1FpALhJSY=; b=QmY4j0t4+FT5jPAyb0DWteI6Z/
	d0w3sQ89O6D2Ei7SZqWkcwod57EpL74ELBBK+F5a/fGdl7TplDZ6ZsxBIxxejS+vUtwt69kUhWtCs
	/OM0x53j1negiguZuKaZ2nHVcpgrvZ+hSbAEFnD+CFF9IASsbskyw3i6N2hcp4EBr42kn1noM94Qb
	eZH4ewPGJdUAQjfzqr55TM/BFQuDdNK4+3SAoEXgHq76qMBCmh1dwZ9agyivo/a3WwkhJoHgpljV5
	76nGmtz4rKS+DZ9HylKeykerQNsNwfoujGqll1B0UnLQMlDnfNnktFjrq3o9lit+CPsxf8jxJnO30
	C2iWsmcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYdYj-0000000GxNl-2TvF;
	Fri, 17 Jan 2025 04:02:13 +0000
Received: from out162-62-63-194.mail.qq.com ([162.62.63.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYdXR-0000000GxEA-3WJK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 04:00:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1737086434; bh=/+rtWKcCLn/Cu93OBLz7j1Rt6rH+SNavHX1FpALhJSY=;
	h=From:To:Cc:Subject:Date;
	b=COF+b5FnAgbVPrE3jXG0ubqb6CdH0oaRvrfOe43d9kKxK0WA0a3FOyk7BJLXKJ5uw
	 3c0irAOEzcHqwKrZZY1vqPJPUNutANRDPcGtVf0ec7i0P26nzED94yL47WmRLKOzuz
	 j4529YRJGXFmhFboCB3K1AEp7LLRSprXvT3qJ1RE=
Received: from localhost.localdomain ([116.237.13.216])
	by newxmesmtplogicsvrszgpua8-1.qq.com (NewEsmtp) with SMTP
	id 1F8EE19; Fri, 17 Jan 2025 12:00:31 +0800
X-QQ-mid: xmsmtpt1737086431tkpe6do49
Message-ID: <tencent_9DCAEBDF4D9BCDB4687B502DB6B608E4FB0A@qq.com>
X-QQ-XMAILINFO: N2T7jyym4eG7X9LX5KZWWl5V7vOxB2YQG9jMMQ7T61G3EQmbo/ibpbelN0eq2I
	 a/KlrK5GiETi+6ZJTO9C2ZP1nLYorrlz9OfJASzDZdDaBU6I3xpMHuv2+ND4ocXIexYyUMpzNTnW
	 QjE78JGFh6dTsHuEVtK5H+IIIgh+63kYwMgQAP6ZcWK0JQFKSc7BP7TDxsq2Cb3xuthGrNj1DNi8
	 cr7XTqncXkU56D9v1SKwPc07vUYP0kH1UG4/BaKXRynv+b8up+s+ZAJsKxMQxFtmL2jhxT6zfZMn
	 1bijXBd6IDAIR9NrWsTX01wBiKrPyPUoOQmn+WsujG1hnZqgO84L3yjGRSWJoHohB4aQJQtu56V8
	 1f4wsB0Nw0XPHOYJsXxPBerPs03XVXnkSBkTx8E8A1m/UB0+tUHuYr1o7nXNTrWxOTonnI7V+x4i
	 0CleXEQ4BM14fM5/dkAc4Yzy86EamoRJ7Nd8fWkfv0BFZjAB/6nelLS3WYLm6CyGyyKFi0HNNdu1
	 7dR30dYLCDl4AuLkmD3yTn9ABWEKjPfitaNzuPG6nGabpGWYvP94/V+i70iAKWqxrCUqhyeSGYdd
	 L/yuECc4X0Utd25pAd4TkC5Hwd+foNYnaq1LN8wZCfki0G8dVwxHLIAoDH+whECgtl9y3GVzopKb
	 1Y4QYQzoz5jV7z0BY2gkGsyz99RL1wPtwdbCK9Vv9Fh7Qn24Vtky34K8Ii6ChPvxgkRTQpD+cUwt
	 vRzgu9+Q3JcViU+IsS39UFtEpiF7eqR2gU3Ut6B/v3lw8OygeWqFtqVj5jdrzWzXzVdwv0b3AP6l
	 ysSOSLa1MRqjTm3tSYH8w6ehNh1bOjmIiUgqfM80t5wPVVwuaKal03T4EU4LvR3PRj4j1CtBO1Sc
	 iTi78GTcbRfS1ZDO3v39pCISOGCpGWtSxFwHTKK112brXOMxmTeJ1+a51n0L+9z0FRgKVGRMe8O7
	 tobKZU14s=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: 1534428646@qq.com
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: mark.rutland@arm.com,
	kristina.martsenko@arm.com,
	liaochang1@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yeoreum.yun@arm.com,
	"Yiren Xie" <1534428646@qq.com>
Subject: [PATCH] arm64: kprobe: fix an error in single stepping support
Date: Fri, 17 Jan 2025 12:00:28 +0800
X-OQ-MSGID: <20250117040028.763587-1-1534428646@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_200054_460398_4FAF3A12 
X-CRM114-Status: GOOD (  15.02  )
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

From: "Yiren Xie" <1534428646@qq.com>

It is obvious a conflict between the code and the comment.
The function aarch64_insn_is_steppable is used to check if a mrs
instruction can be safe in single-stepping environment, in the
comment it says only reading DAIF bits by mrs is safe in 
single-stepping environment, and other mrs instructions are not. So 
aarch64_insn_is_steppable should returen "TRUE" if the mrs instruction
being single stepped is reading DAIF bits.

And have verified using a kprobe kernel module which reads the DAIF bits by
function arch_local_irq_save with offset setting to 0x4, confirmed that
without this modification, it encounters
"kprobe_init: register_kprobe failed, returned -22" error while inserting
the kprobe kernel module. and with this modification, it can read the DAIF
bits in single-stepping environment.

Fixes: 2dd0e8d2d2a1 ("arm64: Kprobes with single stepping support")
Cc: stable@vger.kernel.org
Signed-off-by: Yiren Xie <1534428646@qq.com>
---
 arch/arm64/kernel/probes/decode-insn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/probes/decode-insn.c b/arch/arm64/kernel/probes/decode-insn.c
index 6438bf62e753..22383eb1c22c 100644
--- a/arch/arm64/kernel/probes/decode-insn.c
+++ b/arch/arm64/kernel/probes/decode-insn.c
@@ -40,7 +40,7 @@ static bool __kprobes aarch64_insn_is_steppable(u32 insn)
 		 */
 		if (aarch64_insn_is_mrs(insn))
 			return aarch64_insn_extract_system_reg(insn)
-			     != AARCH64_INSN_SPCLREG_DAIF;
+			     == AARCH64_INSN_SPCLREG_DAIF;
 
 		/*
 		 * The HINT instruction is steppable only if it is in whitelist
-- 
2.34.1


