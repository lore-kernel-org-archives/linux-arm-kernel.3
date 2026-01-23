Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9ABD6CFAE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 03:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LgF2IiBBgl+4u3dsiq9jM64amSwPsMv70P78RqO6sxo=; b=e8eiGR5GQGbv+mF2gpNqfOv68E
	kiGbd1Vh2m+fO8tifXX4sHs/B+1IBAHq0+w9bKpGR6QSEQPrCpX+Sg697gMhRFsDVhTTnA2lJBYa3
	nxCZTQc23KrBokBUSuUwc7OeWyIESsCf9dKR64W1qYqMtZP1Nl/YCMf019pf5BWPU//2ysijpqMQD
	ZLq/ErIVRiqgei1cI84ziQnm6UQdtEBcbNHrSABWyS2bc9NYXr1xNgPTvPTMu6R6IOfY+78orXGi5
	QwFUUpCC94o1f2Q/hIalqNtCvz7do5sgbuju8EJ10XQBcvMQPO4JgyG4IBKA9UNBFHM1syG55BiuQ
	1TfhQhww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj7hk-000000086sQ-3kgH;
	Fri, 23 Jan 2026 03:19:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj7hi-000000086ry-3U0L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 03:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=LgF2IiBBgl+4u3dsiq9jM64amSwPsMv70P78RqO6sxo=; b=05t0QzxOYG0GgefSQyI6Wi1w1U
	2gTAblBFaFFhnSPxoky6SKiUn7tFZ2UvP1Oug0CKFzQFiQ+h5bEQrju3lJJjOcuKky2LUiEfnTtsz
	aTSK2BgJ2+AEmxkzxFHvJPJzsd+rfstWlHx+jNP8wjLH2XPYoGX55LK4X3m3VIX5b5bs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vj7hR-0043xL-7b; Fri, 23 Jan 2026 04:19:05 +0100
Date: Fri, 23 Jan 2026 04:19:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: Re: Re: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock
 sampling control
Message-ID: <c5c0bfdb-316d-4796-afa0-f6f018ceb414@lunn.ch>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
 <308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com>
 <59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch>
 <4e2a55e7.3662.19be8cb9c3c.Coremail.lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e2a55e7.3662.19be8cb9c3c.Coremail.lizhi2@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_191922_864840_C269ABB4 
X-CRM114-Status: GOOD (  15.09  )
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

> > You say internal. So the skew is fixed, it is a property of the
> > silicon? If so, why a DT property? Why not just hard code it in the
> > driver? Since it is internal, different boards should not need it set
> > differently?
> > 
> Thanks for the question.
> 
> EIC7700 has two Ethernet MACs. Only eth1 has this internal RXC/RXD skew,
> eth0 does not.
> 
> So this is not a chip-wide constant that can be hardcoded in the driver.
> We need a way to distinguish the two MAC instances, which is why this is
> described per-port in DTS.

I assume the address of the interface is fixed. So you can just key
off that to distinguish the two instances.

Since this is an internal property, not a board property, it is not
clear it actually belongs on DT.

    Andrew

