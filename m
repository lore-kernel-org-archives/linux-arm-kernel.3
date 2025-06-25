Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A856CC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 16:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcjKnmYkv3TNrvvWx7X6pghX7Z9EIPaXLXFo1FFXovM=; b=Xa9FZbJcN22v3HMcfKnyDYEf1m
	F5F3vcvWA4758Pf8zWdjsXabglyLYr6IirCHYEvYCOM3+EUfkSlK8fccUo1Zptluk5YEKWjBPP+bB
	4sybHAssGjTMeHHTDqdsNAhU+ifmlh/3u00Z5wDT1SZ0b6gn2bitsL648BUM+qoB4TMldasM1xjY6
	TL5GOO8WD79C/vc6hrstb75qsY8GTT3Ca0CH64HqgMpw8bxOWmJ6KtHKwARLt6VxJ+s3K57utDFo7
	f0pVC9o3VXVzwjpvcOZa2d3kWvnCXeD5RhtCVqiDEnsQQ50uoWeW0ZqvJPHqnpqxEfkMqxOOqC38e
	/3T4pbXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUShT-00000009EJS-09Qj;
	Wed, 25 Jun 2025 16:10:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOGw-00000008T44-0Rhf
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 11:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DcjKnmYkv3TNrvvWx7X6pghX7Z9EIPaXLXFo1FFXovM=; b=abRAsgJomMWXBk2Rhl48ldLMUb
	JxlwSo4AfZr4vFXLbSCxUFWXaLOnK7Eyv4Z4CGWb1i0UHZquKXYUo03aNVb+sV3znzWAAXkTrpsGM
	1WiOGDNaEaaHcWVYkc/eyDNClDbEE7arbqG1xi0vU6SYV57jrr63ZzlXQtz8kCwfpQpki1ObP/iOL
	tF9HMIKPD0mdcoP6EbBqjbMFgac31lJWMBFiZ2oRbd9Arl0T+UbBH36r/+TaxAlKtzhvaskm8SbLc
	KDE+bOk64me1IYCR+4lM7BN3UGfDWFKpoBJHQNQROWjnt4O12F8dseMaW1w1neUJvVhRqgWIffmob
	RJ078NUA==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOGt-00000005p7Q-2B70
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 11:26:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 23F40A52303;
	Wed, 25 Jun 2025 11:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87511C4CEEA;
	Wed, 25 Jun 2025 11:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750850789;
	bh=/AEnPXo1dA8qwf5CIu0xk7I0CHglYXCtZ9CYRjry6l8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S1VhB4oCwFp56rekUgYKd6f+8Wpmbr1vhPQmFkmjzZWBo9cfOlamDTba3WcN1HzF8
	 KyIrkF3AdsMCAFP0CeMnAAeR4YtgqgAS8be615FtRpYgL4if3hzsfIySkCvAi6jQDB
	 p5JhLn9bMlCuAz1kbk+DrJSgfvlaZrY3QMlmFFI/81Go2iJ5/O+VRES/Zo85m54t5a
	 exDhD/l/CHYWuofJTk20OFqeRyuqrOF2nQzhFCsIlOye0erW6/vLyHrWjB2NCIWrwW
	 oODvwyoRBIG818bZKoFEeet6vU25aCj7Nw0GFaw0H+IRy3jYxh0WLbqqFbJSwW+CBS
	 Rfh3xkZuV2VNA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 25 Jun 2025 11:48:19 +0100
Subject: [PATCH v6 28/28] KVM: arm64: selftests: Add SME to set_id_regs
 test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-kvm-arm64-sme-v6-28-114cff4ffe04@kernel.org>
References: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
In-Reply-To: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-08c49
X-Developer-Signature: v=1; a=openpgp-sha256; l=3742; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/AEnPXo1dA8qwf5CIu0xk7I0CHglYXCtZ9CYRjry6l8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoW9x6rNqzz5sGrNiRrIXrOWy+bwyOVKM58C21N
 8UQF1abh0qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaFvcegAKCRAk1otyXVSH
 0N0DB/9C9EuLoP1QX+nQpinl3+RPQkVA/LC6ibKQ/ADrljxkUPGGGzPd1i6TvLlJknrU6Vc4Nax
 WDtdGQKNgnTPy3sCEyI4C3+FgSGlHdBbbkgADugt9SKjXOL10CHbhQf+JMHP21/CLhiM70rXc1k
 zcC+isN7mi3oeWRgEXnU3koSXtr0NEPvmPdvraSFOd0YEvH9BdMPw5ucfSK+PBIXLcIGPng/i4A
 5eWSFYfsbv8Dgk61y2B/4VJqJPcuIvTihfFprFmrQovxnackxM2n4xpiD64Ufm59EZEYbJBIzuO
 jVunrH2tpAizaubCJdtSHop4CQE7fKYbG96ae0Xij6ouEAoH
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_122631_807206_0E4373A2 
X-CRM114-Status: GOOD (  10.66  )
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

