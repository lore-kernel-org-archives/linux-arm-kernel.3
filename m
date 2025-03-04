Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F1BC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xCuWG/Pzs8h2QXPatxQTu+Kf4yxJltcHHcFwoFmlaE=; b=QTBKCOnwr3EvfnTXvTQSAqwOn3
	qNXHCj4gJf5jJsVD05j99Dc6eEFO497v8BTGCIhQwSeCCJ2dDdWdzf0b1ZgGo5v9+76ycb4h6uvxx
	p1RSdsTr0nkA6/av8xa12SwqQQQ9sWBy+FC2LChd8tBsU8gxFitpJM0RsVVR8Dffx9ANUZekVWqS+
	Q1PW/GFV6dz3oWQre83CJFeN1y388AGsm0AEJV/ae08PaQZIEt9kaVYl0Xyyt+bl1wODfNiJ4z0NR
	pgDhvZ1ihJriJtVcSXTDv9bxqE8wSoKjKhyG8xFF18U3shIQUV+QkLAUkhq743cx4rVWvzHY3WDPp
	i6DFcLDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpObz-00000003tkW-1677;
	Tue, 04 Mar 2025 09:30:51 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOZA-00000003sw2-2A7R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 09:27:57 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z6VfB4mgdz6D90n;
	Tue,  4 Mar 2025 17:25:38 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id EC987140390;
	Tue,  4 Mar 2025 17:27:50 +0800 (CST)
Received: from localhost (10.96.237.92) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 4 Mar
 2025 10:27:48 +0100
Date: Tue, 4 Mar 2025 17:27:43 +0800
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yicong Yang <yangyicong@huawei.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <wangyushan12@huawei.com>
Subject: Re: [PATCH 3/9] drivers/perf: hisi: Add support for HiSilicon DDRC
 v3 PMU driver
Message-ID: <20250304172743.0000211e@huawei.com>
In-Reply-To: <20250218092000.41641-4-yangyicong@huawei.com>
References: <20250218092000.41641-1-yangyicong@huawei.com>
	<20250218092000.41641-4-yangyicong@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.96.237.92]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_012756_701310_4C7E2385 
X-CRM114-Status: UNSURE (   5.13  )
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

On Tue, 18 Feb 2025 17:19:54 +0800
Yicong Yang <yangyicong@huawei.com> wrote:

> From: Junhao He <hejunhao3@huawei.com>
> 
> HiSilicon DDRC v3 PMU has the different interrupt register offset
> compared to the v2. Add device information of v3 PMU with ACPI
> HID HISI0235.
> 
> Signed-off-by: Junhao He <hejunhao3@huawei.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


