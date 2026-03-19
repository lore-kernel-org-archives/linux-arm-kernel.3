Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA6B1088E58
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 01:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IphLt+X2YEUN0QZS0TcE47jvN82gWZ8dBXENMhkBUfg=; b=bdCerL2RGa4qrQsN/S3IwWP6ee
	ppI/YaWkny2Xfg+9dcH6mtR+ZJjB0QCBZLUVUaza/991zW6785tmkFnYMv19pgCNRyClzCnJpS7VZ
	bed0CoeaapMMeshL83w0k0Qg4xwyJbwBQ3pcPXQcpidPfmupybN2SBT4Z4k73afZwPdRMgRv4Qjjk
	EhaM6BUlA1gSjtjDw8H9jRAo69QlcyT01xfUFhakGTsmWX2NZQs5iNWeKBg4NZq3SsA7fxTNIixl9
	9JrehYTyA4GKdowxMu0Q6X2u9m6BuM+A1UkO2OzTbM5qZuOEVg6magHvrKpHU+VNrirONGdr9+ZDE
	AEcIcjCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w32ag-00000009d9S-3Ej8;
	Thu, 19 Mar 2026 01:54:26 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w32ae-00000009d8t-1Q92
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 01:54:25 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c7381a9a932so518158a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 18:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773885263; x=1774490063; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IphLt+X2YEUN0QZS0TcE47jvN82gWZ8dBXENMhkBUfg=;
        b=i360XuiAheySR+IrUeoe/2wbQJoV32hZW8EIxAVFPBxgo66+Hfo7bR9PdDFOb082Zt
         RQu9IizkYbFhuARXeSbYNKfXDafBhc7XcQ7HCvdU17QXAdxgv1Zlh0GZTURlZxmIVuso
         RQZPtpR/AYiWGAuTOd3D0CBPr7Rhkzybn7V+HlvmQYMEnvzmocr/TM3vSqfFaoaGyYAf
         6ayoh5Ifm98k672UvuE4LXYfYEyxBkv/soAY+daCzMlvleV/zBbF3LbohTexwLxsbJ2t
         Xw7+gsg4GyRapeichgLcC6Xmtw/L5x0ElUoB8cROXqChkmL9s3kjeGYZYyt0qX6xRqge
         wwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773885263; x=1774490063;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IphLt+X2YEUN0QZS0TcE47jvN82gWZ8dBXENMhkBUfg=;
        b=CSElTocuzJzFaz7yml0bPI1nZ6YIcLipgdb/mTKFfELTt2RJ03KMyqpQAIqJOqERUM
         H5WYA0oESegbRKceuaiNhMRPz3tai/4cuHxSq4hdVRQZ7A8slKEuRlCTopgl+EGYp7T+
         H9mU965wSKFSCMRqZFpe+8Sv4leVaM+UTkmSGkqLqZlQiE37S6pcqR6rfq5fqhfdpwhV
         zjndxNozj3Dkyy7Rb7mEGhEzehKGIzDqZhufoUKiHR4m3qr+s0b4zfB38ohudoMVlPS/
         AoCptMT1+5HcwRhnT964DDFqPwIb0WXQY4h7fqV82bvVUpqVy0EnS5qKGTiAAOyel0OF
         0eog==
X-Forwarded-Encrypted: i=1; AJvYcCWUfsmT+yTLga31UDJqT8+JbPEBUhLDFFFvKOr7gg8oIoET1Bbi1YfGGwNU531q9pzb080X0jmsNRa0oM46PAl1@lists.infradead.org
X-Gm-Message-State: AOJu0YzOXYzdNcQfILgddOkyNn+jyWRBTowxIEGSz/Fs31UdzxkBwD9x
	Lv5oMLVwqeJE/JcQV/k0llA/1Y+bD3fXtAPC4DzKGISwx+70UOOtNl7ZP8be1+N8kVhBOYhd5NN
	+
X-Received: from pgbbz36.prod.google.com ([2002:a05:6a02:624:b0:c6e:1f6a:ef71])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:b84:b0:398:787c:d2e4
 with SMTP id adf61e73a8af0-39b99d4bd9amr5301199637.17.1773885262711; Wed, 18
 Mar 2026 18:54:22 -0700 (PDT)
Date: Thu, 19 Mar 2026 01:54:10 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Message-ID: <20260319015418.2871262-1-morbo@google.com>
Subject: [PATCH] KVM: arm64: vgic: Annotate struct vgic_dist with __counted_by_ptr
From: Bill Wendling <morbo@google.com>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Gogul Balakrishnan <bgogul@google.com>, 
	Arman Hasanzadeh <armanihm@google.com>, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_185424_376304_6E93C16E 
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

Add the __counted_by_ptr attribute to the spis pointer field in struct
vgic_dist. This pointer field points to an array of struct vgic_irq
elements, and the number of elements is tracked by the nr_spis field
within the same structure.

The nr_spis field is initialized in vgic_init() (or earlier via
userspace) before the spis array is allocated in kvm_vgic_dist_init().
The nr_spis value remains constant during the lifetime of the spis
allocation, making it a suitable counter for the array.

This patch was generated by CodeMender and reviewed by Bill Wendling.
Tested with the KVM selftests.

Signed-off-by: Bill Wendling <morbo@google.com>
---
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Zenghui Yu <yuzenghui@huawei.com>
Cc: Gogul Balakrishnan <bgogul@google.com>
Cc: Arman Hasanzadeh <armanihm@google.com>
Cc: Kees Cook <kees@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: kvmarm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: codemender-patching+linux@google.com
---
 include/kvm/arm_vgic.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index f2eafc65bbf4..1cca87623d92 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -284,7 +284,7 @@ struct vgic_dist {
 	/* Wants SGIs without active state */
 	bool			nassgireq;
 
-	struct vgic_irq		*spis;
+	struct vgic_irq		*spis __counted_by_ptr(nr_spis);
 
 	struct vgic_io_device	dist_iodev;
 	struct vgic_io_device	cpuif_iodev;
-- 
2.53.0.851.ga537e3e6e9-goog


