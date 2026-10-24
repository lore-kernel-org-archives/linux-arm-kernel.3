Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558E6606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 02:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yW19/76y;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CGP0lkH5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=An84VwlzMp3GuZLx6HMKZAlMwrBtzJQu2yyoAEx9ZZk=; b=yW19/76y+GcvII
	xyrvaPm8Grk0jBLGUDn7MYUnCKxHX97d/h4Nn0r5dl4FX7xBKg6pwVCz675Qo9EE75r6pbhfgMLYd
	avMh/XH9vhLzMi2gdr0dU5UKE7bGoHz+UPGeNN9gUXMHMPLylEMWcj5EsABQR0SWFK+aGZ22noQJY
	Zh8fTPmxvNwqfaEekYo2Ezf3K1lr8Jw5GJwr3iKFAWc6A/W7gplvy2veUuUjj6cHJjM7Khr9I8yui
	O6icxWUY3xHSVD1oQIYKtBZKe9iTgdZPoAQXniZQqC771h7vNsuzuZyJgid7j2IOcLCVpn1fzYTkL
	wIIRXfpEuLQT5d5riGww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKRRO-0000000HLM9-12xU;
	Sat, 24 Oct 2026 02:25:02 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKRRK-0000000HLKx-2Z8f
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 02:25:00 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso9280495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 19:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792808697; x=1793413497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=An84VwlzMp3GuZLx6HMKZAlMwrBtzJQu2yyoAEx9ZZk=;
        b=CGP0lkH5bRIYkoBigJXK+9r/5xHZW7Fc7fYBwFK0CU1rzAuJzhF1MHPxqu6zohJWDQ
         2fwbz2few0qtjdfg9QF2IxOsOiwlCnRpmyNSK1Vzsuhvc2yC+CMlJe/6/C7r0t4BvhV3
         3/QSmEK8q0fSPM+qq3G6NilI4PcKWs9B+9Om5psVzxRD/1kOWDX4TqkDhksJ7U7Rsk9/
         hIIiA7m1OeyCHe0DSnYyzVGZmVxIrbJ0DAPrGeX1Z/idZgnq+W8MrJCvd8UpDsqbJ91q
         fciZAXsL+BojUfBzg8lKB0H63QE7Yybfkw7ZVCKfZO9hiTb+xvG5MrFl3rq7eyaU24wp
         pixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792808697; x=1793413497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=An84VwlzMp3GuZLx6HMKZAlMwrBtzJQu2yyoAEx9ZZk=;
        b=QzqVlNRIhcDHCmM0WltAlJNxSl3ErDH/RjLcdY+0EiY7qZAxgB333+VBFkidIVttBe
         +mGuCF56+NMf4iNVT10+BWuU+jiMn0VTjC4IqMdGZEPkhOCIs95xTXX9l+zq8REL/ZI+
         x6bVooOjNXc3/lc6teIKwLSmEiwMSFtZ5RO5REp81MyrdA2I9SdAZl+z0c0V4b4PCYiG
         OEB5DBTXpAu2FD/N8Boyd4yQ4LIsbrZFqp8WEC3D2IJ1+LnTdXWjeur65oFiqtr7yoDV
         QGTtcXLGPSa0is79wRcAKO02zh0XJvpxQLSQnFxeyiLqsgp/gaLPHOzaqiLq/8AhrhXO
         /y6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwGYLEVu53GOGx5Bl9xUr5sZ/O731gnu1G62yzVeBB2rPwZEADSZYMce+vI3MlP1Pdh7F6SgpxxvuuHzlf3/MR0@lists.infradead.org
X-Gm-Message-State: AFq9FYLJW5n2D3OFJXcBPwFD0If7ACEdaQGHbL6Ywp89DAbiUnj7mEU6
	lAftMyvisGjk3L3W2xQQAzwb3oEo9msbZ8oCpHI9hCjeg7NdrpYYJHd2
X-Gm-Gg: AYBFou1+/uOvxLlXzN6Kj1odpAjFHycf4PqhMf7Itpnnow/5VZ0l4ow9l9ulh/J2zU2
	45L14Uae704vLyzPQvuMtnh5qL7Dv17Fnx5bCS8BTd/1/BzDIoJPcuWCWwaCNBsXACV+a9ihUm9
	rjLnFoJg2tmHMXCk/S05aEUzco0Z5h1b97wxApplKRvLEVaxWpHJdkj0mffF8Wpnur6NlBCHy20
	YXN876F4xp6pvgMApXxsNZguuayK2N93FZ2adJR9+9udr/5U7z0INv5QI7/hhD7pXv+5SXotAON
	qnbK6+6sO3KR+LQAtLfwgpiCUsjXV05PnIhEHe/l4kJ0co83FAa0ndl9VVP/N3R7GJoazR2UuMk
	SlwP/b+z1gQJmVgL0ReF2yd6NCDWGGSyJlcNeH6JXpVhBdVKiZWJlBJafih5zYyxaUyUtpJnqYh
	0mxRczldJ/JfAuNky9d2PIrJmBK6R7JtpLeuex2NaRbhtrExDiQOlwPahNA++nBWy0Z06S0gy4b
	Dl5t9z7tqhOQSSskwunkBwfuiKbP5B2LceyOGIrSFFdsLIFrcvYyfZondcqTxwwNrFO59Nygx+l
	Bik8FXkQVE+9+YDEK15PiNPXgg==
