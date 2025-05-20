Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65525C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 09:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKZgmiZHsWd3katRT3fxSYHJdGTZyCIpS+lL+y5Js0E=; b=FksHKYRMyAZ4AURKvfRCPqX6pI
	Y6ugLz+qdhoAxoDWa74suG83jQRvKWODOapHUYxpRKOQgpHUkiDyZ8emrTfK3yFTsKB1Sb14ncZhs
	sGydhfkLWKl5SC8vHDdPAm/YFrU1J8HVTgN+colDASCC9bOKwgvlXwKo/BoXTHufV6RS4usE7qvqh
	2t8Vh1EDttnmu4q9ihgQLNRIu+LG8DHqndlDoosHgvXzp/ywrOauJlLK591MIpmW701x/4b2WRVn/
	KR/zsfWNiKxt7NKb0rzlS6EVWsRyna0/QpYoXMDaOoTOZR/VBVdyOcxpYDhbqGIzep32lVcc8b5Az
	cqJeRPWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJgi-0000000CGPR-0pVA;
	Tue, 20 May 2025 09:55:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJOo-0000000CDR6-3vD1
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 May 2025 09:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CKZgmiZHsWd3katRT3fxSYHJdGTZyCIpS+lL+y5Js0E=; b=b+s1IqFphpjkZmpMJPYCMnVUdw
	TwTFAGZZzskNLd+5kAuntsPX+rfANbh5OpxpR66Qiy89sJO4XegKhNIV/IVd8B0PAdvUd3M5MEEgp
	fOf5eEELCWDi3vV4+9OFOX7VbqQDzXsMyOBhZU5umgW+J9++vJ9TiOboMRRuUTimJIaO3mHj7wTy4
	UwiRphXLuP9BF1/K2fgwJF6DUn3444LEzoBecHhMz8/pJjj0JoWnhKsYXVUSORNTdONBHv8sLO0TI
	5JGN4NatYHG1d42ufJDIMoKpgYmOVbDCij64PAEY0B4L1+TjIBYB6eRjxwh7jdXp+t8FoqLKJgvTa
	v7L/5fOA==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uHIii-00000000joI-1roN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 08:53:47 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so28967355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 01:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747731182; x=1748335982; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CKZgmiZHsWd3katRT3fxSYHJdGTZyCIpS+lL+y5Js0E=;
        b=ieQhwifcPQQSXoGwmMe80MBR378/23QJy/j1xgPSi0CFxoROr8MMFJlIQIDuZBFVao
         5HUdL06XbHR24rUl3cQlgm+PzdNTVjmKY1uRBNTOq2jhbLG/WlVHaPFy3phJUsRf43g9
         /UeFGKHQoqjCC9Oxm8VTs10S6/ojLEDz1uxeFVs2M885XF7iYkOQKp0VhWQY/DsFvISv
         C6Tt3I7aqviPxZurSgvhlxrnCFbWFVcni/RbQoKTkt3UDkVttxjaX0z7nZuG4ZrtGhUU
         UYHPC25btrGjTt29/IBZ63GVpk5J/Y5MgN6q36Lx4oLlNgeAipCJ5j0eRcSnVGG8q/Zg
         i9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747731182; x=1748335982;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CKZgmiZHsWd3katRT3fxSYHJdGTZyCIpS+lL+y5Js0E=;
        b=wklvktNp81uwnHOFgHeidZ+4zSvQxQWkiIFqUOJ0j2rx5cCWWnl4iXpaEVUQd1ftHn
         JEeQtA0DkoFW8mOmzvkGIFmdlGrZz6ZLJKS1ELUnZMFjVgZD4cHjWlsBDixNtF8jaAI4
         5Ylxf4WsY5zKslaowphk/JiCNCh4Ci8mrFcqBF7Fon3lOHH/38aYmustMrGU5eEmLhlO
         BjSLu8z5BA767rwlYcAvmoaSggxHbkuQKgkbiCOp2PuZvbLOB4tEIdo8LcoRhOjWUPVu
         7J0+hzJ2eQfodHs6TNl0UAKEWw781DXIFkB9A9LXnR+djuCVprym7DPwv7eIMHbT0Rgk
         Lr6g==
X-Forwarded-Encrypted: i=1; AJvYcCU9F5JDnUkFGr0WnN1irmeq4gTU7qhJfm50Lcs5BCSjYJ4A3jDswHj7ydDnLAW6tcA2iTDbpj3dDWWFKBtmuUmy@lists.infradead.org
X-Gm-Message-State: AOJu0YyHKeW1nRGQ4vqr8Otof+NeZkEl2Oi/i4iBPXC+XIPjBNL2nHgV
	WzCJ3gh+3fQ0Wy5PDD44aqIyTO7QjvH7odKsra9jb9cI2S9cSQ5awf6ZFMpNF0V37tgxXRNi8Hn
	elKLhTO/neQV7th5OfLzotg==
X-Google-Smtp-Source: AGHT+IFVdTcpdyqZnbRyjGjgkt8Kni5chetO4dBq5cxEbxyb82PcnyVXthra3fVVyFQB8jcxKQCM9hCtE+YosLWO
X-Received: from wmbhh15.prod.google.com ([2002:a05:600c:530f:b0:43b:c450:ea70])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:59a6:0:b0:3a3:7752:108a with SMTP id ffacd0b85a97d-3a377521242mr3030138f8f.25.1747731182145;
 Tue, 20 May 2025 01:53:02 -0700 (PDT)
Date: Tue, 20 May 2025 09:51:52 +0100
In-Reply-To: <20250520085201.3059786-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250520085201.3059786-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <20250520085201.3059786-2-vdonnefort@google.com>
Subject: [PATCH v5 01/10] KVM: arm64: Handle huge mappings for np-guest CMOs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_095309_078971_12A81D99 
X-CRM114-Status: UNSURE (   9.42  )
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

clean_dcache_guest_page() and invalidate_icache_guest_page() accept a
size as an argument. But they also rely on fixmap, which can only map a
single PAGE_SIZE page.

With the upcoming stage-2 huge mappings for pKVM np-guests, those
callbacks will get size > PAGE_SIZE. Loop the CMOs on a PAGE_SIZE basis
until the whole range is done.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 31173c694695..be4f7c5612f8 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -219,14 +219,32 @@ static void guest_s2_put_page(void *addr)
 
 static void clean_dcache_guest_page(void *va, size_t size)
 {
-	__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
-	hyp_fixmap_unmap();
+	size += va - PTR_ALIGN_DOWN(va, PAGE_SIZE);
+	va = PTR_ALIGN_DOWN(va, PAGE_SIZE);
+	size = PAGE_ALIGN(size);
+
+	while (size) {
+		__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
+					  PAGE_SIZE);
+		hyp_fixmap_unmap();
+		va += PAGE_SIZE;
+		size -= PAGE_SIZE;
+	}
 }
 
 static void invalidate_icache_guest_page(void *va, size_t size)
 {
-	__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
-	hyp_fixmap_unmap();
+	size += va - PTR_ALIGN_DOWN(va, PAGE_SIZE);
+	va = PTR_ALIGN_DOWN(va, PAGE_SIZE);
+	size = PAGE_ALIGN(size);
+
+	while (size) {
+		__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
+					       PAGE_SIZE);
+		hyp_fixmap_unmap();
+		va += PAGE_SIZE;
+		size -= PAGE_SIZE;
+	}
 }
 
 int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd)
-- 
2.49.0.1143.g0be31eac6b-goog


