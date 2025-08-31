Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B77CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 16:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVqXFEe9N7uIRwLMGF9P/QnV2NBuZh0ri3PCWC0W/DA=; b=iqxDouKbwMhOLlUVeCg1pYB+c+
	zuB5rmM5xAPZZDAgpKdbL4TbUlEhN7M2D+ovQNPdMuro7pwfnLZHHM++maf7AhNUHRg7EbKBGqeMf
	k6CY83Mxd8J2ECQE60z4+PlWq2quBYG3k1f6JtwkOgrddaIInPEfyQSPKcuRYgBKJOXPpFEjfir4m
	N/vU5ZBtMagBBbYqL9g0y45jFF5iN/7aWHNI1pYhgBFm47ObtuJNCXhjZhuxxjHCcYpP41+D1u2LH
	VYntKXBOMoGYM5oAXRZOUHcx1Wfru6NpP3/z7vDSY3XmSS4Dz0DlmEO/fsGMnlj7QV42fqWr5xxJ7
	SQJlakAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uslCH-0000000ARRP-0O7p;
	Sun, 31 Aug 2025 16:46:29 +0000
Received: from chumsalmon.baetis.net ([2001:19f0:5:5b58:5400:5ff:fe17:97e8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uskuQ-0000000APUj-2n5b;
	Sun, 31 Aug 2025 16:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tahomasoft.com;
	s=default; t=1756657681;
	bh=km3tbpN//K2LqZ5w/q8z3aHPduBCDAIAHCWXQX8jtQU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NZWuSW8IZr6ng9kOG5DGqmjxkcdybPU1UzTTsUIAyaUM2Ty7JHpqg/9tbea/rZN8J
	 zeGyLf9PP9jQAF+JTnXsdus9o+l5xx9CYB4OI5vATSDgFCoSDs9HwwUXR9h2g/gsIR
	 JNdg5AeNHF2V6K3n5Ar/s73PBKYijWpE9TQIKOXNpCg8JT9Co6LnMmBq0bwkobBiqA
	 jpEbCyFls+s7IGN6RBf50ugjibhncSu/UiKWhg2l0uB175MiKKF9eeKLyG97B/jOLw
	 hpmPWNOnjmOCPHyYRsSP6kjzDctS3eiuouRltP/zxtZiWg7b8pUY7lbmOPw2zBKMXX
	 3ofup6Ir6O0pg==
Received: from WahpenayoPeak.tahoma.link (unknown [IPv6:2600:4040:50be:5a04:7b87:89ea:8410:bae3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by chumsalmon.baetis.net (Postfix) with ESMTPSA id D8FBD27E468;
	Sun, 31 Aug 2025 16:28:00 +0000 (UTC)
Date: Sun, 31 Aug 2025 12:28:00 -0400
From: Erik Beck <xunil@tahomasoft.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HINLINK H68K
Message-ID: <20250831122800.330c9ab3.xunil@tahomasoft.com>
In-Reply-To: <6238650e-7a3c-4dd9-adad-cd2a5e925500@lunn.ch>
References: <021c2e76-cbde-4a2e-a165-a61223cdff93@lunn.ch>
	<5285B176-5178-4F6F-8FB6-B898AC0EC939@tahomasoft.com>
	<20250831104839.7b71f2fc.xunil@tahomasoft.com>
	<6238650e-7a3c-4dd9-adad-cd2a5e925500@lunn.ch>
Organization: Tahoma Soft
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_092802_837601_668B6E49 
X-CRM114-Status: GOOD (  23.27  )
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

On Sun, 31 Aug 2025 17:53:19 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > > > Rockchip by default do bad things with RGMII delays.
> > > > 
> > > >  tx_delay:
> > > >    description: Delay value for TXD timing.
> > > >    $ref: /schemas/types.yaml#/definitions/uint32
> > > >    minimum: 0
> > > >    maximum: 0x7F
> > > >    default: 0x30
> > > > 
> > > >  rx_delay:
> > > >    description: Delay value for RXD timing.
> > > >    $ref: /schemas/types.yaml#/definitions/uint32
> > > >    minimum: 0
> > > >    maximum: 0x7F
> > > >    default: 0x10
> > > > 
> > > > Try setting both of these to 0. And then use 'rgmii-id'.
> > > > 
> > > >    Andrew    
> > Setting both gmac0 and gmac1 to phy-mode=rgmii-id with tx/rx delay set to
> > <0x0> yields about a 7x improvement from ~6 Mbs (with phy-mode=rgmii-id
> > and tx/rx delay unset) to about 43 Mbps, which is still well below the
> > ~950 Mbs with phy-mode=rgmii and tx/rx delay unset.  
> 
> You need to split the problem into two. Rx delays and Tx delays. Use
> something like iperf in UDP mode, to send a stream of UDP packets, or
> receive a stream of UDP packets. TCP is bad for this sort of testing
> because Rx and Tx are interconnected due to flow control and
> retransmissions.
> 
> Try small values of rx_delay to see if you can improve the Rx
> performance. Try small values to tx_delay, to see if you can improve
> the Tx performance.
> 
OK, thanks. 

Just so I am clear, the units are tenths of nanoseconds? So <0x02> is .2
nanoseconds?



> One problem we have with rx_delay and tx_delay is that they are
> magic. We have no idea what they mean. The RGMII standard says there
> should be a 2ns delay between data and clock. A poorly designed board
> could mean the MAC/PHY pair needs to insert say 1.8ns or 2.2ns, not
> 2ns as defined by the RGMiI standard. Rockchip also seem to encourage
> using rx_delay and tx_delay, so i would not be surprised to find
> Rockchip boards are often poorly designed and don't follow the RGMII
> standard.
> 
> rx_delay/tx_delay can probably insert 0.2ns of delay, but it probably
> cannot insert -0.2ns of delay. So it could be, you cannot improve
> it. If that is the case, we need to consider another solution.
> 
>    Andrew
> 


