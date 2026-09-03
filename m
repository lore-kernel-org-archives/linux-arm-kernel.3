Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7F0C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 18:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EITQMMDOY1NRuc+kPOw/RVH8Ct7p4szvWfRyhIkyf44=; b=GM1BRVZ/NxDLXtW76rSOXf9oJX
	GFXdicZmYLX5GYZcdOGnNTrsSBL8fhVKl+acO6YAJvMNERuIpLkftZAI5APjbG30WG+WRs4X3CKXt
	3+vGnpqkeWD2WAgERegj3XMB1PJn/VL9hyp/os/CRY3aiTrnYEr101MznVPb1NH8bXlOzBBoL8DkQ
	Yv6hx/SXUM8Hh8H8vBby9UPTgmis22Cy6eBZWTWwuA3vrcc56Md/EdvzyIe+MEDSRv0S368DFnuRp
	7x/36DwBx9mxZ2PgdHJQb3egyRJZ4DRTSb4azPsGW771hFcyiCK1V+5jsmMJHaEb05a8SDCWDNypW
	Axw0EtNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2C5f-00000000MNc-1SOv;
	Thu, 03 Sep 2026 18:23:11 +0000
Received: from out-67.mta1.migadu.com ([95.215.58.67] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2C5b-00000000MMp-2twW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 18:23:09 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=kyPFuMqpkLBCl8wSQRqkTpk9Ppsff9U2AM1Rfn2ZkhY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788459784; v=1; x=1789064584;
 b=xEqnBVgKYIx44fnoM9TfG1xZKSxhmoCoBYNQ7UZppJIH3L3Zrv0vIJHJMmxutCEztxCxUPy+
 4gNIrZKUogzXLuLr1TTb3d/z2BcY+4tA1wsNTtyKE7Ggov8rMjIXTSpJ+DK1QLY+zubk/Zcighn
 cmiD8/fLnYGuPDvFpY4R4c8g=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f37a0a2f39b893cb;
	Thu, 03 Sep 2026 18:23:04 +0000
X-Mizu-Trace-ID: f37a0a2f39b893cb
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH] MAINTAINERS: Add mpam.rst to the MPAM DRIVER entry
Date: Thu,  3 Sep 2026 19:23:00 +0100
Message-Id: <20260903182300.2706684-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_112308_493359_0AEFA42F 
X-CRM114-Status: UNSURE (   9.52  )
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

Documentation/arch/arm64/mpam.rst is not listed under MPAM DRIVER, so
get_maintainer.pl names neither MPAM maintainer on a patch to it.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Found this while putting together the recipient list for [1]:
    get_maintainer.pl names neither MPAM maintainer on a patch to mpam.rst.
    
    arch/arm64/kernel/mpam.c, arch/arm64/include/asm/mpam.h and
    drivers/acpi/arm64/mpam.c aren't in this entry either, but that
    didn't look as clear cut, so I've left them out. Happy to respin
    with them added.
    
    [1] https://lore.kernel.org/all/20260903084809.2027326-1-fuad.tabba@linux.dev/

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fc320b373656f..20a6e70df83c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18438,6 +18438,7 @@ M:	Ben Horgan <ben.horgan@arm.com>
 R:	Reinette Chatre <reinette.chatre@intel.com>
 R:	Fenghua Yu <fenghuay@nvidia.com>
 S:	Maintained
+F:	Documentation/arch/arm64/mpam.rst
 F:	drivers/resctrl/mpam_*
 F:	drivers/resctrl/test_mpam_*
 F:	include/linux/arm_mpam.h
-- 
2.39.5


