Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5191DE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 10:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3GqzkjDup8F7D/yrCiTXOWNOiGOMmaXbjis+Hi05Cq4=; b=JTe+2O9vlWTI4zkmj4JOC51NR4
	bWTl3FKrfNM+87E3xevmcMtkxe4JBfuHb+3ZWXqHcq1erfN9FEHRqyzPieFNQwxyTRjqsPNAjllgw
	mrjaNh0DIjgDk9U1Nc/RZS8dEuTElwoqkcrU3cw7Mnkwg2zsC/1oBzeXltn8uJjZuMeQih0JHs5eM
	qBpwWCacsvqhBrqtX1Q+DtNz3CPwwYH2yP4xilqE6p6WnotUy5tYkoZDkRa6XKTwi/1QIkM0DN9t5
	+rAFyIlMfpRotG2yJhRetdScT9IF2JDlQjM1O/X0KRsPGdyrwTcVHNRiGkm4AhqFd6BtSq7ZRU3pR
	uqr9ZRRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9AA-0000000FWvl-2HcP;
	Thu, 05 Dec 2024 10:32:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ98W-0000000FWfQ-1KNk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 10:31:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88EF2FEC;
	Thu,  5 Dec 2024 02:31:35 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0F9533F5A1;
	Thu,  5 Dec 2024 02:31:05 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] arm64: dts: fvp: Update bus-range property
Date: Thu,  5 Dec 2024 10:31:03 +0000
Message-Id: <173339457335.691023.1334271427632194234.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128152543.1821878-1-aneesh.kumar@kernel.org>
References: <20241128152543.1821878-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023108_399495_268E0B4A 
X-CRM114-Status: UNSURE (   6.26  )
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

On Thu, 28 Nov 2024 20:55:43 +0530, Aneesh Kumar K.V (Arm) wrote:
> These days, the Fixed Virtual Platforms(FVP) Base RevC model supports
> more PCI devices. Update the max bus number so that Linux can enumerate
> them correctly. Without this, the kernel throws the below error while
> booting with the default hierarchy
>
> pci_bus 0000:01: busn_res: [bus 01] end is updated to 01
> pci_bus 0000:02: busn_res: can not insert [bus 02-01] under [bus 00-01] (conflicts with (null) [bus 00-01])
> pci_bus 0000:02: busn_res: [bus 02-01] end is updated to 02
> pci_bus 0000:02: busn_res: can not insert [bus 02] under [bus 00-01] (conflicts with (null) [bus 00-01])
> pci_bus 0000:03: busn_res: can not insert [bus 03-01] under [bus 00-01] (conflicts with (null) [bus 00-01])
> pci_bus 0000:03: busn_res: [bus 03-01] end is updated to 03
> pci_bus 0000:03: busn_res: can not insert [bus 03] under [bus 00-01] (conflicts with (null) [bus 00-01])
> pci_bus 0000:04: busn_res: can not insert [bus 04-01] under [bus 00-01] (conflicts with (null) [bus 00-01])
> pci_bus 0000:04: busn_res: [bus 04-01] end is updated to 04
> pci_bus 0000:04: busn_res: can not insert [bus 04] under [bus 00-01] (conflicts with (null) [bus 00-01])
> pci 0000:00:01.0: BAR 14: assigned [mem 0x50000000-0x500fffff]
>
> [...]

Applied to sudeep.holla/linux (for-next/juno/fixes), thanks!

[1/1] arm64: dts: fvp: Update bus-range property
      https://git.kernel.org/sudeep.holla/c/4f776d81bf92
--
Regards,
Sudeep


