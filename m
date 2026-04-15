Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DA5F41999
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fZERZt9qC8eiOqTblObyfoFFe81P4cUonW4z5L90fY=; b=ux9yTM/NAGZHGeGy0j6jFKIlwW
	Xuize2GxyPflSi086bRhcBvIkUDkcSQkP6USiGaKUe/w7QzaEI8Ygr+ywKjpbAQlwr5j9+KT7irH4
	tHXtN59Yio+Ds9+7N1bC8Wp/NQS2Jr76/u9mIv4u88jVwwThZKID45CErMAEOOuNxQk0qM+GOasNo
	TjJ1qd9r5e+s+ElFyuczDgjRHtcMHGx1HEz7fjcQcbobab02lJr5xAd/2B5619tC9TtQc/RjJ03bw
	t6tTnPmPxWQouJF4NAObOi3WP8dZkBmfFSQPoH3kQ2rcqG3qUA1TrYsTbX7Fw/Z341pNqyCkFTkJI
	997fihDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyrJ-000000014Lw-0SuP;
	Wed, 15 Apr 2026 11:56:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr9-000000014DB-1ciW
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Apr 2026 11:56:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/fZERZt9qC8eiOqTblObyfoFFe81P4cUonW4z5L90fY=; b=RxzJDBxigSO5PJnW5XjlaFUOc2
	HJlxRla1zlQ1gLpmLRZLNipLfGw0fJk178YVA5Fan8XF47t8rcN6pv3I6SvPUaNN+BuPzKoNxhDrI
	DDwdaRzyEUbyAsYf0osh0VsTsdr93QYYvcYpA1neS1uELG8qH2nn7lUpOoo8QFJInx069V0wuLWoI
	ZqoBkMXRjUWXrhFsEAxoOD/PkqfksEQYp3UqRJzpiQJ+4Lm69ET9vLMCDjAm4XXV4mo/uSeXOT1EE
	VxVYi8hsIJoEMsx3dFXIjBo+UPKe6l4sZcbOdH+tFALEmX8E77WdFDr5SKtq79ICmJK9W5K2ayRzg
	T7xPQjWQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr5-00000002NLN-1J6v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 11:56:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2E1944585;
	Wed, 15 Apr 2026 11:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86EB2C2BCB8;
	Wed, 15 Apr 2026 11:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776254183;
	bh=95h1WFfjE9r9Nnr95FG3E3hjnoiCWNmw/Z72krq0Lc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NlvloMbh71HOrIx33ML3sPYMmQfdjWm+Z918pZK3/zctPS3vUxiyPseEv++ycjJYf
	 ElXc7QRTjum5mMUjFcwCb+0jJrUDh4IER5VaWzeuYlgMK9ljY+/VFccqH3fEipl04r
	 0gpHyO1Ocjs0RZthEnfFSOEUdqqd1+SGhCX8XPhR/a8nPBNquNDm1yUU0fpRO8yXFA
	 edGGiWq4ceqAROrTWrS8CYX5dJhk87vZ4tXGHIK3xbkxF2P5VN/TlkDLq/vZ+ig1/5
	 hB1iy9LF9R/avJYbSKF+s1MATmmlNJsu6Z0P+53cSgk0oDNCDthEJUISrIx15gRHtq
	 jJ+YndfXiN9qQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wCyqz-0000000Bqsi-323k;
	Wed, 15 Apr 2026 11:56:21 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH 13/18] KVM: arm64: selftests: Cleanup unused vars in GICv5 PPI selftest
Date: Wed, 15 Apr 2026 12:55:54 +0100
Message-ID: <20260415115559.2227718-14-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260415_125627_828970_85373EB2 
X-CRM114-Status: GOOD (  10.39  )
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

Clean up a set of unused variables around the size of the guest's PA
space as they are completely irrelevant for GICv5 when only
considering PPIs.

Fixes: 0a9f38bf612b ("KVM: arm64: selftests: Introduce a minimal GICv5 PPI selftest")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/arm64/vgic_v5.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_v5.c b/tools/testing/selftests/kvm/arm64/vgic_v5.c
index 3ce6cf37a629f..9ddd32c3665bd 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_v5.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_v5.c
@@ -20,8 +20,6 @@ struct vm_gic {
 	uint32_t gic_dev_type;
 };
 
-static uint64_t max_phys_size;
-
 #define GUEST_CMD_IRQ_CDIA	10
 #define GUEST_CMD_IRQ_DIEOI	11
 #define GUEST_CMD_IS_AWAKE	12
@@ -208,13 +206,9 @@ void run_tests(uint32_t gic_dev_type)
 int main(int ac, char **av)
 {
 	int ret;
-	int pa_bits;
 
 	test_disable_default_vgic();
 
-	pa_bits = vm_guest_mode_params[VM_MODE_DEFAULT].pa_bits;
-	max_phys_size = 1ULL << pa_bits;
-
 	ret = test_kvm_device(KVM_DEV_TYPE_ARM_VGIC_V5);
 	if (ret) {
 		pr_info("No GICv5 support; Not running GIC_v5 tests.\n");
-- 
2.47.3


