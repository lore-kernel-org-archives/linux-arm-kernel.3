Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE9EE73148
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 08:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4bYzuIeTIcCNGWSl8VjsJtqLHBazJT084269tJJreU=; b=SWwZVZN5JUkbozwM6xBhPkkLxf
	G8ZqGQVVQhPw7Nr3Xx1+CH1Jj5/9KZGj0O2R/5CHj/3xalHQq1RQiOAccPeDx2DCURhyq9kRfrmS6
	QaZW8zfjzH/d712hLkFVskKcOHW8nHH9cXLkoEbUphzEIVOUwnKXiuFAPUTF525fLrujD2V3A05UI
	r9yRkZLLfV41BaWjTIgD0RHjYRIqxyI1rcfvMWsfWvDo2ZctDV43n5iLeDqiNjNhr2Ixmr/DqRG3R
	uS2nkfk2ONHw9CFr9U3HyccpWt9bXV8ALnA74SuXVK7sfNNlMqhTW63Wz7ohtFubnd0zB4NLRh20s
	Fftakqrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpkQ-00000004fkg-3XIw;
	Mon, 02 Feb 2026 08:57:30 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpkN-00000004fiG-3I7q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 08:57:28 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-6582edb3894so4822774a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 00:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770022645; x=1770627445; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=e4bYzuIeTIcCNGWSl8VjsJtqLHBazJT084269tJJreU=;
        b=fu23rjGRa7dd83rp+cCDsEE+FudGR8qTb7fpN2sCyn6awt8VnnahHDicwVrrUs3vg+
         NTBf7XDAAG4AnhidCyL/XoM/qvuk5qi51VJTK7bVg+T9V6SyLB1abo282mwthV9Ti6MS
         IeukWYTEF2+xvAn9nSf4geDWiSv9jNi+Cje4VHXaA6P1IJNqmbXFl9aHb0mlhJyx9Gzt
         ox/mDA1e3+VY+Z0Pblie0pGsy91BNvD8oNvrVFvqD5qHBlFeA5ewPXZjLpLHWmsnm1HA
         DMjp67xnMrxrjt+4ZmbaYSBAE7MHoiI9wy+mdWwiz26RkeCmyQK64eHqA/jgNuD/qY7Q
         gN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770022645; x=1770627445;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e4bYzuIeTIcCNGWSl8VjsJtqLHBazJT084269tJJreU=;
        b=P+jcGwl+TAJsvs3mP4Q848K8UHz5vsByoXO48VnP1B/j5AHl3K4TbsoFKlrOFzPbJt
         g+3mTiSLA3CLH0XYtg/Yoj5f4Ps7wfvwOw9Fpc86EUDOBbUZ8nS5AoIALLQxpErDEmVQ
         /Z7/x6+55MHmpmfC+fywxB494nb4oD5Qt2+49Poy/A+CkDuir0Ah6fd+lyFF+xdPfFaB
         ojPo+9QAsIoi4ZWykro97DtqUubHFeFWhc2IXBMD4IcwaYxEeaMgaHBUSXU26qZJF9l5
         Ro89mmL2YT0pYIbS+3waPFqzevDdumc6g9oUD9AsM3ukUoncpLGLjmTHAPi3ogSccbJT
         FYrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5yr0/rEExUp3eXIsxw+6HRueWcAyhGQnx7xh8XuvV2pEgvq/bptyNG+pNZgpywSspb0xisJD/hHO87uqihIyV@lists.infradead.org
X-Gm-Message-State: AOJu0Yyoyq80Hg9/4pDAtRmluLOhWUdv0KwlfZZfrlDdsSDPAWJ1dSSM
	+pccyhiB45/+cOq86IdHuHfl24M8++KhGaLcjwv35V3yovGghHji0nb5yp/NTCTGGoUhoLj8Z9s
	GKw==
X-Received: from edzh14.prod.google.com ([2002:a05:6402:94e:b0:64b:a7f2:4991])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:254c:b0:658:b55d:2822
 with SMTP id 4fb4d7f45d1cf-658de58d9cfmr6382582a12.16.1770022645475; Mon, 02
 Feb 2026 00:57:25 -0800 (PST)
