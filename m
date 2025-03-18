Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4311AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 12:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ULbvlw/EuoEN1tkpBgXulLTKugYNVY4S9ekPv9Dr508=; b=owTHdNYYp1Ry2A
	gOJvFqDuW0Mfja43etzGKO/I9pGorUBH96awGy0qFYIR9KIMOnKLcyg8vuxKUWUbr30nQsSiIJ6hH
	6x2RVml8RKgrVzIKgifp0P50zFsS3SiBfw40LkV41brvLYkdCTO/y7rryyrPnO0YalDyTFF6ap2m9
	tL+wymjt+CmdyhGK8oeKdAUID2oEr3tviAIMvrFcAtPSCc8T8Ff5F0TNjhectTOnO/o2n4zUw6FqM
	NrYvXHVw7f+2PIkkO3gOmsDtiNgr3k2f218PEzIr/SmSnouUzwoXTnMDripGR1MdTbHE7tRdo2IQ8
	sstJYHA/Q3/QtHIAPm9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWCY-00000005trB-3JYr;
	Tue, 18 Mar 2025 12:37:46 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWAq-00000005taN-3mEg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 12:36:02 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZHB6p0CFyzvWvJ;
	Tue, 18 Mar 2025 20:32:02 +0800 (CST)
Received: from kwepemd500014.china.huawei.com (unknown [7.221.188.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 4ECE614038F;
	Tue, 18 Mar 2025 20:35:55 +0800 (CST)
Received: from [10.67.121.2] (10.67.121.2) by kwepemd500014.china.huawei.com
 (7.221.188.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 18 Mar
 2025 20:35:54 +0800
Message-ID: <67D968A9.7080504@hisilicon.com>
Date: Tue, 18 Mar 2025 20:35:53 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <soc@kernel.org>, <arm@kernel.org>
Subject: [GIT,PULL] arm64: dts: hisilicon dts updates for v6.15
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.2]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd500014.china.huawei.com (7.221.188.63)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_053601_125962_7B7E039B 
X-CRM114-Status: UNSURE (   5.91  )
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
Cc: wuliebao@huawei.com, salil.mehta@huawei.com, daniel.shen@huawei.com, tangkunshan@huawei.com, Arnd Bergmann <arnd@arndb.de>, james.clark@linaro.org, xuwei5@hisilicon.com, huangdaode@huawei.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, shameerali.kolothum.thodi@huawei.com, "Zengtao \(B\)" <prime.zeng@hisilicon.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>, Leo Yan <leo.yan@arm.com>, yangyicong@hisilicon.com, liguozhu@hisilicon.com, zhangyi.ac@huawei.com, linux-arm-kernel@lists.infradead.org, shiju.jose@huawei.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi ARM SoC maintainers,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-6.15

for you to fetch changes up to 8095a17b0ace09a280a5954096701b883dcaa135:

  arm64: dts: hi3660: Add property for fixing CPUIdle (2025-03-18 11:46:55 +0000)

----------------------------------------------------------------
ARM64: DT: HiSilicon ARM64 DT updates for v6.15

- Add property to the ETM nodes for fixing CPU idle states

----------------------------------------------------------------
Leo Yan (1):
      arm64: dts: hi3660: Add property for fixing CPUIdle

 arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

