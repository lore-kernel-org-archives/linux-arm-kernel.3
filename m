Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4149EC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 08:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=oICFhhPe/ZnI1tay8oU4ioomYevpKJymTxsWb61f2Mk=; b=dZnhYr77GdjjJCaqJxmMpk/eTZ
	5xuNrhvVvpgj9arwUDAvL3j6BCOrrxNEL/mu23ZJI9ZfO4rZw/7kf8ZkuQB/Z4oYyVBrIbL82dUAF
	74kdbCrLolXWVpmZ8SrsIQ1ddn3fxZLvdBMOJYhisxvCLdaZaTa9qascXTOqNB0Fn+2Z0vXKnV9uu
	VjA8hwbwsVGyamj1wG86cXzQAoc0KUX4Z1iIX94mL55IoqagmGB3RMT7+GUUwPsO0mwfNTv/hXbUc
	98cuOVy82w+IFtSH0w4f0J0LPbf2d8SWQ9ACZb+edReLxYeONzXgp5em98GMSFASSNi/rKnVUoWod
	nYugRq4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78nw-00000006GIM-3Qf7;
	Tue, 22 Apr 2025 08:16:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77sf-000000065iB-2fFu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 07:17:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 34FB26116E;
	Tue, 22 Apr 2025 07:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB61C4CEE9;
	Tue, 22 Apr 2025 07:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745306240;
	bh=TU/30/xK+AhmPZxiJo8sPfOe1RNfr/izOOnUgthcKPI=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=sdbNRou1CxcudoQ88gyUuqvzDX4ayagI0oYUTU2n4FWXNlqd5O3zkx+a3ZCTMsv6+
	 426tva9Kr5pKDbbKsKWna7TArHiAYItyTbaaj8V2V1APuyCzzGKLf7vmo09hba3LP4
	 J3uX4hqQefGKoERTOuAdcxuSc9Ju/vwboXv6svE8=
Subject: Patch "arm64/sysreg: Add register fields for HFGWTR2_EL2" has been added to the 6.12-stable tree
To: anshuman.khandual@arm.com,broonie@kernel.org,catalin.marinas@arm.com,eric.auger@redhat.com,gregkh@linuxfoundation.org,linux-arm-kernel@lists.infradead.org,mark.rutland@arm.com,robh@kernel.org,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 22 Apr 2025 09:16:59 +0200
In-Reply-To: <20250415045728.2248935-7-anshuman.khandual@arm.com>
Message-ID: <2025042259-stinky-scallion-e100@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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

    arm64/sysreg: Add register fields for HFGWTR2_EL2

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-sysreg-add-register-fields-for-hfgwtr2_el2.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-132690-greg=kroah.com@vger.kernel.org Tue Apr 15 06:58:04 2025
From: Anshuman Khandual <anshuman.khandual@arm.com>
Date: Tue, 15 Apr 2025 10:27:27 +0530
Subject: arm64/sysreg: Add register fields for HFGWTR2_EL2
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org, mark.rutland@arm.com, anshuman.khandual@arm.com
Message-ID: <20250415045728.2248935-7-anshuman.khandual@arm.com>

From: Anshuman Khandual <anshuman.khandual@arm.com>

commit ea37be0773f04420515b8db49e50abedbaa97e23 upstream.

This adds register fields for HFGWTR2_EL2 as per the definitions based
on DDI0601 2024-12.

Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Link: https://lore.kernel.org/r/20250203050828.1049370-7-anshuman.khandual@arm.com
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/tools/sysreg |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2541,6 +2541,25 @@ Field	1	nERXGSR_EL1
 Field	0	nPFAR_EL1
 EndSysreg
 
+Sysreg	HFGWTR2_EL2	3	4	3	1	3
+Res0	63:15
+Field	14	nACTLRALIAS_EL1
+Field	13	nACTLRMASK_EL1
+Field	12	nTCR2ALIAS_EL1
+Field	11	nTCRALIAS_EL1
+Field	10	nSCTLRALIAS2_EL1
+Field	9	nSCTLRALIAS_EL1
+Field	8	nCPACRALIAS_EL1
+Field	7	nTCR2MASK_EL1
+Field	6	nTCRMASK_EL1
+Field	5	nSCTLR2MASK_EL1
+Field	4	nSCTLRMASK_EL1
+Field	3	nCPACRMASK_EL1
+Field	2	nRCWSMASK_EL1
+Res0	1
+Field	0	nPFAR_EL1
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

