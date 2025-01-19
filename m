Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D688FC02187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 16:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Giu0ODHWMA2AFv3pUJiCKz05nk6XvcYFDXOiLwnTS5c=; b=S2cgiD3X7TpUvf7k8T6Tb6+Rf1
	UfiT0J2NLZUKeOOKOJH3XIkE2UPL8L3NxireG2UsUjCTppzgSfIHJXTD+nBmrZG0bOvM9VDYyT9ie
	n7TJOimp1lkJVILRQVTVdFfLZEUFkjJ8PcUc7dJpoJtWPnNLbWoBozwYLczmRs77XYx9HVRu36zBv
	pKQSDTiQ2hLcUivx+i4Qc9/MQPDhpcy4ID6jfttsujNe7mQpIr3S5yHgeBxftoyZiDr04HUn9V4Dr
	YBQd/Yh6JAAJkEd51EGuKIC6gQG1fnwS9CftMrxMehbiAUsBVjKX2nPrJX46Rm+EYYNWWvZcJchCZ
	c/al+h3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZXpe-000000045jF-2y1y;
	Sun, 19 Jan 2025 16:07:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZXoK-000000045ZF-02uE;
	Sun, 19 Jan 2025 16:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Giu0ODHWMA2AFv3pUJiCKz05nk6XvcYFDXOiLwnTS5c=; b=aHA1jJ79Gvxky/aJD5M67levLe
	KTFNETW0FC/OOT2v8vBo5FYAWHuNQioxqs/cu2rnNU9uB4wSGHNOECYudX0uXqqeNIzbjX3dyQ8zM
	CXz8xt3tiE/VYj00PFHPqL1Oueb0KBCj+IC47TqwRVI2maMHesT+ZGv7FdwI6pDzSXrY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tZXo6-006547-1U; Sun, 19 Jan 2025 17:05:50 +0100
Date: Sun, 19 Jan 2025 17:05:50 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Dragan Simic <dsimic@manjaro.org>
Cc: Tianling Shen <cnsztl@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: change eth phy mode to rgmii-id
 for orangepi r1 plus lts
Message-ID: <5ce312f4-f496-4a62-bcda-5e6fbefde376@lunn.ch>
References: <20250119091154.1110762-1-cnsztl@gmail.com>
 <ce15f141688c4c537ac3307b6fbed283@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce15f141688c4c537ac3307b6fbed283@manjaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_080604_054562_3DBF5AE4 
X-CRM114-Status: GOOD (  10.83  )
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

> >  &gmac2io {
> >  	phy-handle = <&yt8531c>;
> > -	tx_delay = <0x19>;
> > -	rx_delay = <0x05>;
> > +	phy-mode = "rgmii-id";
> 
> Shouldn't the "tx_delay" and "rx_delay" DT parameters be converted
> into the "tx-internal-delay-ps" and "rx-internal-delay-ps" parameters,
> respectively, so the Motorcomm PHY driver can pick them up and
> actually configure the internal PHY delays?

Maybe.

One problem is that tx_delay and rx_delay are really bad DT
bindings. They are basically values to be poked into a registers, with
no explanation of what they mean. Maybe 0x19 means 2ns? If so, that is
exactly what the PHY will do with rgmii-id, and you don't need any
additional properties.

The fact testing suggests this works does suggest these delay values
are around 2ns, so there is probably no need for
{rt}x-internal-delay-ps.

In general, i always suggest the PHY does the delay, just so that we
try to make all boards act in the same way. The fact this also removes
the use of these terrible tx_delay and rx_delay makes this patch even
better, if it can be shown to be reliable.

	Andrew


