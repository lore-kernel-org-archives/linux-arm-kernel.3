Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3ADCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVWbroKeyy/vXGetpyerZbPvNTfOYuPtP3zO4UmiVu0=; b=qVlLXWeeI7ZHoybyWTe7mJmwYp
	7zbYr8iispWXP7rFebi6EObA8uK049OUcS0thI7959XlOhbPhr0c733BEdeX2la1g74ZtJJQXRC7I
	caLsLBUzNv7llqTgKMkd9a2a6esdz+Pd7aVxVUW4GgJQoH9mwU0lHairY7vpa+iGMx3SMR3KvEd9w
	dHJHBM5E1AJSL/PtP5s64bLwzO8pR+Qyo6Z65IoCQ2ail3T/5TM/wiFFOw95wGfUTUcksJmrLQ77/
	Qm4ufH9h4kc3+yLQV0s76iBNaOdqGTtxGapYDsXpWffQTimgRCG+OiFmQRWpQX8ytawgwDZ7lcyzw
	fm0iHk2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOms-00000002GJc-400k;
	Tue, 29 Sep 2026 03:45:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmn-00000002GGY-0Yhh
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 03:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KVWbroKeyy/vXGetpyerZbPvNTfOYuPtP3zO4UmiVu0=; b=NOaOENyGwc/jP8/FD3vNWhP4St
	7OD+N10Trnoo36iPZO+t3kdX9fVGwa8vMIpRKI39Q/BjAgLeCv82BEco3WxWQwE91LWr+HFJJsEnx
	jYGTQoUrLFB4PSlRq6GVl3HiQAPQK5r4iPF8DJJ5U1vdIVY9587VSSoOz4qmDGBwQSgBcHQkzv3JN
	lSkEIfCEDjDJNC/X1n1XAVTCW7hmotRn5ukemuzE6jVxsOvg7HqWVIwKaw7QpF3T7LHvRjaGHG/HA
	BiRSJ6kt7Smy75sb/qFf/yC9E3lNsSFH4oXpxfJHzZcdZZad+vn4S028AfAUhZztuo6mbFcfdoxKl
	dYzalLwA==;
Received: from mail-pl1-x648.google.com ([2607:f8b0:4864:20::648])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmk-0000000AYUn-0mzX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:45:44 +0000
Received: by mail-pl1-x648.google.com with SMTP id d9443c01a7336-2d02df2bf09so26926025ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 20:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653539; x=1791258339; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KVWbroKeyy/vXGetpyerZbPvNTfOYuPtP3zO4UmiVu0=;
        b=R54tZkGAAneTgI8DquGmHaF1HG2pP+levrjrtw7vHc0Gz4ircTfn59LD1y3jy8uKpC
         IbTEeze5JICpc6+7Q6lebKHQwELmp88zyGhe+7U1cqIEGZL2EM5aTQU6+63NIlzLQgnk
         5XRtoLnJf7L2if7EwVDhaISSb2gsnChfXCwtc5J8SY+dY1HYdn/u/66CZsZSXXFMHhv9
         rZBqpdr9VqxdxS020S7aZ7+OecAduEXgHAY5yTeFR2BfV5sfgvO3JWlpFVlw3gm5ItkP
         4TyPebOFdo/2WUlkmNwN7uy5AhPtAAzkV7TcsB6jgjPP86X5zSNl0uttqcj8EW1LBX/W
         txpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653539; x=1791258339;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVWbroKeyy/vXGetpyerZbPvNTfOYuPtP3zO4UmiVu0=;
        b=v50ukjwjMcFKTdmDi827Bn8/8ucZNKR9YE4WklYlObJ5apu1gMJ0ScinVPN0FBgm66
         m9w4VOhG4VzXPfyQ2Jy9mOdDeaRBJGpBQCtEQJ5duLes3TsVgTUegp48EYf7CUHrW4RO
         cDabe8JHJhSsyBsvPXJEt+zSYJ6GkXW5y+ZP+kRzdkPw04vKLY5HXF105p5T1aErrUH+
         uO8jxw3MRq1HIcDqdYCs+5Qo3zNdXCyRtmlO7sfiJfe05ocvdL94p6fnQID98DDGy4nm
         hcrMZHQRuLdP+yqEV4axg9d3bmVIf0EL3eZ+PwczgjEL5cXnNi/FxcyFEJVksgv4emLp
         h34g==
