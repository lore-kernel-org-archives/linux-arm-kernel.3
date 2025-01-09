Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090AFE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 14:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JESPOQS4EHqjM5dyI36/1mlgYqQI2J+aklQe3TUDMk=; b=oSJv9ob07ti+zU2EfSwOwyR+f+
	YdazZqpXIpQJP9ZQqLXUA442eYzNTZF6VG3MQPO8pqPugoGft7MGc3fqlRy2O96rUHA0eWQEtwVV6
	dfr0tys09iAByaKr+ukL8VgWbbx7DkDaoKQ58z5ikb899LVDkPb8Dr5567IlFJ67melcPO5CwG50f
	7lF3+fnib75YL9D3vQL1qUjLdNFTxKF/pcqzgzjn3hQYO4PlyJ4jkJobu49oeqTTAx7AfjIV0Zue6
	fqajPLfv6ij/uZ37fsqlDGW6z2+Km9X0tNv1yuIQfAGgf8lIO+A5k1XYjkn0dBDQfLUAQLBpNwNBz
	/lbTWZLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtLk-0000000CCyq-3klL;
	Thu, 09 Jan 2025 14:17:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtKY-0000000CCpb-2Qzy;
	Thu, 09 Jan 2025 14:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9JESPOQS4EHqjM5dyI36/1mlgYqQI2J+aklQe3TUDMk=; b=WoCyI9/2gjr2asx5Kgb+1GDr4r
	Dt2N92ECfFohKn8OS+gWxGtDgABQvRW/ny4oM9Zb4F3OFIEQalk0n9goY6oGMLbgHo/79I4JxZ+oE
	pSYFobCNiqfq1O3KXlieCm/8EgVSlebNa8KeFVCvrVLP8+609r1papRROmM0oRNHhR2M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVtKP-002uXi-Fv; Thu, 09 Jan 2025 15:16:05 +0100
Date: Thu, 9 Jan 2025 15:16:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Basharath Hussain Khaja <basharath@couthit.com>
Subject: Re: [RFC PATCH 01/10] dt-bindings: net: ti: Adds device tree binding
 for DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
Message-ID: <4a8fb859-e173-42bf-8d9b-8d6423f45a9b@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com>
 <20250109105600.41297-2-basharath@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109105600.41297-2-basharath@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_061614_615896_333B0947 
X-CRM114-Status: UNSURE (   8.73  )
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, krishna@couthit.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, richardcochran@gmail.com, prajith@ti.com, rogerq@kernel.org, ssantosh@kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, parvathi@couthit.com, horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jan 09, 2025 at 04:25:51PM +0530, Basharath Hussain Khaja wrote:
> From: Parvathi Pudi <parvathi@couthit.com>
> 
> Documentation update for the newly added "pruss2_eth" device tree
> node and its dependencies along with compatibility for PRU-ICSS
> Industrial Ethernet Peripheral (IEP), PRU-ICSS Enhanced Capture
> (eCAP) peripheral and using YAML binding document for AM57xx SoCs.

If i was to do a side by side diff with the ICSSG, how much would be
the same? Does it make sense to refactor this into a yaml file for all
the common properties, and then yaml files for all the specific
properties?

	Andrew

