Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CB8C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 19:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4k9z3rNoaxvsZh30uSr90husp7CDgyQMsf5rUgjtaNU=; b=GWlHsMAQ4H21GztIneYKr+Ondk
	abxwFgAuw9wYnFdvxY0GojuH8bzutjwzFILY7ow1VzFVNJmPY8bAI+tE3PXGuJEPyYdbtfeh4KGA7
	71MjxnOhT2erWdpu/S1EWIQSO+v5kWO5BEFnP6wiafALvtN2KcbBXDjaiS4yN8kPKXse4BCnnciuH
	k7+R9PS5j8ScZWCGU02RPBf7xEFysYs2+1+UaOjXPggbpuEs5wTBAVmej+NovdvxcW/XNRGD/AP4U
	KkCSCVKYtHw7CbBdThhWaJUCUCLn8rWtAdrYllNGhd+dRBw4+ZMbCQwEgC/oQ3gyRxaKxUzGXHOna
	bvABZ+HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJdf4-00000009Qho-3ahU;
	Mon, 26 May 2025 19:39:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJdcx-00000009QaN-36tg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 19:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4k9z3rNoaxvsZh30uSr90husp7CDgyQMsf5rUgjtaNU=; b=dZEGbMI244Z6VqhpAY3fWaIfh5
	kV3jP75Ntv0uqIiDd10Gxfi5sxVDrEkSmsnMHGlo1knf8cIcEw2D74nfUmCPiE4OWoF+FzutuQow6
	nQAxASczMZgn86iFIrH3w7Cpo0V3y85B4n1r+hg+EnFvebt0EPu2Qgs739YdtlFM9KdM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uJdcY-00E1Qy-2i; Mon, 26 May 2025 21:36:26 +0200
Date: Mon, 26 May 2025 21:36:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] dt-bindings: net: sun8i-emac: Add AC300 EMAC1
 nvmem phy selection
Message-ID: <959e576e-bf36-4d01-9ffb-023931b61574@lunn.ch>
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
 <20250526182939.2593553-3-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526182939.2593553-3-james.hilliard1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_123651_779067_887E1DAF 
X-CRM114-Status: UNSURE (   6.60  )
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

> +        phy-mode = "rgmii";

Does the PCB have extra long clock lines?

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

	Andrew

