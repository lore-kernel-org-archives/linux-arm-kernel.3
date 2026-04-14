Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF45ED7B96
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 09:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUmpC7aj2WrRqj14+4L+nhL/yX199wRlYYETuLDMQU0=; b=bOcAT6LjI+nWbPKxZ5QnJz4Nee
	FJ/QcmEwWCbeyFhwjp6Srs/Vgo2ksq3SeqOEPsWcwy4KMGNeATt5hEnVqhP7OUeFzRjNCjn0tszRd
	vCzzxqj5QkiDW4K41mR2Sqg6rI37Ob7RE1NCFIKUaNP44gJjQeVHTn8ia8GoFcPvdKt3id85kRzSM
	bvvw0pWl7icpRw4aoWYWMSYUqqXkdyp0isX3JfgA0wE1kmRNnvb1w1MTDbZolUlv43nwEcWKYC1GO
	YoLTw9hD49W+//ixc4V66cvXKQrvriaAFUqoqHYY8EibrAYfJuCndMoPyEEA74dR/P3/5J72DczJd
	huamw6oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCaJc-0000000H4yl-1LpT;
	Tue, 14 Apr 2026 09:44:16 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCaJY-0000000H4xc-3sHH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 09:44:15 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=NUmpC7aj2WrRqj14+4L+nhL/yX199wRlYYETuLDMQU0=;
	b=UuuPR36u+W9D7GadsozFA+d5ZzmFFPZmYa3lYuF80ji07VGbjuz7KpN/AfvAuE7BkpbSZ5l+9
	Fnu9VHTVqxIyZSPTYr2a6zF4VoLNQk46vCS/8A1ZR6GAO0n9yY059FzShPsAlsl+Br132g53WSA
	6mKVZ3m5nGAsRBTWd6J9sYk=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fvzhb3PF0zRhRV;
	Tue, 14 Apr 2026 17:37:35 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 3885540574;
	Tue, 14 Apr 2026 17:43:53 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 14 Apr 2026 17:43:53 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 14 Apr
 2026 17:43:52 +0800
Message-ID: <af9c679d-899c-4832-b902-e621b5987f12@huawei.com>
Date: Tue, 14 Apr 2026 17:43:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] ACPI: processor: idle: Do not propagate
 acpi_processor_ffh_lpi_probe() -ENODEV
To: Breno Leitao <leitao@debian.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, <lpieralisi@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>
CC: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	<linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<pjaroszynski@nvidia.com>, <guohanjun@huawei.com>, <sudeep.holla@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <rmikey@meta.com>,
	<kernel-team@meta.com>, <lihuisong@huawei.com>
References: <20260413-ffh-v1-1-301704f69e2f@debian.org>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20260413-ffh-v1-1-301704f69e2f@debian.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_024413_547487_FAD5E023 
X-CRM114-Status: GOOD (  11.03  )
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


On 4/14/2026 12:54 AM, Breno Leitao wrote:
> Commit cac173bea57d ("ACPI: processor: idle: Rework the handling of
> acpi_processor_ffh_lpi_probe()") moved the acpi_processor_ffh_lpi_probe()
> call from acpi_processor_setup_cpuidle_dev(), where its return value was
> ignored, to acpi_processor_get_power_info(), where it is treated as a
> hard failure. This causes cpuidle setup to fail entirely for all CPUs on
> platforms where the FFH LPI probe returns an error.
>
> On NVIDIA Grace (aarch64) systems with PSCIv1.1, the probe fails for all
> 72 CPUs with -ENODEV because psci_acpi_cpu_init_idle() finds
> power.count - 1 <= 0 (power.count=1). This results in no cpuidle states
> registered for any CPU, forcing them to busy-poll when idle instead of
> entering low-power states.
>
>
Sorry for bring you cpuidle issues on your platform.
IIUC, your platfom just has one LPI states on failure, it should be WFI, 
right?
This failure will only cause the cpuidle directory for each CPU not to 
be created, but will not affect the CPU entering the WFI state which 
done by cpuidle core.

But it is a real issue. Thanks for your report.
I think the best way to fix your issue is that remove this verification 
in psci_acpi_cpu_init_idle().
Because it is legal for platform to report one LPI state.
This function just needs to verify the LPI states which are FFH.

/Huisong
>
>

