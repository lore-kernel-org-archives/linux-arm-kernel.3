Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E174103A9B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p84lLdIepUZTxV4B3SNssiaMT7UBerhqgF3wniuKFK8=; b=x0vbeRrE0w68noERY6gOSnBrvV
	tyhU5N5+rBsMoIs+pdW33PUm5q8CjdEN176SUmDva9S4CKyc3okDOaxgjeXBDxdAzzKNBXU5LLlgf
	KR+biNTM91xZR+f/8v0xwyXUm5gLXuWmI34p6h5tdPhFutvm7P3WmLjfOr34c8/dmPnDyPCZ2Ys1I
	vFL+enSgVMR/PjjU5aHt3cCszP9+m/OqD5VSfkS32pmJiHKJFUH27ZyJe2SrIGRsECGGUkieY++oO
	stY3XveAMHb42ScMXBgN7Oq/cz2w+ZVjjo90GWelUwBbyIq8Vf6qutDwSoghAzvz2rZmBy34lBSUp
	j1KPyB0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MSi-00000003GF0-07If;
	Wed, 25 Mar 2026 11:31:48 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MSf-00000003GEH-2cha
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 11:31:46 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-487018c8244so28061695e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 04:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774438303; x=1775043103; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p84lLdIepUZTxV4B3SNssiaMT7UBerhqgF3wniuKFK8=;
        b=Aqhj4PPeZ1REek/2F/Vz0T2vfZQD7vGZEFfyLYx9DlFGyXb0qqO/NLcef3PWbEM2g9
         z8ITcmHX+umtedSt52RQP4z/98zrwYaTmv8f/i/W2RrD7tg0RuHi6Bx/bwKpHoU/DeZA
         porULg2qBUVDicLHBECQm+11GoLIwMoNYct0ZxjO3Fa+ZTolbVHCeU6YTHxbJh+yzEu6
         5lat5zUQ+zIGZTqZWzQ+Al5fN5mSodg5eMcMtpDIeWO1PnBnQShJIAwLLqrH2ZrJ7Qpn
         khSMMALuT+nOSF56QhENI7ivHufbMW1t8G/vLnnmYXp7+HIVWvm79HKOKN/6bWbiSecK
         jR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438303; x=1775043103;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p84lLdIepUZTxV4B3SNssiaMT7UBerhqgF3wniuKFK8=;
        b=FxFrL1vwVo3mozHqCLI3Nyg0v1j6uzDveg10hi+tIDMvHSizbEBH70lxth3XiOvd25
         W5SVs6TxNfGkuDiQRH4jOPTQHgBmjIOkR1yHhu9p+Q43jgA7MRrwxbOmGyLBecnhPRhy
         6tJFvG1kfp1NYy7i3y3f2FKI0XvvHOM92zGgJZ4bttTJ89BTYnbfmbBaqnNYW1YhQxnl
         Sj4oehi77xTcbK4DHix6oxNpXTzApsLE0q+W6SBgIHKSrNc6iO8Ba/omrXZ5CNNz7crJ
         EqjwJyaeYmuneW5cv020X5QoCiRi1cMFH7QFsF5XM8k1yn5bO7dGub5doLXTooj3A9kM
         LXYA==
X-Forwarded-Encrypted: i=1; AJvYcCWJu8FTIGil6Tv6l068YX/C/v0V1E3SJg0p8QvS6/kWZyU7LhtGFU/Y7xDdycLw0Zaf5VwoV07OQjRNWaOeVMdB@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu3er/VIh18YlzU7slNRBh9jJarnBSHLQMA/gkrAAK+YvPqzU4
	f4h/YiEn8Ke9AIegtT/xnOz3+/p54F7WPmtz8VM4NRwNst2JeFHrlhgwLPix33L1hh5lvfXIok5
	1fcx6hBMdRzD9Y0cQr/d0vM0SYqamzw==
X-Received: from wruc11.prod.google.com ([2002:a5d:4f0b:0:b0:43b:42a9:2db1])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4692:b0:485:3812:36f6 with SMTP id 5b1f17b1804b1-48716046ee1mr47372355e9.21.1774438303323;
 Wed, 25 Mar 2026 04:31:43 -0700 (PDT)
Date: Wed, 25 Mar 2026 11:31:38 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260325113138.4171430-1-sebastianene@google.com>
Subject: [PATCH v2] KVM: arm64: Prevent the host from using an smc with imm16
 != 0
From: Sebastian Ene <sebastianene@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, android-kvm@google.com
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com, 
	maz@kernel.org, oupton@kernel.org, sebastianene@google.com, 
	suzuki.poulose@arm.com, tabba@google.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_043145_727838_03DE7257 
X-CRM114-Status: GOOD (  12.85  )
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

The ARM Service Calling Convention (SMCCC) specifies that the function
identifier and parameters should be passed in registers, leaving the
16-bit immediate field of the SMC instruction un-handled.
Currently, our pKVM handler ignores the immediate value, which could lead
to non-compliant software relying on implementation-defined behavior.
Enforce the host kernel running under pKVM to use an immediate value
of 0 by decoding the ISS from the ESR_EL2 and return a not supported
error code back to the caller.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
v1 -> v2:

 - Dropped injecting an UNDEF and return an error instead
   (SMCCC_RET_NOT_SUPPORTED)
 - Used the mask ESR_ELx_xVC_IMM_MASK instead of masking with U16_MAX
 - Updated the title of the commit message from:
   "[PATCH] KVM: arm64: Inject UNDEF when host is executing an
    smc with imm16 != 0"
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index e7790097db93..4ffe30fd8707 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -762,6 +762,12 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
 		handle_host_hcall(host_ctxt);
 		break;
 	case ESR_ELx_EC_SMC64:
+		if (ESR_ELx_xVC_IMM_MASK & esr) {
+			cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;
+			kvm_skip_host_instr();
+			break;
+		}
+
 		handle_host_smc(host_ctxt);
 		break;
 	case ESR_ELx_EC_IABT_LOW:
-- 
2.53.0.1018.g2bb0e51243-goog


