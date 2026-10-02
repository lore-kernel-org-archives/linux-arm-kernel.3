Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F8ACA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMd/Cq2GwbGHdpbQcBrh2/9AlS92WjAwRv4gdMM1lFg=; b=2RCcriM7SENjcOOkouo9jS5BhP
	RBYxDAurZWm7mCPLSl41ASmIFSiGN7c3sUcKIWGZtcuHolcOW1XNSwezRmhHIzgcAwTIWdLvUWnjm
	9SacBa1oFTqkLWO5Aouf7e2t/n+frAgAPWDG8s9xd3gytg6CuGLtwNUV8cT4VxqiJra8LM3ovOMZv
	mv8L3J6U6NLSQ340AVXEt2U8ZAXBPa2bWOIQh5/VOvNtN1p376JMaxvsB5UEIxk25NcfZtM6XuunY
	T0GXjvly1XxkbeXYG/Fo8KetkV3yjupmkHSrP/DXUhv7G19SGG7r2/u0Km349Xm2YbnDOojGDSB0F
	MRzz4Heg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChFI-0000000CBh6-2x7N;
	Fri, 02 Oct 2026 17:40:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChF4-0000000CBME-1b3S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:40:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56E801476;
	Fri,  2 Oct 2026 10:40:14 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFF1D3F85F;
	Fri,  2 Oct 2026 10:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962817; bh=0qSB7kmKs13EcbIeGq8flqQ2uqFzEsBeNiREcjIZLlQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gw0HF/r8eldalMV2QKvIjd1k6jeZg2M3LX4sZL8UPHjS+sBG1I7L/xicIgPL4FoBk
	 ixUCsyBMhrgbDW9oyMVBOBPd+ZQRRjFfoi4gJ17zKnV9hSD8StjGatJqWcc3miQu9l
	 vb5yGzTw7RDu6BiUj2S+sY1sCXf2BN/SJEBNTHic=
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 13/27] MAINTAINERS: Add mpam.rst to the MPAM DRIVER entry
Date: Fri,  2 Oct 2026 18:39:26 +0100
Message-ID: <20261002173941.292319-14-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_104018_477663_9B274A6D 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

From: Fuad Tabba <fuad.tabba@linux.dev>

Documentation/arch/arm64/mpam.rst is not listed under MPAM DRIVER, so
get_maintainer.pl names neither MPAM maintainer on a patch to it.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: James Morse <james.morse@arm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b..c107b266a150 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18440,6 +18440,7 @@ M:	Ben Horgan <ben.horgan@arm.com>
 R:	Reinette Chatre <reinette.chatre@intel.com>
 R:	Fenghua Yu <fenghuay@nvidia.com>
 S:	Maintained
+F:	Documentation/arch/arm64/mpam.rst
 F:	drivers/resctrl/mpam_*
 F:	drivers/resctrl/test_mpam_*
 F:	include/linux/arm_mpam.h
-- 
2.53.0


