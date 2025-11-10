Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF0CCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Awr+81kQsRnEBxn06SpEGdo1D44sv/W67zP5wVfdji8=; b=UfrKjUEPFfGK+lN7+GLOY8/nek
	hawQXh0c9CqynOKnGQI5ZzEL3zd062HHjjV1bGQ3y+s/dHXOQh/SR9KBID9tnPgEaa3Z8vOz37KlQ
	7GmEoQ5DG25EVKVp7lfVM1fJYGW5z+Pt/Xd3BxPin8in30Dv30B8M6pGL72TroqiW90ShKXpbY133
	xaAzEuajaQ4wBt53X+/djYOZOGkS4Maw5dExZ6M7FjUmELI8BB1yBXa0O3wwuVJuvpYJj+YTc6BBW
	8OeFZ5m63WVSijQkvwu8G6n4ejXr+CRb33MCSgC5MPC10QdbUV/54QhLP7lWHwlyCnEWy3MmP4+kC
	vfkJIkpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITik-00000005gIL-3jk0;
	Mon, 10 Nov 2025 15:22:18 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITii-00000005gH4-01B3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 15:22:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Awr+81kQsRnEBxn06SpEGdo1D44sv/W67zP5wVfdji8=; b=ztiH7bgviNzNanjroR1I3K9ala
	g4VP79+oXXvnv4jp8O3mC+I7CpuE7e3ZyKbul3ax9mvMQ6uF7ZgjsEZNlsmW9dsatq3/x3Y8DcaYg
	mJNFvp8XO6OaYEG83DMlc/K8uhCnXFrzIYQ4gaGxb/KYyaWvHCnkNFd/0FERfx4c+qj4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vITi7-00DX2g-4E; Mon, 10 Nov 2025 16:21:39 +0100
Date: Mon, 10 Nov 2025 16:21:39 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Po-Yu Chuang <ratbert@faraday-tech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, taoren@meta.com
Subject: Re: [PATCH net-next v4 1/4] dt-bindings: net: ftgmac100: Add delay
 properties for AST2600
Message-ID: <aeb5d294-d8c7-4dbb-a159-863963d38059@lunn.ch>
References: <20251110-rgmii_delay_2600-v4-0-5cad32c766f7@aspeedtech.com>
 <20251110-rgmii_delay_2600-v4-1-5cad32c766f7@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110-rgmii_delay_2600-v4-1-5cad32c766f7@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_072216_038960_4E5FAA30 
X-CRM114-Status: UNSURE (   8.12  )
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

> Add the new property, "aspeed,rgmii-delay-ps", to specify per step of
> RGMII delay in different MACs. And for Aspeed platform, the total steps
> of RGMII delay configuraion is 32 steps, so the total delay is
> "apseed,rgmii-delay-ps' * 32.

You already have hard coded base addresses to identify the MAC
instances. So i don't see the need for this in DT. Just extend the
switch statement with the delay step.

    Andrew

---
pw-bot: cr

