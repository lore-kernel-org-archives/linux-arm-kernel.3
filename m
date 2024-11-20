Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085A4D63928
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 10:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FHhbZGchrrZYNelaupOfg6fP9x+BokooGfDZlzPZG5g=; b=ISIV3copk6Fa08MyTKJ2FxsALK
	xsDezMZBrdiO+Iv75GEgX4FA4d/lJ07p1G/2P1+ykXv8z742VaM1ZD8Nn8F/iTGp61mAREQQ3IKAS
	uQdcdPhVHVCdm6eW4pHrPegeA+Rdt1SqRhev5G5QMKimE/VeL9EO3HjvHfojuNOG69INXpkd4dZTs
	xsvoMrLZDZGThmNnashNcqyshK9Jad+ximv/AA6G1LoCt0pbk+wfuxG/WmmlT1WX2no5SLkcDvjy6
	3qZK4EOLRvG8K0RiVXsKcV1Y29GeZXAKkWC/9Upmknlgxz27um1t0IQc5tP077LucmxMl1HB1ueoG
	1KIt9obA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiLT-0000000F6ad-2Loz;
	Wed, 20 Nov 2024 10:54:03 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiKR-0000000F6PT-0Xhj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 10:53:00 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e381f195051so3595144276.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 02:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732099977; x=1732704777; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FHhbZGchrrZYNelaupOfg6fP9x+BokooGfDZlzPZG5g=;
        b=yimfaD7Z+YqtoMKvPP0Pd9FYX70atbpGmkziAvJHjuCKobAMy0P2KZcO09J5uVUha2
         jFZVEnLPtqiaA/CLrGXwG6N8c5vHe7bh5aVAHna6jKlCoDh3/Rr9i+XlWldp8ORql7ow
         WgLVGn3I1bVlz/ssVmmezWIUEc6AKiGpKm+aX/Ceb4Y8x8YA2kJGdbMqsT0yKWaEwtpa
         vidPUlnuaptJo12xtsu09/uoAz039gxc8jYQjQWcK6mtAEJUPpRlb76VkD5De9x8xxr/
         QD774SnDKE1kQiVnC/6U/0WOeHGgxJeGx2KRYMG6yqGwsWiydi9SaS90jZAl4Hxx6V2l
         F4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732099977; x=1732704777;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FHhbZGchrrZYNelaupOfg6fP9x+BokooGfDZlzPZG5g=;
        b=I5S79mWN/TcO7nJOqtAErGso5eoB2Pd3zToaoKpFbwY28nPdTozQM6VdlJ1oFhJ7pn
         gos8ZXnzPpdSZ2sKJrvcaNgsBPqQUWUky47M1JyTU3L1y+tL9XKV7pcHMF3evkdt0WE2
         L6g5Z9iExzj9hXLnTZojXy2gOK7yReGLowmuXg/YVWOBQ2I8NvLEdLnehF+GI+FiOOda
         mek+nusip/iyiBVgCBMydBFmhQCVA+FDmDIGAObPi2davPogGW6H+FHjZyVy9ch2/3d2
         /tw5vQrkQAldqoHaWluCqmfuz3c0JdWfrZBgPqFszQbPrYEugZU0AEzoRZ4D7BuhGeJw
         CXiw==
X-Forwarded-Encrypted: i=1; AJvYcCXTMswcwG5KWk0wq1+OyDj8ccPOI/7ELD++bCeMdQbA69dPgIWjnhGvB+fnVfmTLPnuZU4PbVlc2xKJhencO8Uj@lists.infradead.org
X-Gm-Message-State: AOJu0YwUaT4eJmkj6yotJRxELTaLzak4Ck/4/1GVdJrI5GEa1+iG8ace
	RSvuDPaUfFXwQCdn7GkVYPqQ+SC7EWot9PyuSY2E94UrSfQ4xk32FoD8Djt5fXGyTLPVWOrvlg=
	=
