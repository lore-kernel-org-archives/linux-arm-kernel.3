Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9888CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 14:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aY/HOY3esc7iLj6djBy7POlcraK1TTeiecvmcTtxq88=; b=dAeOT2fiqJ2FiMuriQuDBe2AIt
	FE11dM+lknLOfducgwqbUe1DB2kZsZsR8tZZP/fHGOXqxinwL21XZwOXT5e+UAcq3sLEaikscG8BM
	31tc2M9V8JxJ3+VaNiVLIf20yhpJPl8j504lv0kbEGj3YX23ZPWlZsmuKKeXJKTPhOwfWplUKs6Or
	3BZPnTmQGNKElPHhlZ4IiCd1L1W0/18LMv9hUteZARDHC1VYLryb7K3gpETfocffrq18D8f6qV5Hm
	R9atZiuyJ29Bmqnr7eHq9PkX1OlhqKjbYyLmKAL/0Ty92j357n27sn+zcQeOU+qTs00qdF+7XvYio
	JXlithgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urGpE-0000000FgpZ-2BMK;
	Wed, 27 Aug 2025 14:08:32 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDFx-0000000F2Xv-1ENa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:19:54 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45a1b0cc989so47661415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 03:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756289991; x=1756894791; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aY/HOY3esc7iLj6djBy7POlcraK1TTeiecvmcTtxq88=;
        b=sxGFKDJoXzJXrCAey5Qybc2ue216O9khkDxFukvKzWflAZR+OOXnrdbjpR4t+Imd6K
         GWq+OUFlR5F2rCU7qW+2sGWpBBX++rIfAFsmoYYWZeh/uiXZ37OB+jblIG8JjxiSOszJ
         0+8wq2NKLwt3whwEdDgoGxXdX3RZB6REHK9y9Uw4pkqnVDrhj8eae4rxFcGtBZ5Zgl3r
         Iap7LewpZ2AHORnZr28CXXRyrxttVB/hzFZGpRgtzvHeUSa63xE9BDFQFFGEHhdYVM0W
         SHDVEpHD5LGqAB5I1xJdV/4fVU/BYKWLRE/kgatB2j0yOWm9sYxOsJZ94IA1bgri5SVA
         ZFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756289991; x=1756894791;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aY/HOY3esc7iLj6djBy7POlcraK1TTeiecvmcTtxq88=;
        b=UxhVkgYYpWDyp02NXF8RwmLPyFTmvWRD6gLQCYb02JmYSHHJp0/cVsGIgVO0cif7sv
         9LTrBZrpYZgEmAwnKBSFVnaeqlBnb4nwv8eyWWWTHE/RDiOHLHzPOeDhvj5cRb29W7r1
         9FlRv3mnYyBhgAepogLhZwfyOAf/8VCfPPkmvt+Inrh24NxDU5tWrmJM2H5CR2sg17wJ
         vegGQ1laYbxF+lXJZXQKGyNBBXQbFEpbCgdrQ9bO7Ssqp1YoUUftFauJ4POtk6IrSu/L
         wDIZs72Uwd06hU9frtOL2Ot6U4CmkWCML9VRNcUjoV3QnkdcoxPZ7C2teJCTLq2H0gWD
         KqHw==
X-Forwarded-Encrypted: i=1; AJvYcCWfJPF2NRgSDdRbyeT2niMW0QEaS8dfa5EgeGi7wenTYWCPPkw67nDmUKZXoDEmQ74E683njXnSn4nVGpKw7pRK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+tqwWXvoIOOApy5Pg5t/YEYyQ8nxxc1LSVRt5Tsk3Uc0rvtX0
	UV9Nvo5BIJQeJuMINzdZXiAPTSJsU52MJDfp5Bd26eeXKj1MlJf2zTRvxB3XKAevr+r5uFFNKqG
	QTQ==
