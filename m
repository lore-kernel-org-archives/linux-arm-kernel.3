Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B00C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wxpAfyKdQgVQrLozxDIkV2Sv+aNXarc/mWfTeStJk/U=; b=vCuXAeO3ehy8pCP7f9Z87vtLcO
	ih2q1xrZRcnUDE9sKEt55/x3CRo7lM2Xv6xjGM2Zvet+T6S+YwBEz1OwVdzkRC1WeKaTNpLLd6B9r
	lmsygsmFHTBcVj7GvBiusVx9/88uB8vCc/72UX2mqgJNhuRpfKjx8l5P9HNirfeIxMPnu5wDLeQfI
	s7wUGURnXeBIU6x+yzGppPB1WL0aJt9OrKnHN2sp/a0sTtB7BcvbuOrvCHNxz64dtsuHylQvRQWVR
	ltivfNLzlYJeqMKxoTPePu0al3kWEyzLCeQlXbIg5wkyclCBn9pZExhXlTjY4RW7YrQN92BwOzdXL
	NVgy2tDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8PT-0000000EBP2-29XB;
	Mon, 29 Jun 2026 09:36:11 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8PQ-0000000EBOS-2W2u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:36:09 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-46315372c3eso2371747f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 02:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782725765; x=1783330565; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wxpAfyKdQgVQrLozxDIkV2Sv+aNXarc/mWfTeStJk/U=;
        b=I7Kuss0eUlJ4rc5U34EZPgLRmViqDEeFBUv6XpK/HLBvqiYMc03OJ4fz11wQ4cgeaR
         vbJYUESbtpaa6fJvdFFCtBlaeggjudU7HcF+dGZjJcea2GPdVR8hnvZUUVyufE2ff0cl
         IwSaP8azYGsPcxhEi6ybsD3YA5khwmHeYPRxv8fYxYku7rMFkG3eSkhBSR3y+Mc8uGiV
         ZdB860RJR+uB7WrEx44p9CKwizIwbOeI+QdAUXIDpT+71jWrLv1rh9naHX+tsEKmxS6s
         dalVr8wN7g1uBjuMjDAe+DVQAIEl1Tu9tmuaoknQGq5aIOklJDM/w+2045uO7VuS5imn
         0kVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725765; x=1783330565;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxpAfyKdQgVQrLozxDIkV2Sv+aNXarc/mWfTeStJk/U=;
        b=kjz/vPXW8+eA4lSoLHVrYWiaozdMbQIFHbPAje/eRXBvfemE+PPXhQnszrTqCZBiDo
         32EkjJKyNzp8hKyIoh8codKZqh1yyvaWjWWFgaAoYRPMB9yAlQ9dZqteav3WhxB9axuE
         rO9tfEq/ZW6vP8NVirwT6xenRTUlvkGW8fEhWeAAP6QFyLl9jLcjTSrmYaHDdWAegwyk
         S5PvIGxRowo/T/QWMH4wAbL/8WIvz8onA3wHbpIPqQFZWqKaZgVcnNJFDZKkvxSr9Cc/
         OBw/Xvfr+wxEd/uyP2bKdIkcbIbq3sfncovU/QgZ++g3ghY3IltrUQmHcWJtHXfvAA6J
         mTWA==
X-Forwarded-Encrypted: i=1; AHgh+RpoT4jb7jCox+WWaoVGUZYv6UYitRSR+U9M24YGzqZFxs5vj2s6/U5o3m664BODZ/w+I1xHPSzoIMRNT5jbhe9i@lists.infradead.org
X-Gm-Message-State: AOJu0YwJp+rGSG8zr5XZK3n3ItPHHoFMeWdSa874JQY1otDPtQvEYyJi
	wZ6U2dS1EzWRi1fOocndGZ6w0MP7U8eRtJaJtM1gXgdl+UZaT9KXsNdFQ4xcjQCRskg5H8XM66K
	47kvWSx5RkvDSs14RRRGojIWVNy550A==
X-Received: from wruk15.prod.google.com ([2002:a5d:628f:0:b0:461:ab57:c986])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4289:b0:45e:f302:95b with SMTP id ffacd0b85a97d-46dc18a5a3amr27301738f8f.37.1782725765154;
 Mon, 29 Jun 2026 02:36:05 -0700 (PDT)
Date: Mon, 29 Jun 2026 09:35:51 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260629093558.2425257-1-sebastianene@google.com>
Subject: [PATCH v7 0/7] KVM: arm64: Forward FFA_NOTIFICATION* calls to TrustZone
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_023608_658675_FF5DDC1B 
X-CRM114-Status: GOOD (  20.19  )
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

