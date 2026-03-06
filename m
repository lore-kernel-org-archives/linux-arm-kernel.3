Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FD0F513ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 00:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xD8OzgD1yLJrD6nWFaYTuq5jkWWcsBKCjbuI3ypL9ZI=; b=sBkDVwobbw0MeQm1nxKP9U22AL
	KRvkZ7/zq7M9jbYZMdGaQNpCd7JJZxwwGXgW/9hm6K0ZykvIb6hVz1riXwangMiJIdUiu3YRyVBzi
	vQuESKqj0g+Bnes3FXc1Gan461njVXrnnEXduH/Y36izt+yHeGgcZLzmzogzLyiTCmOyuNzpXEFmQ
	6cW8+u9HLjvV0e7uxOoBqqxkQ7Ahz+4F4vdKm3pPzyaVMh6LMWkxARDyxWgFV0DdH0fvkMHAgqh7R
	mJSVGfclCfv66gfn9J8It2TVOHo3KGk6MZmANW2ZFQBx8Gwa6366tpZkeHNRAs0KDPQhmVH1KOhEK
	1xv1Hvlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJMB-00000002nm9-3spB;
	Fri, 06 Mar 2026 00:47:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJM9-00000002nlg-2vwz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 00:47:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 57A2A423E3;
	Fri,  6 Mar 2026 00:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D54C19423;
	Fri,  6 Mar 2026 00:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772758073;
	bh=h9pWZ+KlVqTI+gHB0a3vvZujRk02rbpKF1UtgPpic7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DY1PXkqoCDwg+JaZPV0pz0uTiOL9hZveg0NsCcpXqwRPxOlp8BRYh2rWN4dwouvx7
	 Hbm7li5Jjl+im7NoAd8BIgB6WiBZo/mmaMVZPhvLstwvHF0n19PRTsyitfTbOIY1m7
	 5vnoPqwDnPhctFoYie9p1posds5ma78IoYQU+cNqJwHq7C3RPWOzuQSOYNAZ1Pva9d
	 HkH1j3aPeoD5JXj6QpxUKFEDnBJLOBwBORC8nXELqgWneoNXVcp2KmFSOYsUvofctB
	 lWS0JrtTpAt9ndAV8anNFA2aEaiWHIRKB4Rc2he7DWHWibmGeohXyFLdcAXI8OSR1h
	 /TC7mEL078KvA==
Date: Thu, 5 Mar 2026 18:47:52 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-usb@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: usb: atmel,at91rm9200-udc: convert
 to DT schema
Message-ID: <177275807065.875463.18386357319081632495.robh@kernel.org>
References: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
 <20260224-atmel-usb-v2-3-6d6a615c9c47@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-atmel-usb-v2-3-6d6a615c9c47@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_164753_758748_EF5D3995 
X-CRM114-Status: UNSURE (   9.49  )
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


On Tue, 24 Feb 2026 13:13:00 +0000, Charan Pedumuru wrote:
> Convert Atmel AT91 USB Device Controller (UDC) binding to DT schema.
> Changes during conversion:
> - Include "atmel,pullup-gpio" and "atmel,matrix" in the properties since
>   they are required by existing in-tree DTS definitions.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../bindings/usb/atmel,at91rm9200-udc.yaml         | 77 ++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