X-Google-Smtp-Source: AGHT+IEHB1YOXijgGLZrRIlmTdc5FO6mh9kPr95x/aAbfNOvWt1pqsH9KS2Zz85273eXR5AYVlwVSiRaew==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a25:360f:0:b0:e38:10a7:808e with SMTP id
 3f1490d57ef6-e38cb3de86fmr9039276.0.1732099977073; Wed, 20 Nov 2024 02:52:57
 -0800 (PST)
Date: Wed, 20 Nov 2024 10:52:42 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241120105254.2842020-1-tabba@google.com>
Subject: [PATCH v1 00/12] KVM: arm64: Rework guest VM fixed feature handling
 and trapping in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_025259_167086_B90E4AEC 
X-CRM114-Status: GOOD (  14.53  )
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

This patch series redoes how fixed features for protected guests
are specified in pKVM, as well as how trapping is handled based
on the features available for the VM. It also fixes a couple of
existing bugs in the process.

For protected VMs, some features should be trapped if the guest
tries to use them because they are not supported (e.g., SME), or
if they are not enabled for the particular VM (e.g., SVE).

Initially, pKVM took the approach of specifying these features
using macros and grouping their handling by feature id register.
This proved to be difficult to maintain and bug prone. Moreover,
since the nested virt work there is a framework in KVM for
storing feature id register values per vm, as well as how to
handle traps based on these values.

This patch series uses the vm's feature id registers to track the
supported features, a framework similar to nested virt to set the
trap values, and removes the need to store cptr_el2 per vcpu in
favor of setting its value when traps are activated, as VHE mode
does.

The changes should not affect the behavior of non-protected VMs
nor the behavior of VMs outside of protected mode in general.

This patch series is based on kvmarm/next (60ad25e14ab5), since
it requires the patches from the series that fixes initialization
of trap register values in pKVM [1].

Cheers,
/fuad

[1] https://lore.kernel.org/all/20241018074833.2563674-1-tabba@google.com/

Fuad Tabba (12):
  KVM: arm64: Consolidate allowed and restricted VM feature checks
  KVM: arm64: Group setting traps for protected VMs by control register
  KVM: arm64: Move checking protected vcpu features to a separate
    function
  KVM: arm64: Use KVM extension checks for allowed protected VM
    capabilities
  KVM: arm64: Initialize feature id registers for protected VMs
  KVM: arm64: Set protected VM traps based on its view of feature
    registers
  KVM: arm64: Rework specifying restricted features for protected VMs
  KVM: arm64: Remove fixed_config.h header
  KVM: arm64: Remove redundant setting of HCR_EL2 trap bit
  KVM: arm64: Calculate cptr_el2 traps on activating traps
  KVM: arm64: Update vcpu state with live value of VBAR_EL1 on injecting
    an exception
  fixup! KVM: arm64: Initialize feature id registers for protected VMs

 arch/arm64/include/asm/kvm_host.h             |   1 -
 arch/arm64/include/asm/kvm_pkvm.h             |  25 ++
 arch/arm64/kvm/arm.c                          |  30 +-
 .../arm64/kvm/hyp/include/nvhe/fixed_config.h | 223 ----------
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |   5 +
 arch/arm64/kvm/hyp/nvhe/pkvm.c                | 313 +++++--------
 arch/arm64/kvm/hyp/nvhe/setup.c               |   1 -
 arch/arm64/kvm/hyp/nvhe/switch.c              |  31 +-
 arch/arm64/kvm/hyp/nvhe/sys_regs.c            | 414 ++++++++++--------
 9 files changed, 403 insertions(+), 640 deletions(-)
 delete mode 100644 arch/arm64/kvm/hyp/include/nvhe/fixed_config.h


base-commit: 60ad25e14ab5a4e56c8bf7f7d6846eacb9cd53df
-- 
2.47.0.338.g60cca15819-goog


