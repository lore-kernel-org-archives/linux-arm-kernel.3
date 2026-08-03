Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00049C55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/mcshskARNIpHGJ26P82gHPGmI0Z/0XAuy9eLd5Z3c=; b=EL4xjV+t6/aznX2HAh9QuqVIW9
	N0UjglNsPtsdVMonEZRKbqSyevKyEYo5KAkhgvJJC907WqP/xvmlgaylKAHP4Y61Rqm/gcWNTFhWT
	0wgXd1VeAWQWjbZB3xhF5yC4eNT3gbV2OOEx9r6Dyg7UK3jbA8b178sIwUmHegbheW1C33Q/qis0g
	wmkJFmr5oYJNapC9Cug57KP/ILrYCdwTSpLwq5E6p1OXEQhBoXsX6EFIn2nk1BQvKUrv1zIPTpodU
	UfwJ3mvQEAk9oH3zWgSsfntnXNeqzJAmVFyreYhV6Hvc2LUDnKQuCS5z70uDT5s/Hb01//jG9T+2x
	EnDXuj5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqp5o-0000000GhXR-1Sn3;
	Mon, 03 Aug 2026 09:36:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqp5l-0000000GhX3-4Bpm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:36:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE22E143D;
	Mon,  3 Aug 2026 02:36:12 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EF093F66F;
	Mon,  3 Aug 2026 02:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785749776; bh=VZ4Xa5/EKPJsS92yBrdHIczDDuHqowvN+VQUoxps2q8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eeQD6z5CR/E7rwK43XaeNdtAV3SSK26Z5IxwHxyHzp3PXkJMor3/jdCwXENDxqIfu
	 pIWTD8IY5uX6wVPssh3vlwLyEBFohSIoBk1xeEudYjgMYDl2ad4u11zltvhXn8+iV7
	 sltAAbvIEpFj45ICP/CFF+OUbs5lIZV5phfICDMc=
Message-ID: <b65980e5-8db2-4346-898d-fd6fce87e6cc@arm.com>
Date: Mon, 3 Aug 2026 10:36:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 40/45] arm64: nmi: Add Kconfig for NMI
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-41-vladimir.murzin@arm.com>
 <c46ccf44-7414-42bf-9760-79200ac247ba@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <c46ccf44-7414-42bf-9760-79200ac247ba@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_023618_081966_92A0D891 
X-CRM114-Status: UNSURE (   7.00  )
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

On 7/28/26 07:24, Jinjie Ruan wrote:
>> +config ARM64_NMI
>> +	bool "Enable support for Non-maskable Interrupts (NMI)"
>> +	default y
> I think we should select ARM_GIC_V3 here, as FEAT_GICv3_NMI need GICv3
> 
>> +	help
>> +	  Non-maskable interrupts are an architecture and GIC feature
> GICv3 feature

Not really, GICv5 also supports NMI.

Thanks
Vladimir

