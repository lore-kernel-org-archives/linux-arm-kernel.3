Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18124C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 13:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqKLoTg7Ju7x5pvSrVHpqnVQjdZWB/YWkrxf0VRywQE=; b=qKz53PYpsAORBodauMCNeIEpT8
	z78qKNDkxUVFrf6fByxhQH37BK0Rpp1+NMK5BdR6L10fuOdMW8qF3eVPAMaz6pv02myUg+5Cx2Qso
	wxK/dgtC+qrvqAXAjE9c5Zm3fTTG1JQn2McOWwppUl5swiEmcRi2FTHcYSO194pqCWhua20w2w33+
	UW68s5eoQgN6pergCF4ci5NreQ4/DZAALNFG6fSTnLk2aVO8p4x0VWmGJ1X9kcDWRUepZrXx3DhRe
	iXe7oNZJHXriwrvBYraBonK/xqHwKHR2kKWaFkn3KpaLvwJ00P4blF96s85/cf80Pn6xHnPO68ci3
	0LIYdboQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQgB-0000000EYPC-3a2F;
	Fri, 20 Feb 2026 13:36:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQg9-0000000EYOg-08tV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 13:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xqKLoTg7Ju7x5pvSrVHpqnVQjdZWB/YWkrxf0VRywQE=; b=27qFReLU4ywzybhAqrHkRUEWtG
	zRKYmiqL6KlaPTvAe/qOAxxPUFOIClouJS5DHoZ5X2Poc/DH9+ClxYhIyXHux/Z8344fKkGvks9G7
	jtyiYLCPz1zWnCGQUAgrShqkwIWhWuvMDWpghD1VGwXli/ztD5KcJoU0NKSWp7g9PxWs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vtQfx-0084ZL-7o; Fri, 20 Feb 2026 14:36:09 +0100
Date: Fri, 20 Feb 2026 14:36:09 +0100
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
Subject: Re: [RFC PATCH 0/8] xilinx: tsn: Add TSN Endpoint Ethernet MAC
 driver support
Message-ID: <28b232f1-5814-4b3a-af28-1eab023743c0@lunn.ch>
References: <20260219054911.2017362-1-srinivas.neeli@amd.com>
 <5f884e29-151a-4ee7-9e1a-d7e1f84d9f6c@lunn.ch>
 <SN7PR12MB81478FB396CDD9929618C2D69368A@SN7PR12MB8147.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN7PR12MB81478FB396CDD9929618C2D69368A@SN7PR12MB8147.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_053621_073339_1D4CE71E 
X-CRM114-Status: GOOD (  13.80  )
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

On Fri, Feb 20, 2026 at 12:59:16PM +0000, Neeli, Srinivas wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]

Sorry, i'm not part of AMD...

> > So how does the host send a frame out Port 2? Is there an extra header
> > on the frame sent by EndPoint, which the switch interprets?
> >
> 

> In this RFC, I configured all switch ports in forward mode. As a
> result, when a frame is sent from the internal endpoint, it is
> flooded to both external ports.  To forward packets to a specific
> port instead of flooding, either static switch CAM entries need to
> be configured or address learning should be enabled so the switch
> can learn CAM entries dynamically.

Despite not being part of AMD, this part is important.

I don't care about how the RFC works, i want to know how the hardware
works, to ensure you have the correct choice of DSA vs pure switchdev.

Take the example of running Spanning Tree Protocol. The bridge needs
to send the BPDU out a specific port. What mechanism is used to do
that? It also needs to know which port a BPDU ingressed.

	Andrew

