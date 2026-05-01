Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639E5CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7KgqZx+Fsyugile3PZCp4dg4EBjBcAxKu/8HH+dIz9w=; b=hvqXtpu8LHCqK4pkKtraBZrGc6
	QMDx96PL55HcThBTecDnHGRdeqm5OpJCmRVY8Ck0tuIY7uQjF01TBxs3ITujaz3cbAO/3QXW0hkqc
	poOhlznZ8hPmYeNz4wjn7TqJgw8XmCZ+gKfyGeMlnRsKTsuhwUoI7XudnCCfF1v6xLIt3u8jMNDVh
	zfn6etvboDWEEQVLnmlpLWB2MWoYIEep/8OrmUsZFzzUrqQIqV9GUbrWS2mrVOrWf0QwE75w6bZrn
	QOtVBu1kHyeO2OD5q0h9hL7XrrywYgKrW/mNf7XN6Zokak0iG1dAWXDiF/c/7qwgtqhq3Hn2CVTLw
	twSsNOHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wImJ9-00000006gFH-3UZb;
	Fri, 01 May 2026 11:45:23 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wImJ7-00000006gEu-1XCo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:45:22 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-67b9353942bso566773a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777635919; x=1778240719; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7KgqZx+Fsyugile3PZCp4dg4EBjBcAxKu/8HH+dIz9w=;
        b=lU1ttxJrriw6u40sL9G+VtXiUiWhu81M0pFihhlUOA2qwsvMz3VdoPB10++QzypA/Y
         JfqGz0xlwemdtRNkPRb/y7hifVES7cpUCVwol3Pjlf6mEmfE/HXf/PsDfr+pAFMVTIUd
         0P0tc+J2Cbyqyt4cFlAkjcix5EMJ8C1v1DdfAQyK3m6051nR02AIKgfE3LdREhf8taLF
         efOX96ra0dPEh14JiVtHQpE7ddi2kQWdG6PnSRB3reE7418EwZerBSdOlGGw8tH0jbx4
         zKOjax9+fpponhaR40GVNdJujoR6unA7Z9uTVlGee9q7R0U7WwFvqsLTcnSNP4ZXijDG
         v6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777635919; x=1778240719;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7KgqZx+Fsyugile3PZCp4dg4EBjBcAxKu/8HH+dIz9w=;
        b=EdpLXqcQ+Slmy2TyNL6pZLc1DHqopmlsrt8+3f72jAwNYSMlioTahvAmW6oPztF6dp
         boO5JTPpm7JVtQxGuvdU7NjnDPaPw/q1nw0TbfaWV4Z8X1QMW4785b2vpSAU++qNO1sX
         8eGH4TkSfvCzHySCzsRfZ+Lw53tGLkCfA1nDiBfNrHkffVXKSoEW3EBuB3tcvlrroUI2
         SR8+wO/3OQJ+hAEBdoDYmIvTml3DGznTkANEY4kICqKZ/6XNwfueBc1Ati3Dq68mpBDI
         hOEREJIu0RH4OV56cWSy8QFzEdvsnHghhdDTB+p25S8wAgPWsLqm3rwGJP3Tzv8ZeV2f
         N9rg==
X-Forwarded-Encrypted: i=1; AFNElJ9rKIiechIukNAyNOEBSW8nXkv7abF1vk1QU0LngieMDCU1rh12Ovnc2RJ0vq8cE+ZMI0iYwGiAeBAd0c5rJo3O@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh6AbJPDbiY76OmLBLgqBVOlJdH5snY1xKwJGAoOcVNMhnioOQ
	TZ6Bnv7X2RXNtdMiORPURE05xW/VI7SHwcTDfoJU3vLA5bvT9exmjnfmRp2dv1jekirrMBIUTGa
	iqYU6y6Ke6K3RY7M9LeFSBNSCd4+rQQ==
X-Received: from edbgy7.prod.google.com ([2002:a05:6402:5bc7:b0:674:dc48:b1f2])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5209:b0:672:8f26:8aad with SMTP id 4fb4d7f45d1cf-67b96e73d68mr1282304a12.9.1777635918653;
 Fri, 01 May 2026 04:45:18 -0700 (PDT)
Date: Fri,  1 May 2026 11:44:48 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501114447.2389222-2-sebastianene@google.com>
Subject: [PATCH] KVM: arm64: Forward FFA_NOTIFICATION* calls to TrustZone
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_044521_424616_AEEB972E 
X-CRM114-Status: GOOD (  12.42  )
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

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 1af722771178..a82d0cd22a17 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -675,14 +675,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_RXTX_MAP:
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
-       /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_BITMAP_CREATE:
-	case FFA_NOTIFICATION_BITMAP_DESTROY:
-	case FFA_NOTIFICATION_BIND:
-	case FFA_NOTIFICATION_UNBIND:
-	case FFA_NOTIFICATION_SET:
-	case FFA_NOTIFICATION_GET:
-	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
 	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
 	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
-- 
2.54.0.545.g6539524ca2-goog


