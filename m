Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA005C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJ9Rr9CykAOIDKHJD/CzvfpeB8yYEsova679wlOFG74=; b=PhRPMB6g+seNlMQtqd/LKIr1Gk
	P8GNU6VWEDoDwPx42L1Wrgl6ozUhAgVWj/2knNXisNi/wl8/ipM50+pxJv5fUR0D80kaptqvtDC+u
	7mSL4Ixdsl+hAAToqWhZ90MthSoS5+o9XVPnfqTYTE1yaMNoFtoKCopjOF2rUjrGtXQPvThauolBE
	iWuPsH3TNU2/D/qPctSHJPNMw3PM+EstTZfjqdDZGikkv+hUynM36kyC8tGYmPwAmwpY2kRGDb9ma
	RiHbQj/oEb/fQDP31aObgaH7hFz228xJmt+RHgJKPMDTjMAlW54rcmutsLxsmZbLu1z/5SJP+hMpn
	mD/5Z3ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RDu-000000065uL-2xpk;
	Tue, 15 Sep 2026 11:21:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RDt-000000065u9-0npk
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 11:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pJ9Rr9CykAOIDKHJD/CzvfpeB8yYEsova679wlOFG74=; b=Al3k335Nmpx8BZukf8SEXj6fvG
	NIt44bOz6yzWxQGza1mW07tLo0NfaYlqKiTW9+44jImtAFbvukpppVG8QsWxH+LXnu3uwLERdGsek
	EeOzW/55S5O1YryDdkv2bTTJUHMOJHhVopwZIxepvUWDiyKeORWm0N56yDW/ri5jC8ZPADlXlFUJp
	fo4rcCUlG9lCg44u8IgIXjRVOOZIM8M6qEv2eZ6KnxpYUHZs0jn+EwNPXLuT2Jy3KTd7t/LDSikT1
	i0zAkoHP7bMbDudSjjUTPBWeTnP7TgTxrEOMrSa7rs8XJH4u1SaAjhiiUT6ZeTGZ7ngHy/ybXl6O8
	CNRVcEUw==;
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6RDo-00000006cSe-3xOL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 11:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789471257; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=pJ9Rr9CykAOIDKHJD/CzvfpeB8yYEsova679wlOFG74=;
	b=yme4vGVoBl2QGh6JGypvXCT/Iw9Ib3fYE/4s01F1tDF6W/hVHqtSVG375BSZ/go8Dx4q4SdZcf44P7yYiEhOjmKs0w8NekmrxnXTbUldjGCFarrXd94kpvqaDl0f+97sK7G1ehLKsU4RqKkHTvMt2xxOjLAhOHyhKmuUBfCMMkk=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0XB1X-IG_1789471237;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XB1X-IG_1789471237 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 15 Sep 2026 19:20:56 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: Kiryl Shutsemau <kas@kernel.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Breno Leitao <leitao@debian.org>,
	Kyle McMartin <jkkm@meta.com>,
	Usama Arif <usama.arif@linux.dev>,
	kernel-team@meta.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] iommu/arm-smmu-v3: Default queue depths to one page in a kdump kernel
Date: Tue, 15 Sep 2026 19:20:36 +0800
Message-ID: <20260915112037.1495272-1-xiangzao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260909095228.2174031-3-kas@kernel.org>
References: <20260909095228.2174031-1-kas@kernel.org> <20260909095228.2174031-3-kas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_122109_372681_E844E716 
X-CRM114-Status: UNSURE (   9.14  )
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

Tested-by: Yuanhe Shu <xiangzao@linux.alibaba.com>

We hit the same problem on our arm64 platform: the kdump capture kernel
runs out of memory because the SMMUv3 queues are still allocated at full
hardware size. We had started looking into it ourselves, then came across
this series, so we tested it on the affected hardware rather than prepare
a duplicate fix.

It resolves the problem for us - details below.

Test platform: an arm64 server, 128 cores, 2 NUMA nodes, 512 GiB RAM,
exposing 6 SMMUv3 instances. 64K-page kernel (PAGE_SHIFT=16) based on
Linux 7.0.14 with the series applied on top; crashkernel reservation is
512 MiB.

On this platform kdump FAILS without the patch, and the series fixes it.

Before - capture kernel WITHOUT the series:
  All 6 SMMUv3 instances still allocate the hardware-maximum queues:
    arm-smmu-v3 arm-smmu-v3.0.auto: allocated 524288 entries for cmdq
    arm-smmu-v3 arm-smmu-v3.0.auto: allocated 524288 entries for evtq
    arm-smmu-v3 arm-smmu-v3.0.auto: allocated 524288 entries for priq
    (... same for all 6 instances)
  That is 8 + 16 + 8 = 32 MiB per instance, 192 MiB total - 37.5% of the
  512 MiB reservation. The capture kernel OOMs before makedumpfile runs:
    swapper/0 invoked oom-killer: gfp_mask=0x2040cc0(GFP_KERNEL|...), order=0
    Out of memory and no killable processes...
    Rebooting in 10 seconds..
  => no vmcore is saved.

After - capture kernel WITH the series:
  All three queues are floored to one page per instance:
    arm-smmu-v3 arm-smmu-v3.0.auto: allocated 4096 entries for cmdq
    arm-smmu-v3 arm-smmu-v3.0.auto: allocated 2048 entries for evtq
    arm-smmu-v3 arm-smmu-v3.0.auto: allocated 4096 entries for priq
    (... same for all 6 instances)
  => ~1.1 MiB total (~191 MiB freed). All 6 instances re-probe cleanly
  (no -ENXIO, no allocation failure) and a 608 MB vmcore is saved.

Same machine, same 512 MiB reservation; the only difference is the v6
series, so this is a controlled before/after.

Thanks,
Yuanhe

