Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FCAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 13:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WVC5KPxHIUTpQJAWz4Yd0Tr3K7nMkABHyOzsn0Ycnho=; b=NPJF1gnLlZsXQf+CpXLs8wd4OP
	QzesRN/MqGxJixwj/D67bI4epv5Bg4ModYbLkAjyfhHhCQitqxHb0Axa+rdNFL7cfADpqxMJl1nkd
	TuiyZQ74lXKha9lOPDtQXsdHZJPwSEv69zhRUc+hYcKgRrTFETz5XQN8ca91W4iFRp7K8O9XZgGd+
	TFlcv9dIRslvE56tS5leknzhpYQ9dBP2iqAuV1FmrG4qEEm+kwzEOpeBwbuz/azGYmbFJQ7mMt/+t
	pjl70+04S+sqzE6XJwiSUc72TylwZtpZPpNoVe7gcbBkl1Komb2HYmaztrQf/WU5zlgO5sKXrTMKC
	MrCMy8VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiviV-0000000F0B5-3lqx;
	Fri, 14 Feb 2025 13:26:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tivSY-0000000Ewft-0lAy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 13:10:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=WVC5KPxHIUTpQJAWz4Yd0Tr3K7nMkABHyOzsn0Ycnho=; b=GMat5fW/wTe2S9Xc13bsmUgHVp
	BSKW20FGbgUDU2G628ymjJcueeL0WXBX702Wr9IeQ67colXklE/H+g5+B3a8DtXQ8qLrhA1kKa8+I
	l4YYAWTKEKK3W9u0MPt6QyRtnhoSlP2hh5zW85j+tOTIHUJWo29swQCGqLzhfRxLwLi0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tivSH-00E4Ry-UD; Fri, 14 Feb 2025 14:10:05 +0100
Date: Fri, 14 Feb 2025 14:10:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Swathi K S <swathi.ks@samsung.com>
Cc: krzk+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	'Pankaj Dubey' <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: net: Add FSD EQoS device tree
 bindings
Message-ID: <ffb13051-ab93-4729-8b98-20e278552673@lunn.ch>
References: <20250213044624.37334-1-swathi.ks@samsung.com>
 <CGME20250213044955epcas5p110d1e582c8ee02579ead73f9686819ff@epcas5p1.samsung.com>
 <20250213044624.37334-2-swathi.ks@samsung.com>
 <85e0dec0-5b40-427a-9417-cae0ed2aa484@lunn.ch>
 <00b001db7e9f$ca7cfbd0$5f76f370$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00b001db7e9f$ca7cfbd0$5f76f370$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_051022_232406_211D0815 
X-CRM114-Status: GOOD (  19.76  )
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

On Fri, Feb 14, 2025 at 10:47:39AM +0530, Swathi K S wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: 14 February 2025 05:50
> > To: Swathi K S <swathi.ks@samsung.com>
> > Cc: krzk+dt@kernel.org; andrew+netdev@lunn.ch; davem@davemloft.net;
> > edumazet@google.com; kuba@kernel.org; pabeni@redhat.com;
> > robh@kernel.org; conor+dt@kernel.org; richardcochran@gmail.com;
> > mcoquelin.stm32@gmail.com; alexandre.torgue@foss.st.com;
> > rmk+kernel@armlinux.org.uk; netdev@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com;
> > linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v6 1/2] dt-bindings: net: Add FSD EQoS device tree
> > bindings
> > 
> > > +  phy-mode:
> > > +    enum:
> > > +      - rgmii-id
> > 
> > phy-mode is normally a board property, in the .dts file, since the board
> might
> > decide to have extra long clock lines and so want 'rgmii'.
> > 
> > The only reason i can think of putting rgmii-id here is if the MAC only
> > supports 'rgmii-id', it is impossible to make it not add delays.
> > If that is true, a comment would be good.
> 
> 
> Hi Andrew,
> Thanks for reviewing.
> I think we already discussed this part some time back here [1]
> [1] :
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20230814112539.7
> 0453-2-sriranjani.p@samsung.com/#25879995
> Please do let me know if there is any other concern on this.

We partially discussed this in this thread.

As i said, what value you need here depends on the board design. The
PCB could provide the 2ns delay, in which case, 'rgmii' would be the
correct value to have in the board .dts file. Hence the binding should
not restrict the value of phy-mode to just rgmii-id. All 4 rmgii
values should be accepted.

The only reason you would force only rgmii-id is if the MAC/PHY pair
cannot do anything else. If that really is true, i would expect a
comment in the binding, and the MAC driver to return -EINVAL for
anything but rgmii-id.

	Andrew

