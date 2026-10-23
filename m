Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98BF60A6F72
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eZ3PP9dG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Deujhz2O;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PoDPze0g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rUCmr5KNsTqdAFtykuTtOHLJ0k3Z9x+lHOLfB29fVwI=; b=eZ3PP9dGSALwYu
	Zqne5h2LtK5rD5kvQR8Bziv5lAL392K0nBPWoMLFN0SfL8stv6qgXHELBgjzyGKgSr1X22JmMm9r0
	XB0ttKeSPSmr7MgtCJelrHgUOTf8cG9E9/RaA4xfCx0SyUv1LAYPmLlo0o05tZau23mmNAxMtgbc3
	NvM9GQUT2G3Roo7eakc+BZVRLWO9RN9Ho0JonQosy1ZVTyFyI2aLvGYaVCXynYBORI5/T+NIGMRQz
	SnwUoDVgXgw3RnDEugZV0X/s2AAnplNUJv0NUkk/s1EPpYWf0/h0quwv39UZFn71HzzBTZ85xdbYl
	1PM2bXh1OMD+lmNKOsJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9HZ-0000000Fg2a-455C;
	Fri, 23 Oct 2026 07:01:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9HY-0000000Fg0M-0VXl
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Oct 2026 07:01:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rUCmr5KNsTqdAFtykuTtOHLJ0k3Z9x+lHOLfB29fVwI=; b=Deujhz2OwrUotBSju+NeEkou9F
	7mK841Di/mxZGUWh1y8k8Wy2anOFw01/9xepzPV4CZG3Aa7tyhq/qSIIE9plryrTOq2AYXIRIxqQ6
	DPfNnAfpK/bFvdFWKyobmYbyfS+k7kOVw7gPnd0R3acXXlwAiwK6YvU3MqHPfPd4ORwk2BpQBJKkK
	PisC/gauGfVQEYjZ2gwVn3yPswYgLE+iJ0YP4fuhgFwfuH2nyTOo9EFd62qKn51+8zykEGTxf3EfX
	LZOzAObVDMYDRPVsWSgODdWNCuc77Z3TymlrndExH8GiTbs1iZaN54vUOS79+Irzv77DXc0LewJxt
	3PyPEm8Q==;
Received: from out-103.mta0.migadu.com ([2001:41d0:1004:224b::67] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9HK-00000008y6s-34B8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:01:37 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=eS/K4doPXluNCr1/hI+pokpdsQChHXvBQQzirTFG9AU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792738880; v=1; x=1793343680;
 b=PoDPze0g8zldcDV/HwCZOP7leQ1N5HWH/s4sa6iVzVsq4qFzdk2aPNQUhUxkM9T2jSP/0sqF
 DFp0VlHtBj4Dmf6VS4BdkTlwGHc311NBy3LTU8q6fIhdEiPptBUulsjv6Rph9wgj1DItDStsN4Z
 1brxc9aLY/X/yxiwXDmAsyTY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2ac626447dabcc43;
	Fri, 23 Oct 2026 07:01:20 +0000
X-Mizu-Trace-ID: 2ac626447dabcc43
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
	Yicong Yang <yangyicong@hisilicon.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] KVM: arm64: selftests: Test ID_AA64ISAR1_EL1.LS64 on its own
Date: Fri, 23 Oct 2026 08:01:10 +0100
Message-ID: <20261023070110.1833446-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023070110.1833446-1-fuad.tabba@linux.dev>
References: <20261023070110.1833446-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_080135_638874_B33C35EC 
X-CRM114-Status: GOOD (  16.89  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

KVM caps ID_AA64ISAR1_EL1.LS64 at LS64_V, but accepts a write of any
level up to the host's and caps it. On a host at LS64_ACCDATA or above,
the generic test writes the level above KVM's value and expects it to
be rejected, but KVM accepts it.

Move LS64 out of the generic table into its own test. It checks that the
field reads as the host's level capped at LS64_V, that a write of 0 is
kept and one of the host's level is capped, and that a level above the
host's is rejected.

Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 .../testing/selftests/kvm/arm64/set_id_regs.c | 49 ++++++++++++++++++-
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 7429a1055df56..60b96f7608dc3 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -108,7 +108,6 @@ static const struct reg_ftr_bits ftr_id_aa64isar0_el1[] = {
 };
 
 static const struct reg_ftr_bits ftr_id_aa64isar1_el1[] = {
-	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR1_EL1, LS64, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR1_EL1, XS, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR1_EL1, I8MM, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR1_EL1, DGH, 0),
@@ -644,6 +643,51 @@ static void test_user_set_mte_reg(struct kvm_vcpu *vcpu)
 		ksft_test_result_pass("ID_AA64PFR1_EL1.MTE_frac no longer 0xF\n");
 }
 
