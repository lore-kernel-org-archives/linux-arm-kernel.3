Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9585CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 13:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rT5v7wWOd9z2U6eKe73oJd2M6DCVwRnp3icdbt6GnWE=; b=Z/UPcS28kSUmn+eP9QGfoqz/ke
	I7e9sO+UjO4V1D2n7mp0yMR465EfpRCn/1bUEm0H893QF/Hu/pNzPjILxn1258GL4ClQ9FbboIAz7
	sARq3q+tzd+B1Xl4iL8TxKLsDPjSid+ENtiuC55++Rq55tZ0N/GUjw9kSlg7va3ryP3rd1rjcztn+
	P9HutPkagHzSd+RYKgdeamZiFuUGNf2JFnT7NhkxFfFPlU6VOIJrUCLFTGI3lWdOeR2ZToaUcNR3W
	+F0n1qMO4njzln8Iqi+/Lm2ENxzuGcYGBIlQfTczN5e8YvKXKiE3VY2Ns30V+E8dHD7NL8LhMYZCW
	sHIkmpXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwtZ-00000005i1u-2Xaw;
	Tue, 09 Jun 2026 13:53:33 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwtV-00000005i0w-0zZq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 13:53:31 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rT5v7wWOd9z2U6eKe73oJd2M6DCVwRnp3icdbt6GnWE=;
	b=RjiwnZ/SW617o+291+hAx5hakYlbv+II8rC5xYen7pKEmW71YsDBAKG2TDzLbkt9voKvS1BX/
	jYqbRXlXq6sbpfHQC56zGMisFE31HgRVSbu4xDTWHmWS005X4jtc8QxXlObwrDrvRanZ5+AgAj/
	4EOl3KDFo9vT4QQPku4F//E=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4gZVXT5JsGz1K97x;
	Tue,  9 Jun 2026 21:45:13 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 2E96C40572;
	Tue,  9 Jun 2026 21:53:06 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 9 Jun 2026 21:53:05 +0800
Received: from [10.67.120.139] (10.67.120.139) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Tue, 9 Jun 2026 21:53:05 +0800
Message-ID: <9792d8ac-06a5-47a9-83e7-3828a26fef56@huawei.com>
Date: Tue, 9 Jun 2026 21:53:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drivers/perf: hisi: Updates for HiSilicon uncore PMUs
To: Will Deacon <will@kernel.org>
CC: <mark.rutland@arm.com>, <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<fanghao11@huawei.com>, <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, <wangzhou1@hisilicon.com>
References: <20260423152959.1458563-1-wangyushan12@huawei.com>
 <001403a3-513a-4c17-b2ec-2beafbf221fd@huawei.com>
 <aiCHPe4X4bwAtZ8q@willie-the-truck>
Content-Language: en-US
From: Yushan Wang <wangyushan12@huawei.com>
In-Reply-To: <aiCHPe4X4bwAtZ8q@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_065329_769948_5BA8123E 
X-CRM114-Status: UNSURE (   8.36  )
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



On 6/4/2026 3:57 AM, Will Deacon wrote:
> On Tue, May 19, 2026 at 04:42:32PM +0800, Yushan Wang wrote:
>> Hi all, a gentle ping on this.
>>
>> All comments are welcomed
> Sashiko has a few (some of which are bogus):
>
> https://sashiko.dev/#/patchset/20260423152959.1458563-1-wangyushan12@huawei.com
>
> Will
Thanks for the reminding, I will post newer version this week.