X-Forwarded-Encrypted: i=1; AKwUvBxbN1WWrPCsHkt+aLS29m6EO7mfjczoM1XWvxKlTUe+MzryD3q3hbA8oOsFe9HuIVoZBKe5Wn60yzlnyvy1QgTG@lists.infradead.org
X-Gm-Message-State: AFq9FYKuzZ0uDjM+gZcJqSnoWzzneo9LHSpo6ZtB++T6i306VmQ0Z3cW
	i7DScJuV7XOWvb6dF1cgTp9E1K1TWcGGLG1LMGbhyvRHxZ1b07muNc4sT59ZIi9WW0O+gd9dLCC
	Qpw==
X-Received: from plqu23.prod.google.com ([2002:a17:902:a617:b0:2df:9ebf:232b])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db06:b0:2e2:c84b:43e9
 with SMTP id d9443c01a7336-2e2c84b48d6mr8655125ad.1.1790653538595; Mon, 28
 Sep 2026 20:45:38 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:45:02 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-9-praan@google.com>
Subject: [PATCH v11 08/16] genirq/msi: Provide msi_device_domain_restore_msi_msgs()
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_044542_249275_8E74C895 
X-CRM114-Status: GOOD (  14.34  )
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

From: Thomas Gleixner <tglx@kernel.org>

Devices that provide the message store for MSI interrupts in their own
hardware registers often lose that register state across power transitions
(such as runtime suspend or system sleep) and need to restore the cached
MSI messages upon resume.

Provide msi_device_domain_restore_msi_msgs() to iterate over all
associated MSI descriptors in a device's MSI domain under proper
descriptor and irq_desc locking and rewrite the cached MSI messages via
the irq_chip hierarchy.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
[praan: Use scoped_irqdesc_get_and_buslock(), fix the xarray range bound
 and write the commit message]
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 include/linux/msi.h |  2 ++
 kernel/irq/msi.c    | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/include/linux/msi.h b/include/linux/msi.h
index a4613de11960..44d551e85abd 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -669,6 +669,8 @@ void msi_domain_free_irqs_all(struct device *dev, unsigned int domid);
 
 struct msi_domain_info *msi_get_domain_info(struct irq_domain *domain);
 
+void msi_device_domain_restore_msi_msgs(struct device *dev, unsigned int domid);
+
 /* Per device platform MSI */
 int platform_device_msi_init_and_alloc_irqs(struct device *dev, unsigned int nvec,
 					    irq_write_msi_msg_t write_msi_msg);
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index df460a574d80..8fb855b5e09f 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -1784,3 +1784,40 @@ bool msi_device_has_isolated_msi(struct device *dev)
 	return arch_is_isolated_msi();
 }
 EXPORT_SYMBOL_GPL(msi_device_has_isolated_msi);
+
+/**
+ * msi_device_domain_restore_msi_msgs - Restore MSI messages for a device domain
+ * @dev:	The device to restore MSI messages for
+ * @domid:	The id of the interrupt domain to restore
+ */
+void msi_device_domain_restore_msi_msgs(struct device *dev, unsigned int domid)
+{
+	if (!dev->msi.data)
+		return;
+
+	guard(msi_descs_lock)(dev);
+	struct irq_domain *domain = msi_get_device_domain(dev, domid);
+
+	if (!domain || !irq_domain_is_msi_device(domain))
+		return;
+
+	struct xarray *xa = &dev->msi.data->__domains[domid].store;
+	struct msi_domain_info *info = domain->host_data;
+	struct msi_desc *msi_desc;
+	unsigned long idx;
+
+	xa_for_each_range(xa, idx, msi_desc, 0, info->hwsize - 1) {
+		/* Only handle MSI entries which have an interrupt associated */
+		if (!msi_desc_match(msi_desc, MSI_DESC_ASSOCIATED))
+			continue;
+
+		scoped_irqdesc_get_and_buslock(msi_desc->irq, 0) {
+			struct irq_data *data = irq_desc_get_irq_data(scoped_irqdesc);
+			struct msi_msg msg = msi_desc->msg;
+
+			if (data->chip)
+				irq_chip_write_msi_msg(data, &msg);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(msi_device_domain_restore_msi_msgs);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


