Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415A7C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 08:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=stKSYHtRRhVda/OAISMJ37FI2182UofDKi5iULZNdxg=; b=t9Y075LRMZbLjVKTQEdt7rorN8
	7lM23DKNTpzExehHJDn+WNp1d0h5XmYqSATWAkRqt/L5mIVoTvQGMkPtsjGkOgI4kaO0I7+f+CK1i
	VHTvfq097mll3zJQ89d/ZCEAiiszMfAuhrtn94vO+C4tnei6TXmrKvpskQYEjtNidQY5zZsSJ4IF0
	X/febwjcQGrIV9WZLRf56oy7aGpLpz1VqlP7cPZAMgb17LlXmRBTRzHo4OzHypYE4DJnY50OW9cNq
	wpRqJaBcNdbbJs2hrqYcxOTWlBVd0wZjNFtzDwALH1muUv2aaMY7LSgrxyCM2Tr+LVMROb02WwoaP
	iR9Ht7fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78iP-00000006FHs-0vrD;
	Tue, 22 Apr 2025 08:10:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77sW-000000065h2-44xr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 07:17:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 310CC4A66C;
	Tue, 22 Apr 2025 07:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098A6C4CEE9;
	Tue, 22 Apr 2025 07:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745306232;
	bh=2+W4vh6wLoJr95zWN1t11nAl9Ap+hlJOPPmvaPtDOgQ=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=vLYHMEH3RxwXUpEuaZngTG7pkskc9iSuSGCsdGpYW1Xz9oXxcJhnTU4rh3jVsSz+5
	 sHaRUu7DV9ywRqGongIpSMedRmlJwEkCVM5qFZI3wxGDrBhlZc3mZu9Tp2OUlTE4UL
	 im6zagBo2i3lzvZO1yzFY8DfH76wzt7peQ7utAG8=
Subject: Patch "arm64/sysreg: Add register fields for HDFGWTR2_EL2" has been added to the 6.12-stable tree
To: anshuman.khandual@arm.com,broonie@kernel.org,catalin.marinas@arm.com,eric.auger@redhat.com,gregkh@linuxfoundation.org,linux-arm-kernel@lists.infradead.org,mark.rutland@arm.com,robh@kernel.org,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 22 Apr 2025 09:16:59 +0200
In-Reply-To: <20250415045728.2248935-4-anshuman.khandual@arm.com>
Message-ID: <2025042259-collide-swimmable-f868@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_001713_056413_66370EBE 
X-CRM114-Status: GOOD (  11.12  )
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


This is a note to let you know that I've just added the patch titled

    arm64/sysreg: Add register fields for HDFGWTR2_EL2

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-sysreg-add-register-fields-for-hdfgwtr2_el2.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-132687-greg=kroah.com@vger.kernel.org Tue Apr 15 06:57:51 2025
From: Anshuman Khandual <anshuman.khandual@arm.com>
Date: Tue, 15 Apr 2025 10:27:24 +0530
Subject: arm64/sysreg: Add register fields for HDFGWTR2_EL2
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org, mark.rutland@arm.com, anshuman.khandual@arm.com
Message-ID: <20250415045728.2248935-4-anshuman.khandual@arm.com>

From: Anshuman Khandual <anshuman.khandual@arm.com>

commit 2f1f62a1257b9d5eb98a8e161ea7d11f1678f7ad upstream.

This adds register fields for HDFGWTR2_EL2 as per the definitions based
on DDI0601 2024-12.

Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Link: https://lore.kernel.org/r/20250203050828.1049370-4-anshuman.khandual@arm.com
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/tools/sysreg |   28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2494,6 +2494,34 @@ Field	1	nPMIAR_EL1
 Field	0	nPMECR_EL1
 EndSysreg
 
+Sysreg HDFGWTR2_EL2	3	4	3	1	1
+Res0	63:25
+Field	24	nPMBMAR_EL1
+Field	23	nMDSTEPOP_EL1
+Field	22	nTRBMPAM_EL1
+Field	21	nPMZR_EL0
+Field	20	nTRCITECR_EL1
+Field	19	nPMSDSFR_EL1
+Res0	18:17
+Field	16	nSPMSCR_EL1
+Field	15	nSPMACCESSR_EL1
+Field	14	nSPMCR_EL0
+Field	13	nSPMOVS
+Field	12	nSPMINTEN
+Field	11	nSPMCNTEN
+Field	10	nSPMSELR_EL0
+Field	9	nSPMEVTYPERn_EL0
+Field	8	nSPMEVCNTRn_EL0
+Field	7	nPMSSCR_EL1
+Res0	6
+Field	5	nMDSELR_EL1
+Field	4	nPMUACR_EL1
+Field	3	nPMICFILTR_EL0
+Field	2	nPMICNTR_EL0
+Field	1	nPMIAR_EL1
+Field	0	nPMECR_EL1
+EndSysreg
+
 Sysreg HDFGRTR_EL2	3	4	3	1	4
 Field	63	PMBIDR_EL1
 Field	62	nPMSNEVFR_EL1


Patches currently in stable-queue which might be from anshuman.khandual@arm.com are

queue-6.12/arm64-sysreg-add-register-fields-for-hfgwtr2_el2.patch
queue-6.12/arm64-boot-enable-el2-requirements-for-feat_pmuv3p9.patch
queue-6.12/arm64-sysreg-add-register-fields-for-hdfgwtr2_el2.patch
queue-6.12/arm64-sysreg-update-register-fields-for-id_aa64mmfr0_el1.patch
queue-6.12/arm64-sysreg-add-register-fields-for-hfgrtr2_el2.patch
queue-6.12/arm64-sysreg-add-register-fields-for-hfgitr2_el2.patch
queue-6.12/arm64-sysreg-add-register-fields-for-hdfgrtr2_el2.patch

