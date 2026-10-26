Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB82606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UX5V12JV;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ej4E9VBp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ucD/WoA7wxIoPFGYELZoInIDrJz1mWtO2kaqtrfylpQ=; b=UX5V12JVAPdje4My8jbjn7MvTw
	MKpAJw9n/K7Sz4DLn2h4UQhN/8kCkox4EKcvT4VbpignUySnApUllpBfrGvCBfXhNTEksA+Y8aSM1
	/98QACxgptD/Z/HclksUpvj4jDSyYeknSxEIxaS4if4Z1WAEQlG4bKPmphCSC8J3TOJz1KdVPSdkO
	QjQuPxTloRIERwUWGe0ApwgymoBbpwEidg7CwEwyRda8veg5jx2Q9bquYi5zGxHTuM7w6J+NjDB1a
	isSuqipNmDEfTZ64r2K4i/laZhXb+odhH6wBPbS5joY2tADdJ/1ypeGXETlZMw25cBe5koOo9HHUk
	EOXi6Tkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNjm-00000002uAt-0uR7;
	Mon, 26 Oct 2026 16:39:54 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNjj-00000002u9g-38XB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:39:53 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a359c7f47bso18746365e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793032789; x=1793637589; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ucD/WoA7wxIoPFGYELZoInIDrJz1mWtO2kaqtrfylpQ=;
        b=ej4E9VBpEjIOo5Mtt4NeNKaaTO4bwC+E0NP3tvZ+rT0uwkZxlaRgcm1a1ep9UxUBZR
         LMkDZLzUz6/kIjS6F8sTNNYc00AC72Ijs/4qGFgRp2XSaLIpmtCTf/iRW2bbvjVFaNHi
         +8p4/1NB8Z/4Jr81TGfdcZ2xhl5PZMM1MEAvSgeDAz5YUoKwpnXcUwQ9xqBJ/t/1Gemy
         LqrfCLg2hEFEMkDYWELBeshEuBXQA5gNdUE5tT39GiapW0gvpxmhd7VoFn4UIXQDVDoE
         3RkwB5hYLk/hZLi7tjqZaSR+6YHc+6wbCwLweI2Vt8CI8xKkMgBb8jpc8aXh/Gubb68M
         ocgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032789; x=1793637589;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ucD/WoA7wxIoPFGYELZoInIDrJz1mWtO2kaqtrfylpQ=;
        b=jU7xV7/QQicyV9N4IosyYYkgvLUbti0LFBCxDLhVlvPR3TtMt5dH5kSrXLJ2+iyJW/
         NIFkbB3MB2djmBP6fRTTi7ZHSmhnaqyHXqGOGD0A+VYdFVDkygcRwmt7UzT++OBIs6cr
         PRFAPHBsLth/Z5ZcoRN8a7XQTflcjL7Ph2nOVcxOBStLerRfdoCC3PfhFiIldRUM90zt
         TryMLwsso/E187XKHk8E+1D4pPdlhqvfNHSb1AfiPptFZVgmpE7KNu61PjETR9MkVnLH
         FoxVxQgfTnxretF6W5ZGxiSKZtAfi9LK3QHAzdBMv28LMMb7cgVuor/eB6NGrKoI+E/s
         HqCg==
X-Forwarded-Encrypted: i=1; AKwUvBwbGiW1HGwIAw4dlfpTklLmX5jQICqN5h7utmyaXL1xUiYfO44ttC9aXxs11/7e9jNdNOSBoBx5NCeQDii15Zja@lists.infradead.org
X-Gm-Message-State: AFq9FYK0PkYVlYghi5wi4PlMb34NNfhYgOQ2iqGAjjGkKc1lrtKL05xM
	qj7ovquVwrZ2doudfnTjRjLuMwSqaVVyKQWIl9I5PzVI2UgoLVbfCxTka+clEWhucGrndWPTILr
	KHUIjXbTB3ibhiWnF+y0HaA==
X-Received: from wmfr7.prod.google.com ([2002:a05:600c:1587:b0:4a2:15e9:5ef1])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a318:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4a35aee2cfdmr103061435e9.31.1793032788588;
 Mon, 26 Oct 2026 09:39:48 -0700 (PDT)
Date: Mon, 26 Oct 2026 16:39:34 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261026163937.963087-1-vdonnefort@google.com>
Subject: [PATCH v3 0/3] KVM: arm64: pkvm: Fix missing reset of GICv3 LRs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_093951_799683_3EF304E3 
X-CRM114-Status: GOOD (  10.37  )
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
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The GICv3 List Registers (LRs) are architecturally UNKNOWN when a CPU
boots or wakes up from a low-power state. When pKVM is enabled,
__vgic_v3_init_lrs() is currently never called on boot, CPU hotplug, or
CPU PM resume.

Following Marc's comments on v1, instead of handling the LR reset inside
the pKVM hypervisor, this series fixes the host CPU init, hotplug, and
PM paths to properly reset the vGIC LRs even when pKVM is enabled. This
removes a few calls to is_protected_kvm_enabled(), making the whole
hypervisor init machinery more generic.

Since pKVM can't trust the deprivileged host, keep the reset in the
CPU_ON/CPU_SUSPEND path.

Changelog:

v3:
  * Drop "KVM: arm64: pkvm: Avoid trapping on HVC_RESET_VECTORS". (Fuad)
  * Collect Fuad's tags.
  * Apply the few nits (Fuad)

v2 (https://lore.kernel.org/all/20261022140048.2522787-1-vdonnefort@google.com/):
  * Make the __vgic_v3_init_lrs HVC always available. (Marc)
  * Propagate __hyp_reset_vectors() error and remove
    is_protected_kvm_enabled() special-casing in the host CPU init/PM
    paths so the host resets the vGIC LRs. (Marc)

v1 (https://lore.kernel.org/all/20261021110000.508827-1-vdonnefort@google.com/)

Vincent Donnefort (3):
  KVM: arm64: Make __vgic_v3_init_lrs HVC always available
  KVM: arm64: pkvm: Fix missing reset of GICv3 LRs
  KVM: arm64: pkvm: Reset GICv3 LRs in the hypervisor

 arch/arm64/include/asm/kvm_asm.h     |  2 +-
 arch/arm64/include/asm/virt.h        |  2 +-
 arch/arm64/kvm/arm.c                 | 50 +++++++++++++++-------------
 arch/arm64/kvm/hyp/nvhe/hyp-main.c   |  5 +--
 arch/arm64/kvm/hyp/nvhe/psci-relay.c |  4 +++
 5 files changed, 36 insertions(+), 27 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.56.0.257.gf7497c7d27-goog


