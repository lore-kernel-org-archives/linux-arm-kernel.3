Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9617BCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pQYTCkieiArSO8QgN3A7DsdongSxCEFY2bYSSqBfmwY=; b=mvcREmSr7Anz3HbRp/Mv1BBf4G
	cMP+FL0lsr8M8oJtIEZEYYTQcrUP0Aauz0fWZAwdsZKt052QzACHTp/9IOjNPad7+pgR0XdV/U/m8
	jm0NJSn/vcG8n76go1fUBrIOfqLBBrOwlyfwW8a51+1NCP8bAlXJ452eP1uuiN6jLUnyJcy3+gGFc
	65dZtNIqi03PZcvXeKeDjITkGI8t35kn1jUJE7fjBDBO6K+04raUG7oz+E/Ey5SA0not09Eren+bR
	GOpqF4hZ6kWD1WOM36/P4B98oHw39JLZps86aaIaURSZOV0VSUq8GhvKuwxjc9Yh+SpASAHXpDCDB
	t8RuFUxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzhi-00000006D1U-1zTV;
	Tue, 23 Jun 2026 11:54:10 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzhf-00000006D0x-3YoS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:54:09 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-4642a5651d4so5625392f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 04:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782215645; x=1782820445; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pQYTCkieiArSO8QgN3A7DsdongSxCEFY2bYSSqBfmwY=;
        b=qLrqqnVbulYfNlPcGxrmyZg57nBnFKmlUePwug9a43+89amSr5H4sT5ccbC9p1MYnc
         +xscgGC+E6i/X5/fUydHx5hytvQi9lKsXq5n3jugsBsX4Ahc2b4wwCE6JFPXsGcZUSuC
         CNlTiG3dR6/ouR0usPhO2H6oyvXY95746pfGoZ1KTCV2uRBwGNpCwrOGbA5j5gg5LgIH
         /8CuKIisSvjjleNQwm0dHY0m73mUJ3bz3826iZXlMuwBAthU/kWk9RSEIwUQCFyPB62j
         UkqkKWt4vNz9n0OWhHwtI/ft9ckG2snQd8uQRJ6bWUOfFFrKICQ79NzEYhYOCTAbMtVP
         ImPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215645; x=1782820445;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pQYTCkieiArSO8QgN3A7DsdongSxCEFY2bYSSqBfmwY=;
        b=qofo3/PqQRcEyRe0MUezDngzsE3Jm9Pdyg8+kdwqlYvUpFI6rXHpBiU8/f2laEl4OF
         sNUdU8FPsMJZ08/HAkDHUds2ZBBh8JUGuf4FnY0//ner/L67dKXxaZ9TJUvR+nTSFrRT
         ocnD7iGdl04QfP2qE2iydO+0PiUErk6ErClsdqyLZRtnrl9AWTh67QfccZWbGP4YllO6
         oAAzLd0q6jHm1fndGz0Tcy01cOipRRfX6CRmfpTOfwh3z4LwNvqee+hD5DJ8lAmND7wY
         PWWDzfCL4uvIe7Nb1DNm/X/Yrkifk78JX46FyB4HDQsojh2LmCsLNDv10xdi7qDuncFv
         XcpQ==
X-Forwarded-Encrypted: i=1; AHgh+RrExdkitXgPAoHvlMARbSpnN71ttgSmWo1wPMTSuNGWKduHCgqOz0n9qYPjQLCEyrWZ9H4NdYd+Oq53E5ulypcR@lists.infradead.org
X-Gm-Message-State: AOJu0Ywke07rSF7ZCE7d439fU61FZklo8ZjJ/SViGWdMSdpHSw2pu+9K
	3xnYW1z7dFlJeuSXyBrugfXOP3b2FrIfWuu67T0seGYcRMOwpk/2e/LjQwG1o6JghRPRc6kV3eQ
	v4w7ojt1gBwhaQn+xBipxnuX1rfZzPQ==
X-Received: from wrql14.prod.google.com ([2002:a5d:480e:0:b0:462:257d:36d7])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2902:b0:468:b71a:6efe with SMTP id ffacd0b85a97d-468b71a721dmr14364108f8f.6.1782215644532;
 Tue, 23 Jun 2026 04:54:04 -0700 (PDT)
Date: Tue, 23 Jun 2026 11:53:47 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.786.g65d90a0328-goog
Message-ID: <20260623115354.632361-1-sebastianene@google.com>
Subject: [PATCH v5 0/7] KVM: arm64: Forward FFA_NOTIFICATION* calls to TrustZone
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
X-CRM114-CacheID: sfid-20260623_045407_905552_46754BD4 
X-CRM114-Status: GOOD (  17.89  )
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

Link to v4:
https://lore.kernel.org/all/20260616154149.2763214-1-sebastianene@google.com/
Link to v3:
https://lore.kernel.org/all/20260616105417.2578670-1-sebastianene@google.com/
Link to v2:
https://lore.kernel.org/all/20260608165549.1479409-1-sebastianene@google.com/
Link to v1:
https://lore.kernel.org/all/20260501114447.2389222-2-sebastianene@google.com/

Sebastian Ene (7):
  KVM: arm64: Enforce strict SBZ checks in the FF-A proxy
  KVM: arm64: Forward FFA_NOTIFICATION_BITMAP calls to Trustzone
  KVM: arm64: Support FFA_NOTIFICATION_BIND in host handler
  KVM: arm64: Support FFA_NOTIFICATION_UNBIND in host handler
  KVM: arm64: Support FFA_NOTIFICATION_SET in host handler
  KVM: arm64: Support FFA_NOTIFICATION_GET in host handler
  KVM: arm64: Support FFA_NOTIFICATION_INFO_GET in host handler

 arch/arm64/kvm/hyp/nvhe/ffa.c | 219 ++++++++++++++++++++++++++++++++--
 1 file changed, 211 insertions(+), 8 deletions(-)

-- 
2.55.0.rc0.786.g65d90a0328-goog


