Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083E9C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 13:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYS8MGw1rvpKx7e8kOPpBhMRoCVxRnVWUywb9QjDvXc=; b=bgASxgtNtaSPlOYudpjmNrMI6C
	5JWUQoDwika8na2Hoftqo+tjkhrEnfUaFlban4k974hBUsCKYgwBqWKyhA/DzPWKcRapDYdiBxNdl
	8lASkFUYP9lpuxa+09GpwN/+1Fgo1nY9Ddf/8cuSoe5vzs2WwT/WBTXBYu0ldNXZS2O7eXutCfjGh
	vtWGpCwd7iRggugb5oOQxZ+4TgbjanoAjUX6XT5MxBJNBNp82EAM2FMAil5MbJtYO4gOLSjwnvliD
	IY8tojoch6Rv13xJ08pek11U6ML9FSp5T111e8OrDLO+gSPg8kw3M8Nso5osQ5JHKIEktUf05FSvM
	KqV+BxvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQjF-0000000EYfS-3AXk;
	Fri, 20 Feb 2026 13:39:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQjD-0000000EYf2-3LNN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 13:39:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uYS8MGw1rvpKx7e8kOPpBhMRoCVxRnVWUywb9QjDvXc=; b=iRtZhjJokINZqNDYn8LXLx0JxX
	GruzK4SQj0kVJix3KOMS8iCLen32wd6uS5etM2V5Sx5ZjSQzrO6Pfpc3H8AQh/ryThQjFsPCW8OL9
	Q8UckK50QD7n+VomIKSFZMiMG/1Qy/ONzYRIZAVhLhD8TDv3/+y4DSilk6EU7BiOOCZo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vtQj4-0084bV-O7; Fri, 20 Feb 2026 14:39:22 +0100
Date: Fri, 20 Feb 2026 14:39:22 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Neeli, Srinivas" <srinivas.neeli@amd.com>
Cc: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"Simek, Michal" <michal.simek@amd.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"richardcochran@gmail.com" <richardcochran@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"git (AMD-Xilinx)" <git@amd.com>
Subject: Re: [RFC PATCH 1/8] dt-bindings: net: Add TSN Endpoint Ethernet MAC
 support
Message-ID: <36492eda-a332-4dc8-abd2-99be88f7d06e@lunn.ch>
References: <20260219054911.2017362-1-srinivas.neeli@amd.com>
 <20260219054911.2017362-2-srinivas.neeli@amd.com>
 <76c811a7-d081-4238-bf6a-0226e867560a@lunn.ch>
 <SN7PR12MB814702B7C9A28577A94FE79C9368A@SN7PR12MB8147.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN7PR12MB814702B7C9A28577A94FE79C9368A@SN7PR12MB8147.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_053931_836353_AC10C48D 
X-CRM114-Status: GOOD (  10.11  )
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

> > > +        // Endpoint Node
> > > +        ep_mac: ep-mac@16000 {
> > > +            reg = <0x16000 0xa000>;
> > > +        };
> >
> > Except the Endpoint MAC does not have MDIO?  Or does it have an MDIO bus,
> > and you have simply not listed it?
> The endpoint MAC does not connect to an external PHY and therefore does not expose an MDIO bus.
> It is an internal endpoint, so no MDIO node is required.

It does not really matter if it is required. Does it physically exist?
Can MDC and MDIO be routed to pins? Could i hang an external switch
off it?

DT describes hardware. If the hardware exists, describe it.

	Andrew

