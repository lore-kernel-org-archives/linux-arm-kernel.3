Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEA4C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 13:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGCt+0XxcYcy2o+9UQUPdgFocwfvqqMxMPoHohs8Lr0=; b=FBM8CxXuKbQtTM5OndHV2Mv0M8
	YL2Y7F7EYsJy6+BrOOffrRohRI2OjnyiHcfxwW8/PAxg7aNdq/1iXuEWCe2aRWTzONpJfdkx1nILj
	Or/6APg9yWlL+4mvcDZrEda5DAAce0JXNi/JP+BBw8L3A5Wo8608zgkItZx9tKO2QKXb4en2NPiVB
	bxUc+XANOFMaCuVUQh8KEmGDiUPDP8obMfrkkKAUK1g8XoGNUzwkR7igIbLcchpySz2zpzPTVEqpk
	0yDvpVxVS4KoQaksEUq5ENopxID9CXlhd1EFoPGivZrgPLb94Oyk2mxMVbHPl9ff1i35BKiO/fwml
	yKC22x7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td7ge-00000006xwK-31l7;
	Wed, 29 Jan 2025 13:00:56 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td7fK-00000006xk8-3IDA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 12:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iGCt+0XxcYcy2o+9UQUPdgFocwfvqqMxMPoHohs8Lr0=; b=CUztH85zaoBHrhNGD7AArJxIxQ
	bTqqhXxkfIpyFsSfW9KkbD+h9KZwEnsQ0rJilPxFAnBn8ImYlu4Kgwjp3FyNz4ZS+JCmDXRR3pldW
	CCSdXbtfElUK5J8Ei+K7RPaxW+t+4GDnM4PRoYwIYetZmMYLfW5LAK13RhKAh/XTSn0c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1td7f5-00984N-HY; Wed, 29 Jan 2025 13:59:19 +0100
Date: Wed, 29 Jan 2025 13:59:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Swathi K S <swathi.ks@samsung.com>
Cc: 'Rob Herring' <robh@kernel.org>, krzk@kernel.org, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	conor+dt@kernel.org, richardcochran@gmail.com,
	mcoquelin.stm32@gmail.com, alim.akhtar@samsung.com,
	linux-fsd@tesla.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, alexandre.torgue@foss.st.com,
	peppe.cavallaro@st.com, joabreu@synopsys.com, rcsekar@samsung.com,
	ssiddha@tesla.com, jayati.sahu@samsung.com,
	pankaj.dubey@samsung.com, ravi.patel@samsung.com,
	gost.dev@samsung.com
Subject: Re: [PATCH v5 1/4] dt-bindings: net: Add FSD EQoS device tree
 bindings
Message-ID: <b4df65c8-e6e5-437f-826a-eb011aac83df@lunn.ch>
References: <20250128102558.22459-1-swathi.ks@samsung.com>
 <CGME20250128102725epcas5p44b02ac2980a3aeb0016ce9fdef011ecf@epcas5p4.samsung.com>
 <20250128102558.22459-2-swathi.ks@samsung.com>
 <20250128154538.GA3539469-robh@kernel.org>
 <003001db722f$1d7e56d0$587b0470$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <003001db722f$1d7e56d0$587b0470$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_045934_821052_71204A37 
X-CRM114-Status: UNSURE (   7.71  )
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

> > > +properties:
> > > +  compatible:
> > > +    const: tesla,fsd-ethqos.yaml
> > 
> > Humm...
> 
> Hi Rob, 
> Could you help me understand if there is anything wrong here?

Is your compatible really "tesla,fsd-ethqos.yaml"? If so, i think this
file needs to be called tesla,fsd-ethqos.yaml.yaml.

	Andrew

