Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F9ACA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 20:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOg1TD8bTIja1jsfCfz0y6W3vB735g3sOL05FkDgwYo=; b=fw2EFp80vzoI87cDhsT5fM7aJ4
	ZDZEabSOqjFXbIk+cMjE/YP9b64WYf1SB0aDHAL4R5y4lpjRJ/3tWPkuu7givAT6xqggyZ/4c/5LV
	nkLvB5/9A3Ul8CWX5VGDRoCHeBvI3M2o8Bra0Z/ibGWSvy0FtybUM1p5sPe78frL7fkm/6gfzj8Ni
	jtAmBme2pyvZedEkZCaoBmnB3yv4zrLhdWW36Iqbxx3ZnADT53raq2zi6e47R7XyuCYBpPkK44ayv
	HMqtLiO8Sn+bqin4CFVgMYz5oX9mWlq3QlEpvqsgqZnS7AavVxkZvdR2EJ08qdJc+mWksPE0Z3g5B
	zuIome7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvsi-0000000Bzw4-0HDB;
	Tue, 12 Aug 2025 20:46:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsrk-0000000Bb96-45pB
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 Aug 2025 17:32:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QOg1TD8bTIja1jsfCfz0y6W3vB735g3sOL05FkDgwYo=; b=OemYQLHAEZuB4y/H9r9o/At0Ae
	mXPG9Uz/6IzNypllTRvE824zIZdBmXksukJr2qSgPFC6aEto2iTygZRBS2LMlwtj3dMwry9GU2Ffp
	zXUVEDRD7bl0/oqaCPzjtd3xNR0Gu9ZrEbFVXuDAbUuexA5T/aKCO6IzdaRLxO3POe1hTeDzYMrPM
	mv7Jb/eqZ7CRyZX20K+3/xK9Xl1bI7trLqpxX1fTT/lw8W6AHxQnwnvZdd5/drPF4amiBenYkW1i+
	O2ZRTHRm3PamAAXtCgIjxmHiLYWWo07XqnM7MevrU4wb/vtddqiBPcIuVMLZe8LPfRrgFX4rNIIW5
	zYC7Bmkw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsrZ-0000000FsKe-1pdn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 17:32:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAD9C24E9;
	Tue, 12 Aug 2025 10:32:30 -0700 (PDT)
Received: from [192.168.20.57] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA0903F63F;
	Tue, 12 Aug 2025 10:32:36 -0700 (PDT)
Message-ID: <2d9259e4-1b58-435d-bf02-9c4badd52fd9@arm.com>
Date: Tue, 12 Aug 2025 12:32:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: enable CONFIG_SCHED_CLUSTER
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org, patches@amperecomputing.com,
 Shubhang@os.amperecomputing.com, krzysztof.kozlowski@linaro.org,
 bjorn.andersson@oss.qualcomm.com, geert+renesas@glider.be, arnd@arndb.de,
 nm@ti.com, ebiggers@kernel.org, nfraprado@collabora.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250808025533.6422-1-shijie@os.amperecomputing.com>
 <e47757c3-6091-43b5-ba28-52e11de7d86a@arm.com>
 <cb383a76-8848-44cd-6f32-fd30478d9ebd@gentwo.org>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <cb383a76-8848-44cd-6f32-fd30478d9ebd@gentwo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_183241_897487_3AB72607 
X-CRM114-Status: GOOD (  17.19  )
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

On 8/12/25 11:33 AM, Christoph Lameter (Ampere) wrote:
> On Mon, 11 Aug 2025, Jeremy Linton wrote:
> 
>>  From what I've seen, SCHED_CLUSTER seems to be a bit of give and take
>> depending on benchmark and machine. I'm not sure if it should be default
>> enabled or not, but it would really be nice to have at least a larger sweep of
>> benchmarks/machines in order to be sure of the decision.
> 
> If the hardware provides a clusterid then I think this clusterid should be
> used for the sched domains. CONFIG_SCHED_CLUSTER does that. So it should
> be the default.

Hi,

The problem is that this information is being sourced from the ACPI 
PPTT. The ACPI specification (AFAIK) doesn't define a cluster, so the 
linux cluster information is being 'invented' based on however the 
firmware vendor choose to group CPU nodes in the PPTT. Which means its 
possible for them to unknowingly create clusters, or also fail to create 
them when they make sense.

> 
> If there is no cluster information then these domains should not be
> created. I think that is already the case?
> 
> 


