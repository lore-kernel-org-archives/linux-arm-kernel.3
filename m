Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90494E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 10:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rjIk5IWPX/sFgqupdD4dSWcOuD6lN7+QBI/rBP5fj18=; b=rVKf0Zl/5XVGWwF2O3UV3WaRza
	eCX+sC040n8krQDCaqNuAYtgUG3jiCjdwmiJvI3pRTw46WWpzU8CGkWgNCGXFCW2zj3FDF4vlkpkm
	771aj25blDgwoelpOxSlMewkg5yE/6Uz03aYF3jaljCzrANfPluWiqOcpzuNYQpvZFwm8BgRG7+8G
	CQZbo0/xTqG+nzgqvuV6nhQdi2I8hixEkKdAJ1W/K9YlPGUqO18sKRhH07R2LQimqq1NDgaxkEzsR
	t7iqdoc2HxzTggB00WniP4n2UEZMMHmvZd/1kccT3HKvYOaJh4wvlGX6Wwx7vnE08gH2Mbz6Khlru
	0UtFfv0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWYL0-00000000Zdh-3fFB;
	Sat, 11 Jan 2025 10:03:26 +0000
Received: from out203-205-221-252.mail.qq.com ([203.205.221.252])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWYJm-00000000ZZH-2ya0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 10:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1736589406; bh=rjIk5IWPX/sFgqupdD4dSWcOuD6lN7+QBI/rBP5fj18=;
	h=From:To:Cc:Subject:Date;
	b=ayKACWz0WHnJhH7o+T/era1/U6932U7zK3/HftL5OOWKkP5UGF1hMXBhLSzRhl0W8
	 +/M+edKLdCxssfN7jc1cdQyceh/4Ib1ncPXL1n8wA3oc3TMgsFGNQGJuS/g37aqbgp
	 NKcVFpK/l/caryNMWKInl0IjaxuNtKN13Pp7Ud1Q=
Received: from u22.. ([208.115.96.45])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id E24AD6B7; Sat, 11 Jan 2025 17:56:36 +0800
X-QQ-mid: xmsmtpt1736589396tszkecd4g
Message-ID: <tencent_4B60C577479F735A75E6459B9AEAB3F54A05@qq.com>
X-QQ-XMAILINFO: NmxDRtNfo6mLCtlJ3NUEaLEv/0UxDoISsTe+ak3zBbPJ4DaE9J0Bm5Sg35AlKD
	 xVEZndEBtZP7yjTu40DZ2oUisibTHpHr0mPtReka6BXItsdxGNZaDPulzeNrL14cBuM0eKXSeidU
	 V8NgmPhuJxhPjLNwX2lR3mtbBSSHsVVIGhzsHtkNUYTdXoK9t/ySxGrzHCOcwvyETY221kbeNj9s
	 PgoxUQHGkczthhqIiuQvJT4s/jghKb1WVRBDjkjxVYSZUl+TGONl9nyVbgG7+iTejWy5Q0QN9wBS
	 eMoA405b9zTJLiGBYqi/OUJEjGMuq3xBDXU1PA3e/n4gCBci0qS4qIWL04aWAhioXnMcycw5SgYm
	 nmv74Wa+agBgIDobFq+C+Imunn8z/5m5voXLdZF8oGK/LUkGf+REam0C12PogLO2GwbXO/c9Fuz4
	 MspoA2dZbRNa8uqQKpuBxEZn5LG2DkSSCebUeby9/UDKHNBogelDYM9Yc82N/CAZR2iM4uZOehw8
	 euo86vPTdNs9u3Sji123Vc12K+6pWdLx+9snYJbo/u1PV/NFLlb04peJtdBRdzPIKVPVqXIAU/7+
	 CJ18duhpMjrkR7WebAd0FEjJ4dxNSa/qB01HnJpTk13va4OCsePnOcj3WjVgwedrU6ZqGak640Qi
	 oMpCv2TYow0Pj43EHmHt+79ceuFCKlBUhJCeL7pRJKC9Jv5wdtovwJVVbtQcLZ2e8SCHrs2cOkVE
	 ZUIdGSfaFKYk6HFiYovSMibCfFbPFqXJSAkXAJvj3iXHGDx7j+EzI1zHwflXb4D5aiuVRIPQ9ob3
	 dD9IrzbKY5rdgDJo/LxB3R18ZesZ2zcjp4sju6xC+nkMWj5ec3r9rURHGPUC1RrBHzh6qhcAe+8j
	 rEGOG1g29it7go1dcemiAuMbWPWyWdV2NpsGsROty6kRCBi9K61+UPhZ3OB9vOW2f4HdD4GtmnL7
	 ZhHtN/QvYYTy1yXSMEqE8e5HcJfUyIsuLn8DuV3Z4T53JzKgTsLq+/RidJqyyz2ube5dgH3KQH0x
	 mieEzFHVIr4UBgdzvUw7+/JdJiJZsa3sAiNQceyl1CkMoZPGa+1DJm2dtEA0k=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: 1534428646@qq.com
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: mark.rutland@arm.com,
	kristina.martsenko@arm.com,
	liaochang1@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	"Yiren.Xie" <1534428646@qq.com>
Subject: [PATCH] arm64: kprobe: fix an error in single stepping support
Date: Sat, 11 Jan 2025 17:56:32 +0800
X-OQ-MSGID: <20250111095632.738024-1-1534428646@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_020211_354901_F48C2138 
X-CRM114-Status: GOOD (  10.82  )
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

From: "Yiren.Xie" <1534428646@qq.com>

It is obvious a conflict between the code and the comment.
And verified that with this modification it can read the DAIF status.

Signed-off-by: Yiren.Xie <1534428646@qq.com>
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


