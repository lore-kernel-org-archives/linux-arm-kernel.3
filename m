Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A19C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 11:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSclpPLeI1hGFbiwOsBHUvL6mFy+L/yY6gEnq/IpB60=; b=KHum9YQoBFOeRul9oiBlkrnUfr
	5DbwpoLV3L/kROA9lIK0lQvWfngXP/JjBg9+2ixAvqaaXS1LP/QoDGys554zZ+j1rsuVkfGgplLSY
	X2g/pIR7cmh2ISJESVPUx1bE2F6lit795OwPuu2nGUPPq9Qc2+cBPnmB/Vb0dKjBFTQeiWda6PQ6e
	XbQPYQt6alndYrPcdn0i3DofFvNhE/XVHGjok/om+QTyUcrQ9X6fmTrljDWM7kfJnlWRnDx+x9EkB
	WSVWKsPW/t4bU62Jpqyj6q2jmc8PZI1+NDJshuBcO3JmW9jJ+b6rM2DbSNegudlRJHQ2o3AG4nVPW
	OfOciATQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMce-00000009xZH-2l0A;
	Thu, 17 Jul 2025 11:17:56 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucM1u-00000009sFh-0yBO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 10:39:59 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bjTt64g9hz6L5Js;
	Thu, 17 Jul 2025 18:38:38 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 71655140371;
	Thu, 17 Jul 2025 18:39:52 +0800 (CST)
Received: from localhost (10.48.159.214) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 17 Jul
 2025 12:39:51 +0200
Date: Thu, 17 Jul 2025 11:39:49 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yicong Yang <yangyicong@huawei.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<hejunhao3@huawei.com>, <prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <wangyushan12@huawei.com>
Subject: Re: [PATCH v4 2/2] drivers/perf: hisi: Add support for HiSilicon MN
 PMU driver
Message-ID: <20250717113949.00002eff@huawei.com>
In-Reply-To: <20250717074138.39903-3-yangyicong@huawei.com>
References: <20250717074138.39903-1-yangyicong@huawei.com>
	<20250717074138.39903-3-yangyicong@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.159.214]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_033958_413108_7C9CA4CE 
X-CRM114-Status: UNSURE (   7.07  )
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

On Thu, 17 Jul 2025 15:41:38 +0800
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

Looks good to me.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Thanks,

Jonathan


