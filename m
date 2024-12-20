Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252DEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2zMwNf9t0q5gn7SR4oFkzDlcS6LsVE6kD2nIRkFUlp4=; b=aED/OdJjZ9p6qUK+qoKLKeTDiP
	pBLRvp46SLJ4HFcBFieAzIyH1ojQWcY4lcF+ztc0r5a6RUT4IXGVltN392qH9niO6GsYJabTA0PJK
	ds2gQDCVH9vpCUQDt713/znu18NY3W33wgMcCGUt2TbWf964ipvmO/eLKudxskKTtmrZ2ovp5jODg
	fhVgnSOtZmb8HZOFZPceDNdf6CVCLpPp7maGF1aRqsvyDHiBHm2sLV0Ba+8G6RgDS7W215KkTDY6I
	vpt/m04s6nB8EFuGGKehkN82Z4zqGyaaFLGWPp2tggK31i4vCtiHqJJLwQF+4eS7XHcIZV11QOW44
	ea7mlpRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgNP-00000005Y7m-04aj;
	Fri, 20 Dec 2024 17:01:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgDo-00000005Vx2-3Bhh
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Dec 2024 16:51:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2zMwNf9t0q5gn7SR4oFkzDlcS6LsVE6kD2nIRkFUlp4=; b=dOPxuV08yM1ylFocf0z08ufXGo
	qTJinN/o78HDACeBdTv1LDHMqaRCDRwLjJRanZBlL63P5epvWQt+D10o7D7CLBocaq+BJxLFUH/Et
	kUAkKtjN51228DdNa+tQ4VYAw5Ya1v/LaRTUkpWpHlptlhO2VTOVF5jod0B0Ak0JfYs3VAmYhIFL4
	nYFpfuMafeLmpahpld1SqCjCFHBBdWVO/LTuTbLaM14Nwx0Nw0UCa0u80WpCNnclXLcX59MZwlr0+
	1N+klVj6pFhslhMGK7FHdpJvpexWzqlraMs5HenDwJLEDL+CIC7yZEfRFTK5fRUZWtt2qCp/NyNDe
	XKcrbVPw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgDl-00000005jV9-2l3m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:51:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 26833A42017;
	Fri, 20 Dec 2024 16:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7A3C4CED3;
	Fri, 20 Dec 2024 16:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734713484;
	bh=a+yncXwMMueTmbDqZnDIxIoJ5xsyf/PU5pYLC6ZbRbM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vLhYu+o1l++cILw7iyIVCcLat3F3ew01Ad54HxoZ0pxbH6rThGz/L0017gDWjF0Te
	 2dsAfTr8PLX+dlbs/lw6y+VBYIILA/8P6jovxfMPegV5yFcjF14U1UvdVGD7jL8f73
	 xwpkqjohLRCroOVtSg0rhhqL5tuTq8e8tSFGANkEH/3xgEMf3iz3fPW5W5WyHfMb13
	 XoKFe3Aba1VLOG+VjFFcL7zslcQ+OGdwUErrh0dZc9tFWio/bUfXnnVo3X4TY6EzJW
	 2PXEDecDpmzbhMkIiwKCs+s4zXLdWAGtEDKNHbB1pVUEMKbgGGpL+adtC/HI4R7tF+
	 x48mrTY9irCgg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 20 Dec 2024 16:46:32 +0000
Subject: [PATCH RFC v3 07/27] KVM: arm64: Convert cpacr_clear_set() to a
 static inline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-kvm-arm64-sme-v3-7-05b018c1ffeb@kernel.org>
References: <20241220-kvm-arm64-sme-v3-0-05b018c1ffeb@kernel.org>
In-Reply-To: <20241220-kvm-arm64-sme-v3-0-05b018c1ffeb@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083; i=broonie@kernel.org;
 h=from:subject:message-id; bh=a+yncXwMMueTmbDqZnDIxIoJ5xsyf/PU5pYLC6ZbRbM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnZaBZdrU2V+OphtPgF7NwJy6uVDv4tmY4K7qACS27
 7872fXSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ2WgWQAKCRAk1otyXVSH0BvtB/
 wI5sZMQ9hxIxROX5W9UZZrhMrY9fD+KkpsCZhFytntZ+8JR14prgNoUKPp3948eBLgtc15UJFySKGQ
 Ndru+92DG2ZY0Jfpg8pOhwNHdNFRf7i8iy3x6NzdfOWsfqsFgHVk4qGK9zhmwxyzl84dDIWHGhpD6e
 aRNiSuALRNHMgpvN3KbhOIO2wOCiR1eJz6gqILHINr0Cx6I7KcuiDQ4ryhz0W6rq+fPlwFLAM8lKW4
 grkNv1hEE5V4XG9cdtv5p0H99/KNSRxF0mf2l92afCdiNeSWHOqx3stkBvfaEzA96MuM5jrGDz875+
 KAGD/VaHBJfxPDBer/1e77U+E3qsCQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_165125_992981_9C653C6D 
X-CRM114-Status: GOOD (  10.81  )
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

Currently cpacr_clear_set() is defined as a macro in order to allow it to
include a number of build time asserts that the bits being set and cleared
are appropriate. While this check is welcome it only works when the
arguments are constant which starts to scale poorly as we add SME unless we
do multiple updates of the system register.

Convert the function to a static inline so that it can accept runtime
variable arguments.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_emulate.h | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 2d91fb88298a263dcd73a4269318f8edf1379650..5f05da7f538d29d321c424233f21b8448d8b4628 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -592,24 +592,15 @@ static __always_inline void kvm_incr_pc(struct kvm_vcpu *vcpu)
 		cptr;							\
 	})
 
-#define cpacr_clear_set(clr, set)					\
-	do {								\
-		BUILD_BUG_ON((set) & CPTR_VHE_EL2_RES0);		\
-		BUILD_BUG_ON((clr) & CPACR_ELx_E0POE);			\
-		__build_check_all_or_none((clr), CPACR_ELx_FPEN);	\
-		__build_check_all_or_none((set), CPACR_ELx_FPEN);	\
-		__build_check_all_or_none((clr), CPACR_ELx_ZEN);	\
-		__build_check_all_or_none((set), CPACR_ELx_ZEN);	\
-		__build_check_all_or_none((clr), CPACR_ELx_SMEN);	\
-		__build_check_all_or_none((set), CPACR_ELx_SMEN);	\
-									\
-		if (has_vhe() || has_hvhe())				\
-			sysreg_clear_set(cpacr_el1, clr, set);		\
-		else							\
-			sysreg_clear_set(cptr_el2,			\
-					 __cpacr_to_cptr_clr(clr, set),	\
-					 __cpacr_to_cptr_set(clr, set));\
-	} while (0)
+static __always_inline void cpacr_clear_set(u64 clr, u64 set)
+{
+	if (has_vhe() || has_hvhe())
+		sysreg_clear_set(cpacr_el1, clr, set);
+	else
+		sysreg_clear_set(cptr_el2,
+				 __cpacr_to_cptr_clr(clr, set),
+				 __cpacr_to_cptr_set(clr, set));
+}
 
 static __always_inline void kvm_write_cptr_el2(u64 val)
 {

-- 
2.39.5


