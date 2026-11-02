Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2694D606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yzD7Jx81;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a2WEDe5M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KQoOyQvr1Yf4M6fmXMMxMW5LFm9ZNQllsr1s7UwFllQ=; b=yzD7Jx816LVRUQcGivBizBpxYL
	13Ol6QMBnCpzMjm99t/Zl824ME4FgOTsZHODPWXQfSxDIM3Ip9lwc9+Q+ZHovxdU66YVpP+kTa7Cf
	mWteF0iJUUMpcoXUkX38BKagFWwuabjIbgPZ75NVrnQMpkWo6iI+8LSI11Y0WZoOEYE8/KdhTbYV+
	WXpesMDdJywCmxV/sEiwXcBbzSynutQIgTveFhHlHkDavG5wTNV9sFryMUZlqQwTuapFgaF/bZ30C
	78RI+YAOCnrbaZRtmw28R8DJyCPN780OVszA74092mAmXq/T2Yn6Ftxl6TjKdIFVdgK2J0IE6hqaf
	H0tbYkTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyw1-00000000Nho-0lHG;
	Mon, 02 Nov 2026 20:47:17 +0000
Received: from mail-wr1-f72.google.com ([209.85.221.72])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyvx-00000000Naj-3ZZI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:47:16 +0000
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e011829easo2350044f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652428; x=1794257228; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQoOyQvr1Yf4M6fmXMMxMW5LFm9ZNQllsr1s7UwFllQ=;
        b=a2WEDe5M04fcr78MATzD/CbTEOx9N7I23TFeMfFpAL7bmbDQr+veLE4+llwtfPDjyJ
         Hdpg2ppC3QGQGTKCZM7MJlB9vQSE3f/XzW7pA/YPtG1GrFnAAx/n1R55bvyMqanCU2p6
         Sk5OmQI6yL8+PPoXf/ia6BzCSxwwQrWQtheQwIdD17lt1oTYLuyAEafakcJkmkHz+zmg
         w7MN61e1ExxXEfwbZE7xDj2ljBz7QkQ4KASFsG+b5Esr5LRMbnhMd928wyLBA37DU9Po
         iFpCzrpjj+ZzIW0eqAG5C8OIhzNt1y0gcT5dqQOsx1u2IHgj3jLjOk9o7lBQM2WhGdFP
         WTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652428; x=1794257228;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KQoOyQvr1Yf4M6fmXMMxMW5LFm9ZNQllsr1s7UwFllQ=;
        b=T56m4+n+ClmRcal/iiieoCfA0oK5rz6iHh7Oa2gUY1VCb2SDPIjEqUnPmIzyletzfl
         XSUniQ36UitT+Y3EvXbwWvxkZr6bq2n/TC0KOZQ5FLdLZsIRY2YBPFEklTwYG6lI0RiV
         SGj3pcaLlOZ+RKO8F5wsfRRyZsOfO9DHwigSgH6t9bzaa56CPQN3SbiS/+dTKuHg3ecT
         0k2yV3z2BkjrXMZInrbc4dNlwAFyXDjigYuiaqJqhBiWfHntFOq6UU5Hs3CCJaNjdOg6
         UwwzJoAzmvt1Yt+zvymioyCn41cbkgZqhqxvukpYWAaIXfLr9TwlD3q/9X7J3XByDPTo
         yEAg==
X-Forwarded-Encrypted: i=1; AKwUvBzHyyRvRwoRNPFUN4w1hjHCi0kPW9Ddj2G/xxyh1EIHIob2mjX3WbxAA3U2sYu3ScZbHXEHS6D/wtmWjcvk/FFb@lists.infradead.org
X-Gm-Message-State: APuU4Z8G8bXEvCbk4prINT2NV1MuIxZWrqmsC86NuNFM021J7a92+vns
	7xJOzBtzecDc+K8K5sVfMZqBaI1zbQ7P4YT0mY8N3+yXNFHNTULi/Fu5vchL7nxeYonSHInwR3s
	mBSLRRDtMhW3RjKCiq8+twA==
X-Received: from wrmh7.prod.google.com ([2002:adf:e987:0:b0:48e:3c18:27a1])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4908:b0:48e:7470:9e98 with SMTP id ffacd0b85a97d-48e74709f70mr21406431f8f.39.1793652427656;
 Mon, 02 Nov 2026 12:47:07 -0800 (PST)
Date: Mon,  2 Nov 2026 20:46:11 +0000
In-Reply-To: <20261102204628.401871-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102204628.401871-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102204628.401871-7-vdonnefort@google.com>
Subject: [PATCH v3 06/23] KVM: arm64: Reject zero-sized ranges in pfn_range_is_valid()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_124713_923929_55AC2C94 
X-CRM114-Status: GOOD (  10.38  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pfn_range_is_valid() validates that a [pfn, pfn + nr_pages) range fits
within the physical address space, but does nothing when nr_pages is 0.

Luckily, there's currently no existing check that could be evaded.
However the pfn_range_is_valid() should make size trustworthy and 0
could be problematic. Explicitly reject 0 range size.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 8d5bfae67396..385a7ed12b3c 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -400,6 +400,9 @@ static bool pfn_range_is_valid(u64 pfn, u64 nr_pages)
 {
 	u64 limit = BIT(kvm_phys_shift(&host_mmu.arch.mmu) - PAGE_SHIFT);
 
+	if (!nr_pages)
+		return false;
+
 	return pfn < limit && ((limit - pfn) >= nr_pages);
 }
 
-- 
2.56.0.385.gac671c819a-goog


