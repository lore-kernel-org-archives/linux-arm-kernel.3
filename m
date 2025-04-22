Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E68C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 08:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=rWArvFPch6Taa2uh303ALfl6hcry+qU1KMWh/wCTSGQ=; b=DbTubU9AHaiAwuFEZ/gYU5vnnj
	Q/0zkUy3wMtsy0iqYMyZjg9tnutuhM/1utlRBWIqz7Sry+qvD+4VyOi47TEBC2odX6zIvbrv0vYcV
	VxZhiE7QPGifmQVY5Q51cwUNTu9Cg5iJ50uXGBuOtX0IPGVThC/b86v22RLQFNPa2t2zDRE/nBO9u
	HCFU+q+ZrTbJZQCnw6U+cWJ7qW7IG8yJO8y+00+KodOSvpUmCsn5nQK4U6SQ5VBv9GjtZ8dEVEdJ3
	qTrAj5RdMfGyqlIP5gcd6T8DO66K+FJ2Bp/eNsccEaQ+bVPEd6ghMoqvZVH79VegcrHjch4e1qzLL
	hjs08gwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78z1-00000006JAh-0uak;
	Tue, 22 Apr 2025 08:27:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77tk-000000065py-3BrE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 07:18:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0406CA4BD8C;
	Tue, 22 Apr 2025 07:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70003C4CEE9;
	Tue, 22 Apr 2025 07:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745306307;
	bh=hv+J71gX6E47EJVlxXP9rLD+QRsZuCzPa0YX6aylyQk=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=QHC3U4QhX2sEDYYcsezAHIlcU9V507tFSQfC31x/zxV9nrm/4A3qcHYjNCs+LDmt9
	 pKawCyw9cPjvIvPzxIq8QYoFDUontbyI0UwM14b7ch6M+qycqs1f6mn381FgeFthdV
	 Dwp53p7dCpduhtwsP3lAv3PdBdt0yZijUzCXKVqs=
Subject: Patch "arm64/sysreg: Add register fields for HFGRTR2_EL2" has been added to the 6.14-stable tree
To: anshuman.khandual@arm.com,broonie@kernel.org,catalin.marinas@arm.com,eric.auger@redhat.com,gregkh@linuxfoundation.org,linux-arm-kernel@lists.infradead.org,mark.rutland@arm.com,robh@kernel.org,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 22 Apr 2025 09:18:09 +0200
In-Reply-To: <20250414045848.2112779-6-anshuman.khandual@arm.com>
Message-ID: <2025042209-unmixable-fiddling-3dc2@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_001828_943071_33173579 
X-CRM114-Status: GOOD (  10.93  )
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

    arm64/sysreg: Add register fields for HFGRTR2_EL2

to the 6.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-sysreg-add-register-fields-for-hfgrtr2_el2.patch
and it can be found in the queue-6.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-132388-greg=kroah.com@vger.kernel.org Mon Apr 14 06:59:19 2025
From: Anshuman Khandual <anshuman.khandual@arm.com>
Date: Mon, 14 Apr 2025 10:28:46 +0530
Subject: arm64/sysreg: Add register fields for HFGRTR2_EL2
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org, mark.rutland@arm.com, anshuman.khandual@arm.com
Message-ID: <20250414045848.2112779-6-anshuman.khandual@arm.com>

From: Anshuman Khandual <anshuman.khandual@arm.com>

commit 59236089ad5243377b6905d78e39ba4183dc35f5 upstream.

This adds register fields for HFGRTR2_EL2 as per the definitions based
on DDI0601 2024-12.

Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Link: https://lore.kernel.org/r/20250203050828.1049370-6-anshuman.khandual@arm.com
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/tools/sysreg |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2700,6 +2700,25 @@ Field	1	nPMIAR_EL1
 Field	0	nPMECR_EL1
 EndSysreg
 
+Sysreg	HFGRTR2_EL2	3	4	3	1	2
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
+Field	1	nERXGSR_EL1
+Field	0	nPFAR_EL1
+EndSysreg
+
 Sysreg HDFGRTR_EL2	3	4	3	1	4
 Field	63	PMBIDR_EL1
 Field	62	nPMSNEVFR_EL1


Patches currently in stable-queue which might be from anshuman.khandual@arm.com are

queue-6.14/arm64-sysreg-add-register-fields-for-hfgwtr2_el2.patch
queue-6.14/arm64-boot-enable-el2-requirements-for-feat_pmuv3p9.patch
queue-6.14/arm64-sysreg-add-register-fields-for-hdfgwtr2_el2.patch
queue-6.14/arm64-sysreg-update-register-fields-for-id_aa64mmfr0_el1.patch
queue-6.14/arm64-sysreg-add-register-fields-for-hfgrtr2_el2.patch
queue-6.14/arm64-sysreg-add-register-fields-for-hfgitr2_el2.patch
queue-6.14/arm64-sysreg-add-register-fields-for-hdfgrtr2_el2.patch

