Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1EDCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tJGnL8Im4mQRH9+SYQUXhNX7j/GvhYVwnU5vk8HyRBk=; b=RoxqcspKQLxwK7
	SunCi32xT+pEcAOEDW7EJsGYHe9Y49NJpYzKt6u2UF4zaG7LCAeaoZm3my///Htmzvggr6oQv9ICE
	9+l7IFEVtaofkZjaW8G3sQVGHvxBu02lkxt3nzOv4KppeQqVcv+RxH6Q+9DmUrN6x7eYnZZdmLlui
	lcnt2qMF1FUING4Ur4tO3naDSosbpvHaWSslf+KkFj2D3kPiOUFvt6pG0vKI4i6hFHRG5h5l/J7+t
	bvlWqCvMGR0Ai2t/TZBxI8DCCJ5oRjWXQ0GR2ZMvE2UPbbzDERJX1MR9mnkZpe3KHgS/EHWRLHKDs
	EDFctOMuvNZ0pCSyf0Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBp-00000004pIB-2TLX;
	Tue, 09 Sep 2025 06:50:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uviVK-00000002CZA-3vPR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 20:30:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D22860140;
	Mon,  8 Sep 2025 20:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E66EC4CEF1;
	Mon,  8 Sep 2025 20:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757363422;
	bh=BksOrPE+ZRN/9iJRIdByF0w7vBNmdK0mrOFP3MyN0AE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bgE3b7kSXL9vq7+O9vCSmc8iAqUZN0ejxhiiawV+mtPM5vBd9FJXFRZGXgYgdZWCs
	 V/Qq8/53NilKwUG9sT5mFMhz5pJZPDtAgaAh+w12kYOAw0xifOS+FU+UlnaywKUxWl
	 X6X0pTwR/dMXgNa1EaA6cvb3iSn6qBz1meYvBXbK9mq5rTB5FYPxJj2Jc0mRvAEO6H
	 DWYLVphN4mbkRs9EwtJdREFGC/uxc37agFEXN2U3zc4v8U96ptK6E28B2XIg4lA7Uq
	 lIpdKFKD4FUAJ0qWJ2QNLRM79qPIB0hvhM5q7CQXokgUs+sgFHFPclJEDuZZrwPHLw
	 GzcWwXoDwy+7g==
Date: Mon, 8 Sep 2025 13:30:19 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v15 0/5] PRU-ICSSM Ethernet Driver
Message-ID: <20250908133019.44602174@kernel.org>
In-Reply-To: <974157264.314549.1757343020136.JavaMail.zimbra@couthit.local>
References: <20250904101729.693330-1-parvathi@couthit.com>
	<20250905183151.6a0d832a@kernel.org>
	<974157264.314549.1757343020136.JavaMail.zimbra@couthit.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: pratheesh <pratheesh@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, krishna <krishna@couthit.com>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, saikrishnag <saikrishnag@marvell.com>, m-karicheri2 <m-karicheri2@ti.com>, Bastien Curutchet <bastien.curutchet@bootlin.com>, mohan <mohan@couthit.com>, jacob e keller <jacob.e.keller@intel.com>, pabeni <pabeni@redhat.com>, s hauer <s.hauer@pengutronix.de>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, ALOK TIWARI <alok.a.tiwari@oracle.com>, richardcochran <richardcochran@gmail.com>, johan <johan@kernel.org>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, kory maincent <kory.maincent@bootlin.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, horms <horms@kernel.org>, michal swiatkowski <michal.swiatkowski@linux.intel.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, 8 Sep 2025 20:20:20 +0530 (IST) Parvathi Pudi wrote:
> > On Thu,  4 Sep 2025 15:45:37 +0530 Parvathi Pudi wrote:  
> >> The Programmable Real-Time Unit Industrial Communication Sub-system (PRU-ICSS)
> >> is available on the TI SOCs in two flavors: Gigabit ICSS (ICSSG) and the older
> >> Megabit ICSS (ICSSM).  
> > 
> > Looks like the new code is not covered by the existing MAINTAINERS
> > entries. Who is expected to be maintaining the new driver?
> > Please consult:
> > https://docs.kernel.org/next/maintainer/feature-and-driver-maintainers.html  
> 
> We will update the MAINTAINERS information in a separate patch to
> this series and share the next version soon.

I wasn't asking if you can update the MAINTAINERS, I was asking what
you will update it with. Since that's still not clear I'm dropping
the series from pw, please repost with the MAINTAINERS entry included.

