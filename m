Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C045DC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtD+S2m6+Sdeg7QezQGfKuz/DVr7QpseyEymVQ+BXw8=; b=iqjXEcpB07d5RsJ69c9JD73PSh
	IYyys/qg/9Go/Z3A7JFlqJDH2Gnar1TAokpMhVdTDUJTLoKVEQuOjPgcDYtXXDtwDoud8CMV96bpo
	kixEKFrY30GIVG57RQ6t0GBI5/9m8U9tG58G9BWNlpEUIPpacrGmAFa3cP038aS88N8w2rrnck6Ha
	fzz4dK9VhPVohDyTj0vxGLao/0cggEAv5oZCpFBg8mFglZTV47Rh8JliB+CozNrv5bbSoc5cGss7k
	5oEaIiMwBJGI2Np3ds77EfbZOzXEU/0wdDvbroDxvORACHbNRgy3II3aDduSRBnJ7/BwfB/BiyNVf
	7WXe8KLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ybL-00000009dGZ-2z89;
	Tue, 08 Sep 2026 16:23:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ybK-00000009dFi-3pJy
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 16:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rtD+S2m6+Sdeg7QezQGfKuz/DVr7QpseyEymVQ+BXw8=; b=oJEU+RVxZehrfQAJZ+yPFkhbDm
	wAexkzrnK/MLkD+8ln7gCJsa6Fi7P8ykAPPOqmyyCwdK/eWLLJZBigawqXvXWkeNhoHF4BGkba16o
	gpr8mIxrKn9x/05yW5lrJOe/nPFiOW/OFuH4sMXH0PnvI/2qU0Ane7ZDQCm4+ACS02MzrHvdeyas6
	2e2nUua6r1W6SizYgK3eymnGiyVwZrHYt2aTCFs+IzSifMIdron79091aoFZP8osL65bjpwsP5O5D
	jdLYkOgghtlZef1xlqF9u5aHpAKxchaHJ0PCicyubiT+g9RY3FMvI/UOX6ADIaDw+axrPqI8U1L+R
	4tZp7WRQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3ybI-0000000059l-0UMJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:23:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5C6F1476;
	Tue,  8 Sep 2026 09:23:06 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 13ECD3F7B4;
	Tue,  8 Sep 2026 09:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788884590; bh=ZXNl0PkFseGSY5buvrG1RYaRc9Peh83P91M3YTJ/q/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fQ/PWbCRCJxNZW9mZlnwtLp96PicpPSWvkBuSjtvLiq+v2y1JOIltaVICN4VpnDm+
	 n/oDhxt/bescAX+eRFZ01VaPwUFZ3phCo7w0tNQ92feUf8jerq3nGcgjkRynriOh/f
	 iYXhG4mosucDzy+Ie9e9T1T/mtddQgvnlxCOnT5A=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v17 06/20] KVM: arm64: CCA: Add a new mode for supporting Realm guests
Date: Tue,  8 Sep 2026 17:22:09 +0100
Message-ID: <20260908162223.1683432-7-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908162223.1683432-1-suzuki.poulose@arm.com>
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_172312_426846_CBA34573 
X-CRM114-Status: GOOD (  11.43  )
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

Add an explicit mode to support Arm CCA guests.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 arch/arm64/include/asm/kvm_host.h               | 1 +
 arch/arm64/kvm/arm.c                            | 5 +++++
 3 files changed, 9 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd24..1afe3df3b923e 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3256,6 +3256,9 @@ Kernel parameters
 			nested: VHE-based mode with support for nested
 				virtualization. Requires at least ARMv8.4
 				hardware (with FEAT_NV2).
+			rmm: Support for running confidential guests in Realm
+			     world using RMM, as defined by Arm Confidential
+			     Compute Architecture (CCA)
 
 			Defaults to VHE/nVHE based on hardware support. Setting
 			mode to "protected" will disable kexec and hibernation
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index b2e99c5cb1cd3..31ae9d8d8e92f 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -69,6 +69,7 @@ enum kvm_mode {
 	KVM_MODE_DEFAULT,
 	KVM_MODE_PROTECTED,
 	KVM_MODE_NV,
+	KVM_MODE_RMM,
 	KVM_MODE_NONE,
 };
 #ifdef CONFIG_KVM
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 9af3bbb2f8c24..50f0adfadab38 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -3264,6 +3264,11 @@ static int __init early_kvm_mode_cfg(char *arg)
 		return 0;
 	}
 
+	if (strcmp(arg, "rmm") == 0 && !WARN_ON(!is_kernel_in_hyp_mode())) {
+		kvm_mode = KVM_MODE_RMM;
+		return 0;
+	}
+
 	return -EINVAL;
 }
 early_param("kvm-arm.mode", early_kvm_mode_cfg);
-- 
2.43.0


