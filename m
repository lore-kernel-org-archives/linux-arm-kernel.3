Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF264C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFF6SOp13MfI+rKYc7dCezNEaDk/WUOkhnG6IJMmr80=; b=IRO5x18TWE0kuWA0wyen/V+gAE
	uOFPGXDURpksAlrM5f2J7Kyr/NQIcLdfLURoPEod05GMYDcxcuAIl3Ev06/OTducwk2H0NsbKf6Pf
	xV57bF7BGUk4XAnE7jTYNXNkk4pJmDbXc0dP3b949CTQVlWBA90t64Sk/IUrpof+BS4rf4TJqPu4u
	6NeNnCFOX+k70jI/YpUjtj4NVwJMsFXMCrAf0k6jYD/76YCye39944fQPPE5U5A2AHkqPy5BrONA2
	RmpuDZMDSwHYsaJxOLKWCnsvcse5BW2+S5YooSvXM2kxjyJC1cNHmlMETCmN7SeoABWIHeyIbyNyi
	JLmHQGDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8xD-0000000HFc3-1mQG;
	Fri, 13 Jun 2025 18:16:39 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6i8-0000000Gxna-3EH9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 15:52:57 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3ddc147611fso44166305ab.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 08:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749829975; x=1750434775; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OFF6SOp13MfI+rKYc7dCezNEaDk/WUOkhnG6IJMmr80=;
        b=ZMY7C1rd0LeebmL3Z6Ffg5QwAt/VNmRvuwOGrekuluWW7D2jDGGuswYgJWKotGaGVa
         wax/ZizK7/jONc7lYhBD+5gMqKJipmehUu8yMzC5siozjdi43/0f1V51sJC4v8xMPHOL
         y7oXTvaO4c/xhIIqPJaWl40qlqpSii7ZMtHXyEZDSztQHZ5LAFtCP8C4DrJIkmIZ0wcl
         n7/J+WcQBnogaZJMatR9LZG7Ulk+9QGrNRG+Rpe+AR+QeP72lBbrCKYilddM2NJkGT5b
         DqiXJqzcoCsdRXwNM63ht5D1DC5wJqkoulwFXr9VIN6+R+47FcVPCtiIKrIgR+i1cTeR
         MNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829975; x=1750434775;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OFF6SOp13MfI+rKYc7dCezNEaDk/WUOkhnG6IJMmr80=;
        b=VjxVovl2o+mzCbYVT5LKsa+9wvgNBfP9zo9SMfWmpofX+TKhDmgxJtM8qyeDWmkzoV
         n/vXena/ajfmubIgZSUzi8G1zf39gkCOGAo4Sd4nHMlgu7MVXrhHe0qict1hx8EIoULN
         Hrc14PoeQF2FYPA/rRvYnuYfveFQxryO1O0FVA484Dyo9hCu1cPVbBsUd2qWHBcck3mK
         HlSUqRuDLw8dbPC+4juUjFSrsKgQ5iDl+xPN+yLC8okv9t/UJ4YH+CjJq0oiG0iR/uVW
         Kh8WgJLDshp2yej5dbKls7wfN/f8PSKo2g12fY7QctvOcfd2Qy6nnGguaZsJCE8RW641
         +dMg==
X-Forwarded-Encrypted: i=1; AJvYcCXL4Lb6LvXlWyzbxI/Dfj88RIrJbyyGU6pI/n5mFA9hhwpK5eH9AxTSUbefkoK9Dz1H7HyhW04d0dFt8tqFLyGi@lists.infradead.org
X-Gm-Message-State: AOJu0YxHj+Ae0/As60P1unlVWot32/gu6ZGcDV2qYnLj8N1sHDD/iyWe
	sUibAkxY4pQieZx7wE9XRygG6e2eMrRotmY4Sj4Ex6QM5p9fHz/h07TMYPqpYr5iHJITEbt4tYJ
	IkxQlCJ9otw==
X-Google-Smtp-Source: AGHT+IG8T3q/TFMjMeVIYD6samTw89/uinTNnuWwzxHnuwndVMxgoAdLhGBoyVqCfis1o5KW9rTeoIB0iQbo
X-Received: from oabkz22.prod.google.com ([2002:a05:6871:4096:b0:2bc:69a2:7ea5])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:a3c6:b0:2d6:667c:511f
 with SMTP id 586e51a60fabf-2eaf05ca75amr171809fac.9.1749829964975; Fri, 13
 Jun 2025 08:52:44 -0700 (PDT)
