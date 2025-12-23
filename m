Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5609E6FE28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 19:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mpE2cHSu7VEJSV8o9XAdCC+Pqd8elvYLdca31NEtq6Y=; b=U8hDJtf0+GLklX6RrH+xQAmUET
	R0UKSWDoYok1aPhTxF7v4EN2k/aIFEeNdbtClF0kwIJgdGITlTya4+turW3T+kCeaxoyXuIAOlTfL
	4Yig7QKSND78Z95JXW3HVfl/HbDm1zwlpdH/svff+6iX0PgiA2FlZgaTOq/0kWO2y8tv64ecwPwqW
	7u40ztlJKYv1+9l37X0LDF8dFkQ+HJcdMEZOq5GuNoM1IUH9bWklGVyZbKQZTd8NbkjbpUAvJC3EO
	7+p69Emxcp+ACSUGjM3sgf0Q++PFb/FYOVVz6MsrZS1OU0XyFX0Civc5MOXrG4roKmTU04NwJN3wM
	GLViI0ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8Ca-0000000FzYG-2Ccq;
	Tue, 23 Dec 2025 19:37:48 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8CX-0000000FzXb-2goX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 19:37:46 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2a090819ed1so45996555ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 11:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766518664; x=1767123464; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mpE2cHSu7VEJSV8o9XAdCC+Pqd8elvYLdca31NEtq6Y=;
        b=wEdCqQnaHT+kitVsfmYAoRb6PFp46AfVQG9jyBbzm3FDCt/65qTjozENJ42RS/7NL3
         Zq2+RhPi0s1JV7V4wIxFboLOfvkOXPk7RYlr8Rfs6kar4cxIeO8V0eSaM86gBFuQK+F9
         GGixDQLEOgc26WvCd7SRvgCtc1laKe5Ch0p3Zsfd/Jt7LUR1couR8L/XkAOeqSOoCkc/
         piGtosC4vQlbLB6qXIyCLOu5PzdqQklVzZY4Or7NZSLRwUbvKPrVh6g7ugQBapVQB0At
         Yaaa1hK+ej3I/Tv/gssuYgy2tNhPLo9WJT3SQDgQM13UmaHbclChik3I7QtVZ1sgTVM+
         YfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766518664; x=1767123464;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mpE2cHSu7VEJSV8o9XAdCC+Pqd8elvYLdca31NEtq6Y=;
        b=rz7dmlt8UU/A9rbtLoHhecuPctVwMC4r5Z0YRyWkYUceg2qw4xfc3L7Kzn+0uKc0hH
         YWjosB0jI2u7E6DBWCzOk7uEaHLzvBmXhpy8HktLBKcrPx+N1cfrC9wX63gc8JnCXjRS
         6p/0yCNLs7cVP4rFPxI9JnFNWedgZvP3X4gP5oL+uTEu/SSvt3L0U5za3j18YVjUxVZM
         scGUwXS8Mi1Kz9JTSO9NXAAM0fc4uMACJNbs2TkXR6u4vfXS07Wv/O/V7cogsHuqNwNd
         NpTf7f4JAwbdPmndoyBdvPK4dtqtVot6ddHC2ADzwP74gP+Ud5a/MocU8YMcisOl2bro
         6LuA==
X-Forwarded-Encrypted: i=1; AJvYcCVIyeYe/ObSoCGTIEn9XDTpqZ8uCrPAS/ousqhiqBYuRmjEr3XSMivvb3UT50FSfiCRpz9P9NKKzlfQNAl1urSb@lists.infradead.org
X-Gm-Message-State: AOJu0YwhsGo+SjjsRExdTzwLa8jZhxdr50NyPp0Dpl36RQfsaNiq6RTF
	NFEpGIeBhHMTucMt0TPz/Qk3M3LvuSXYgKdV2SusKighZcACLY1EF9q3chBXu4W6DQx4hRNHhTi
	geApsuUsXxChM2A==
X-Google-Smtp-Source: AGHT+IF83L91Gh8tBV6+mxWodX8HXmAQvfSbCEAss+zVjQUMiFCvaVUUpvJKxJPo6RfJA6Fdt7OWobxVaK6jag==
X-Received: from dlbto10.prod.google.com ([2002:a05:7022:3b0a:b0:121:7a50:e97b])
 (user=pekangas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:2214:b0:11a:23fb:16e2 with SMTP id a92af1059eb24-121721aab8fmr17386955c88.9.1766518663824;
 Tue, 23 Dec 2025 11:37:43 -0800 (PST)
Date: Tue, 23 Dec 2025 19:34:39 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251223193440.1441657-1-pekangas@google.com>
Subject: [PATCH 0/1] KVM: arm64: Fix hyp VA size between layout and MMU
From: Petteri Kangaslampi <pekangas@google.com>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Vincent Donnefort <vdonnefort@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Petteri Kangaslampi <pekangas@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_113745_705510_D42FF088 
X-CRM114-Status: GOOD (  12.03  )
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

All,

In the KVM initialization code, kvm_mmu_init() and
kvm_compute_layout() use different logic when determining the
hypervisor's virtual address space size. Specifically, the MMU code
uses the larger of vabits_actual (the kernel's VA size) and
IDMAP_VA_BITS (48 bits), while the VA layout code just uses the
kernel's VA size.

This means that if the kernel is configured with a VA size of less
than 48 bits (like happens in our environment), the assumptions used
to calculate hyp_physvirt_offset and the code that determines VA
ranges to use for mappings in hyp/nvhe/mm.c get out of sync, which can
results in mapping failures.

The immediate fix is pretty obvious and attached here. This is against
6.12 but I don't think this code has changed recently. I think longer
term refactoring knowledge of the hypervisor's address space into one
place might be helpful; currently it is a bit spread out.

Petteri Kangaslampi (1):
  KVM: arm64: Fix hyp VA size between layout and MMU

 arch/arm64/kvm/va_layout.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

-- 
2.52.0.351.gbe84eed79e-goog