Add coverage of the SME ID registers to set_id_regs, ID_AA64PFR1_EL1.SME
becomes writable and we add ID_AA64SMFR_EL1 and it's subfields.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 29 +++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 8f422bfdfcb9..f41c4e7da3e8 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -140,6 +140,7 @@ static const struct reg_ftr_bits ftr_id_aa64pfr0_el1[] = {
 
 static const struct reg_ftr_bits ftr_id_aa64pfr1_el1[] = {
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, CSV2_frac, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, SME, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, SSBS, ID_AA64PFR1_EL1_SSBS_NI),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, BT, 0),
 	REG_FTR_END,
@@ -187,6 +188,28 @@ static const struct reg_ftr_bits ftr_id_aa64mmfr2_el1[] = {
 	REG_FTR_END,
 };
 
+static const struct reg_ftr_bits ftr_id_aa64smfr0_el1[] = {
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, FA64, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, LUTv2, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, SMEver, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, I16I64, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, F64F64, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, I16I32, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, B16B16, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, F16F16, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, F8F16, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, F8F32, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, I8I32, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, F16F32, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, B16F32, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, BI32I32, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, F32F32, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, SF8FMA, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, SF8DP4, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64SMFR0_EL1, SF8DP2, 0),
+	REG_FTR_END,
+};
+
 static const struct reg_ftr_bits ftr_id_aa64zfr0_el1[] = {
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ZFR0_EL1, F64MM, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ZFR0_EL1, F32MM, 0),
@@ -217,6 +240,7 @@ static struct test_feature_reg test_regs[] = {
 	TEST_REG(SYS_ID_AA64MMFR0_EL1, ftr_id_aa64mmfr0_el1),
 	TEST_REG(SYS_ID_AA64MMFR1_EL1, ftr_id_aa64mmfr1_el1),
 	TEST_REG(SYS_ID_AA64MMFR2_EL1, ftr_id_aa64mmfr2_el1),
+	TEST_REG(SYS_ID_AA64SMFR0_EL1, ftr_id_aa64smfr0_el1),
 	TEST_REG(SYS_ID_AA64ZFR0_EL1, ftr_id_aa64zfr0_el1),
 };
 
@@ -233,6 +257,7 @@ static void guest_code(void)
 	GUEST_REG_SYNC(SYS_ID_AA64MMFR0_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64MMFR1_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64MMFR2_EL1);
+	GUEST_REG_SYNC(SYS_ID_AA64SMFR0_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64ZFR0_EL1);
 	GUEST_REG_SYNC(SYS_CTR_EL0);
 	GUEST_REG_SYNC(SYS_MIDR_EL1);
@@ -774,8 +799,8 @@ int main(void)
 		   ARRAY_SIZE(ftr_id_aa64isar2_el1) + ARRAY_SIZE(ftr_id_aa64pfr0_el1) +
 		   ARRAY_SIZE(ftr_id_aa64pfr1_el1) + ARRAY_SIZE(ftr_id_aa64mmfr0_el1) +
 		   ARRAY_SIZE(ftr_id_aa64mmfr1_el1) + ARRAY_SIZE(ftr_id_aa64mmfr2_el1) +
-		   ARRAY_SIZE(ftr_id_aa64zfr0_el1) - ARRAY_SIZE(test_regs) + 3 +
-		   MPAM_IDREG_TEST + MTE_IDREG_TEST;
+		   ARRAY_SIZE(ftr_id_aa64zfr0_el1) + ARRAY_SIZE(ftr_id_aa64smfr0_el1) -
+		   ARRAY_SIZE(test_regs) + 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST;
 
 	ksft_set_plan(test_cnt);
 

-- 
2.39.5


