Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63C8CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rM7fbtYWJwl42IFaQ3dJ9vWgaAFMX0vvSQ6XK76mm8=; b=hs6LaF/+L1bBX1WCc99H3CSFXa
	NiDEJNV/ztt0YstJYOtyFnKxNBFC49GRVBqzECyiDsgM7eMnkpVpCoMbMcicLFD6iH8YPB3ZUc4ng
	0ka0eqjf76Fpp9fP0xGv8HjfISW9RSPZ36q18nExZ3tPhEuddBiQTMLb/9YdlaIhbEXEHHBVi8voy
	7NTc6ODHNGNsuqBQrV47FOS5lxVxkuoqmKNy1fGstqnijAR1JMRO8lXdKTOL7ckwoAHntMP2rRrl+
	VjW/PvpE3P2OWDAkPOt0znFXSaFTc2Rj+JbM5QVjhetrD1197fOfUwZaxpJPvDm9e2xSpDTsuGKFB
	9r6N1vFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDF1-00000000tdQ-1nUG;
	Mon, 28 Sep 2026 15:26:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDEv-00000000tad-0zaq
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Sep 2026 15:26:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/rM7fbtYWJwl42IFaQ3dJ9vWgaAFMX0vvSQ6XK76mm8=; b=N3JU54DXTyKzJAgd6fUm4KnPja
	lHMLyQ/l+KC0HNJJcf8lMegD/FV5ezJEb+B9jANV9H7D4CHdMdV0JkF/X/o/9CtcENFgSmeDw2Op/
	Kao8EGvNyZRDHipeYIqbwAKija84fT8Smo3qnsSsQVTsLmNq2aRo63LaI9qqOwd8ub4HP/5HFWUxq
	k0zH7A0Gj6kqpctlUhMtPC/BtEX3pwuRIXM88Q6vTvw2ohLApGlonX/LP/JddSe7LZVtoOmbp6EM8
	VsjTi5oE/GShOj6y7b7yxguo0PztB8ZqfelB4SaEk3yE6NN0tKc+98D8XVCCynrHLDE+TLxzaZNqn
	ZmSkk8xQ==;
Received: from out-91.mta1.migadu.com ([2001:41d0:203:375::5b] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBDEs-00000001clD-286F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:26:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=bVUARLRy/2fo3UIM94OcGSR9nBrrgL4zvU6NywPOORo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790609156; v=1; x=1791213956;
 b=AWA6If2b3TNQzX8/jZxQaLbPI/2hiuoeTJjhynJ0u5sGo/EJbyyH5TJFCVeE+tmQDIbkLaef
 QxN/onuFnSrIkpxj/5TJ0OZZKW4q8BKdI5h3hXrAw5WGa3ZmzjEgsGTAWWpBF7zJCslPtd0MoWB
 DSGaKycEBHpTRI0S4P1QXxTU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e326ca226933ccf1;
	Mon, 28 Sep 2026 15:25:56 +0000
X-Mizu-Trace-ID: e326ca226933ccf1
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jing Zhang <jingzhangos@google.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 05/10] KVM: arm64: selftests: Test AT S12E1R with an invalid VTCR_EL2.SL0
Date: Mon, 28 Sep 2026 16:25:02 +0100
Message-Id: <20260928152507.2116110-6-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260928152507.2116110-1-fuad.tabba@linux.dev>
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_162558_712437_D5C09851 
X-CRM114-Status: GOOD (  12.01  )
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

Check that AT S12E1R with SL0 set to 3 on 4K pages, an invalid starting
level without FEAT_TTST (which KVM doesn't expose to an L1 guest),
reports a stage-2 level 0 Translation fault in PAR_EL1. KVM used to
retry the AT forever instead, so without the fix the test hangs. An out
of range T0SZ isn't tested, since the architecture lets an
implementation clamp it instead.

Assisted-by: LLM
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/kvm/arm64/at.c | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/at.c b/tools/testing/selftests/kvm/arm64/at.c
index ce5d312ef6baa..61fd217f724bd 100644
--- a/tools/testing/selftests/kvm/arm64/at.c
+++ b/tools/testing/selftests/kvm/arm64/at.c
@@ -73,12 +73,40 @@ static void test_at(bool expect_fault)
 	test_at_insn(S1E1W, expect_fault);
 }
 
+/* 4K granule with SL0 == 3 and no FEAT_TTST is a stage-2 level 0 Translation fault */
+static void test_at_s12_bad_sl0(void)
+{
+	u64 vtcr = FIELD_PREP(VTCR_EL2_SL0_MASK, 3) | FIELD_PREP(VTCR_EL2_T0SZ_MASK, 24);
+	u64 sctlr = read_sysreg_s(SYS_SCTLR_EL12);
+	u64 par;
+
+	/* Disable stage 1, so the stage-2 fault is on the output address, not a table walk */
+	write_sysreg_s(sctlr & ~SCTLR_ELx_M, SYS_SCTLR_EL12);
+	write_sysreg(vtcr, vtcr_el2);
+	sysreg_clear_set(hcr_el2, 0, HCR_EL2_VM);
+	isb();
+
+	__at(OP_AT_S12E1R, TEST_ADDR);
+	isb();
+	par = read_sysreg(par_el1);
+
+	sysreg_clear_set(hcr_el2, HCR_EL2_VM, 0);
+	write_sysreg(0, vtcr_el2);
+	write_sysreg_s(sctlr, SYS_SCTLR_EL12);
+	isb();
+
+	__GUEST_ASSERT((par & SYS_PAR_EL1_F) && (par & SYS_PAR_EL1_S) &&
+		       FIELD_GET(SYS_PAR_EL1_FST, par) == ESR_ELx_FSC_FAULT_L(0),
+		       "AT S12E1R: expected stage-2 level 0 translation fault (par: %lx)", par);
+}
+
 static void guest_code(void)
 {
 	sysreg_clear_set(tcr_el1, TCR_HA, 0);
 	isb();
 
 	test_at(true);
+	test_at_s12_bad_sl0();
 
 	if (!SYS_FIELD_GET(ID_AA64MMFR1_EL1, HAFDBS, read_sysreg(id_aa64mmfr1_el1)))
 		GUEST_DONE();
-- 
2.39.5


