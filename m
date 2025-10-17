Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D0CCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 07:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=MKFyMDPvTa9boGw/pIA8VSgPtcenGXXPbiiS70Y6s2M=; b=FT7BjdS2CzuAwi7yWWXMzjIt92
	O4pCFxbJzsqzciutrGBd+vHtgQET9qJAD4AXRPmO3oE3g79SnM2Z9KT71czb7LylmZWjTAGoDs3iP
	J94l/D0st6vP1NcKedH4PIT5fH+F89k2AHbTuUT19XTR6kXvy8eZRjc1Zf/h0bc7FXa+RaCBvF022
	wXwPrNdm0dQhy/wuqjHvwGDHgRZVuMa1RvR2hQmnNd18kvyJ8LNrRLu2PXrM5MiM0pwrXwaHFSF4C
	v4KPFxwfLwPDdUKNbBcEaBeH2JWpPOlGstradtp9OGBAFMLyWOYSTWYmPmdYnpAWR8RoslWn2GI4l
	DEFtJT3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eea-00000006wWL-2hSj;
	Fri, 17 Oct 2025 07:13:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eeY-00000006wVp-3rpy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 07:13:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E34564040;
	Fri, 17 Oct 2025 07:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F61EC4CEE7;
	Fri, 17 Oct 2025 07:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760685209;
	bh=e1vaQfds8k8YMet3ny9OYsJZ1KjuD/MkFtOtjq06w7I=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=Nhb15t8JSQhMEFIRempLclUJ3BfvAkq29WzAGLEGXvu1zv7p9lR6LydmJ2+m2dV+X
	 AN4De/6AQL36yfVFOAJNBY2gTylpEW7xLpz4qSdivQylDUgm7JqdZ/STIN1FhIhR/P
	 PyU0kan8w5zHkTILZHerk7nYjrBs9W9iovSV9ywE=
Subject: Patch "arm64: errata: Apply workarounds for Neoverse-V3AE" has been added to the 6.12-stable tree
To: catalin.marinas@arm.com,gregkh@linuxfoundation.org,james.morse@arm.com,linux-arm-kernel@lists.infradead.org,mark.rutland@arm.com,ryan.roberts@arm.com,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Fri, 17 Oct 2025 09:13:19 +0200
In-Reply-To: <20251016111208.3983300-3-ryan.roberts@arm.com>
Message-ID: <2025101719-legislate-plasma-7c16@gregkh>
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

    arm64: errata: Apply workarounds for Neoverse-V3AE

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-errata-apply-workarounds-for-neoverse-v3ae.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-186004-greg=kroah.com@vger.kernel.org Thu Oct 16 13:12:53 2025
From: Ryan Roberts <ryan.roberts@arm.com>
Date: Thu, 16 Oct 2025 12:12:06 +0100
Subject: arm64: errata: Apply workarounds for Neoverse-V3AE
To: stable@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>
Message-ID: <20251016111208.3983300-3-ryan.roberts@arm.com>

From: Mark Rutland <mark.rutland@arm.com>

[ Upstream commit 0c33aa1804d101c11ba1992504f17a42233f0e11 ]

Neoverse-V3AE is also affected by erratum #3312417, as described in its
Software Developer Errata Notice (SDEN) document:

  Neoverse V3AE (MP172) SDEN v9.0, erratum 3312417
  https://developer.arm.com/documentation/SDEN-2615521/9-0/

Enable the workaround for Neoverse-V3AE, and document this.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
[ Ryan: Trivial backport ]
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Documentation/arch/arm64/silicon-errata.rst |    2 ++
 arch/arm64/Kconfig                          |    1 +
 arch/arm64/kernel/cpu_errata.c              |    1 +
 3 files changed, 4 insertions(+)

--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -198,6 +198,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V3     | #3312417        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Neoverse-V3AE   | #3312417        | ARM64_ERRATUM_3194386       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | MMU-500         | #841119,826419  | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | MMU-600         | #1076982,1209401| N/A                         |
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1111,6 +1111,7 @@ config ARM64_ERRATUM_3194386
 	  * ARM Neoverse-V1 erratum 3324341
 	  * ARM Neoverse V2 erratum 3324336
 	  * ARM Neoverse-V3 erratum 3312417
+	  * ARM Neoverse-V3AE erratum 3312417
 
 	  On affected cores "MSR SSBS, #0" instructions may not affect
 	  subsequent speculative instructions, which may permit unexepected
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -455,6 +455,7 @@ static const struct midr_range erratum_s
 	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
 	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
 	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3),
+	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3AE),
 	{}
 };
 #endif


Patches currently in stable-queue which might be from ryan.roberts@arm.com are

queue-6.12/arm64-cputype-add-neoverse-v3ae-definitions.patch
queue-6.12/mm-thp-fix-mte-tag-mismatch-when-replacing-zero-filled-subpages.patch
queue-6.12/arm64-errata-apply-workarounds-for-neoverse-v3ae.patch

