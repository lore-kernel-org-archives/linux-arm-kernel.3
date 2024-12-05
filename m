Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA54E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TN8pvwpDnxwncszsG0NMIBH27G5W8mHhCglWqsxgfcQ=; b=BQDzRnFzHrzKBRF+eOCB3xXWgt
	bsaeUu1oHiT+i2M9eIZpKzuCQ8ow/JfBXcWcDUJjZLie9II7jREzBYwx1UNCi8N9iVy5BMMRoaFNH
	sw6Wq//SnKLl3YjS7m5NdO+anIV5QlmXjcnDCnxYw+eiG4tyh2ZPpd+w3rmAgjbmZf8Fy98lnHF7U
	nirK8tddid8VUz1UEgqpCuIQsMjCFPgk22ONoe/QvADdzCz/tMtST+ne0EDDz8oGXgDkD0LfEHPo0
	BHIgGfqiaEplsvykIvz/naYkOOJDYhHrXCeXYY3wr95eoIqASmy6rvMFSCZLFPseg4mIvUZLc2uSH
	+uMNEXjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8el-0000000FROi-0Z1R;
	Thu, 05 Dec 2024 10:00:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8dc-0000000FR1v-2Oyr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 09:59:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC77BFEC;
	Thu,  5 Dec 2024 01:59:37 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 338E03F5A1;
	Thu,  5 Dec 2024 01:59:08 -0800 (PST)
Date: Thu, 5 Dec 2024 09:59:05 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] arm64: dts: fvp: Update bus-range property
Message-ID: <Z1F5aeNT-0KFOVHf@bogus>
References: <20241128152543.1821878-1-aneesh.kumar@kernel.org>
 <Z1CwGaAh714XfILz@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1CwGaAh714XfILz@e110455-lin.cambridge.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_015912_709934_45C0ABD2 
X-CRM114-Status: GOOD (  15.06  )
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

On Wed, Dec 04, 2024 at 07:40:09PM +0000, Liviu Dudau wrote:
> On Thu, Nov 28, 2024 at 08:55:43PM +0530, Aneesh Kumar K.V (Arm) wrote:
> > These days, the Fixed Virtual Platforms(FVP) Base RevC model supports
> > more PCI devices. Update the max bus number so that Linux can enumerate
> > them correctly. Without this, the kernel throws the below error while
> > booting with the default hierarchy
> > 
> > pci_bus 0000:01: busn_res: [bus 01] end is updated to 01
> > pci_bus 0000:02: busn_res: can not insert [bus 02-01] under [bus 00-01] (conflicts with (null) [bus 00-01])
> > pci_bus 0000:02: busn_res: [bus 02-01] end is updated to 02
> > pci_bus 0000:02: busn_res: can not insert [bus 02] under [bus 00-01] (conflicts with (null) [bus 00-01])
> > pci_bus 0000:03: busn_res: can not insert [bus 03-01] under [bus 00-01] (conflicts with (null) [bus 00-01])
> > pci_bus 0000:03: busn_res: [bus 03-01] end is updated to 03
> > pci_bus 0000:03: busn_res: can not insert [bus 03] under [bus 00-01] (conflicts with (null) [bus 00-01])
> > pci_bus 0000:04: busn_res: can not insert [bus 04-01] under [bus 00-01] (conflicts with (null) [bus 00-01])
> > pci_bus 0000:04: busn_res: [bus 04-01] end is updated to 04
> > pci_bus 0000:04: busn_res: can not insert [bus 04] under [bus 00-01] (conflicts with (null) [bus 00-01])
> > pci 0000:00:01.0: BAR 14: assigned [mem 0x50000000-0x500fffff]
> > 
> > The change is using 0xff as max bus nr because the ECAM window is 256MB in size.
> > 
> > pci-host-generic 40000000.pci: ECAM at [mem 0x40000000-0x4fffffff] for [bus 00-01]
> > 
> > lspci output with and without the change
> > without fix:
> > 00:00.0 Host bridge: ARM Device 00ba (rev 01)
> > 00:01.0 PCI bridge: ARM Device 0def
> > 00:02.0 PCI bridge: ARM Device 0def
> > 00:03.0 PCI bridge: ARM Device 0def
> > 00:04.0 PCI bridge: ARM Device 0def
> > 00:1e.0 Unassigned class [ff00]: ARM Device ff80
> > 00:1e.1 Unassigned class [ff00]: ARM Device ff80
> > 00:1f.0 SATA controller: Device 0abc:aced (rev 01)
> > 01:00.0 SATA controller: Device 0abc:aced (rev 01)
> > 
> > with fix:
> > 00:00.0 Host bridge: ARM Device 00ba (rev 01)
> > 00:01.0 PCI bridge: ARM Device 0def
> > 00:02.0 PCI bridge: ARM Device 0def
> > 00:03.0 PCI bridge: ARM Device 0def
> > 00:04.0 PCI bridge: ARM Device 0def
> > 00:1e.0 Unassigned class [ff00]: ARM Device ff80
> > 00:1e.1 Unassigned class [ff00]: ARM Device ff80
> > 00:1f.0 SATA controller: Device 0abc:aced (rev 01)
> > 01:00.0 SATA controller: Device 0abc:aced (rev 01)
> > 02:00.0 Unassigned class [ff00]: ARM Device ff80
> > 02:00.4 Unassigned class [ff00]: ARM Device ff80
> > 03:00.0 PCI bridge: ARM Device 0def
> > 04:00.0 PCI bridge: ARM Device 0def
> > 04:01.0 PCI bridge: ARM Device 0def
> > 04:02.0 PCI bridge: ARM Device 0def
> > 05:00.0 SATA controller: Device 0abc:aced (rev 01)
> > 06:00.0 Unassigned class [ff00]: ARM Device ff80
> > 06:00.7 Unassigned class [ff00]: ARM Device ff80
> > 07:00.0 Unassigned class [ff00]: ARM Device ff80
> > 07:00.3 Unassigned class [ff00]: ARM Device ff80
> > 08:00.0 Unassigned class [ff00]: ARM Device ff80
> > 08:00.1 Unassigned class [ff00]: ARM Device ff80
> > 
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> 
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> 
> Sudeep, can you please take this patch through your tree?
>

I have already queued and must be in -next, just didn't get to a point to
respond as applied yet. I will update with your tags. Thanks!

-- 
Regards,
Sudeep

