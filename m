Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16323ECD998
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 19:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmFlqkIkNu6xvUvAqEBq231tObXuQzPEymlXsN9NeUA=; b=uAf1jHjU60cKQw1LvYyATUO1s1
	hsGwErKqKjH5jF+cP6b7JZR+b/5bGg0eNLxWZSjPZ5vWZq+qIY4mh3TQjKy1tGzNGjSObwpT35lzE
	MfgTe5ka5zBKf2AQ0RM+vQsVrXgn3JJVWIIr9KtxyaMw6tVKSZnLv2x4qnKbJ+arxZXNIiLwr+So1
	vsZnhQYtm1ev5QYgHJzSg+shHRT8/bbytXQcrCipwlQnxrP403ICSy/AYR++jjuduur5sKYFtOSkU
	tskmVP8t0FwVUTJEWQd1uhXOtSFcwLmJ2JLy08ZLVJ/ysbH/AYvR2RoXUXVlouDaYA6jRTeHbJ5Qy
	HKC+VKcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo5HW-0000000ARYT-3pdX;
	Thu, 05 Feb 2026 19:44:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo5HU-0000000ARY6-24OT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 19:44:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vmFlqkIkNu6xvUvAqEBq231tObXuQzPEymlXsN9NeUA=; b=A7kMgie1OeBmxHx9znE47EBgVz
	E6Z1ET2DAGRgWJnDTIDeXAKmrDR9Q5RNUYKb3AIt0X2MqwfJfvpp0wfJwO2sdjKS8h8paQLyx9Bhk
	y9CTtWgDbWTtiMh0lrZJaFtNJ4JUOyMAgSgIopsnQ/6kE5rtVmpg6iJ1J4Qq4H569JSM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vo5HK-006Hey-3K; Thu, 05 Feb 2026 20:44:38 +0100
Date: Thu, 5 Feb 2026 20:44:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org
Subject: Re: [PATCH RFC net-next] net: stmmac: add documentation about clocks
Message-ID: <0ddd8a12-2c24-4730-9cf3-893ad4db0c6a@lunn.ch>
References: <E1vo47h-00000007l0I-3rzN@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vo47h-00000007l0I-3rzN@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_114448_549224_915C756F 
X-CRM114-Status: GOOD (  11.75  )
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

On Thu, Feb 05, 2026 at 06:30:37PM +0000, Russell King (Oracle) wrote:
> Add documentation covering stmmac_clk, pclk, clk_ptp_ref and clk_tx_i
> in the hope that this will help understand what each of these clocks
> are for.
> 
> There is confusion around stmmac_clk and pclk which can't be easily
> resolved today as the Imagination Technologies Pistachio board that
> pclk was introduced for has no public documentation and is likely now
> obsolete. So the origins of pclk are lost to the winds of time.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> 
> Is this worth documenting, despite the vagueness of stmmac_clk vs pclk?
> Too verbose? Or not sufficient information? What do people think?

I think it is worth documenting.

I also wounder how many DT authors will look here, and be able to
translate the named used here to what snps,dwmac.yaml has:

  clock-names:
    minItems: 1
    maxItems: 10
    additionalItems: true
    contains:
      enum:
        - stmmaceth
        - pclk
        - ptp_ref

Maybe it is worth repeating this as comments here?

      Andrew

