Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D13C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 12:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INprWymgNbatZBHRmPV6OO2JEtA0MsdvgbQT1NuFAp8=; b=3/+RYR/fJQ9JPXvX1+cVyDZAD5
	NBBIEk3Cyx5uHmelRSf1bFrIqFWFo3tI15Sn8zSikStLAqHkExZUCM4kgnufdN99ct6feN+eCDdeP
	t7nZI7Nw/C5kt2cctnLdPRasZJcJJFsqRq7LxhhsECo7vGXEAFKvAqQ2PxMmLK2bALrNmiX3lrjEX
	bZHqIJrxH5n7IeBGSlETc+J/ruykNRlYzn0lPrLySZskjSQ2QsEGz8d7OS4SfFCoUl5ZPDC/8BzSx
	zoug1U0DqUkOJN+5ZeboRuPLKDdHA4drZROFQAy5lHuPubYRNgOBMjtUTA6JzKNGJZhNysBfuB6BW
	1tA/vSVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IXt-0000000HBFz-2Jxd;
	Fri, 25 Apr 2025 12:52:45 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8GvU-0000000Gsb8-240e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 11:09:02 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZkVRF3JcRz6L4vT;
	Fri, 25 Apr 2025 19:07:05 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id F41C11404F5;
	Fri, 25 Apr 2025 19:08:54 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 25 Apr
 2025 13:08:54 +0200
Date: Fri, 25 Apr 2025 12:08:52 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Junhao He <hejunhao3@huawei.com>
CC: <peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <james.clark@linaro.org>, <leo.yan@arm.com>,
	<john.g.garry@oracle.com>, <will@kernel.org>, <mike.leach@linaro.org>,
	<yangyicong@hisilicon.com>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/3] perf vendor events arm64: Drop hip08
 PublicDescription if same as BriefDescription
Message-ID: <20250425120852.000073a4@huawei.com>
In-Reply-To: <20250418070812.3771441-3-hejunhao3@huawei.com>
References: <20250418070812.3771441-1-hejunhao3@huawei.com>
	<20250418070812.3771441-3-hejunhao3@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_040900_686313_C4017D51 
X-CRM114-Status: UNSURE (   5.78  )
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

On Fri, 18 Apr 2025 15:08:11 +0800
Junhao He <hejunhao3@huawei.com> wrote:

> If BriefDescription and PublicDescription are the same, only
> BriefDescription is needed. It will be used for both long and
> short format outputs.
> 
> Signed-off-by: Junhao He <hejunhao3@huawei.com>
LGTM
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

