Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E60CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 11:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2DcBI1bMgoVInefU/iXVbUVgVuOWez0fkUcdSx3JFY=; b=NEBL2PRfsb6u7rDY4eWU3gjHnL
	YxsDMxj95ZacsvjtswUhqBvfar+9Rg/hLKWgiIvhPpP7FdwWtMq0NxllTdZZYtAHh8gmatzQAIJe5
	3pLn0bGH4/KPmV9UVXahFYCzMRRsiMmLrGH7SsCdHxd9CdvdbPWQ9tar+6OCxjFeL1/jjM5ns1evf
	owtfNR73GIK9eFRB9us6QgZOlMlZO/MeycN8ksYa0HB9wjcF4jA1Jh+HtTMcHrMozvtF120AfUqdQ
	kEfVnQAll7K8c0KTaFSaM/nXaMBGWkzjCTq5ZtTRqHqYR4qdprZLvpcYJL1JiVhE8VC4Xu17E2rjd
	RZrEPy4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoguF-0000000DNY6-46dU;
	Wed, 20 Aug 2025 11:23:03 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uog6p-0000000DAcg-1LLr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 10:32:00 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4c6N4G31SBz6M4q9;
	Wed, 20 Aug 2025 18:29:50 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id C69FB1402FB;
	Wed, 20 Aug 2025 18:31:57 +0800 (CST)
Received: from SecurePC-101-06.huawei.com (10.122.19.247) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Aug 2025 12:31:56 +0200
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Catalin Marinas <catalin.marinas@arm.com>, <james.morse@arm.com>,
	<linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, Will Deacon <will@kernel.org>, Dan Williams
	<dan.j.williams@intel.com>, Davidlohr Bueso <dave@stgolabs.net>, "H . Peter
 Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
CC: Yicong Yang <yangyicong@huawei.com>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, Andy Lutomirski
	<luto@kernel.org>
Subject: [PATCH v3 4/8] MAINTAINERS: Add Jonathan Cameron to drivers/cache
Date: Wed, 20 Aug 2025 11:29:46 +0100
Message-ID: <20250820102950.175065-5-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250820102950.175065-1-Jonathan.Cameron@huawei.com>
References: <20250820102950.175065-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_033159_503459_1758E4B6 
X-CRM114-Status: GOOD (  11.53  )
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

Seems unfair to inflict the cache-coherency drivers on Conor with out
also stepping up as a second maintainer for drivers/cache.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
v3: Add lib/cache_maint.c and include/cache_coherency.h
    Conor, do you mind those two being in this entry? Seems silly to spin
    another MAINTAINERS entry for a few 10s of lines of simple code.
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa4..039d10ded9e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23967,10 +23967,13 @@ F:	drivers/staging/
 
 STANDALONE CACHE CONTROLLER DRIVERS
 M:	Conor Dooley <conor@kernel.org>
+M:	Jonathan Cameron <jonathan.cameron@huawei.com>
 S:	Maintained
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
 F:	Documentation/devicetree/bindings/cache/
 F:	drivers/cache
+F:	include/cache_coherency.h
+F:	lib/cache_maint.c
 
 STARFIRE/DURALAN NETWORK DRIVER
 M:	Ion Badulescu <ionut@badula.org>
-- 
2.48.1