+#define LS64_IDREG_TEST 4
+static void test_user_set_ls64_reg(struct kvm_vcpu *vcpu)
+{
+	u64 reg = KVM_ARM64_SYS_REG(SYS_ID_AA64ISAR1_EL1);
+	u64 val, ls64, host, limit;
+	int err;
+
+	/* LS64 is visible to EL0, so this reads the host's sanitised level */
+	host = FIELD_GET(ID_AA64ISAR1_EL1_LS64, read_sysreg(id_aa64isar1_el1));
+	limit = min(host, ID_AA64ISAR1_EL1_LS64_LS64_V);
+
+	val = vcpu_get_reg(vcpu, reg);
+	ls64 = FIELD_GET(ID_AA64ISAR1_EL1_LS64, val);
+	if (ls64 == limit)
+		ksft_test_result_pass("ID_AA64ISAR1_EL1.LS64=%lu, host at %lu\n", ls64, host);
+	else
+		ksft_test_result_fail("ID_AA64ISAR1_EL1.LS64=%lu, host at %lu\n", ls64, host);
+
+	val &= ~ID_AA64ISAR1_EL1_LS64_MASK;
+	err = __vcpu_set_reg(vcpu, reg, val);
+	ls64 = FIELD_GET(ID_AA64ISAR1_EL1_LS64, vcpu_get_reg(vcpu, reg));
+	if (!err && !ls64)
+		ksft_test_result_pass("ID_AA64ISAR1_EL1.LS64=0 accepted\n");
+	else
+		ksft_test_result_fail("ID_AA64ISAR1_EL1.LS64=0: err %d, reads %lu\n", err, ls64);
+
+	/*
+	 * A VM saved on an older kernel carries the host's level, which KVM
+	 * must accept from the VMM but keep at the limit.
+	 */
+	err = __vcpu_set_reg(vcpu, reg, val | FIELD_PREP(ID_AA64ISAR1_EL1_LS64_MASK, host));
+	ls64 = FIELD_GET(ID_AA64ISAR1_EL1_LS64, vcpu_get_reg(vcpu, reg));
+	if (!err && ls64 == limit)
+		ksft_test_result_pass("ID_AA64ISAR1_EL1.LS64=%lu accepted as %lu\n", host, ls64);
+	else
+		ksft_test_result_fail("ID_AA64ISAR1_EL1.LS64=%lu: err %d, reads %lu\n",
+				      host, err, ls64);
+
+	err = __vcpu_set_reg(vcpu, reg, val | FIELD_PREP(ID_AA64ISAR1_EL1_LS64_MASK, host + 1));
+	if (err && errno == EINVAL)
+		ksft_test_result_pass("ID_AA64ISAR1_EL1.LS64=%lu rejected\n", host + 1);
+	else
+		ksft_test_result_fail("ID_AA64ISAR1_EL1.LS64=%lu not rejected\n", host + 1);
+}
+
 static u64 reset_mutable_bits(u32 id, u64 val)
 {
 	struct test_feature_reg *reg = NULL;
@@ -828,7 +872,7 @@ int main(void)
 
 	ksft_print_header();
 
-	test_cnt = 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST;
+	test_cnt = 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST + LS64_IDREG_TEST;
 	for (i = 0; i < ARRAY_SIZE(test_regs); i++)
 		for (j = 0; test_regs[i].ftr_bits[j].type != FTR_END; j++)
 			test_cnt++;
@@ -840,6 +884,7 @@ int main(void)
 	test_vcpu_non_ftr_id_regs(vcpu);
 	test_user_set_mpam_reg(vcpu);
 	test_user_set_mte_reg(vcpu);
+	test_user_set_ls64_reg(vcpu);
 
 	test_guest_reg_read(vcpu);
 
-- 
2.47.3


