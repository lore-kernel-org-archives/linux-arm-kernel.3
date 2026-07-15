Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E74DC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhgWz6vHk27ED/iPmnJILlRupwiQTb8LD817jdHgI/8=; b=EXlq+d4artWkgyb4jak5f0NATJ
	vdhXwRvVxTpnkyXj3LGpnC13DQKXUSRYWtaAaQn8fZxiI68oasmkkJgT5aN+kvvkIt+U2wDxTgNoL
	Ob9fF3uyil5G6i7njV0PZEj1W6EHShMddHm/oE63fpTtNNHs5Yl0tEhNqs57pEAc/w14w2fhyk0cn
	igYJUZuqZBWydGafFFMsKFDmXgdaXaO+ggGRbCJRL6yyZbO8Qp1ZbfwOma7drYsYZ69uGgZ5XrL0r
	060zrorzOWKPWJibEQcwhQdaE42YtQ2PwrdYEUpvpUfZFL4FNvVv+jkqAk4GJii8PzGwk1Y3+iUfV
	OhHzfclw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyaZ-0000000ElKU-3ZT7;
	Wed, 15 Jul 2026 12:19:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyaV-0000000ElJF-3nMe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:19:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 068432F;
	Wed, 15 Jul 2026 05:19:37 -0700 (PDT)
Received: from [10.1.39.37] (unknown [10.1.39.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5640F3F7B4;
	Wed, 15 Jul 2026 05:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784117981; bh=1Tt0MZGEStJa1QvPCBaLpbX+2rLiZ4I/VM9Ny/bJNBE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U1mfcg9QIS5BoO/4wu//17ztJSflgRoB9KQjRjBikCmilifzyw6nVovS43XmGPDtn
	 4cMHAPRhcRgkMscJR0+GbCwtD5Vw65ifrz/ECvQ6Q7ZrvDfG/DJH6/Wich4aXymhWI
	 21sLyoTBBqddcTDUvDNaVr+eHAlRJRLMnW87X+w8=
Message-ID: <ba85df41-4858-44aa-9bd3-d503518fe107@arm.com>
Date: Wed, 15 Jul 2026 13:19:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/6] coco: guest: arm64: Replace dummy CCA device with
 sysfs ABI
Content-Language: en-GB
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Andre Przywara <andre.przywara@arm.com>
References: <20260707081351.1680209-1-aneesh.kumar@kernel.org>
 <20260707081351.1680209-7-aneesh.kumar@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260707081351.1680209-7-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_051943_983041_4A7FF2BB 
X-CRM114-Status: GOOD (  12.15  )
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

On 07/07/2026 09:13, Aneesh Kumar K.V (Arm) wrote:
> The SMCCC firmware driver now creates the arm-smccc platform device and
> instantiates the CCA RSI auxiliary devices once the RSI ABI is discovered.
> The arm64-specific arm-cca-dev platform device stub is therefore no longer
> needed.
> 
> However, userspace has used the arm-cca-dev platform device to detect Arm
> CCA Realm guests [1]. Removing it without a replacement would break that
> detection and would also leave userspace depending on kernel device-model
> details.
> 
> Add /sys/firmware/cca/realm_guest as a stable, architecture-provided ABI
> for detecting whether the kernel is running as an Arm CCA Realm guest. The
> file returns 1 in Realm world and 0 otherwise, similar to the existing s390
> /sys/firmware/uv/prot_virt_guest interface for protected virtualization
> guests.
> 
> Remove the dummy arm-cca-dev registration now that userspace has a
> dedicated CCA Realm guest indicator, and document the new ABI in
> Documentation/ABI/testing/sysfs-firmware-cca.
> 
> [1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>



