Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F658EA8542
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 03:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYBQRZKTwAHpVXpWwCMVZ60fQaeOHonHGB4Ho9yspok=; b=G6+tK+0igbECvoCfxMtTIaxbtL
	Cz076+1KV027GmI9cYYAxRRA0tomyDwbGUjxfg4JlNygmxSgcfMKydRGC76oxClin8xFbZuwIF7hW
	XkkWVsDmnWH9Y7ARKDPOvKGuEUtztLfEWIpjK6+b+jRVgFKQsEcUNszAVaLRSsjR6vAxJmF6C9KCh
	usmKInkR9LpBjSdwFFgWT9kbz+drehGC6J5wsyIlR/03JFN5HGm7AKyura9Wsst6kXIRdyk4Oa4fZ
	G4uOgwyExCFe2JBukt7el8qefkYFfRyCttaNZOS9+gW8/g6WZL3ArZZ3K/9Qj+J1Hm5yRZ9r40Wva
	8BfPKfxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzQzp-00000006a3A-2INc;
	Mon, 09 Mar 2026 03:09:29 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzQzn-00000006a2O-0SnZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 03:09:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hYBQRZKTwAHpVXpWwCMVZ60fQaeOHonHGB4Ho9yspok=;
	b=FpqhkGebl6Ta9ZzWHJ1Ut0a29QzU7GMLIqi7Aev4zKx+kn6q2fuTcJCnmj+t5GAeO+DwcY9sX
	Ye7uTe8vtbhv1FjZQWSFCNK0PzXtcwSvVapJmWHchWG7awX/1TWzUkK5vks534l6Inv4iSeu8zm
	eYtjdEMDNZ8p5Ikd3eR/9A8=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4fThgS4c1Sz1K984;
	Mon,  9 Mar 2026 11:04:20 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 3C81140363;
	Mon,  9 Mar 2026 11:09:12 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Mar 2026 11:09:11 +0800
Message-ID: <c52f984c-9df8-4eb7-967c-33a605740e84@huawei.com>
Date: Mon, 9 Mar 2026 11:09:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch 0/9] Add support for HiSilicon platforms and refactor
To: Jonathan Cameron <jonathan.cameron@huawei.com>
CC: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <shuah@kernel.org>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <ben.horgan@arm.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>,
	<xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260304040334.765860-1-wuyifan50@huawei.com>
 <20260306104510.0000437b@huawei.com>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <20260306104510.0000437b@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.222]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_200927_650796_D643A4D3 
X-CRM114-Status: UNSURE (   8.68  )
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

Hi Jonathan,

On 3/6/2026 6:45 PM, Jonathan Cameron wrote:
> On Wed, 4 Mar 2026 12:03:25 +0800
> Yifan Wu<wuyifan50@huawei.com> wrote:
>
> For v2 onwards Make sure the cover letter title includes
> selftests/resctl as with the patches.
> People use that title to decide if they want to open the thread
> so it may be all they ever see.
Thanks for the suggestion. I will fix and resend it. Looking forward to 
your review and comments.

Regards,
Yifan Wu

