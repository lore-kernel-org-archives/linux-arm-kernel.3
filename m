Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF47EC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 08:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Uu9GXEDZwyYIMljqugYcQWLyNEwnJndeVfbjxV3AxE8=; b=bV5E53bZUnw8eOXT2bbs5wd6AB
	V+bsNNMdDHabR3o2NafarHUBEqZ3bkHPmdpSV7JS1Kjb7PfyWTUZ8kBioQ2LrMpuGqYjSo4ZKYGU+
	XxmSMuFJ3XNphaECfIOyCQ+9j5TrLBlLq+jRg5BI/H7624M52MBDZFgZ9wRtZX2mcNeEBSdK6ZQNC
	NuqqFbn5tiYet4dNmMMsnOb75U0SiaZTtHHshuZOIxr/F2p4tEeoX/qaqGodLe1TnD6xWQjVve4Vq
	PLJjgazJMd697yC38XsMDmG4t+AOalujeC2oMJVx9IoYEEekOKy/6z099ONXzghlFA9Y5PgmVrpYU
	StzNf4Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u792i-00000006JwQ-2MpM;
	Tue, 22 Apr 2025 08:31:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77tq-000000065qs-0FHj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 07:18:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 49B34A4BE23;
	Tue, 22 Apr 2025 07:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B186DC4CEE9;
	Tue, 22 Apr 2025 07:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745306313;
	bh=CjKlxi+sEjAG3Hozv3wL/vXB0cLvAR+Mn/Jg+KX/ctw=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=0+JkLQjhZGJXeDi0/hL+v8zyPuCZjZ8JbFLgsdvxZOhC01ZEcv01+3+18guXQXQb6
	 a+XdjxGF22ibgh0JHtjLY7kbDq9XCq/JhtGbp4fAtTtA+N601Kf/C/4VAXktcjGnC6
	 ec4mOljEZGuD1h0En9LU/BepoAdkufAbrt5Lv/I0=
Subject: Patch "arm64/sysreg: Update register fields for ID_AA64MMFR0_EL1" has been added to the 6.14-stable tree
To: anshuman.khandual@arm.com,broonie@kernel.org,catalin.marinas@arm.com,eric.auger@redhat.com,gregkh@linuxfoundation.org,linux-arm-kernel@lists.infradead.org,mark.rutland@arm.com,robh@kernel.org,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 22 Apr 2025 09:18:10 +0200
In-Reply-To: <20250414045848.2112779-2-anshuman.khandual@arm.com>
Message-ID: <2025042209-unbundle-buffed-c8e1@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_001834_227775_ECD26294 
X-CRM114-Status: GOOD (  11.46  )
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

    arm64/sysreg: Update register fields for ID_AA64MMFR0_EL1

to the 6.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-sysreg-update-register-fields-for-id_aa64mmfr0_el1.patch
and it can be found in the queue-6.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-132384-greg=kroah.com@vger.kernel.org Mon Apr 14 06:59:13 2025
From: Anshuman Khandual <anshuman.khandual@arm.com>
Date: Mon, 14 Apr 2025 10:28:42 +0530
Subject: arm64/sysreg: Update register fields for ID_AA64MMFR0_EL1
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org, mark.rutland@arm.com, anshuman.khandual@arm.com
Message-ID: <20250414045848.2112779-2-anshuman.khandual@arm.com>

From: Anshuman Khandual <anshuman.khandual@arm.com>

commit cc15f548cc77574bcd68425ae01a796659bd3705 upstream.

This updates ID_AA64MMFR0_EL1 register fields as per the definitions based
on DDI0601 2024-12.

Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Link: https://lore.kernel.org/r/20250203050828.1049370-2-anshuman.khandual@arm.com
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/tools/sysreg |    2 ++
 1 file changed, 2 insertions(+)

--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1664,6 +1664,7 @@ EndEnum
 UnsignedEnum	59:56	FGT
 	0b0000	NI
 	0b0001	IMP
+	0b0010	FGT2
 EndEnum
 Res0	55:48
 UnsignedEnum	47:44	EXS
@@ -1725,6 +1726,7 @@ Enum	3:0	PARANGE
 	0b0100	44
 	0b0101	48
 	0b0110	52
+	0b0111	56
 EndEnum
 EndSysreg
 


Patches currently in stable-queue which might be from anshuman.khandual@arm.com are

queue-6.14/arm64-sysreg-add-register-fields-for-hfgwtr2_el2.patch
queue-6.14/arm64-boot-enable-el2-requirements-for-feat_pmuv3p9.patch
queue-6.14/arm64-sysreg-add-register-fields-for-hdfgwtr2_el2.patch
queue-6.14/arm64-sysreg-update-register-fields-for-id_aa64mmfr0_el1.patch
queue-6.14/arm64-sysreg-add-register-fields-for-hfgrtr2_el2.patch
queue-6.14/arm64-sysreg-add-register-fields-for-hfgitr2_el2.patch
queue-6.14/arm64-sysreg-add-register-fields-for-hdfgrtr2_el2.patch

