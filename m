Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BB4C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 00:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vy5omDl6KJ0USqAk7erLvFOD2j4+PI0gYl7PBegS6lc=; b=Jl4d8WyvQ3o0pGLH4/MFgx2p7/
	dgMJtBrdh+oLAeZkPzLwA75k0sKIUIjKi1cqEy98mUK9HsENid2PLk7ZGpY49znrUSh2wUkX+YRsa
	0rkSxn0ceOQ8C7/j5OTYjm5DD+7z0s+ppGk4EV9QhWf+9kQ9Qyp2aWYisn9iDvA+1FfcvKJCAsfbP
	C4krcDvwB77EEIIh7zfCky6krwe6nq+h4jLXdjC8x1a4F+y1XQbC6zBRgRenNfgnw5uAmMQ0HNZTl
	XDz8skN671+2/Uz299lERmIvTSHVjWto+4QR7kPWq5SBQSWOQVYkt+8wdZKx7Sl4TZ07q4yM6cHDi
	IGLIVDHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tijSK-0000000D2ha-2F1O;
	Fri, 14 Feb 2025 00:21:20 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tijQr-0000000D28g-48DR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 00:19:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Vy5omDl6KJ0USqAk7erLvFOD2j4+PI0gYl7PBegS6lc=; b=17v1bXHYFf54qAGZYsVxZ490bL
	yzvQWx+tpnTYiNIQLOopdRvSNKZ4Fj8sSgLvtYBja0uAxUZWAzufox+QypFXCsZG9y1uxtgMd15Ky
	GopZS/CQ721Px5en8PgJm1AxSRQW3Rb5fwXm4+RdBd3+Pr3qDKcw6Uu6IHP8QAl13K5o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tijQf-00Dtoy-OP; Fri, 14 Feb 2025 01:19:37 +0100
Date: Fri, 14 Feb 2025 01:19:37 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Swathi K S <swathi.ks@samsung.com>
Cc: krzk+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: net: Add FSD EQoS device tree
 bindings
Message-ID: <85e0dec0-5b40-427a-9417-cae0ed2aa484@lunn.ch>
References: <20250213044624.37334-1-swathi.ks@samsung.com>
 <CGME20250213044955epcas5p110d1e582c8ee02579ead73f9686819ff@epcas5p1.samsung.com>
 <20250213044624.37334-2-swathi.ks@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213044624.37334-2-swathi.ks@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_161950_024789_41681DF0 
X-CRM114-Status: UNSURE (   6.82  )
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

> +  phy-mode:
> +    enum:
> +      - rgmii-id

phy-mode is normally a board property, in the .dts file, since the
board might decide to have extra long clock lines and so want
'rgmii'.

The only reason i can think of putting rgmii-id here is if the MAC
only supports 'rgmii-id', it is impossible to make it not add delays.
If that is true, a comment would be good.

	Andrew