X-Received: by 2002:a05:600c:6384:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4a35aca72e2mr9122565e9.13.1792808696426;
        Fri, 23 Oct 2026 19:24:56 -0700 (PDT)
Received: from ASHA ([2001:630:3c1:164:1a66:daff:fe85:4026])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5698f1sm21088415e9.8.2026.10.23.19.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:24:54 -0700 (PDT)
From: Amir Noohi <amirmnoohi@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Igor Velkov <iav@iav.lv>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Christoffer Dall <cdall@linaro.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Amir Noohi <amirmnoohi@gmail.com>
Subject: [PATCH 1/2] genirq/manage: Provide irq_set_percpu_irqchip_state()
Date: Sat, 24 Oct 2026 02:24:49 +0000
Message-ID: <20261024022450.629980-2-amirmnoohi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024022450.629980-1-amirmnoohi@gmail.com>
References: <20261024022450.629980-1-amirmnoohi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_192458_681489_21B1508E 
X-CRM114-Status: GOOD (  19.54  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

irq_set_irqchip_state() acquires the bus lock and the descriptor lock of
the interrupt. A per CPU devid interrupt has a single descriptor for all
CPUs, while its irqchip state is per CPU, e.g. each GICv3 redistributor
holds the active and pending state of the PPIs of its own CPU and GICv5
keeps that state in per CPU system registers. Callers which modify that
state have to be pinned to the CPU anyway, so the descriptor lock only
serializes CPUs which update their own private state.

KVM on arm64 sets the active state of the host timer interrupts on every
vCPU load, i.e. on every KVM_RUN ioctl and every time a vCPU thread is
scheduled in. When many CPUs load vCPUs at the same time, they all spin
on the descriptor lock of the same interrupt, even when every vCPU has
a physical CPU of its own. A global serialization point on the same path
was removed before in commit 64b6d1d7a845 ("genirq: Get rid of global
lock in irq_do_set_affinity()").

Provide irq_set_percpu_irqchip_state(), which sets the irqchip state of
a per CPU devid interrupt on the calling CPU without acquiring the
descriptor lock. The irqchip callback is still invoked with interrupts
disabled. The caller has to have preemption disabled and has to ensure
that the interrupt is neither freed nor reconfigured concurrently, which
is the case for an interrupt it has requested. Interrupt chips which
require a bus lock are rejected, as the bus lock may sleep and cannot be
taken with preemption disabled.

The function is not exported as its only user, KVM on arm64, cannot be
built as a module.

Signed-off-by: Amir Noohi <amirmnoohi@gmail.com>
---
 include/linux/interrupt.h |  2 ++
 kernel/irq/manage.c       | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index 3bf969ad8fe0..ab20129615d4 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -507,6 +507,8 @@ extern int irq_get_irqchip_state(unsigned int irq, enum irqchip_irq_state which,
 				 bool *state);
 extern int irq_set_irqchip_state(unsigned int irq, enum irqchip_irq_state which,
 				 bool state);
+int irq_set_percpu_irqchip_state(unsigned int irq, enum irqchip_irq_state which,
+				 bool state);
 
 #ifdef CONFIG_IRQ_FORCED_THREADING
 # ifdef CONFIG_PREEMPT_RT
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index bdb47837c66f..e76fe1cec9fb 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2777,6 +2777,42 @@ int irq_set_irqchip_state(unsigned int irq, enum irqchip_irq_state which, bool v
 }
 EXPORT_SYMBOL_GPL(irq_set_irqchip_state);
 
+/**
+ * irq_set_percpu_irqchip_state - Set the irqchip state of a per CPU interrupt
+ * @irq:	Linux interrupt number of a per CPU devid interrupt
+ * @which:	State to be set (one of IRQCHIP_STATE_*)
+ * @val:	Value corresponding to @which
+ *
+ * Variant of irq_set_irqchip_state() which sets the state of the calling
+ * CPU's instance of a per CPU devid interrupt without acquiring the
+ * interrupt descriptor lock. The descriptor and its lock are shared by all
+ * CPUs while the state is not, so acquiring the lock only serializes CPUs
+ * which modify their own state.
+ *
+ * Must be called with preemption disabled on an interrupt which has been
+ * requested, so that the interrupt chip hierarchy cannot change
+ * concurrently. Interrupt chips which require a bus lock are not supported.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+int irq_set_percpu_irqchip_state(unsigned int irq, enum irqchip_irq_state which, bool val)
+{
+	struct irq_desc *desc = irq_to_desc(irq);
+	struct irq_chip *chip;
+
+	lockdep_assert_preemption_disabled();
+
+	if (WARN_ON_ONCE(!desc || !irq_settings_is_per_cpu_devid(desc)))
+		return -EINVAL;
+
+	chip = irq_desc_get_chip(desc);
+	if (WARN_ON_ONCE(chip->irq_bus_lock || chip->irq_bus_sync_unlock))
+		return -EINVAL;
+
+	guard(irqsave)();
+	return __irq_set_irqchip_state(desc, which, val);
+}
+
 /**
  * irq_has_action - Check whether an interrupt is requested
  * @irq:	The linux irq number
-- 
2.53.0


