Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384BEC3DA4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 18:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=al8wnAmuDO2/DLx09V9y9yBu3gEmPV4ysG+iELaYbqw=; b=aW+mDEY7u2702l
	cyBLcNWqVd2Vs/Yq4srVOFsPrw0sZmfoOqlg1D4eePsOfiVdGjHNPEAnOhXQAOrJ8A4ZquVd2kP9C
	gNaI6C0RZmbqo2nW8oULEEyu9M1rxxDwCsNyRoxJ09Ag+fmyc2zNQHdUmgXSUTzSOS3l0T4HiibFg
	I0za8AcDRLZ0RvqZiJHSWeTUV2Zhwy0K5GH/12rDBBDYDPVGrUovTt4mTIgs+D/U9F1ojDN73AtTa
	HYhsazSQ67SPBneaiwi2cx8bdrZolZESH9odlpD+BJOBgnxl7e8GB0dD67CAWQ2oIilULyD7Kt5Kf
	EwkF8wyRr6IcwrDAv1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFHk-00000003hc1-0RW9;
	Mon, 17 Mar 2025 18:34:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEI5-00000003Z4H-1yb0
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Mar 2025 17:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:References;
	bh=al8wnAmuDO2/DLx09V9y9yBu3gEmPV4ysG+iELaYbqw=; b=Yk/TyvP2PD9fUZCPjLmnEtEUtu
	UY8W/d/5mQg9G7A7uKox35EQAh69zscSPWEiWITRkGCgIKM1jxPS2Gc3/ELozB4d3nQyVrC2k+IsR
	CAj3zbC8/z4qofGsV//bKYx1KM1ZxnBOBML0g/TYIPI7NxHGc4CN7h+rZsIUaGgbxxLop+qhUTwst
	faTMYtpRTgU+bxFkaMvgOE+9dNXuutk80msjfn4ULLicxLx3obYHosdwrydZjrMbDPrzv/8OB49G9
	APS2ns/IucTKAJmhBsquwygK3lo7Z+nKq/DIjyZ5t2fngaOe+4XY/P4QeJS0bDUXFjPEaXQpraGml
	wTE01N3A==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEI2-00000003WE4-0wr6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 17:30:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 584875C2BCA;
	Mon, 17 Mar 2025 17:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD60C4CEE3;
	Mon, 17 Mar 2025 17:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742232609;
	bh=srOc0Uaub0/6YRvw1cYQN4PBXQGkUPQK1F4bq+yDgG0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=M9PMCKWa0bj+/nVaCIFk0FoMJUZXz5fwtB08nGvANg8fa+tSb/Ui2IPjY/nYC53QS
	 9LeFzkfiX0lRYjdvjLwxnErliWj5zXn/A8puoJwJ+86QqeGn8dn9YfOXu8wk/BZYVM
	 +oL0FLW3uHGXVApJZKpCPgLRzIF4Chld9ncJVtPoilruw6RyTTwBx7+FMtXfa+J+79
	 nmBcAwHoEP8VzAyKpT7bi52exvbI+Qgdh1rBrVUo2pD4K4XL47rb6BFuK8rO5P1F1S
	 ryNweBX/Kr3+ht+twGVZsqzfJMQ5ez6Bq/26XLYdPdbYeenBf8pP9KmwBQvOCXQ29y
	 QagecCswBBEzQ==
Date: Mon, 17 Mar 2025 12:30:08 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Frank Li <Frank.Li@nxp.com>, Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC NOT TESTED 0/2] PCI: dra7xx: Try to clean up
 dra7xx_pcie_cpu_addr_fixup()
Message-ID: <20250317173008.GA933389@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313060521.kjue4la47xd7g4te@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_173014_466675_576B5DBA 
X-CRM114-Status: GOOD (  13.87  )
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

On Thu, Mar 13, 2025 at 11:35:21AM +0530, Manivannan Sadhasivam wrote:
> On Wed, Mar 05, 2025 at 11:20:21AM -0500, Frank Li wrote:
> > This patches basic on
> > https://lore.kernel.org/imx/20250128-pci_fixup_addr-v9-0-3c4bb506f665@nxp.com/
> > 
> > I have not hardware to test.
> > 
> > Look for driver owner, who help test this and start move forward to remove
> > cpu_addr_fixup() work.
> 
> If you remove cpu_addr_fixup() callback, it will break backwards
> compatibility with old DTs.

Do you have any pointers to DTs that will be broken?  Or to commits
where they were fixed?

> You should fix the existing DTs and continue carrying the callback
> for a while.

Any insight into where these existing DTs are used and how long
they're likely to live?

Bjorn

