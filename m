Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57164C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X4tE949qRBkC4yYjzPjGurt/S8AoL1L3JbunAkJmp2w=; b=h9QVsmuvfm0bxvuYT6YRrh+ezW
	lyRRU13x6zaFxsSXTWGahGHfEN83vXA+WRuZPTDmjph3BRIW/vonAEHcaxzt6/lnKDei/VF8TbmiQ
	8QKpuuhPugwzmtlRwjKSEy5yR2VFo07hA+U8FEgH59kcHECCUA3JdK3x9rHVw5EO+OjbNXNfm+s/l
	sapttL9Exfr+Hy0nfbAtRqzKw6XrxJ2Vn8Bb+3LO9yPp8HIaqiviW1uzvaSVqTvGyFnk7lm+wOZ5y
	TD4cm6e98J3aLl6ZswGQTrMfxvZnarY10e1IIAnX9t1BJe9OBDPOiFUoodNVvY5EbMSTIT2Wg8jb7
	4Qtu2W8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh90R-0000000FUpX-1w2Q;
	Tue, 07 Jul 2026 16:50:47 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh90J-0000000FUp9-0XXw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 16:50:43 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-c1279120710so184676566b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 09:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783443036; x=1784047836; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X4tE949qRBkC4yYjzPjGurt/S8AoL1L3JbunAkJmp2w=;
        b=i55vK/XbFkPj5UkaaQFLnW12KHyNwOWEn6O2tN5fk7UMmDBBfk3gT4lg1wukwvSlm/
         pGKjYH9HUFPT921V157QzhCbbIwLqXQrYUXDAtw5QrATc4xsgc3jwl95Kjw1Uer9+xeV
         mwyHdXj4d7CjgwJ0woigwfpHrDApmBwERSPfLUdNvr3oZcBjDTmYp62RX0cGCqLn7ZY6
         aHMQJRoxw6dJ+MwMj2hcLUkO1HP+G1FuHCWLwCU1Y8HuWvYxCLuuy1HbTRjyJDL1XKGd
         vovQ0LHLsAqM1ST5Q2ma/Y8sSuFZhFo2aNTfpHqfHuw24cXENnQYD0ybXMLfnWBCbMjQ
         Tbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443036; x=1784047836;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X4tE949qRBkC4yYjzPjGurt/S8AoL1L3JbunAkJmp2w=;
        b=gvQF3qLmuCt1Fekox+/WCzVcQ8zhQvpGanT7SChb9YExL45mosz1MLba3zrprCghHA
         DBzhEDLVMLysB7ynD+/nbHYRhOBO8N6WnmfTJ6oAj6q4Qu0AdsJcmx69m6tq1lac75xp
         X9LMc5j38unPxsfeD2kNtxNk+VBPYhCesRawgu4bk6buf7EvxFBQbqQQFu26vniyoz5Q
         OoB1+5e8ly2CR83jvbAOZRjnw0b/QVgoaWxF63rvD+XWIH9qimjYhIQu5fszsXv0fRdW
         ZIR9P89lbY6rIOeF4ga+0dOyadGwEwXp8RUihhHWQhDvfNLLGPI+MXzzUErUAysV6lPv
         X4Xg==
X-Gm-Message-State: AOJu0YyhDald/DYj/k4O44YRGRFPIHWcmLH8gah1d7ZIgGdf/AAB3Hor
	RHqB9CncXQM7YJzFbZOeuX7xRuWo49E3II0UH855EYqj3QY4RNFD0a62I/2gQ3PRpUbymkQSKT/
	JYTYHKzE70gRhCOOG75oUYA==
X-Received: from ejed19.prod.google.com ([2002:a17:906:1753:b0:c12:7900:90b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e8b:b0:c15:abe2:e1df with SMTP id a640c23a62f3a-c15abe2f250mr283675666b.43.1783443036203;
 Tue, 07 Jul 2026 09:50:36 -0700 (PDT)
Date: Tue,  7 Jul 2026 17:50:29 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260707165029.3410701-1-vdonnefort@google.com>
Subject: [PATCH] KVM: arm64: Fix potential leak in hyp_trace_buffer_alloc_bpages_backing
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_095039_205719_24B0A569 
X-CRM114-Status: UNSURE (   8.96  )
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

In the very unlikely event of a failure in __map_hyp, the allocated
backing pages are leaked in hyp_trace_buffer_alloc_bpages_backing(). Fix
this by freeing the pages on error.

Fixes: 3aed038aac8d ("KVM: arm64: Add trace remote for the nVHE/pKVM hyp")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 2411b4c32932..5fbbfd40376f 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -160,6 +160,7 @@ static int hyp_trace_buffer_alloc_bpages_backing(struct hyp_trace_buffer *trace_
 	int nr_bpages = (PAGE_ALIGN(size) / PAGE_SIZE) + 1;
 	size_t backing_size;
 	void *start;
+	int ret;
 
 	backing_size = PAGE_ALIGN(sizeof(struct simple_buffer_page) * nr_bpages *
 				  num_possible_cpus());
@@ -171,7 +172,11 @@ static int hyp_trace_buffer_alloc_bpages_backing(struct hyp_trace_buffer *trace_
 	trace_buffer->desc->bpages_backing_start = (unsigned long)start;
 	trace_buffer->desc->bpages_backing_size = backing_size;
 
-	return __map_hyp(start, backing_size);
+	ret = __map_hyp(start, backing_size);
+	if (ret)
+		free_pages_exact(start, backing_size);
+
+	return ret;
 }
 
 static void hyp_trace_buffer_free_bpages_backing(struct hyp_trace_buffer *trace_buffer)

base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


