Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421F2C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 08:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=3aFgikyLna2qYSjpW6JOxblQ3T6qxa3g8Y/kL+bCdQY=; b=VHxL8NQP5zBc9qHuIwMsZTBya/
	x4Hi84klQo0umUuNIgHyxlIB6Uc9cEzgZP7+VCOy0jbdnirNEnLJLlQr+mBZ4hBRzV/3521Kt6O+w
	whbSVf7uJYzE7HcnqeQkN4CfbiaD+hspDvLLbJH1R59iclPi5oAc+rNnYXyMT206v71ED2/0asaAH
	UjQ10JOG/UVHjTm0bP11NaizFCdjNCkzGZOkFEAOasooTCd7JMvZgAaM6YDly5/NoehB4LfvEJS64
	/DF5/3AuFZuoert9Qlncy40QK7nuMwVr7D3e9StB2B6Ulk/bL4eXmvveAyexT84BnM5p1ddkFa8su
	01dUvpCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78xB-00000006Ijm-1dAm;
	Tue, 22 Apr 2025 08:26:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77ti-000000065pU-148E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 07:18:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5E8C7A4BCFA;
	Tue, 22 Apr 2025 07:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A198AC4CEE9;
	Tue, 22 Apr 2025 07:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745306305;
	bh=e4AAha/MbCtc2NOOLjX76Ui+mGx4uYnpag1NtX5dReM=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=GtJ1MSnplP1BEEn0YaVuRswqO4YGVuom6soPowcVn33BgmJVKDHbJkPOSd9aUSNL+
	 mpzvgiozedyH/njRt4WT181HBQMXYttr4aOFEo9y603nwF12MGOGPU5szbBw9N6LHi
	 Uo2zaAbPvXSa72HveYI0Q918LZzJxSOkO3yeRr8s=
Subject: Patch "arm64/sysreg: Add register fields for HFGITR2_EL2" has been added to the 6.14-stable tree
To: anshuman.khandual@arm.com,broonie@kernel.org,catalin.marinas@arm.com,eric.auger@redhat.com,gregkh@linuxfoundation.org,linux-arm-kernel@lists.infradead.org,mark.rutland@arm.com,robh@kernel.org,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 22 Apr 2025 09:18:09 +0200
In-Reply-To: <20250414045848.2112779-5-anshuman.khandual@arm.com>
Message-ID: <2025042209-removal-untimed-6a3b@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_001826_444658_07187AB3 
X-CRM114-Status: GOOD (  11.20  )
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

    arm64/sysreg: Add register fields for HFGITR2_EL2

to the 6.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-sysreg-add-register-fields-for-hfgitr2_el2.patch
and it can be found in the queue-6.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-132387-greg=kroah.com@vger.kernel.org Mon Apr 14 06:59:19 2025
From: Anshuman Khandual <anshuman.khandual@arm.com>
Date: Mon, 14 Apr 2025 10:28:45 +0530
Subject: arm64/sysreg: Add register fields for HFGITR2_EL2
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org, mark.rutland@arm.com, anshuman.khandual@arm.com
Message-ID: <20250414045848.2112779-5-anshuman.khandual@arm.com>

From: Anshuman Khandual <anshuman.khandual@arm.com>

commit 9401476f17747586a8bfb29abfdf5ade7a8bceef upstream.

This adds register fields for HFGITR2_EL2 as per the definitions based
on DDI0601 2024-12.

Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Link: https://lore.kernel.org/r/20250203050828.1049370-5-anshuman.khandual@arm.com
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/tools/sysreg |    6 ++++++
 1 file changed, 6 insertions(+)

--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2872,6 +2872,12 @@ Field	1	AMEVCNTR00_EL0
 Field	0	AMCNTEN0
 EndSysreg
 
+Sysreg	HFGITR2_EL2	3	4	3	1	7
+Res0	63:2
+Field	1	nDCCIVAPS
+Field	0	TSBCSYNC
+EndSysreg
+
 Sysreg	ZCR_EL2	3	4	1	2	0
 Fields	ZCR_ELx
 EndSysreg


Patches currently in stable-queue which might be from anshuman.khandual@arm.com are

queue-6.14/arm64-sysreg-add-register-fields-for-hfgwtr2_el2.patch
queue-6.14/arm64-boot-enable-el2-requirements-for-feat_pmuv3p9.patch
queue-6.14/arm64-sysreg-add-register-fields-for-hdfgwtr2_el2.patch
queue-6.14/arm64-sysreg-update-register-fields-for-id_aa64mmfr0_el1.patch
queue-6.14/arm64-sysreg-add-register-fields-for-hfgrtr2_el2.patch
queue-6.14/arm64-sysreg-add-register-fields-for-hfgitr2_el2.patch
queue-6.14/arm64-sysreg-add-register-fields-for-hdfgrtr2_el2.patch

