Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16594CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 16:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AhNRxbrdg6ISPZIm1nvZ8swSV1Z5SsxYmrn66VE+GBs=; b=jLtgg4c4GVBC5KOshqSY2JBCl+
	kZRh7wgPV5ioCKteohVqmHppAclDSdTPwPPLTBTuQhOxVgIML++/7RSUlRX/AuSziXcIhFsDpK49E
	mqv0yS3mcKrf7qigpe7oFATJTPUeFJuKdH4d69KRvPB03hamNE42acoIIrBHeFjbZVq+ZzIrkdIlK
	OfeCLcedH2LrDBj/gzdx7wzBApiyg62cMZmiIMcdflBSgj3DaACk8PaMFrBoPsFnEO4nHeQvf0499
	nVUUmWCsI5YuFddsTAk6GNPH6AnlokoDGldAf7SAfcBBWFGTYg1s0XA5vmgs+/AXOlnrQTGxirIWJ
	wqObYoiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1RQ-00000008cB0-06Wh;
	Tue, 09 Sep 2025 16:43:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvv98-00000006Cn9-44zB
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 10:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=AhNRxbrdg6ISPZIm1nvZ8swSV1Z5SsxYmrn66VE+GBs=; b=YVNfSpCZkrDeGlFX9L6SeyK6kn
	m3+R7TXuJQsNXFwqYpvy6nrXwBylSVCSQ4TTmuI425Ycpj918Kogn6ouX9ZVRbstnraWJVUl7fWQX
	fSWj6klPYMeKzlrD3Fn+R2HrEPyZT8dtfgQ7iWhne/00oTjfZ4AhgAQ4329p3NS7eFYuLNbwhUZJQ
	ebEy4BH2lDoAsjYmk4NytQD8Ve6cKUZ9Ebdn7gupC8Cygyuhkn5N/lLXKOCAg/hxKzoBCL9CKvKyD
	0dd2F4O2bAD3+QW8j1rUENBmJc5vtESLIL8WYF7VaYEClbcJhjyf9OZEGYt+z+SbXKvg3C/TXEgZm
	iRiawudw==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvv95-00000005HGF-2dnn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:00:17 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45dde353979so18132425e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757412014; x=1758016814; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AhNRxbrdg6ISPZIm1nvZ8swSV1Z5SsxYmrn66VE+GBs=;
        b=VxaAdc1//eIBlW4lqfiHmHsOd1jt8ZPsNLLQ1pogoxLX52wFg9zPMTBdW//xQ9B/27
         jhFvjr6qAf1QyrwpY/fSNwMe2iSFalsCa/d1ddPuXR5ylwHe9z3muvnKhvoDbokczuoC
         x4B4Tgh6YABEXL3xdoqGNsvWC+MoaFlsg5eHTEzSiESWTE/OxUw2tprhI3OULNCiXp6N
         hisfhShgT+KYbit8DndPKUHrMgwn9JBUnbJEEhuxcO/GFPQABryJ9odzBVvr0RbXFurx
         pSdhAaSKXjpoEvw16mqyj0Du8kWK/jrECUphi3QIkWodSKBQwpFgCkd/bWJgjdmINCBO
         BALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412014; x=1758016814;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AhNRxbrdg6ISPZIm1nvZ8swSV1Z5SsxYmrn66VE+GBs=;
        b=phHJ6o7Om7NC0s8Ix9Cz6gtcol3qXeLupNCtsZZlMEKhZmhiUmM0uf3Kj40V67QDT1
         qbYrf+uFAUW3WInv0bsZNjZ9zKsFZvWLOn4ehl6NDt+WoQgADi5pCXJH9F4nNydMSP6x
         EeUBIftCC+G5vMAA8dQ1ZDNUNbVbwUE//LACUsYa9NIcq/hHPorOAtSWMOfPwU224SqG
         Y9oG5P9f19DfnqQn7qWLhZHId1aGR61tAJ6HjUdLTNeWJfb8804eCsxMobvzUKTQOiSu
         Hno/EnDJVy+jTn8+UzsZ7LJ8gL4tRVk0CqPQb6rsnJSkVsVc+WelH2g9tUBVV7ggi7Dh
         bqfg==
X-Gm-Message-State: AOJu0Yw1X67BYuTAdVtTg3XH5phs0p1GneNapk+KkagtKG20HqOpFF0i
	mV6Qm+XJ0RMD1gWWsU6k/TImZyh4QANiByfri+y41rF1AqwwPqSHvHkoZLyd4KDJXaBEq/lLtYX
	d/+zVIWOTULW6ZPubU7Wh1o4IBKIZ1jf5NArgmc4eToq1naqLaHixpC/2/boxvwJEbdIW+I8ReV
	yq5oUG3Wnr4gFLogJp/oAGNI9DBhDATsr9cCcdhHqzh70zPzHtdg==
X-Google-Smtp-Source: AGHT+IHzO6iJLK1mxVbt9ybO2bWPuop/A7UNojIEaCpW+tXljzJMk3ZXSHK8g7FlH1Jeu7qwJB64pyZuYg==
X-Received: from wmbfa7.prod.google.com ([2002:a05:600c:5187:b0:45b:89e7:5038])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4ecd:b0:45d:d5fb:1858
 with SMTP id 5b1f17b1804b1-45dddee8e80mr91499155e9.21.1757412013569; Tue, 09
 Sep 2025 03:00:13 -0700 (PDT)
Date: Tue,  9 Sep 2025 10:00:03 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250909100007.3136249-1-keirf@google.com>
Subject: [PATCH v4 0/4] KVM: Speed up MMIO registrations
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Keir Fraser <keirf@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_110015_839329_B3885941 
X-CRM114-Status: UNSURE (   8.56  )
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

This is version 4 of the patches I previously posted here:

 https://lore.kernel.org/all/20250819090853.3988626-1-keirf@google.com/

Changes since v3:

 * Rebased to v6.17-rc5
 * Added Tested-by tag to patch 4
 * Fixed reproducible syzkaller splat
 * Tweaked comments to Sean's specification

Keir Fraser (4):
  KVM: arm64: vgic-init: Remove vgic_ready() macro
  KVM: arm64: vgic: Explicitly implement vgic_dist::ready ordering
  KVM: Implement barriers before accessing kvm->buses[] on SRCU read
    paths
  KVM: Avoid synchronize_srcu() in kvm_io_bus_register_dev()

 arch/arm64/kvm/vgic/vgic-init.c | 14 +++--------
 arch/x86/kvm/vmx/vmx.c          |  7 ++++++
 include/kvm/arm_vgic.h          |  1 -
 include/linux/kvm_host.h        | 11 ++++++---
 virt/kvm/kvm_main.c             | 43 +++++++++++++++++++++++++++------
 5 files changed, 53 insertions(+), 23 deletions(-)

-- 
2.51.0.384.g4c02a37b29-goog


