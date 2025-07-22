Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA488C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 11:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:CC:To:MIME-Version:From:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sc4gWV+PtWva0XvczE1W0cjdYuD7vA92piaEvJt06Ao=; b=dVHq6wsPFI5DP+fyOV2kKT9CqQ
	QyIFuAAOgQemW+7GB9M/0H2y5noxn9L4jn9Vclo3/jq3nHutsRXKaNNu9KTefeLjAtEWgUvl6WF+9
	335PTEfc8MeCp5hjFz1owxBYUpTavN7+GtyU+KknfKXt7O3Daqwtl0javZKXA3ffJ3Kwq6Za6Fxk5
	rKILP3idIZGPfid7zgMLD6v0ntPlq8nZ1gxfPl8uEcqCnLPRtDd/VpzKPKw3Cu2zx9rwKyTN3vyjk
	hzIya+fEBwDyWl5ylEXMSHwB4/XGJcJSDdWVkseZYEjKtDu1wWPVguNJfTzHYD92Zb/Vxsb+j7Uqx
	1P+tAp+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBRC-00000002KKj-3roJ;
	Tue, 22 Jul 2025 11:45:38 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueB9L-00000002HW4-3CUt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 11:27:13 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bmZkr0Tpwz16THR;
	Tue, 22 Jul 2025 19:28:04 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 02CA61402C1;
	Tue, 22 Jul 2025 19:27:04 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 22 Jul 2025 19:27:03 +0800
Received: from [10.67.113.98] (10.67.113.98) by kwepemq100003.china.huawei.com
 (7.202.195.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 22 Jul
 2025 19:27:03 +0800
Message-ID: <687F7586.9040302@hisilicon.com>
Date: Tue, 22 Jul 2025 19:27:02 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <sfr@canb.auug.org.au>
CC: <linux-next@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, <xuwei5@hisilicon.com>
Subject: Add the hisilicon branch to linux-next
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.113.98]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq100003.china.huawei.com (7.202.195.72)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_042711_955217_48950A13 
X-CRM114-Status: UNSURE (   3.57  )
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

Hi Stephen,

Could you please add the following to linux-next?

   Repo: https://github.com/hisilicon/linux-hisi.git
   Branch: for-next

This aligns with the MAINTAINERS for the HiSilicon tree.
Thanks!

Best Regards,
Wei