Remove the FFA_NOTIFICATION* calls from the blocklist used by the pKVM
FF-A proxy. This restriction was preventing the use of asynchronous
signaling mechanisms defined by the Arm FF-A specification to
communicate with the secure services.
While these calls are markes as optional, there is no reason why the
hypervisor proxy would block them because:

1. Host is the Sole Non-Secure Endpoint: The Host operates as the
   only Non-Secure VM ID (VM ID 0) recognized by the Secure World.
   Because all forwarded notifications are inherently attributed to
   the Host by the SPMC, there is no risk of VM ID spoofing
   originating from the Normal World.

2. No Memory Pointers or Addresses: The FFA_NOTIFICATION_* ABIs
   operate strictly via register-based parameters, passing only
   VM IDs, VCPU IDs, flags, and bitmaps. Because these calls do
   not contain memory addresses, offsets, or pointers, forwarding
   them doesn't pose a risk of memory-based confused deputy attack
   (e.g., tricking the SPMC into overwriting protected memory).

While the pKVM proxy behaves as a relayer, it doesn't currently have its
own FF-A ID(only the host has the ID 0). The behavior of the setup
flow is covered by the spec in the: '10.9 Notification support without
a Hypervisor'.

---
Changes in v7:
- rebased on 7.2-rc1
- collected the Ack from Will
- check for major version as well when doing the SBZ/MBZ enforcement

Changes in v6:
- applied Will's feedback and re-ordered the patch series so that we
  apply the MBZ enforcement at the end of the series
- update ffa_check_unused_args_sbz so that we take into account the FF-A
  version because the spec changed the list of unused parameter registers
  for 64-bit SMCs from v1.1 to v1.2

Changes in v5:
- handle 32-bit smc variants correctly when doing the MBZ enforcement
- add check for FFA_FEATURES
- handle missing FFA_FN64_NOTIFICATION_INFO_GET
- collected the Review tags from Vincent, thank you 

Changes in v4:
- previous series(v3) had serious issues with the patch number and it
  appeared like it used a mixed bag from v2 as well. Resend this to
  restore the correct order of the patches.
- fix strict check in ffa_check_unused_args_sbz and make it "<= 17"
- check the receiver endpoint Id in
  FFA_NOTIFICATION_BIND/FFA_NOTIFICATION_UNBIND instead of the sender
- use hyp_smccc_1_2_smc all along 
- check the receiver endpoit Id when doing FFA_NOTIFICATION_GET  

Changes in v3:
- applied Will's suggestion to use the introduced method
  ffa_check_unused_args_sbz for existing calls and added a new
patch in the beggining of the series to do this.
- merged the handling of
  FFA_NOTIFICATION_BITMAP_CREATE/FFA_NOTIFICATION_BITMAP_DESTROY into
one patch as Vincent suggested and create one handler for both.

Changes in v2:
- enforce the MBZ/SBZ fields
- split the calls into separate patches
- rebase on 7.1-rc7

Link to v5:
https://lore.kernel.org/all/20260623115354.632361-1-sebastianene@google.com/
Link to v4:
https://lore.kernel.org/all/20260616154149.2763214-1-sebastianene@google.com/
Link to v3:
https://lore.kernel.org/all/20260616105417.2578670-1-sebastianene@google.com/
Link to v2:
https://lore.kernel.org/all/20260608165549.1479409-1-sebastianene@google.com/
Link to v1:
https://lore.kernel.org/all/20260501114447.2389222-2-sebastianene@google.com/

Sebastian Ene (7):
  KVM: arm64: Forward FFA_NOTIFICATION_BITMAP calls to Trustzone
  KVM: arm64: Support FFA_NOTIFICATION_BIND in host handler
  KVM: arm64: Support FFA_NOTIFICATION_UNBIND in host handler
  KVM: arm64: Support FFA_NOTIFICATION_SET in host handler
  KVM: arm64: Support FFA_NOTIFICATION_GET in host handler
  KVM: arm64: Support FFA_NOTIFICATION_INFO_GET in host handler
  KVM: arm64: Enforce strict SBZ checks in the FF-A proxy

 arch/arm64/kvm/hyp/nvhe/ffa.c | 220 ++++++++++++++++++++++++++++++++--
 1 file changed, 212 insertions(+), 8 deletions(-)

-- 
2.55.0.rc0.799.gd6f94ed593-goog


