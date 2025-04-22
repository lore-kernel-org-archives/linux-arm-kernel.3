Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279AAC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 08:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=WfRD6S1RfwRLUn+uxQV1+Bk84JpAPus2BvbdVuIIClU=; b=pJ+O6dap+RRQ0m+h3LJX1aW/RI
	qR+01Vh1P6ILRMUZi3V6snw4079IcnKc9oMsT4gDjCY/SqbSGTsEP8EXk/CeH4xLxCZRRahPQNm4R
	qYax1le8YGzF9rAflPrJPT2YWoLflAYHzgWYF7AUcSlfj6Wy2UTDwnYPTjiQZ3T/qaj+TsfR7fkj8
	uZ1g2nlpXOSDLItZcj3R/H75gMywd9VZzqmxDLoxpP6qm8TeqDvHcChEoajhVI7YtEmvELL9Ivp9q
	F9d+a03ghX9Fto+B6xlCGK7QJNa/Zmdu8J/yspJzD/mohPTyXXOmYkx75b87qG3PvZaY+OMJKMpd4
	+ZbCc+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78gZ-00000006EuC-1xec;
	Tue, 22 Apr 2025 08:08:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77sU-000000065gf-1cs9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 07:17:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 650224A694;
	Tue, 22 Apr 2025 07:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCA7C4CEE9;
	Tue, 22 Apr 2025 07:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745306229;
	bh=LEN0rOnPL9PkMksjxhSDBtkWjIDt6v3SvQupVt0otxE=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=nxlW8GhJFBzM83mVi+lwGLdwQOu0W8NSC75kit99AM/pZiSUzyiqY4QIhowIJb6GO
	 YAFZdtSR9XVcWjmT8fHg53cLUL74He/5mmCzacHgHNuj6YngRQIZewyS3pe+p0Sqxd
	 dRdv+JTd6Jk9gauQo22nceR1LkWq3m88MPXkvFLg=
Subject: Patch "arm64/sysreg: Add register fields for HDFGRTR2_EL2" has been added to the 6.12-stable tree
To: anshuman.khandual@arm.com,broonie@kernel.org,catalin.marinas@arm.com,eric.auger@redhat.com,gregkh@linuxfoundation.org,linux-arm-kernel@lists.infradead.org,mark.rutland@arm.com,robh@kernel.org,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 22 Apr 2025 09:16:59 +0200
In-Reply-To: <20250415045728.2248935-3-anshuman.khandual@arm.com>
Message-ID: <2025042259-mower-neutron-6122@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_001710_471270_0B30B920 
X-CRM114-Status: GOOD (  10.87  )
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

    arm64/sysreg: Add register fields for HDFGRTR2_EL2

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-sysreg-add-register-fields-for-hdfgrtr2_el2.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-132686-greg=kroah.com@vger.kernel.org Tue Apr 15 06:57:48 2025
From: Anshuman Khandual <anshuman.khandual@arm.com>
Date: Tue, 15 Apr 2025 10:27:23 +0530
Subject: arm64/sysreg: Add register fields for HDFGRTR2_EL2
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org, mark.rutland@arm.com, anshuman.khandual@arm.com
Message-ID: <20250415045728.2248935-3-anshuman.khandual@arm.com>

From: Anshuman Khandual <anshuman.khandual@arm.com>

commit 44844551670cff70a8aa5c1cde27ad1e0367e009 upstream.

This adds register fields for HDFGRTR2_EL2 as per the definitions based
on DDI0601 2024-12.

Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Link: https://lore.kernel.org/r/20250203050828.1049370-3-anshuman.khandual@arm.com
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/tools/sysreg |   29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2465,6 +2465,35 @@ Field	1	ICIALLU
 Field	0	ICIALLUIS
 EndSysreg
 
+Sysreg HDFGRTR2_EL2	3	4	3	1	0
+Res0	63:25
+Field	24	nPMBMAR_EL1
+Field	23	nMDSTEPOP_EL1
+Field	22	nTRBMPAM_EL1
+Res0	21
+Field	20	nTRCITECR_EL1
+Field	19	nPMSDSFR_EL1
+Field	18	nSPMDEVAFF_EL1
+Field	17	nSPMID
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
+Field	6	nPMSSDATA
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

