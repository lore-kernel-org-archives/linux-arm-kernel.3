Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3C6CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqQFClT82XrGpGP+eCWxLur1RYyxjshGCfc9InJnvnA=; b=Zxdf8GfO7rDYpmODFdyfy8o8Tw
	BJRvNi3iqNKW8J7FV6uEPkTwc+sCGzT6HHF4uPKP5ARebvaXIEucA7x81mniJsiCtGva5BzYxjw8y
	Khs7G7YKouA82Xc+fDq76WEzfVo+NcEcttnujrIvVkfDoYtrcl5dsUT+wkfVLgGX/bxWH3unFTlHN
	qcYBkG+mocPbkzRWslpXmsQVozDUVOUxh4p6oCD/Gic3tpaQmEpoCyexLz108AG180hbVYv90jwa3
	TxENX0LIwgbtKRe5miSNtUeEh+B+M8EChnpMhaf8nbiCQR++aEKO5vj9vq1QH/ATt/T1bn9UuJUjR
	7R70nfkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6H-000000047Gh-1E6M;
	Wed, 20 May 2026 09:20:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd67-00000004776-3uQ3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:20:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B6F060121;
	Wed, 20 May 2026 09:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12CC51F008A0;
	Wed, 20 May 2026 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779268815;
	bh=kqQFClT82XrGpGP+eCWxLur1RYyxjshGCfc9InJnvnA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BH29QoBv9xFqeEkJBUcWWt3/hRdJezMKmbKfI0NozczrqR+G+U0h5Fbjqpy+qcpvX
	 P5Twe9gF9Mm2no2R0ZbR49lFawxwnBGVM3Yok6UM/kcn+HoorhN/dXVloKkTlcsqye
	 iVpDBxnMMPNOT3Ey1+//xje49lFJ8aDH27LHourGpbmcGlQvz03dEhdGGk/yDvWy1S
	 Vkydqap48mJacth4bM9LCpItyms6JYVhjFuSODEUqv7Y7qKEbT5JN/zH0IgJBYnTLW
	 NIkGIvyekcCbbRa8+WIKmFcyJPznsw5ZqZfQwpHr9QSWXqz8Wg63ugi2ablrItgfln
	 qlg085FJiIYnw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPd65-00000004IaV-1UPx;
	Wed, 20 May 2026 09:20:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH v2 15/18] Documentation: KVM: Fix typos in VGICv5 documentation
Date: Wed, 20 May 2026 10:19:46 +0100
Message-ID: <20260520091949.542365-16-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520091949.542365-1-maz@kernel.org>
References: <20260520091949.542365-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

From: Sascha Bischoff <sascha.bischoff@arm.com>

Fix two typos in the VGICv5 documentation.

Fixes: d51c978b7d3e ("KVM: arm64: gic-v5: Communicate userspace-driveable PPIs via a UAPI")
Fixes: eb3c4d2c9a4d ("Documentation: KVM: Introduce documentation for VGICv5")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 Documentation/virt/kvm/devices/arm-vgic-v5.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/devices/arm-vgic-v5.rst b/Documentation/virt/kvm/devices/arm-vgic-v5.rst
index 29335ea823fc5..70b9162755c7e 100644
--- a/Documentation/virt/kvm/devices/arm-vgic-v5.rst
+++ b/Documentation/virt/kvm/devices/arm-vgic-v5.rst
@@ -12,8 +12,8 @@ Only one VGIC instance may be instantiated through this API.  The created VGIC
 will act as the VM interrupt controller, requiring emulated user-space devices
 to inject interrupts to the VGIC instead of directly to CPUs.
 
-Creating a guest GICv5 device requires a host GICv5 host.  The current VGICv5
-device only supports PPI interrupts.  These can either be injected from emulated
+Creating a guest GICv5 device requires a GICv5 host.  The current VGICv5 device
+only supports PPI interrupts.  These can either be injected from emulated
 in-kernel devices (such as the Arch Timer, or PMU), or via the KVM_IRQ_LINE
 ioctl.
 
@@ -25,7 +25,7 @@ Groups:
       request the initialization of the VGIC, no additional parameter in
       kvm_device_attr.addr. Must be called after all VCPUs have been created.
 
-   KVM_DEV_ARM_VGIC_USERPSPACE_PPIs
+   KVM_DEV_ARM_VGIC_USERSPACE_PPIS
       request the mask of userspace-drivable PPIs. Only a subset of the PPIs can
       be directly driven from userspace with GICv5, and the returned mask
       informs userspace of which it is allowed to drive via KVM_IRQ_LINE.
-- 
2.47.3


