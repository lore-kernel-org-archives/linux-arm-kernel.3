Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4717CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 19:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+7flFK2RUnxDqXCVUqXaa0V2OFkhUFUQMezuL5yE6g=; b=eGuYDrUSz47IsBLQDIyJ0k9AYu
	Uyk73DvfFKTbSnHwlSJpjGyoosEXKh5kv6EnAZXbsJHRDSaSfe1tJiTPNekE4mMinWbwdy/hmLEZ8
	xSzXRbZ6qnhBBwdXyVsuNKLz1WIe07d2AvoUbU4DuVpo5phCu3VdV5zTu4ViHXrgNktLDXN+kHKpl
	p5MBlGNcTnio+CfoeoDtvz09ARBvjVbMHwygXJL+sr87jkvlyBNqgi+cvZFpZWrV5J3npmvvWOM5f
	pWsHXKfEHuaArxtwWqHQ1OaILrtlYqHfyXeeE1FScJHUXcN2C7SOCcxjOCyZa806OyWwZCZx1IDNU
	otAwrMfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoRv0-0000000BOZK-0bXy;
	Tue, 19 Aug 2025 19:22:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOoW-0000000Axxs-2GtF;
	Tue, 19 Aug 2025 16:03:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=N+7flFK2RUnxDqXCVUqXaa0V2OFkhUFUQMezuL5yE6g=; b=kGPqj6NClAqPHS8M/uA71K3oTt
	5MMCYBEUXDle2yjsuFbQEh7VjoHgYOYDaXwJePFOVYZZXqpTboYge93ACdlVVY491QRd5gB5rXo+M
	z+BLiNLxqgQmBq81fCsuRTOKUnm3EgA0wJQidIcDFfGfc/zg5NzLewgbUfN28Dv94Dsg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uoOoN-005D7L-1y; Tue, 19 Aug 2025 18:03:47 +0200
Date: Tue, 19 Aug 2025 18:03:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Dongjin Kim <tobetter@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Change ethernet TXD timing delay
 value
Message-ID: <4d25c642-d457-4cb7-8bc1-587edd4f1d75@lunn.ch>
References: <20250819045018.2094282-1-tobetter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819045018.2094282-1-tobetter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_090356_577924_784D60FF 
X-CRM114-Status: GOOD (  10.24  )
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

On Tue, Aug 19, 2025 at 01:50:17PM +0900, Dongjin Kim wrote:
> Very poor network performance is observed on the ODROID-M1 Board
> (REV 1.0 20220613) when running iperf3 (under 200Mbits/sec), and
> this problem can be resolved after changing the value of TXD
> timing to 0x35 from 0x4f.

How did you decide on 0x35?

~/linux/arch/arm64$ grep -hr "tx_delay = " | sort | uniq -c
      4 	tx_delay = <0x10>;
      1 	tx_delay = <0x1a>;
      1 	tx_delay = <0x21>;
      2 	tx_delay = <0x22>;
      4 	tx_delay = <0x24>;
      2 	tx_delay = <0x26>;
     14 	tx_delay = <0x28>;
      1 	tx_delay = <0x2a>;
      6 	tx_delay = <0x30>;
      1 	tx_delay = <0x3a>;
      3 	tx_delay = <0x3c>;
      2 	tx_delay = <0x42>;
      5 	tx_delay = <0x43>;
      2 	tx_delay = <0x44>;
      1 	tx_delay = <0x46>;
      6 	tx_delay = <0x4f>;

The numbers are all over the place, but it is clear that 0x28 is the
most popular for some reason. But since this delay values are magic,
i've no idea why.

     Andrew

