Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5709BCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 13:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvmxYvqaBcP5LiWtUkLVMauMKmxLzw2JcaPTHvugUts=; b=n6UGENElUDGvwc3TFIAriyY6/Q
	B22p/1WQf9XJKnR8V4LnxdO1UCvjpL/Jn2lVOYdH9B8aRjdgrgOn9m1jOi3PqGAIgiCz5ng4gAtco
	9d81pwwpB8Zrjz1PbgrpDYvRMwYUvvC1hUsJ+rzUB1HGyILm79QYsqrr+z9SC3J8CSKNDgXzvhveF
	eWxkkyQyfEDefOpGdhZA8yeQfrjPlVESq6kkztWblwkhikXNZeKoPVsq0+cT4fLvnJjZcGESSpP/v
	g17fzDB9sW649+NC0fg5p6uyeWIHKU1Sj4JHC9GyVNDaueVPJOayjxATpYaGsbdw/2Z3bLtYJVmv2
	GbHX5cAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qKF-00000006Axj-2syf;
	Thu, 09 Oct 2025 13:04:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qKC-00000006Awr-3dE1;
	Thu, 09 Oct 2025 13:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=cvmxYvqaBcP5LiWtUkLVMauMKmxLzw2JcaPTHvugUts=; b=XNZ807W26VyEL+XLmIZBp1oN2f
	SCM0sM4795CNZhlYNS4pn8NPVB4JME68APBYg0Z0fum+60AkTRvlRrNB67yRUq1u3xRTKorkJrtBY
	TqDeXE3WYGsHTvRruTKRznhe70yTIGUFXbPq9mWw22FR/47Hycf56RgJTRRWPS5DxfRg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v6qJn-00AWt2-22; Thu, 09 Oct 2025 15:04:27 +0200
Date: Thu, 9 Oct 2025 15:04:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alexey Charkov <alchark@gmail.com>
Cc: jjm2473 <jjm2473@gmail.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, heiko@sntech.de, quentin.schulz@cherry.de,
	kever.yang@rock-chips.com, naoki@radxa.com, honyuenkwun@gmail.com,
	inindev@gmail.com, ivan8215145640@gmail.com,
	neil.armstrong@linaro.org, mani@kernel.org, dsimic@manjaro.org,
	pbrobinson@gmail.com, didi.debian@cknow.org, jbx6244@gmail.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: add LinkEase EasePi R1
Message-ID: <d4628648-8f21-4b57-8ca9-f08d89f5e399@lunn.ch>
References: <20250929065714.27741-1-jjm2473@gmail.com>
 <20250929065714.27741-4-jjm2473@gmail.com>
 <d8ad476c-d0c7-4e97-9e76-540a539ffb52@lunn.ch>
 <CAP_9mL4ofig-X-w9wx1A5D_eVXROo6AVFBSwp4mh=kj7webpPA@mail.gmail.com>
 <7e219aef-88a0-4184-9553-30dcbc8dbd79@lunn.ch>
 <CAP_9mL6utQjN_2EZ4vs3K8jzcxHxvKWNTNEXZ9fAx4HuA=DNXA@mail.gmail.com>
 <a0501abe-d86d-4f3a-9d55-c842bfafc190@lunn.ch>
 <CABjd4YyqL1YouMt97MA=CLWJmcFMMr+=xpOKOd6YtAC6jQAO=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABjd4YyqL1YouMt97MA=CLWJmcFMMr+=xpOKOd6YtAC6jQAO=Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_060452_904586_C0395DFB 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
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

> FWIW, the TRM for Rockchip RK3576 specifies that the values in
> tx|rx-delay control the number of delay elements in the internal
> delayline on the transmit and receive clocks, respectively (up to 200
> each).

200 is interesting:

  tx_delay:
    description: Delay value for TXD timing.
    $ref: /schemas/types.yaml#/definitions/uint32
    minimum: 0
    maximum: 0x7F


200 != 0x7f

But i don't think the driver does any validation, so its not too
important.

    Andrew

