Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE474CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 03:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8Ox722Ja33t+pSAH0BdoPpXXOK9JIvS0e1iSxPH+2U=; b=Ww0AMAF9VenrKarP0ZMSOUdIcd
	Z/iRaeFxyWSvhJZbCaGmUogM9969MEaa3GUrLyl6TrLB+dB/XfVxGIE4fHBHYe4YHIHzekUnAXVNK
	i57UX/CjOqqQH8iOM25AahxXlcqSZSfuPy9yRzSgWyientUhKNy/3jkueioTRbbAOWkmGpmRGT0RU
	wi9MUuj2qjAjsjhIcObovaAmRj+EbH0RsaxjHicxKP4bqVkmzQ9lwFbQl1kaQGMMRJItw4OX4IXJ7
	X+n9nb47QJRa6gSO0E/Sc9xOgXDN4B8KktXTotZdjOUK/qeKAB01O+HZPFKdXx6SP5VUy29wJPjo0
	wmI0Iwiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Xf3-00000008jnN-3BSS;
	Mon, 22 Sep 2025 03:56:21 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Xf1-00000008jn0-1Uki
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 03:56:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1758513377;
	bh=/8Ox722Ja33t+pSAH0BdoPpXXOK9JIvS0e1iSxPH+2U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=f3KyClUVemVid8xs++Nhat2YRNO7D5f4kt1hwz8Rc6Ms1bXQogfg9TTw8ze+AvW56
	 kqurv4wI877YS8ci56AR5EK1Iv5W+tlyd+UOgd/GwQzHeEPMrsfkWgCzFaZ28Skg4D
	 66gFra4qV3kNFgQ1ySPiL5rUrpiBEcbjEChPGf6gVmoIIy6DrrwmO/GHoCzA2iVyMM
	 GhCl3ulhiPmAF9NcJtQg7CKvoVkuhdDCiw+rqyII3hXMh4hY9Xy2J5uTzlB0zu3CMK
	 uGDJHclryKpGdsZPrAQf339YRdF4dDwkzwN4O0JEwg9ZIKkwU3iZJJAwlXNNBJ3t4u
	 qyRE7HDROx09w==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A13DD64731;
	Mon, 22 Sep 2025 11:56:16 +0800 (AWST)
Message-ID: <0fc79e55e5fc0f8a43586ac3f90599b8f2a6c817.camel@codeconstruct.com.au>
Subject: Re: [PATCH] dt-bindings: edac: Convert aspeed,ast2400-sdram-edac to
 DT schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Stefan Schaeckeler	
 <sschaeck@cisco.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Mon, 22 Sep 2025 13:26:15 +0930
In-Reply-To: <20250919195326.2079446-1-robh@kernel.org>
References: <20250919195326.2079446-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_205619_588882_B244E767 
X-CRM114-Status: UNSURE (   5.97  )
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

On Fri, 2025-09-19 at 14:53 -0500, Rob Herring (Arm) wrote:
> Convert the ASpeed SDRAM EDAC binding to DT schema. It's a
> straight-forward conversion.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Thanks Rob.

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

