Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1841C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 15:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6OKa9Bkbeq4QpUjqQVjbZ+Iqs4t8ntQfpdJAOPX7Vc=; b=OlQEqIxti3w2jGOx6UTqvzrkug
	SilA/GdiAI/yJ2hTD+CFxS6KgPVj26un5YxsL8lqWxhCjpTmpTaf/3vnbN+NIh1llIq0Jd6ikctgH
	1C1oz34KCpZHYTLhjV/elXt5/YNW0B/m+4a5V7XmfydGoTyhSd3kjqhyVFybGb2RwPFQZvbkPDw78
	niKAARhZ0svglS/hRWwnTrge+FvitioTOdrGp7mtqBPy5+U4XXm4o30Ws/Bf70BhqenXxL049ISVS
	eBmwFE0JKLKD1cNtehavjEQodnQ4TLWoCvk1ljfQ8GlMqVySNQCIU7Iheo0ZrhxJQwArV0FyuVUBn
	hqg2JfKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpqU-0000000Dfhm-3iFd;
	Wed, 04 Jun 2025 15:16:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpoN-0000000DfQt-2GRS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 15:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=q6OKa9Bkbeq4QpUjqQVjbZ+Iqs4t8ntQfpdJAOPX7Vc=; b=m38/as1GRwuEE/yLC+KrimAYLN
	p5Up5uPCb0ci1r27PA7kzZouknOp+tn2vZc+nNydEmWtumnypEZYwYvZ8Hhl/Ii4/+/m08Jx5yO8c
	q/uzfxVyk1WbcynBj15QrlowY7Ez2XH//58JJL9eZHAw+FxgORYT/5ir59n/UledaC6Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uMpoF-00Egtl-Pm; Wed, 04 Jun 2025 17:13:43 +0200
Date: Wed, 4 Jun 2025 17:13:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [v1] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
Message-ID: <1d755cbf-4dee-4784-98b7-e72061219e3f@lunn.ch>
References: <20250603221416.74523-1-stefano.radaelli21@gmail.com>
 <54c4a279-a528-4657-8319-c9374add54b7@lunn.ch>
 <CAK+owoihxp-2xAvFfVthvNELshti_3V-pFgD7D7jzd1XqiLgGQ@mail.gmail.com>
 <d5f891d7-d24a-4f85-b59d-313b925c4495@lunn.ch>
 <CAK+owog69JktbsBhHZj7ULYXmH_bZ-CO8=QEMqBVc0mjp8jz6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK+owog69JktbsBhHZj7ULYXmH_bZ-CO8=QEMqBVc0mjp8jz6g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_081351_664729_219089D1 
X-CRM114-Status: GOOD (  15.33  )
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

On Wed, Jun 04, 2025 at 03:08:09PM +0200, Stefano Radaelli wrote:
> Hi Andrew,
> 
> To clarify more precisely: hw team told me that the required 2 ns
> RGMII delays are
> implemented directly in hardware inside the SOM itself, through passive delay
> elements (filters) placed on the RX and TX lines. There is no reliance on PHY
> strap settings or any kind of delay configuration via registers.
> 
> This means:
> - The delays are fixed and cannot be changed via software.
> - From the point of view of any carrier board, the interface is
> already timing-compliant.

Great. Please add a comment in the DT explaining this. 99% of the time
'rgmii' is wrong, but this is the 1%. We should make it clear this is
not just another cut/paste error, but very intentional and correct
because of the PCB design.

There is a patch to checkpatch.pl i want to introduce in the next
development cycle which will look for 'rgmii', and if found, look on
the line before for a comment including the word 'PCB'. If it finds
'rgmii' without such a comment it will issue a warning. So it would be
nice to avoid that in your correct case.

     Andrew

