Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8F2D4415E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 13:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/8L6jiP0MMCe6YnhTtuyP2MV88r7Yd1I8/6RUdDlQk=; b=aP1GzzyBBuvalQOU+pgx1spBM4
	r4ZjHJ86rFDrBdC99P/x5T6zZZz4G7NC8A/wa0xx2k5zoZgme0F9kFs2tpZNTzodgNitTrQSyZ8as
	smJrlRhoSbwHo0pMwXbd0pq2B8CuwNKq8MYkvxo7+nNikk8E1dzX8HLSS/60BHjXQVa5nDTMtEoYP
	ntCfdHIAo1ykdp+wdm/5Pw5MUkn2gWTErSRuao2tsfEpmrj2nHTcJ2pFfSW4kEHU6dX5/etJvU+vz
	UQt/VPAEYoc0/AV2pWeSNQv4it0XB5eBUQwnqAFfMSVHFh7ClNIUvDy/AgKxiCI1wVafjgxkIf768
	na0i7iCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOYZ-0000000CZCw-3xVs;
	Tue, 19 Nov 2024 13:46:15 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOR5-0000000CXWl-40vn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 13:38:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=n/8L6jiP0MMCe6YnhTtuyP2MV88r7Yd1I8/6RUdDlQk=; b=jyBeVuQ8YgM7rp6UTaSBQbCsgi
	mUDUUxwYRmnKMSB5N+E5ZWXUQtgvZnVfVaMnKw9RSolP/Xuy6ITn6EpVwkHvrwO0uhs9acKbe1Zl+
	irmKSRLWDJuTQJCPamsfM/q/N7vUSwxctESCXcYB0NwMaTmDJIbAF78zYiq4Ckk2mP4c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tDOQx-00Dnxs-62; Tue, 19 Nov 2024 14:38:23 +0100
Date: Tue, 19 Nov 2024 14:38:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Gupta, Suraj" <Suraj.Gupta2@amd.com>
Cc: Sean Anderson <sean.anderson@linux.dev>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"Simek, Michal" <michal.simek@amd.com>,
	"Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"git (AMD-Xilinx)" <git@amd.com>,
	"Katakam, Harini" <harini.katakam@amd.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: xlnx,axi-ethernet: Add
 bindings for AXI 2.5G MAC
Message-ID: <d25ad78f-a009-4a0e-9052-ed247e6a2afc@lunn.ch>
References: <20241118081822.19383-1-suraj.gupta2@amd.com>
 <20241118081822.19383-2-suraj.gupta2@amd.com>
 <20241118165451.6a8b53ed@fedora.home>
 <410bf89c-7218-463d-9edf-f43fc1047c89@linux.dev>
 <ce534b32-7363-4433-8b1d-4e01c3d92084@lunn.ch>
 <BL3PR12MB657106F2B29FE44123C672EEC9202@BL3PR12MB6571.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL3PR12MB657106F2B29FE44123C672EEC9202@BL3PR12MB6571.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_053831_992917_73FA892F 
X-CRM114-Status: GOOD (  16.90  )
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

> > Do you mean 2.5G is a synthesis option? Or are you saying it has always been able
> > to do 2.5G, but nobody has added the needed code?
> > 
> > This is a pretty unusual use of max-speed, so i would like to fully understand why it
> > is being used before allowing it.
> > 
> >         Andrew
> 

> 2.5G support was already there in hardware, driver is getting
> upstream now. 1G or 2.5G configuration needs to be selected before
> synthesis. In 2.5G configuration it supports only 2.5G speed.

So when the PCS is fixed to 2.5G, are you planning on using rate
adaptation to support lower speeds? There are a few systems doing
this, mostly by using pause frames between the PHY and the MAC.

> I'm exploring registers to get 1G / 2.5G selections information
> instead of using max-speed. Will send next series soon.

That would be best. The PCS might itself report its
capabilities. Sometimes there is the equivalent of the BMSR.

> Just for my understanding, could you please share the use of
> max-speed DT property if possible?

It is generally used to remove higher speed operation because they are
broken for a particular board. It should be considered a board
property, not a SoC property.

	Andrew

