Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613CFC83030
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 23:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qBbmY1BbyE3mC/epWHpsMAj7UgiubCHR2WMsu2myOI=; b=a1NvdC9dQumDehll6KNE/ezf0e
	oSGWAr99T/mNZRYBkifT+Pq2xycVzTa62FGuqyf7wIdxqTuD6PboNkrPMCYd8yTxA2N1BYftVbY+9
	5o8JpOCviN/ufHAlbs3unr8syIHj+9guUejN4Mz1gFB5UNxwiMG30Ch347c8YYyjUAnGNXwA4ATh0
	NbihZxayEDkOfmPg9KYPshv1IUfANX3Atrwig3puu9qIn/3NrwyRM4CfWVQPtC+AAS98zY8YkwTgz
	dj7U2zxwImljDaMPsrBjIs/58qLj7HO5Cm5opS+FvBJ5tVaLyO8ox/RALrs7lpoFVjDZXtgFzXiDQ
	WUwYplEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYCH1-0000000H9NH-2Ura;
	Sat, 05 Jul 2025 23:26:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYCEh-0000000H97N-0Jd5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 23:24:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3520D152B;
	Sat,  5 Jul 2025 16:23:42 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68AF03F66E;
	Sat,  5 Jul 2025 16:23:53 -0700 (PDT)
Date: Sun, 6 Jul 2025 00:22:23 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Chen-Yu Tsai <wens@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH net 0/2] allwinner: a523: Rename emac0 to gmac0
Message-ID: <20250706002223.128ff760@minigeek.lan>
In-Reply-To: <e9c5949d-9ac5-4b33-810d-b716ccce5fe9@lunn.ch>
References: <20250628054438.2864220-1-wens@kernel.org>
	<20250705083600.2916bf0c@minigeek.lan>
	<CAGb2v64My=A_Jw+CBCsqno3SsSSTtBFKXOrgLv+Nyq_z5oeYBg@mail.gmail.com>
	<e9c5949d-9ac5-4b33-810d-b716ccce5fe9@lunn.ch>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_162359_167591_E1CF8D07 
X-CRM114-Status: GOOD (  18.09  )
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

On Sat, 5 Jul 2025 17:53:17 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

Hi Andrew,

> > So it's really whatever Allwinner wants to call it. I would rather have
> > the names follow the datasheet than us making some scheme up.  
> 
> Are the datasheets publicly available?

We collect them in the sunxi wiki (see the links below), but just to
make sure:
I am not disputing that GMAC is the name mentioned in the A523 manual,
and would have probably been the right name to use originally - even
though it's not very consistent, as the same IP is called EMAC in the
older SoCs' manuals. I am also not against renaming identifiers or even
(internal) DT labels. But the problem here is that the renaming affects
the DT compatible string and the pinctrl function name, both of which
are used as an interface between the devicetree and its users, which is
not only the Linux kernel, but also U-Boot and other OSes like the BSDs.

In this particular case we would probably get away with it, because
it's indeed very early in the development cycle for this SoC, but for
instance the "emac0" function name is already used in some U-Boot
patch series on the list:
https://lore.kernel.org/linux-sunxi/20250323113544.7933-18-andre.przywara@arm.com/

If we REALLY need to rename this, it wouldn't be the end of the world,
but would create some churn on the U-Boot side.

I just wanted to point out that any changes to the DT bindings have
some impact to other projects, even if they are proposed as a coherent
series on the Linux side. Hence my question if this is really necessary.

Cheers,
Andre

https://linux-sunxi.org/A64#Documentation
https://linux-sunxi.org/H616#Documentation
https://linux-sunxi.org/A523#Documentation