X-Google-Smtp-Source: AGHT+IGVx8dVPxAEwHkMwTbEjRKkAi25ytMaI23qr+UCUfvHQCf/8gvOt0+gLqsmTrkGgu27mc6kH+cznw==
X-Received: from wmbay25.prod.google.com ([2002:a05:600c:1e19:b0:45b:66d9:7573])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f41:b0:459:d3ce:2cbd
 with SMTP id 5b1f17b1804b1-45b517ad602mr160115725e9.13.1756289990971; Wed, 27
 Aug 2025 03:19:50 -0700 (PDT)
Date: Wed, 27 Aug 2025 11:19:40 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250827101949.4089456-1-tabba@google.com>
Subject: [PATCH v3 0/9] KVM: arm64: Reserve pKVM VM handle during initial VM setup
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_031953_361087_2C4246D6 
X-CRM114-Status: GOOD (  16.63  )
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

Changes since v2 [1]:
- Added a patch that checks for duplicate DECLARE_REG use
- Rebase on Linux 6.17-rc3

All VMs in pKVM identified by their handle, a unique per-VM ID. This
handle is shared between the host kernel and the hypvervisor, and used
to track the VM across both.

In pKVM, this handle is allocated when the VM is initialized at the
hypervisor, which is on the first vCPU run. However, the host starts
initializing the VM and setting up its data structures earlier. MMU
notifiers for the VMs are also registered before VM initialization at
the hypervisor, and rely on the handle to identify the VM [2].
Therefore, there is a potential gap between when the VM is (partially)
setup at the host, but still without a valid pKVM handle to identify it
when communicating with the hypervisor.

Additionally, in the future, the host needs to communicate with
TrustZone about the before the VM first run. Therefore, move handle
creation to when the VM is first initialized at the host.

This patch series also takes the oportunity to do some refactoring
(mostly renaming and fixing documentation) of the code. We are in the
process of upstreaming pKVM. Refactoring this code now would generate
less churn than postponing it, as the upstreamed codebase grows.
Moreover, the exsiting names and documentation are at best misleading
(and in cases actually wrong), which could lead to more confusion and
problems reviewing code in the future.

This patch series is divided into two parts:

- Patches 1-5: Renaming, refactoring, and tidying up to lay the
  groundwork for moving handle initialization and to fix existing
  issues.
- Patches 6-9: Decouple handle creation from VM initialization at the
  hypervisor and move the handle creation to VM initialization at the
  host.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20250811101947.3637632-1-tabba@google.com/
[2] https://lore.kernel.org/all/20250303214947.GA30619@willie-the-truck/

Fuad Tabba (9):
  KVM: arm64: Add build-time check for duplicate DECLARE_REG use
  KVM: arm64: Rename pkvm.enabled to pkvm.is_protected
  KVM: arm64: Rename 'host_kvm' to 'kvm' in pKVM host code
  KVM: arm64: Clarify comments to distinguish pKVM mode from protected
    VMs
  KVM: arm64: Decouple hyp VM creation state from its handle
  KVM: arm64: Separate allocation and insertion of pKVM VM table entries
  KVM: arm64: Consolidate pKVM hypervisor VM initialization logic
  KVM: arm64: Introduce separate hypercalls for pKVM VM reservation and
    initialization
  KVM: arm64: Reserve pKVM handle during pkvm_init_host_vm()

 arch/arm64/include/asm/kvm_asm.h              |   2 +
 arch/arm64/include/asm/kvm_host.h             |   5 +-
 arch/arm64/include/asm/kvm_pkvm.h             |   1 +
 arch/arm64/kvm/arm.c                          |  12 +-
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |   4 +-
 .../arm64/kvm/hyp/include/nvhe/trap_handler.h |   3 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  14 ++
 arch/arm64/kvm/hyp/nvhe/pkvm.c                | 177 +++++++++++++-----
 arch/arm64/kvm/pkvm.c                         |  76 +++++---
 9 files changed, 219 insertions(+), 75 deletions(-)


base-commit: 1b237f190eb3d36f52dffe07a40b5eb210280e00
-- 
2.51.0.261.g7ce5a0a67e-goog


