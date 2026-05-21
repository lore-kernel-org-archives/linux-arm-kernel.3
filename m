Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39E1CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0w0paPj0j6eJsDuENg7ZDSDMt1WZief0AlIPdrZFR/A=; b=B8Q4yRPfaJi7vhFyNMUaobtC92
	MspBMolZbKhLZRZf0Gp0sQfYjMliDzVU4Oz5kfMbjiHEo5Q+OC2ic/IfbWcJ9/lzczYVgZnDrT+j1
	8uhN0NxQyHmfqUlsgXtIEAj2ygqjqaDXc4zGI2NN5t0EfpH74n9o5lG3nT7H2McAlbEjTw9D31QW8
	akQGepNPCOOr52OhdyQxdwVIn+6sfVHR7CqAHSxix5YPu68FfW6X4jWYPDuECTLL7snmnBRZjjySO
	DUR+jfK90AbjbaZRfftn5evf6b+8sSVIegFTgpHr61JdAWu8UOmq5VMTzbOdqNUhR93aFMIPsVgVI
	KMtPNGhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzPW-00000007G5Z-0At5;
	Thu, 21 May 2026 09:09:46 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzPU-00000007G4v-00Lp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:09:45 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48fd2b502e2so50379105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 02:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779354582; x=1779959382; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0w0paPj0j6eJsDuENg7ZDSDMt1WZief0AlIPdrZFR/A=;
        b=XNJouaeF9/Xe4COJ8AlyUXluCG4qU69zAIXn4vfSrHcOplFB1VkRAx/BosV1HaSRgW
         Wqtj7tUBOUQ8mJFFikTiGKjz58iH+uvOqQQp17uK/3nfgtyoeM0pO/Z5GjfM0k/a17nh
         uaWJkplETWQqAYesCApCi09LfJaMgrMDqBP+U8PYRGxGUsYm1PKddPMRMZ0XJpa3KFnt
         wjvRBWvozLR4wipsFmmame0JFiLG0TLSuqCR5IBQ8gB1Z1OfFe2lTn2n+Er3XlyuJWgt
         lVSPp0B28A3t7ijelUp5oYRGmrwjbgNgd3Hab6pdmA4X5f6V4fyt6rpjPf2peofEAsZo
         /fBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779354582; x=1779959382;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0w0paPj0j6eJsDuENg7ZDSDMt1WZief0AlIPdrZFR/A=;
        b=T6gl0OXED/yU8Ms/btRf/uIU2VnXWgoeYFt8YdeX+9z5UQu31ulCfhCP3gnPPLavil
         odBw5BzLDHDOG4TvV4ZH2q/EMohIWgVCqxqrIMmlziw/rVgNsEDMon4fe+aRkmz5CWcs
         vLKfyjLAUmQi18KCQ/m4y/1i4izJ25dQQmsgbjShXTGS55PaHfDy2aNF1BQqXBIaV6aU
         NGdkdJTdVH/YC8Oc9Pidw5PnCTYBjwUtxWKO/CjDiiX9PB93p/S7MkHaLhW2U408hdAC
         YJEYCsFymjUZufPrPJYH8yRN6gWdsvTVJmwuUNSsYKJ5nazN3UuQVctfzcPnOy5i1aOg
         iYdg==
X-Gm-Message-State: AOJu0Yyk9Ub494Va2adIE9IBHpscYrn1pyW4Dn33KhVVVtaNkxson+nF
	Npb5swcTZjrtrz9E9+soKdqYzuKm1N+zBNqeIelPzuMg4oh5ROAQ4ZP0dmk81zbuz/fJiQMtCM3
	e1nAuJ9D/1+wzUBKKzY825Q==
X-Received: from wmbhu22.prod.google.com ([2002:a05:600c:a296:b0:488:c686:2b56])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c107:b0:489:1c1f:35f1 with SMTP id 5b1f17b1804b1-49036035305mr20728065e9.4.1779354581586;
 Thu, 21 May 2026 02:09:41 -0700 (PDT)
Date: Thu, 21 May 2026 10:09:39 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521090939.735108-1-vdonnefort@google.com>
Subject: [PATCH] KVM: arm64: Fix meta-page unsharing in pKVM hyp tracing
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_020944_047168_9767EB30 
X-CRM114-Status: UNSURE (   8.58  )
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

As the hyp_trace_buffer_unshare_hyp() function name suggests we should
unshare all the previously shared pages, otherwise we leak hyp-shared
pages which won't be reusable for hyp memory.

Fix the typo by calling __unshare_page() on the meta-page, ensuring all
previously shared pages are correctly unshared.

Fixes: 3aed038aac8d ("KVM: arm64: Add trace remote for the nVHE/pKVM hyp")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 8b7f2bf2fba8..06805b426101 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -189,7 +189,7 @@ static void hyp_trace_buffer_unshare_hyp(struct hyp_trace_buffer *trace_buffer,
 		if (cpu > last_cpu)
 			break;
 
-		__share_page(rb_desc->meta_va);
+		__unshare_page(rb_desc->meta_va);
 		for (p = 0; p < rb_desc->nr_page_va; p++)
 			__unshare_page(rb_desc->page_va[p]);
 	}

base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.54.0.746.g67dd491aae-goog


