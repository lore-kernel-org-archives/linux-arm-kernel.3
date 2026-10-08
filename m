Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B76CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 21:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D8C27EcH29KADxDXBSHLLYoAGv2CUc8rXpBFE4lHgp4=; b=em8FKCD7SpuyjSmBCMb6cJIU+e
	ME1+dSL96VJLWnbxyrhuORe5HOWyO7hPqYTk8a6xtNgOjksRoRyutgnyQh9QQKqfaDPGJLG6rSMFq
	FVY1tB0rFPSheglY2Il3tjVtQANh4bC6yHEUB4VzTDedMqtrj46k/v8N+IyUk0rGKR1uLvoeB4+P6
	lioIn8YDvf2vEh8DgNdxPOIKj/uvstkWRrvLGDR+kwnGNNbIszlSTWF9FNLJtL59ky5+KVivoFNGp
	hDyo54yjjcZlCTF6N8Bu2bHBRuB8+m4DtWcardzKRJrQcbpxe+Yf3ZLo7Er4SBDGbLS5EV09YObI8
	YIz7Xa6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEvff-000000054Sj-0c5E;
	Thu, 08 Oct 2026 21:28:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEvfc-000000054SJ-3bQx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 21:28:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D57B1477;
	Thu,  8 Oct 2026 14:28:50 -0700 (PDT)
Received: from e127648.arm.com (unknown [10.57.87.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 973403F763;
	Thu,  8 Oct 2026 14:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791494933; bh=DRL3fpOafRSkxxllvLGIoUiKklaEafR6458OmgjKk88=;
	h=From:To:Cc:Subject:Date:From;
	b=T+vRViT8zVrpxXP2flAbT8UDGmMuWjnRQLBXijj9tJbOMaRa5Ulwwur/YZq3K8xc5
	 GDaMD7s5/+5WQIm0rVctB2i5V3Emx4ndYxAvnJ25du6RPvkQEJ+Cr8MFaDv5sAoMim
	 5SqERzB9S5T23key9FycNsTwNH/QJ52hTYkNjkFU=
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
Subject: [PATCH 0/2] MAINTAINERS: Update CPPC responsibilities
Date: Thu,  8 Oct 2026 22:28:30 +0100
Message-Id: <20261008212832.354382-1-christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_142857_082212_DDD51DF7 
X-CRM114-Status: UNSURE (   6.16  )
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

Hi Rafael,

This series replaces Pierre with me as a reviewer for cppc_cpufreq and
adds a dedicated ACPI CPPC entry with you and me as maintainers.

The separate entry should help direct CPPC changes to people familiar
with its performance control semantics, register access mechanisms and
the platforms implementing it.

Thanks to Pierre for his work on CPPC.

Thanks,
Christian

Christian Loehle (2):
  MAINTAINERS: cpufreq: Replace CPPC reviewer
  MAINTAINERS: ACPI: Add a separate CPPC entry

 MAINTAINERS | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)


