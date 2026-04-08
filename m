Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C241073C9E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 11:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cFVZM51ujgYl6062hVS6iRzVSZQWxsJgdzphCGIB/gw=; b=nP7MwYlXVHPECMUqRSP8zWQnFn
	Fa9MNkOmwtafqAVmU8SgRRdZnd5xjoK1fXz9mThfxJJB37l9NYVuYdA7WGLNncXvlKX4wDVHXLlDT
	+Ispp0ki7u5/rvipAQbJIpDy7/om6Cnh8OCH2z+8IMR1HtQZqoxRfVaaPE+45BgtjqwjFjlXByuRL
	FNRgect8I3MgFt6TWrW9dICtFZc4+4nl2fKx5Hn5bylkMCg98Sd0zf3ALH0wNaKsy7BvWXoRMaWgP
	w8dc1zBXuwCStUgChcvOI2onzSPxk+qW3XAQhk+gY48keLRZlpeY1F9RH6d+p+ZBsaCaU1/iQmM/a
	Dhz3OUFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wARHi-00000008loe-485d;
	Wed, 08 Apr 2026 11:41:26 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wARHg-00000008loA-0pJg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 11:41:25 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-43d5651fedaso291894f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 04:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775648481; x=1776253281; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cFVZM51ujgYl6062hVS6iRzVSZQWxsJgdzphCGIB/gw=;
        b=SpHuBkWYg7VX9ba1FrAMSOuFJrZOQ15a3JTjXh2qRpmlYWIdxtaX9wx+zO3NQG2Pc0
         m0gDSKM68BUe4rH5gvBUpcYojEIuKQgHxb2sqWjfPzDoC7gziERIUI+AXZLrbss/85Wx
         ASlqQha/cPbnrRBu8m/peif1xNj0C6DOsBs9Gv/lTPwSsqfp8wVdGMl+N6rfp0o46Tup
         yS+JhRdPGImQ1pyCx81ALNbCoedJI3TVkbr4E1OBclE1TMnyPNy0cuXwD1h0JVgtY7+6
         b7v35vM/wl2Wy/FsjI0ACxV/rYBEfdgsGGRMN4KB9wLVf+eBSrzrhPfczx6GIAtVO/aw
         RhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775648481; x=1776253281;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cFVZM51ujgYl6062hVS6iRzVSZQWxsJgdzphCGIB/gw=;
        b=bebgYXJGMCwcc6meS4WDoSFa+NUfysMLvUKrH/6xhYf9HTa9OSMuZeKmPTDeryofmv
         JRHWyHfJs6Xln8qwUVlkOMXOay/51WOLen3/uOB/wHOvxrZQ44d+CzIfHPVrvXf3wbMI
         Jf2jcqrJ5uPARXjgWlirvh/MYLQ4Mqaasohib9Jc2QMqq9BbGyaeGMPJqeV3ORb+f5P7
         vxuKgtEnqxE35j3aYnBhL4pRb/e/JAYHKhT2hYOfNg34Lrq1KDMa0sjcFX4raHm8+MKf
         yo4jDZKkRZzjaeI/cDXlrMGH6saaIE1Imqmcv+2nP//azna1rfn9+4c9fTgsoCij2t4P
         64yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLKY78rTUeJCfr2rPvHRsyFGL9F6L4KI5jh4cem3SmGAZAm73x9VlkpqtRKNWTt5qG3j+li+gJ62fh8xCLnHfP@lists.infradead.org
X-Gm-Message-State: AOJu0YxNmNTy3MdhrTIi3ws44824ROHtKVVI2NaUpXwZTMX6qqwXGJQ7
	r5eF/91GALpA6GZLD26Y7nCBQ1PQ6a7cD6zlVIEZ+dnr/0EA1zrjF25uude90wH64YONibUOFaI
	ac8KJIB45kmEXMoqzlB1Erpyhias7Lw==
X-Received: from wrbdf4.prod.google.com ([2002:a5d:5b84:0:b0:43b:4e28:2766])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ec7:b0:488:9439:880d with SMTP id 5b1f17b1804b1-488997eb933mr275574805e9.29.1775648481567;
 Wed, 08 Apr 2026 04:41:21 -0700 (PDT)
Date: Wed,  8 Apr 2026 11:41:18 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260408114118.422604-1-sebastianene@google.com>
Subject: [PATCH v2] KVM: arm64: Reject non compliant SMCCC function calls in pKVM
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com
Cc: joey.gouly@arm.com, korneld@google.com, maz@kernel.org, 
	mrigendra.chaubey@gmail.com, oupton@kernel.org, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, will@kernel.org, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_044124_260438_3C2D9B60 
X-CRM114-Status: GOOD (  12.32  )
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

Prevent the propagation of a function-id that has the top bits set since
this is not compliant with the SMCCC spec and can overlap with the
already known function-id decoders. (eg. if we invoke an smc with
0xffffffffc4000012 it will be decoded as a PSCI reset call). Instead,
make it clear that we don't support it and return an error.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
NOTE: This is based on linux-next, next-20260407 to avoid a minor
conflict with a previously submitted patch (commit cf6348af645b).  

Changelog:

v1 -> v2:
* dropped the changes to the function signature that were accepting
  64-bit function-ids.
* applied Mark's suggestion to make it clear that we don't accept non
  standard SMCCC calls.
* revised commit message & updated the title.

Link to v1: 
https://lore.kernel.org/all/20260401123201.389906-1-sebastianene@google.com/

---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 73f2e0221e70..cca4b07c8d61 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -805,6 +805,10 @@ static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
 	}
 
 	func_id &= ~ARM_SMCCC_CALL_HINTS;
+	if (upper_32_bits(func_id)) {
+		cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;
+		goto exit_skip_instr;
+	}
 
 	handled = kvm_host_psci_handler(host_ctxt, func_id);
 	if (!handled)
-- 
2.53.0.1213.gd9a14994de-goog


