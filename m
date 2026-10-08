Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B604CCA6016
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 21:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E96pTT6XTnNNfP+DWw90hC0+rjXeIZxMXNYz9L3ZLME=; b=Rn6mnmALpe9J2gu4LOwhWkkmrI
	2FKcp32LY6wJ919bIcf+2Il5cSdTgjzDunZ13yxCl80iIcWOMwJaVIaLRlB235F1BE1tNbKA1Ms6j
	GfTOA6z3eS1LXkanSLmg9i85pE8SjI09Qgjpk10V+RjAwQFn2LMw34fduLGffJEF+GJoRRTGV/67w
	wq3eWxjeXnQ6hTmhCknDMKqTKlaAshrtW/+8XLu7XuXJf4tdsbO0uWiCu9Usr7aFGB/wd4NGZ0OUY
	nVELP9yOL38vZj9bZydo8tLBzjG9rIwalmVouPSHfatAxvsoYHXpNEPqxSmRwBDXJyO/JuufhQQFY
	nG023RPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEvfm-000000054Uk-1wPT;
	Thu, 08 Oct 2026 21:29:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEvfj-000000054Te-1Qpz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 21:29:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02FA51595;
	Thu,  8 Oct 2026 14:28:59 -0700 (PDT)
Received: from e127648.arm.com (unknown [10.57.87.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 13BD63F763;
	Thu,  8 Oct 2026 14:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791494942; bh=HSK1pjVm9ehxmlooMYhWq3cd6qmvmv5av3882DG5p+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WVtS6XoPTlc6ehGJgMPUQGYfT9yGQM/L72Qy8L7R61KWMkezxJHb47n4u/wS+Ci/u
	 L/SmOLhKjO+Jor9ai0YuPDg+ersouu9gCUye0R/m+PJMZk95p64yYYQ+Ybo8L7CiQM
	 UIyL8yRdBAxKl2fTYlROGJUvMHUnQEtX/FjWtU38=
From: Christian Loehle <christian.loehle@arm.com>
To: rafael@kernel.org
Cc: zhenglifeng1@huawei.com,
	zhongqiu.han@oss.qualcomm.com,
	viresh.kumar@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Vanshidhar Konda <vanshikonda@os.amperecomputing.com>,
	Shubhang Kaushik <sh@gentwo.org>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	jonathanh@nvidia.com,
	zhanjie9@hisilicon.com,
	Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH 1/2] MAINTAINERS: cpufreq: Replace CPPC reviewer
Date: Thu,  8 Oct 2026 22:28:31 +0100
Message-Id: <20261008212832.354382-2-christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008212832.354382-1-christian.loehle@arm.com>
References: <20261008212832.354382-1-christian.loehle@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_142903_431095_3AB17005 
X-CRM114-Status: UNSURE (   9.12  )
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

Take over CPPC cpufreq review duties from Pierre Gondois. Thanks to
Pierre for his reviews and contributions to the driver.

Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90b..3064942ef05c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6765,7 +6765,7 @@ M:	"Rafael J. Wysocki" <rafael@kernel.org>
 M:	Viresh Kumar <viresh.kumar@linaro.org>
 R:	Jie Zhan <zhanjie9@hisilicon.com>
 R:	Lifeng Zheng <zhenglifeng1@huawei.com>
-R:	Pierre Gondois <pierre.gondois@arm.com>
+R:	Christian Loehle <christian.loehle@arm.com>
 R:	Sumit Gupta <sumitg@nvidia.com>
 L:	linux-pm@vger.kernel.org
 S:	Maintained

