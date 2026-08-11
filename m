Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BCCC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 20:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q58NnluEd7Mdf1XEgaOf4Q0TW7uWRgkIuWPlNMdzkuA=; b=LPm6zbqUOUxqury4ZRArO2HYVJ
	HZY897AFMPLXdI3z94E6lelBI7wCNp8WatdvLyFcORDW5lzdwuT8w8J8QKRuGjfw3S+wGrGrwjG5/
	PWfZS0kx70ygDgP2bikPf3+8dkdSEbapZq5Y5BVT7Ek3D90gMty+1UHqYvoSM2pp3MGxOqlHiquDq
	tYl0M9032x+QBFYzoGeNluU5TGyhjt75JA/ng1GwCTYF2xBjUlJIFNQB/t6l3Y7hRjpD+96zAOBx/
	FghDRVSYsDFvcr81C1j1vGg8I91+DHnPZD8V6NRJNcIMi+9Nb1LsjIrSKYKWVofHNAyxrSffHCx7j
	ds7i2UOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wttAG-0000000EvzT-0sSH;
	Tue, 11 Aug 2026 20:33:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wttAD-0000000EvyM-3JZS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 20:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Q58NnluEd7Mdf1XEgaOf4Q0TW7uWRgkIuWPlNMdzkuA=; b=lbZ+RsQZGCcQBh5XXCpSZvo1/n
	bufOcQurq8OHVcTaEIcSCmvU32eFJx7dSAUsIQhVDijjOQKb/IuGzNMbGa85WbG5nrV8yuove+bSu
	fR8eftzawHZLSe7cx8s6guUBdrBGSKwj28ncTVAUnhsXbOtFOe0/idmjonZGuDoZ6kk0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wtt9w-00H98L-7M; Tue, 11 Aug 2026 22:33:16 +0200
Date: Tue, 11 Aug 2026 22:33:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 RFC 2/2] ARM: dts: BCM5301X: change Luxul XWR-3150 CPU
 port from 5 do 8
Message-ID: <74a83203-9acb-4413-8952-9182f02d1e67@lunn.ch>
References: <20260811193658.14304-1-zajec5@gmail.com>
 <20260811193658.14304-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811193658.14304-2-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_133333_831197_E9460CAF 
X-CRM114-Status: GOOD (  13.96  )
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

> Change the choice of "cpu" port to 8 and make the third Ethernet
> interface (connected to port 8) use MAC designed for the first Ethernet
> interface (connected to port 5). This makes Linux use switch in a
> feature full way.

> This seems to be a slight abuse of DT. Instead of describing hardware we
> make it steer Linux into using a more appropriate switch port. This
> isn't strictly a setback on its own. It's a change from one choice to
> another.

It is a bit fuzzy, but the hardware of port 8 is better designed for
the function of being the CPU port. We are expressing this hardware
property via actually using it as the CPU port.

> I'm not sure about that MAC however. We say that the third Ethernet
> interface should use MAC that was designed for the first one.
> 
> Is all of that acceptable?
> 
>  .../arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts | 9 +++++++--

Is this the only device in mainline which is affected?

   Andrew

