Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBCEE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 14:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNh7DueZ0ROhGXSoVao0r4XYvV32aPWQzqAogsGA9pE=; b=xy7Q0f4vciqTJrWeCaX8aW4Rwb
	EulICqnQqfMVrkZ+PRJV5dyvIqJlicLHzO1K4+ik2BIYP8hiVpK/jymRkWCrzTOkdbHpvgNj9SJDN
	vlry4WtUv9JT93Gfw5kfxR/z/PR5+V2VPaNm5MAR8vWp3n+a8yEuxjC+LT9vbq9rdsRCoU56Lscru
	JvvxFdf5rT3qvDhpGdZXZ2N9VFb5XY4VKJY+sCbeSGNkHbkVfSXCmvsODYMcpgwICnHRb1EjFYPu1
	efVcZhIc3jTS4/pq4fdsc5R4OrwxaSJRW3NcXogm/Jvbd6hwgodBNNh2MoEzqLZMJQ4SuqMhvN+Ny
	exP2VyLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtHX-0000000CC6E-2MrN;
	Thu, 09 Jan 2025 14:13:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtGC-0000000CBm8-2xG1;
	Thu, 09 Jan 2025 14:11:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vNh7DueZ0ROhGXSoVao0r4XYvV32aPWQzqAogsGA9pE=; b=vKnDRRcF0Gff8rhBV3+joaGp0z
	QB/FUdZLbjzRvbvftL0QBE9Jed2l6xIG4FfwIpMGgxT0s0ux9rgALc94CQDJhXzJt+ZjgF0VuAI8k
	QUBxaqp2Q72CTK3UXbTpS56Xut3Jy2W9sUADpgrbMJm0TenBa2Z0nXgwLnuyshETkN1I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVtG1-002uSH-NK; Thu, 09 Jan 2025 15:11:33 +0100
Date: Thu, 9 Jan 2025 15:11:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Basharath Hussain Khaja <basharath@couthit.com>
Subject: Re: [RFC PATCH 00/10] PRU-ICSSM Ethernet Driver
Message-ID: <2e82fb20-c6f9-4cc3-a700-fce049295f58@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109105600.41297-1-basharath@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_061144_738667_25F9B263 
X-CRM114-Status: GOOD (  10.94  )
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, krishna@couthit.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, richardcochran@gmail.com, prajith@ti.com, rogerq@kernel.org, ssantosh@kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, parvathi@couthit.com, horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jan 09, 2025 at 04:25:50PM +0530, Basharath Hussain Khaja wrote:
> Hi,
> 
> The Programmable Real-Time Unit Industrial Communication Sub-system (PRU-ICSS)
> is available on the TI SOCs in two flavors: Gigabit ICSS (ICSSG) and the older
> Megabit ICSS (ICSSM).
> 
> Support for ICSSG Dual-EMAC mode has already been mainlined [1] and the
> fundamental components/drivers such as PRUSS driver, Remoteproc driver,
> PRU-ICSS INTC, and PRU-ICSS IEP drivers are already available in the mainline
> Linux kernel. The current RFC patch series builds on top of these components
> and introduces changes to support the Dual-EMAC mode on ICSSM, especially on
> the TI AM57xx devices.
 
I guess this version also has the horrible architecture of multiple
firmware's you need to swap between at runtime?

	Andrew

