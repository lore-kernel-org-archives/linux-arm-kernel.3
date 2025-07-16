Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7028C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 11:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFiBh24vfyxUkvL/qAF91ZLaWMijXEEuq00t+Y6HBLE=; b=2MioddaNMksA2P/oBht5xIAS93
	k6hh7/hZ9ljHvjSIh+NB4j5t7IC7U78rfLg18aOOK168uuu4BIYE8QoPjJwQ/n0XhH9y65kfk2qVS
	OLZ+KxPnox1xUMeoysREr0jBEftrs53i0juKluygjtNd/H76TrBaenu7zoe7cQkAAFqG0p0pCjchI
	ylSMvcKKvHghF1DPSveciK6JsPsJm5J2weHmio0YMIMzlM3dHLvfxbHpL6pOnBGkbeFXwpZ4mNdaA
	Zz2gfCMOerfvOLh2LBrODFQEgoq7jy4VRjHSMWnOkw35BxPGxHSoRjuBvSrIMwgVy87FZTy5cHb0j
	ouEe0U9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc0G6-00000007YMq-1VBd;
	Wed, 16 Jul 2025 11:25:10 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzzK-00000007VHm-2CZb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 11:07:51 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3a4eee2398bso3162951f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 04:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752664069; x=1753268869; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bFiBh24vfyxUkvL/qAF91ZLaWMijXEEuq00t+Y6HBLE=;
        b=Q0i5HeMERXeT3fQ1z1u2SXThyJr/FupTMlkfcBksTX2gIsM1nretACyWWYaWxL+c+N
         djLKaiciQvV7KDlB1Ju8f2oY+uBaj251d317vOXtaVr5sIsJbz1buLNkkkNB7WCWD2ef
         mB4vDhUZ9MVjl1eXNsusxufNvPb3CGK787jDhhBm6tT4N+Ye83jouMdsMU+oGdYA6AZ2
         N5Jprlneq0Lg1vGsQdQUU/25geGyp981smGR4didQCmJw4p+wx3KF2JS6XzA9PTf6fIO
         3aZQhntaOv7fefWz4ea5eqzfil/RmxcWZjxdGEI5XzT1f3SaavSwGNioslqu0sYEUqab
         nNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752664069; x=1753268869;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bFiBh24vfyxUkvL/qAF91ZLaWMijXEEuq00t+Y6HBLE=;
        b=IriKfP++YCnPhMyPZhAsFsA6bwjqCGWEvX3u96utfRXQgQ3OAghsqxTuktZogRZX9E
         UPTytuPL0PZUDHU9p13Ud+jIcSCKxw/QaSYW04VKZnT3QVB0EA54rx0ALF2OfQwr99Xo
         sMmV9N+8UdmcYYEzgBTVktu2s5cEEoaUwTeN7CmGx6iggucDxf72tGq/mi4d52gXEq3b
         3HMBuG4Gpg/wzQskvcJqzOWPnef1OuDCRCLi/qefHlt1KOJoh2D4x2lQJUvD8YU6CU5c
         FT0WPGAM2U4+2kZSHzdznye65gvvme8SEZLW7KauWoqejPJ2ODT+QzKhqWH2WNVVlJyY
         1uJw==
X-Gm-Message-State: AOJu0YyRhgb2l+khtjpDBIutqUxa2ma9EJhbc057yKKgwWN0UIGQloNR
	JKb0RzAX94zFTfYaniqsoECawVZL6DIYtd/U31gfBoRQcYL1RkxCh4Pef0kKCu6HRdA0n5sC8aJ
	A36mb7BhfAoEC7fdCa3+61ayeyoLDUg5i5za98OYYHQaiA9m86oS3Q9PgFees/MXRA4E1guqbvu
	Yb9udP6axR/MempkcILDuT0Xq0idPa7NBvfufgWCXPB+1O5HCZdA==
X-Google-Smtp-Source: AGHT+IHS3mDNKI5f7HxVRvsGrhgPtKyzq6M9m0VkLvornMAR5mJ3Yg4oC8wem/+qjRBiPoyYxBKnOYGMMA==
X-Received: from wmqd13.prod.google.com ([2002:a05:600c:34cd:b0:456:23aa:8bf])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2486:b0:3a5:232c:6976
 with SMTP id ffacd0b85a97d-3b60dd99677mr1925159f8f.44.1752664068593; Wed, 16
 Jul 2025 04:07:48 -0700 (PDT)
Date: Wed, 16 Jul 2025 11:07:37 +0000
In-Reply-To: <20250716110737.2513665-1-keirf@google.com>
Mime-Version: 1.0
References: <20250716110737.2513665-1-keirf@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250716110737.2513665-5-keirf@google.com>
Subject: [PATCH v2 4/4] KVM: Avoid synchronize_srcu() in kvm_io_bus_register_dev()
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Keir Fraser <keirf@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_040750_576656_C0A09A0F 
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

Device MMIO registration may happen quite frequently during VM boot,
and the SRCU synchronization each time has a measurable effect
on VM startup time. In our experiments it can account for around 25%
of a VM's startup time.

Replace the synchronization with a deferred free of the old kvm_io_bus
structure.

Signed-off-by: Keir Fraser <keirf@google.com>
---
 include/linux/kvm_host.h |  1 +
 virt/kvm/kvm_main.c      | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9132148fb467..802ca46f7537 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -205,6 +205,7 @@ struct kvm_io_range {
 struct kvm_io_bus {
 	int dev_count;
 	int ioeventfd_count;
+	struct rcu_head rcu;
 	struct kvm_io_range range[];
 };
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 9ec3b96b9666..f690a4997a0f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5948,6 +5948,13 @@ int kvm_io_bus_read(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
 }
 EXPORT_SYMBOL_GPL(kvm_io_bus_read);
 
+static void __free_bus(struct rcu_head *rcu)
+{
+	struct kvm_io_bus *bus = container_of(rcu, struct kvm_io_bus, rcu);
+
+	kfree(bus);
+}
+
 int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
 			    int len, struct kvm_io_device *dev)
 {
@@ -5986,8 +5993,7 @@ int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
 	memcpy(new_bus->range + i + 1, bus->range + i,
 		(bus->dev_count - i) * sizeof(struct kvm_io_range));
 	rcu_assign_pointer(kvm->buses[bus_idx], new_bus);
-	synchronize_srcu_expedited(&kvm->srcu);
-	kfree(bus);
+	call_srcu(&kvm->srcu, &bus->rcu, __free_bus);
 
 	return 0;
 }
-- 
2.50.0.727.gbf7dc18ff4-goog


