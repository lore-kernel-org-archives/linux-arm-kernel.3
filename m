Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B69C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 14:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BmBVOGClBFtfsWf4aThmoEaYBh3pYi94hNgT36QdLtg=; b=n1nxc60f1FtjZFTQpqKY+t+PHC
	cSsv0MsHHnpnv/78+Ck3V6jzQnMVO8NaTjfY9PnTp/tHAUWQ8mkDzpfwbwNERfXfkNaN+UXMi2mE3
	6a5hn1HYOofc2DIE7plkdR50GnC99QXdlYl1DTSUysQbolGFKWThHR6TeUmrv7sQIa95LvSzwZl1P
	MdIpQeb2E1NaD7b8N9IekHyD+rfZA+Q77pMPVO6yiw0eLBvI/Bh+qcm9v63W1LoPpej3hC3rJh5Ml
	AlftyJ5s4KSvOrkMqfSr85fReD/84naZQJXlXaHZofc0OGvrXAZ/TXEgSUF1RRUiTeseG2mb5TNQH
	KrvLhNPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxn6T-0000000EbaC-325X;
	Sat, 22 Aug 2026 14:53:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxn6Q-0000000EbZr-2UFY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 14:53:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BmBVOGClBFtfsWf4aThmoEaYBh3pYi94hNgT36QdLtg=; b=mu/ff3JLIfokluYcBS+ivQUdda
	22CLPQ9nZYxTsvEucsUVEV467v/gg2FMWU/u4cj6oPQW25uoxe5X1IIX0mJXitQmWGUKaLdnRQjHJ
	p1OXu7UPEYSkaksGKhWngVn+xxqBmwMEvAsP2UCOY6IhADzD0F6ZsOWFhGcoelb5lMOI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wxn6G-0012Rd-1q; Sat, 22 Aug 2026 16:53:36 +0200
Date: Sat, 22 Aug 2026 16:53:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Roman Riabenko <roman@riabenko.com>
Cc: wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: allwinner: a64: olinuxino: Fix phy-mode
Message-ID: <b37fa1dd-862f-48ac-98c9-4556c2bf3f94@lunn.ch>
References: <20260822052353.22881-1-roman@riabenko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822052353.22881-1-roman@riabenko.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_075346_655606_45632571 
X-CRM114-Status: GOOD (  12.03  )
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

On Sat, Aug 22, 2026 at 08:23:53AM +0300, Roman Riabenko wrote:
> The 'rgmii' mode does not appear to describe the RGMII timing in Olimex
> A64-OlinuXino boards. The PCB layout shows that the clock and data
> traces have roughly the same lengths for both RX and TX and, thus, do
> not appear to implement the 2 ns RGMII delay or introduce any
> significant delay.
> 
> According to the KSZ9031RNX datasheet, the PHY adds a typical 1.2 ns RX
> delay and no TX delay by default. The 'rgmii-id' mode causes the PHY
> driver to enable appropriate internal RGMII delays.
> 
> Packet loss in the downlink direction is observed with the 'rgmii' mode
> and is severe enough to interfere with downloads and disrupt software
> installation. No packet loss is observed with 'rgmii-id'.
> 
> Adjusting the TX delay in the DT was found to be unnecessary with
> 'rgmii-id'.

Nice, thanks for doing a proper analysis.

> Signed-off-by: Roman Riabenko <roman@riabenko.com>

  Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