Date: Mon,  2 Feb 2026 08:57:21 +0000
In-Reply-To: <20260202085721.3954942-1-tabba@google.com>
Mime-Version: 1.0
References: <20260202085721.3954942-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260202085721.3954942-4-tabba@google.com>
Subject: [PATCH v1 3/3] KVM: arm64: Use standard seq_file iterator for
 vgic-debug debugfs
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_005727_847903_D54FB299 
X-CRM114-Status: GOOD (  17.79  )
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

The current implementation uses `vgic_state_iter` in `struct
vgic_dist` to track the sequence position. This effectively makes the
iterator shared across all open file descriptors for the VM.

This approach has significant drawbacks:
- It enforces mutual exclusion, preventing concurrent reads of the
  debugfs file (returning -EBUSY).
- It relies on storing transient iterator state in the long-lived
  VM structure (`vgic_dist`).

Refactor the implementation to use the standard `seq_file` iterator.
Instead of storing state in `kvm_arch`, rely on the `pos` argument
passed to the `start` and `next` callbacks, which tracks the logical
index specific to the file descriptor.

This change enables concurrent access and eliminates the
`vgic_state_iter` field from `struct vgic_dist`.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/vgic/vgic-debug.c | 40 ++++++++++----------------------
 include/kvm/arm_vgic.h           |  3 ---
 2 files changed, 12 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-debug.c b/arch/arm64/kvm/vgic/vgic-debug.c
index ec3d0c1fe703..2c6776a1779b 100644
--- a/arch/arm64/kvm/vgic/vgic-debug.c
+++ b/arch/arm64/kvm/vgic/vgic-debug.c
@@ -104,58 +104,42 @@ static void *vgic_debug_start(struct seq_file *s, loff_t *pos)
 	struct kvm *kvm = s->private;
 	struct vgic_state_iter *iter;
 
-	mutex_lock(&kvm->arch.config_lock);
-	iter = kvm->arch.vgic.iter;
-	if (iter) {
-		iter = ERR_PTR(-EBUSY);
-		goto out;
-	}
-
 	iter = kmalloc(sizeof(*iter), GFP_KERNEL);
-	if (!iter) {
-		iter = ERR_PTR(-ENOMEM);
-		goto out;
-	}
+	if (!iter)
+		return ERR_PTR(-ENOMEM);
 
 	iter_init(kvm, iter, *pos);
-	kvm->arch.vgic.iter = iter;
 
-	if (end_of_vgic(iter))
+	if (end_of_vgic(iter)) {
+		kfree(iter);
 		iter = NULL;
-out:
-	mutex_unlock(&kvm->arch.config_lock);
+	}
+
 	return iter;
 }
 
 static void *vgic_debug_next(struct seq_file *s, void *v, loff_t *pos)
 {
 	struct kvm *kvm = s->private;
-	struct vgic_state_iter *iter = kvm->arch.vgic.iter;
+	struct vgic_state_iter *iter = v;
 
 	++*pos;
 	iter_next(kvm, iter);
-	if (end_of_vgic(iter))
+	if (end_of_vgic(iter)) {
+		kfree(iter);
 		iter = NULL;
+	}
 	return iter;
 }
 
 static void vgic_debug_stop(struct seq_file *s, void *v)
 {
-	struct kvm *kvm = s->private;
-	struct vgic_state_iter *iter;
+	struct vgic_state_iter *iter = v;
 
-	/*
-	 * If the seq file wasn't properly opened, there's nothing to clearn
-	 * up.
-	 */
-	if (IS_ERR(v))
+	if (IS_ERR_OR_NULL(v))
 		return;
 
-	mutex_lock(&kvm->arch.config_lock);
-	iter = kvm->arch.vgic.iter;
 	kfree(iter);
-	kvm->arch.vgic.iter = NULL;
-	mutex_unlock(&kvm->arch.config_lock);
 }
 
 static void print_dist_state(struct seq_file *s, struct vgic_dist *dist,
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index d32fafbd2907..f2eafc65bbf4 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -302,9 +302,6 @@ struct vgic_dist {
 
 	struct xarray		lpi_xa;
 
-	/* used by vgic-debug */
-	struct vgic_state_iter *iter;
-
 	/*
 	 * GICv4 ITS per-VM data, containing the IRQ domain, the VPE
 	 * array, the property table pointer as well as allocation
-- 
2.53.0.rc1.225.gd81095ad13-goog


