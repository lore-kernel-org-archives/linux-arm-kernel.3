Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315AAF41997
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdVPyloyVND7ltSHmtNj4SFj4JZWFEtJllNZs4EwiXc=; b=BORltANO7VWoHYf7XY8QCAgZZQ
	6rbWbfAJvT1FA1Eu4zZhUfDzygMuCb9qZSAPc41L0iUw20mFO3VeP/CqmiSagcjizYErdvMzP0RQ6
	poCShZWCW4Aejui/D2R+VvASecjmyhwXPbIM2ZSe6fKt2NgqnMA/xyaJswZyH4StDAe3mOmeuawX7
	E1XouP43l/0+aQljCwaLDV7VQUcijV8GM3izdnMR+eUUyJcS+zOhwSLHY3GAMVCkKCKHngkoUGSXX
	mkgL4B35q6ErDEy2UNJBcV9VCzBWHd8uaGRpz7CdomwlcBMssMaQ6pMrluBb6M4CwKNwYri1SJez0
	TvEVh12g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyrO-000000014Ui-1gRw;
	Wed, 15 Apr 2026 11:56:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyrA-000000014EX-437W
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Apr 2026 11:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fdVPyloyVND7ltSHmtNj4SFj4JZWFEtJllNZs4EwiXc=; b=VfwamOs+NrHPYl9hgHNPMjNTAN
	Yn/tKhqo5PH5iWsmNnLm3EVASPVh6N5P/VYYtfNVdF4k3pmMvQzikNG5CLRARd8KC50MvyTtxtGkf
	vmFh+szQ94eFEpq9yV095ZvVkqwBB95R7k7Ue06e/Hq6tKT4XbS3mpxEnqcvGX9cH78Y/9T02wPEH
	gbB0OgRPkGGklb74OYucs//7KwIyY8BBf9B6bVgT5TWfEClhG88uoYoLkSJ0cewkQSIjaqDutSfC0
	2K8ndA5euE0meuStqbloCST5BMxbXtv4fc4Mrv9SYKtqxoRlFCRjQEm99Pa3BQ3BJCkV3tk7HJzMq
	VLDyR3Sg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr5-00000002NLO-3GSC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 11:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 10BBD4459E;
	Wed, 15 Apr 2026 11:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D1FC2BCB3;
	Wed, 15 Apr 2026 11:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776254183;
	bh=GepxWY2Sbz+aiD9Px/BOeFFVY1vJXpQLuKumF7thz8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DYBjmnZhmwAK6duQ+c6y0Y5960nm/fSG1PdX9lcFVBypxea86KrQtRQkuhBedF4AL
	 Lnw69lAKYnK8hNgTWOenv1H4QvLS6sNlGVcAsM1ZKJA9bV7xW3KbWJdxtdpdllAeB+
	 mJ6yDIdB8Pa7rqSS0wCKYBBC9i7u0h3w3EtGnx1xqGcr/X1vl5b04ob3YD51PKQ5pg
	 Iq63LqRb93ND7ZjSVS0YsgD9aMdonFOLtDwreXSmvb+hVEzNMcDIMR19tGfg2aEpwu
	 JZ9dKjaFUIhozq7smEfbCazxi/q40pcXtlYBfIC+udmWpFxUDwvMhX3P0rWPsKgqBm
	 MRdLd8hCvQ5vw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wCyr0-0000000Bqsi-0d0n;
	Wed, 15 Apr 2026 11:56:22 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH 15/18] Documentation: KVM: Fix typos in VGICv5 documentation
Date: Wed, 15 Apr 2026 12:55:56 +0100
Message-ID: <20260415115559.2227718-16-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260415115559.2227718-1-maz@kernel.org>
References: <20260415115559.2227718-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_125628_502807_B64F5240 
X-CRM114-Status: GOOD (  11.36  )
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
index 29335ea823fc5..1985b2d880322 100644
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
+   KVM_DEV_ARM_VGIC_USERPSPACE_PPIS
       request the mask of userspace-drivable PPIs. Only a subset of the PPIs can
       be directly driven from userspace with GICv5, and the returned mask
       informs userspace of which it is allowed to drive via KVM_IRQ_LINE.
-- 
2.47.3


