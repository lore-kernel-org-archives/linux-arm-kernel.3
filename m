Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DC8C282D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 10:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QE/wxe0vQRXyXYupU++5DnSfXLWkndGunQrY4PXYLpk=; b=2ghoJPSga9n7f/iy1x+EsVekKk
	JGxYXP2C99SKDt6fWJwlzYD8vqF1Kc895CtCGHjAyROcL4En1R1ihuuenOrLC8biiF4PugNKyFQ/E
	1Ejpe/w3y1eCMLcYfMWZBLna1gPejP61h/6gbEPKhCkqT15yNaYni1VsJ7pLDIhJqUaWLNHubS7lJ
	/3kNkthLq3crA1O5HEHKxS7eN89Jh4G9HIOTCE9GSv6epS5Is0sPsMirL+exLuseDS8/eAYrpEa5g
	KA+PFdMTvHLLHDILOwqcuc2Uh1uGiHfFTG2KomwNpF9E0Swqd2xK4vQMi3q85qjB+PuwVm4ts6mXN
	BL/xQVtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPcl-00000004BDd-0InJ;
	Tue, 04 Mar 2025 10:35:43 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPS6-000000047ru-0MIm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:24:43 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z6WsX3n6Wz6L5NK;
	Tue,  4 Mar 2025 18:20:32 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 34CEF140A08;
	Tue,  4 Mar 2025 18:24:35 +0800 (CST)
Received: from localhost (10.96.237.92) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 4 Mar
 2025 11:24:32 +0100
Date: Tue, 4 Mar 2025 18:24:27 +0800
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yicong Yang <yangyicong@huawei.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <wangyushan12@huawei.com>
Subject: Re: [PATCH 9/9] drivers/perf: hisi: Add support for HiSilicon MN
 PMU driver
Message-ID: <20250304182427.000076d9@huawei.com>
In-Reply-To: <20250218092000.41641-10-yangyicong@huawei.com>
References: <20250218092000.41641-1-yangyicong@huawei.com>
	<20250218092000.41641-10-yangyicong@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.96.237.92]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_022442_266517_BEA327DC 
X-CRM114-Status: UNSURE (   7.39  )
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

On Tue, 18 Feb 2025 17:20:00 +0800
Yicong Yang <yangyicong@huawei.com> wrote:

> From: Junhao He <hejunhao3@huawei.com>
> 
> MN (Miscellaneous Node) is a hybrid node in ARM CHI. It broadcasts the
> following two types of requests: DVM operations and PCIe configuration.
> MN PMU devices exist on both SCCL and SICL, so we named the MN pmu
> driver after SCL (Super cluster) ID.
> The MN PMU driver using the HiSilicon uncore PMU framework. And only
> the event parameter is supported.
> 
> Signed-off-by: Junhao He <hejunhao3@huawei.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Short and sweet

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


