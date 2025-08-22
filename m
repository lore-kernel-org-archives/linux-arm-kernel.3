Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F372FCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQHWCj2G7uE0VQTePlKYzggszJQgMhjnofu5HSi2Vew=; b=qllLW+FyyaMmwBzhOEYlm/00ay
	Rrul3dGVylP1rzOGOfPAs64mkZ8WH9JtAXY2U80oT1TT33FL/nY6U3aWice0SYU6bKIKSyyzucO0Q
	9usG3tWjjr5xAxQTAKjeuo+RW290t6Nk6PkJlGCu4Idhu8IY26s8t2LHbN8jDQgKIlImK9MU43LRI
	E3jApVCgJsVu25ZM4sMriIBblzuiLLvXUjF9HmgzZ0sqqR7pSemaiGHsJpQ6d0rRrXw8ary1wyv8D
	Zp0yUIVfMIRMa5MbnLsIS0iQEDm99i1HtNaxrFiZ+Zg6aY46wC7aABamdWDvf5UnoA4rKObPBC+Al
	jUBQq3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPrD-00000002Il0-2j8k;
	Fri, 22 Aug 2025 11:22:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upII3-00000001MXD-0Pbc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 03:18:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=FQHWCj2G7uE0VQTePlKYzggszJQgMhjnofu5HSi2Vew=; b=5OuwMnFk8XspHeSWT5qjK0jRrg
	C0ctkC7F0t/TaaLvA8Rr/qlr4y6DSI/6ALz5iiVOM4Uf4PUAurNE49I9LOCAHJClYQK3D+vGHkPse
	NOT9YoUvBtM6e8cRThEI7IZ4FAJqJrCOXw5YOaKpl45cH8SYNgZzrHQ8wAVoZsVq7jno=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1upIHZ-005X48-JB; Fri, 22 Aug 2025 05:17:37 +0200
Date: Fri, 22 Aug 2025 05:17:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Cc: weishangjuan@eswincomputing.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	yong.liang.choong@linux.intel.com, vladimir.oltean@nxp.com,
	jszhang@kernel.org, jan.petrous@oss.nxp.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
	boon.khai.ng@altera.com, dfustini@tenstorrent.com, 0x1207@gmail.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: Re: Re: Re: Re: Re: [PATCH v3 2/2] ethernet: eswin: Add eic7700
 ethernet driver
Message-ID: <548973df-2fa8-4502-9f7c-668d0eeb16c6@lunn.ch>
References: <c212c50e-52ae-4330-8e67-792e83ab29e4@lunn.ch>
 <7ccc507d.34b1.1980d6a26c0.Coremail.lizhi2@eswincomputing.com>
 <e734f2fd-b96f-4981-9f00-a94f3fd03213@lunn.ch>
 <6c5f12cd.37b0.1982ada38e5.Coremail.lizhi2@eswincomputing.com>
 <6b3c8130-77f0-4266-b1ed-2de80e0113b0@lunn.ch>
 <006c01dbfafb$3a99e0e0$afcda2a0$@eswincomputing.com>
 <28a48738-af05-41a4-be4c-5ca9ec2071d3@lunn.ch>
 <2b4deeba.3f61.1985fb2e8d4.Coremail.lizhi2@eswincomputing.com>
 <bad83fec-afca-4c41-bee4-e4e4f9ced57a@lunn.ch>
 <3261748c.629.198cfa3bc10.Coremail.lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3261748c.629.198cfa3bc10.Coremail.lizhi2@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_201807_133293_85D5A221 
X-CRM114-Status: UNSURE (   8.43  )
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

> We re-tuned and verified that setting the TXD and RXD delays to 0 and
> configuring TXEN and RXDV to 0 yielded the same hardware performance as
> long as we only applied delays (e.g. 200ps) to TXCLK and RXCLK.

This is in addition to phy-mode = 'rgmii-id'?

> Therefore, in the next patch, we will drop the vendor-specific properties
> (e.g. eswin,dly-param-*) and keep only the standard attributes, namely
> rx-internal-delay-ps and tx-internal-delay-ps.
> Is this correct?

Yes, 200ps is a small tuning value, when the PHY adds the 2ns. This is
O.K.

	Andrew

