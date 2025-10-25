Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0A6CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 08:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoSspGJSkwG6DfTCeaMAAskxhBTQyJF+EsLhYFKst/4=; b=4kogYAkXJB1P2jCc52pPOM6/47
	OlI+hK0u3R2iTzF35M+eqbhN1iAf0rfD2VIu1sre06iJ6LWfIs7rdqd2J5XETspAyRoanTgOKHUOt
	OeglmCokgFu/B2FcRKxkPRadsVbaWId31iWXP6zWk36WagYPJqymFPR5Q7NKh0/v4XBFFMzypNr40
	vBTvohhcIgXcY1k2Wo6kCKuDYGfv0wUVJ47opVr+TjaKt0J5zsc+rSNIm8G9K8/OJNnv0tkD0UsUr
	fWTD8Z3YHDdJvi0YubQUTcV7BZ0nFb54lSLCNxrDcm3J+q5dd3eH2vaH0MlZwXRllaztaqlxD50HZ
	5vGr34Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCZqz-0000000B85L-0xcg;
	Sat, 25 Oct 2025 08:42:25 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCZqw-0000000B84y-1SGV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 08:42:24 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4cttXr5cXdznTVF;
	Sat, 25 Oct 2025 16:41:32 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 45481180044;
	Sat, 25 Oct 2025 16:42:12 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 25 Oct 2025 16:42:12 +0800
Received: from [10.67.121.115] (10.67.121.115) by
 kwepemq200004.china.huawei.com (7.202.195.237) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 25 Oct 2025 16:42:11 +0800
Message-ID: <c29c67ce-8457-2545-ac1c-9ef00b92c7e4@hisilicon.com>
Date: Sat, 25 Oct 2025 16:42:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 0/7] Add support for FEAT_{LS64, LS64_V} and related
 tests
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
	<oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
	<suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<yangyccccc@gmail.com>, <prime.zeng@hisilicon.com>, <xuwei5@huawei.com>,
	"Zhou Wang" <wangzhou1@hisilicon.com>
References: <20251024090819.4097819-1-wangzhou1@hisilicon.com>
 <2a880d79-9205-45d1-8f8d-9f028e0bbfb2@app.fastmail.com>
From: Zhou Wang <wangzhou1@hisilicon.com>
In-Reply-To: <2a880d79-9205-45d1-8f8d-9f028e0bbfb2@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.115]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_014222_549977_BBD7FE37 
X-CRM114-Status: GOOD (  14.50  )
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

On 2025/10/25 0:22, Arnd Bergmann wrote:
> On Fri, Oct 24, 2025, at 11:08, Zhou Wang wrote:
>> Armv8.7 introduces single-copy atomic 64-byte loads and stores
>> instructions and its variants named under FEAT_{LS64, LS64_V}.
>> Add support for Armv8.7 FEAT_{LS64, LS64_V}:
>> - Add identifying and enabling in the cpufeature list
>> - Expose the support of these features to userspace through HWCAP3 and cpuinfo
>> - Add related hwcap test
>> - Handle the trap of unsupported memory (normal/uncacheable) access in a VM
>>
>> A real scenario for this feature is that the userspace driver can make use of
>> this to implement direct WQE (workqueue entry) - a mechanism to fill WQE
>> directly into the hardware.
>>
>> Picked Marc's 2 patches form [1] for handling the LS64 trap in a VM on emulated
>> MMIO and the introduce of KVM_EXIT_ARM_LDST64B.
>>
>> As Yicong has left HiSilicon, I will help to continue to upstream this patchset.
>>
>> [1] 
>> https://lore.kernel.org/linux-arm-kernel/20240815125959.2097734-1-maz@kernel.org/
> 
> The patches all look reasonable to me, but I notice that you forgot
> to add your signoff below Yicong's, so the Arm maintainers won't be
> able to merge the series.>
> If nobody else has any comments on this version, please resend in
> a couple of days with your signoff added to each patch.

I will add my signoff in next version. In fact, comparing with v5, there is little
change, so I did not add my signoff.

Best,
Zhou

> 
>      Arnd
> .

