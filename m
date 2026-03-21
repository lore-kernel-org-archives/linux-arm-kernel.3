Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B271108B8FF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 06:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0lQ45GZptwOohmqxDB7WVu+nzKnPzGV1kcHxWvWkK8=; b=F6TCKFyORYhuy9rI9lo4w71pBN
	CURhtYUMgwk2P4MpwA15F5p2T/dKnH/N74OhCx64mPbnLquiOjuOX6OPfUjheJe426PRkHC/6uisa
	ZJ6ULockqneLeLeRxlUFcqCVmS5rBxS1HhMOLJlvHh/ozfGEWZUGo79+bsFcZXmvs2GKHVsTrmEHk
	q+J8kD6OGiYzHjoyaF4vCvUiN6JnMhJ82yk5XX54DPEvIrwVQtz8CM31fbgFPrzPtwt9FYctVUMsb
	gBHYH71H1JLfEU9IBeqa5s1uGrYuFwHVsqDAEGQbZIIVLavJP/HDFkOjf4eObIL2WOzK4p9578lbt
	4Yl/pWtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3qDp-0000000EAdU-29Rj;
	Sat, 21 Mar 2026 06:54:09 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3qDm-0000000EAcZ-2Ct9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 06:54:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=z0lQ45GZptwOohmqxDB7WVu+nzKnPzGV1kcHxWvWkK8=;
	b=zLCS47MHGrNPIwFg83l/BiQC1NTog8n4Cx0el06S+9adGkk1ma4nadv3ImmLavxGWM5+t10yr
	4YIO1Z60mW+R0UblwRzn5WvNQu0DxOvkm8KQRLr+ySqmNeE5ywCOz29WujXlh/OLXVU6YWJEbZG
	pJW79nsxG22+e8RMXK/EU28=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4fd94R2pNszpStX;
	Sat, 21 Mar 2026 14:48:23 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 2121640561;
	Sat, 21 Mar 2026 14:53:52 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 21 Mar 2026 14:53:51 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 21 Mar 2026 14:53:51 +0800
Message-ID: <69BE407F.8050301@hisilicon.com>
Date: Sat, 21 Mar 2026 14:53:51 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Huisong Li <lihuisong@huawei.com>, <xuwei5@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<zhanjie9@hisilicon.com>, <xuwei5@hisilicon.com>
Subject: Re: [PATCH v1 0/2] soc: hisilicon: kunpeng_hccs: Some clean code
 to fix compiling warning
References: <20260317035746.1773605-1-lihuisong@huawei.com>
In-Reply-To: <20260317035746.1773605-1-lihuisong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.113.213]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq100003.china.huawei.com (7.202.195.72)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_235406_764221_A4F663E2 
X-CRM114-Status: UNSURE (   5.58  )
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

Hi Huisong,

On 2026/3/17 11:57, Huisong Li wrote:
> Fix some compiling warning on kunpeng_hccs driver.
> 
> Huisong Li (2):
>   soc: hisilicon: kunpeng_hccs: Fix discard ‘const’ qualifier compiling
>     warning
>   soc: hisilicon: kunpeng_hccs: Remove unused input parameter
> 
>  drivers/soc/hisilicon/kunpeng_hccs.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Series applied to the Hisilicon driver tree.
Thanks!

Best Regards,
Wei

