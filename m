Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BBEF53D69
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 15:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XsiG+kTNf/QMEaWMVDL6EoUgMvPdLZhdxKE1/mgiJDQ=; b=Om9FYLlBlgd3BOey9yjwdLkZ8e
	U8C9LIXttt2LTFEutQJGJd1bSjc4b9tBs0DmiVuM8rfmrs1IdNN3HhDId+GBXLdescJNTXR5jIotC
	PUfoE0yyZID5pksP9HTO2XbgJEolKGuNchRvUZLDYakk09D2lD/8Y13nAMm9hoQKxpgJYL7vqnGDD
	H2QfWnK9Qbbr6UouRkrj3Vy9TdljtyPQlq8WAlK5uLmZGYN+rTG9s4FWvEouwoZTTyw2/cbg7NgSG
	nIvBOFUkxGMctaJjUrVD63PyxMeAtg2iAFUqXPezhm3olt1PFJw6S3R0zKJWhWoro1gb7hCL5SXFN
	oxOrx/uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29mL-00000004KAy-1adl;
	Mon, 16 Mar 2026 15:22:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29mK-00000004KAj-22IU
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 15:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XsiG+kTNf/QMEaWMVDL6EoUgMvPdLZhdxKE1/mgiJDQ=; b=dSOMer8H+GeBTHAFI5Cu09cydV
	dgVohRiloMEKb97KgbeigrCBhBomnRx/Nj2NIp/dY0RS/bmATj99S4uMA91rPXiMcXXOfAJGxjGAr
	Yek11UcmRXv0nQmthgtuD7NZ9wl08k1DjIMbxIyr9t0tMop50surp0yhuv7XOAtHtqtwvESMfv7ow
	I2ZPr2/Hf86mIh5UwfR7h/mK58RAnDyW2Q3kl23n9jsOOKxg8USoJb3k7ul3XtMKTlB3zp4V1/kW4
	g5CxvFv6NM+Z0eF2/frJoFRF1KU4ufVWF8huSij2fz8ybf+LeU4LJoNe/p9tJOdvLQCkpmv6ExWkJ
	btOChKYg==;
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29mH-0000000746K-0Vo1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 15:22:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XsiG+kTNf/QMEaWMVDL6EoUgMvPdLZhdxKE1/mgiJDQ=;
	b=l39lPJUnUsgcJ1gnQjhaS8JzsYuwfn5WLJ6xkqEpty/1ZQ76h9OxO5w1TOLWVrwW9941juFfP
	C9aX5zuDHrhkVL5OVp5qKgnvJc9FXyr87ojapcO3csqzC8KOrKMl05IcFPTW9Wqr7IJiA6qVhGD
	vgbT6G7yJJ791AvQS4VQAME=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4fZJbb45ndzpStq;
	Mon, 16 Mar 2026 23:16:59 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 333DB40363;
	Mon, 16 Mar 2026 23:22:20 +0800 (CST)
Received: from [10.67.120.170] (10.67.120.170) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 16 Mar 2026 23:22:19 +0800
Message-ID: <c6d68e28-30fb-40cd-8f3e-5ad47c54b233@huawei.com>
Date: Mon, 16 Mar 2026 23:22:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] iommu/arm-smmu-v3: Add register display to
 debugfs
To: Nicolin Chen <nicolinc@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<wangzhou1@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>
References: <20260313104351.3502293-1-xiaqinxin@huawei.com>
 <20260313104351.3502293-3-xiaqinxin@huawei.com>
 <abRxh24wATp9r6+F@Asurada-Nvidia>
From: Qinxin Xia <xiaqinxin@huawei.com>
In-Reply-To: <abRxh24wATp9r6+F@Asurada-Nvidia>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.170]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_152245_499606_09762084 
X-CRM114-Status: UNSURE (   7.41  )
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



On 2026/3/14 04:20:23, Nicolin Chen <nicolinc@nvidia.com> wrote:
> On Fri, Mar 13, 2026 at 06:43:48PM +0800, Qinxin Xia wrote:
>> +/**
>> + * smmu_debugfs_registers_show() - Display SMMU register values
>> + * @seq: seq_file to write to
>> + * @v: private data (SMMU device)
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +static int smmu_debugfs_registers_show(struct seq_file *seq, void *v)
> 
> @v seems unused as well.
> 
> Nicolin
> 

Thank you for your review. All comments and function encapsulation
problems will be fixed in the next version.
-- 
Thanks,
Qinxin