Date: Fri, 13 Jun 2025 15:52:36 +0000
In-Reply-To: <20250613155239.2029059-1-rananta@google.com>
Mime-Version: 1.0
References: <20250613155239.2029059-1-rananta@google.com>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Message-ID: <20250613155239.2029059-3-rananta@google.com>
Subject: [PATCH v3 2/4] KVM: arm64: vgic-v3: Consolidate MAINT_IRQ handling
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_085256_813302_77136008 
X-CRM114-Status: GOOD (  13.24  )
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

From: Oliver Upton <oliver.upton@linux.dev>

Consolidate the duplicated handling of the VGICv3 maintenance IRQ
attribute as a regular GICv3 attribute, as it is neither a register nor
a common attribute.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-kvm-device.c | 51 +++++++++++++--------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-kvm-device.c b/arch/arm64/kvm/vgic/vgic-kvm-device.c
index f9ae790163fb..e28cf68a49c3 100644
--- a/arch/arm64/kvm/vgic/vgic-kvm-device.c
+++ b/arch/arm64/kvm/vgic/vgic-kvm-device.c
@@ -303,12 +303,6 @@ static int vgic_get_common_attr(struct kvm_device *dev,
 			     VGIC_NR_PRIVATE_IRQS, uaddr);
 		break;
 	}
-	case KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ: {
-		u32 __user *uaddr = (u32 __user *)(long)attr->addr;
-
-		r = put_user(dev->kvm->arch.vgic.mi_intid, uaddr);
-		break;
-	}
 	}
 
 	return r;
@@ -523,7 +517,7 @@ static int vgic_v3_attr_regs_access(struct kvm_device *dev,
 	struct vgic_reg_attr reg_attr;
 	gpa_t addr;
 	struct kvm_vcpu *vcpu;
-	bool uaccess, post_init = true;
+	bool uaccess;
 	u32 val;
 	int ret;
 
@@ -539,9 +533,6 @@ static int vgic_v3_attr_regs_access(struct kvm_device *dev,
 		/* Sysregs uaccess is performed by the sysreg handling code */
 		uaccess = false;
 		break;
-	case KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ:
-		post_init = false;
-		fallthrough;
 	default:
 		uaccess = true;
 	}
@@ -561,7 +552,7 @@ static int vgic_v3_attr_regs_access(struct kvm_device *dev,
 
 	mutex_lock(&dev->kvm->arch.config_lock);
 
-	if (post_init != vgic_initialized(dev->kvm)) {
+	if (!vgic_initialized(dev->kvm)) {
 		ret = -EBUSY;
 		goto out;
 	}
@@ -591,19 +582,6 @@ static int vgic_v3_attr_regs_access(struct kvm_device *dev,
 		}
 		break;
 	}
-	case KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ:
-		if (!is_write) {
-			val = dev->kvm->arch.vgic.mi_intid;
-			ret = 0;
-			break;
-		}
-
-		ret = -EINVAL;
-		if ((val < VGIC_NR_PRIVATE_IRQS) && (val >= VGIC_NR_SGIS)) {
-			dev->kvm->arch.vgic.mi_intid = val;
-			ret = 0;
-		}
-		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -630,8 +608,24 @@ static int vgic_v3_set_attr(struct kvm_device *dev,
 	case KVM_DEV_ARM_VGIC_GRP_REDIST_REGS:
 	case KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS:
 	case KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO:
-	case KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ:
 		return vgic_v3_attr_regs_access(dev, attr, true);
+	case KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ: {
+		u32 __user *uaddr = (u32 __user *)attr->addr;
+		u32 val;
+
+		if (get_user(val, uaddr))
+			return -EFAULT;
+
+		guard(mutex)(&dev->kvm->arch.config_lock);
+		if (vgic_initialized(dev->kvm))
+			return -EBUSY;
+
+		if ((val < VGIC_NR_SGIS) || (val >= VGIC_NR_PRIVATE_IRQS))
+			return -EINVAL;
+
+		dev->kvm->arch.vgic.mi_intid = val;
+		return 0;
+	}
 	default:
 		return vgic_set_common_attr(dev, attr);
 	}
@@ -645,8 +639,13 @@ static int vgic_v3_get_attr(struct kvm_device *dev,
 	case KVM_DEV_ARM_VGIC_GRP_REDIST_REGS:
 	case KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS:
 	case KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO:
-	case KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ:
 		return vgic_v3_attr_regs_access(dev, attr, false);
+	case KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ: {
+		u32 __user *uaddr = (u32 __user *)(long)attr->addr;
+
+		guard(mutex)(&dev->kvm->arch.config_lock);
+		return put_user(dev->kvm->arch.vgic.mi_intid, uaddr);
+	}
 	default:
 		return vgic_get_common_attr(dev, attr);
 	}
-- 
2.50.0.rc2.692.g299adb8693-goog


