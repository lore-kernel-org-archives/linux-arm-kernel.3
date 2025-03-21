Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5EBC35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O6V9HaZd2ad0uxgFkQQR3TGyN2djIy/gv5y4C4xVL/8=; b=DXHWQydUh2QsOJ5OoVTn8iwYsw
	82XCkD/MqutjIRowBdf6j8rqhfeHH1XznPeKMAYZxsSh3VMWD8FSuphFDestUHHGUjuKbUf8rY917
	ieFdni9niyu+xrWH0evpil53wEplg6ti7gk9Lj3c7XXsLSArtkc57nYrwCLkoC+fEeovtgyBSJ9Y4
	h6n6/dh3Q5hNwgHoL+R/guMrKfJrac7rPWyLe/JnTwfoWFXRoHNPL/Kln+L/QPcjIPlaIGIY6CKpo
	vHWK3D9HlfDm0cNoibW9JNq6CQlxm0/i2/7KpwslDAGkH8a+HuIEo8JudRRWkf7GYOmTni3fsQfhy
	R6M1nY4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvaLK-0000000EdSI-0wkg;
	Fri, 21 Mar 2025 11:15:14 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvaJc-0000000Ed8M-39rN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 11:13:30 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZK06v3R3Hz6L59y;
	Fri, 21 Mar 2025 19:08:23 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 48C35140517;
	Fri, 21 Mar 2025 19:13:20 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 21 Mar
 2025 12:13:19 +0100
Date: Fri, 21 Mar 2025 11:13:18 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yicong Yang <yangyicong@huawei.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<hejunhao3@huawei.com>, <prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <wangyushan12@huawei.com>
Subject: Re: [PATCH v2 3/8] drivers/perf: hisi: Use ACPI driver_data to
 retrieve SLLC PMU information
Message-ID: <20250321111318.0000455e@huawei.com>
In-Reply-To: <20250321073846.23507-4-yangyicong@huawei.com>
References: <20250321073846.23507-1-yangyicong@huawei.com>
	<20250321073846.23507-4-yangyicong@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_041328_935324_02E0667F 
X-CRM114-Status: UNSURE (   7.31  )
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

On Fri, 21 Mar 2025 15:38:41 +0800
Yicong Yang <yangyicong@huawei.com> wrote:

> From: Junhao He <hejunhao3@huawei.com>
> 
> Make use of struct acpi_device_id::driver_data for version specific
> information rather than judge the version register. This will help
> to simplify the probe process and also a bit easier for extension.
> 
> Factor out SLLC register definition to struct hisi_sllc_pmu_regs.
> No functional changes intended.
> 
> Signed-off-by: Junhao He <hejunhao3@huawei.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
LGTM
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

