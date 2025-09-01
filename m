Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830F6CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2zcgRmIXCbrIKc8FxkKITlNihcAQ6h2DXOsEm8mAF18=; b=a76Lp4E6eC3EpbnBZPSLVf7D3G
	xCmcIlL5gSZWFKWcSAajpDa0ZvxeME+kLZctKL1ycqKYph5md83LADM6Y9RI/zRPcglu6W8lWdaO8
	yKX3prMaEdhmRtlFJyfluDIH1v0onbe20mrMPXcFkL2RpU5PTX2JY1IJ7/gIop+FSX00w6h6yTn+P
	hD7OxmokevWl+TB8q3YNrUoDHOgp3n2482AItiCkLuv/ysvrReKZvXZtfH95vhpNVMwKRjLmQMh6M
	01BMRAsgBYShsFKWgTTysYtw539qdZALoBy/FH25Iu9UgQpTL+YFwsKdlUsak48CN6X7nPvXwCAj3
	gKa3b2gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFHY-0000000EafM-0Uwu;
	Tue, 02 Sep 2025 00:53:56 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDJ1-0000000EAP5-36ro
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 22:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2zcgRmIXCbrIKc8FxkKITlNihcAQ6h2DXOsEm8mAF18=; b=DhSCe94TnGa6VnplH5DLlL0vHA
	r4Urt0wwe1CScuy98/B8P3sNOOgHQgY3D7uo4RLV/r/z8p+FDamsHXiw1TLOAc98wSfQbJj9nD6w/
	65Ty6MpzVtNMw+Qh/rVJJCgsjlijuHSOGpNC2RIoesxBVm9iSh5dxzY2xu4UzMTJiIgY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1utDIl-006p2z-QY; Tue, 02 Sep 2025 00:47:03 +0200
Date: Tue, 2 Sep 2025 00:47:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	David Miller <davem@davemloft.net>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH net-next 1/5] arm64: dts: ls1043a-qds: switch to new
 fixed-link binding
Message-ID: <7b5a01ae-f3f1-4029-8b43-87861a8f8b8f@lunn.ch>
References: <a3c2f8d3-36e6-4411-9526-78abbc60e1da@gmail.com>
 <fe4c021d-c188-4fc2-8b2f-9c3c269056eb@gmail.com>
 <aLNst1V_OSlvpC3t@shell.armlinux.org.uk>
 <a5411ede-5312-4510-a559-e3b09e7e763b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5411ede-5312-4510-a559-e3b09e7e763b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_154719_775792_993CD91C 
X-CRM114-Status: GOOD (  11.71  )
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

> Usage of the deprecated binding was added to this dt file with ab9d8032dbd0
> ("arm64: dts: ls1043a-qds: add mmio based mdio-mux support") in 2022.
> At that time the binding had been marked deprecated for years already.
> I think it would be good if dtc would warn already if a deprecated
> binding is detected, so that CI can complain.

I don't think the DTC compiler can help. It does not use the .yaml
files. You can compile a dtc file to dtb without any outside help.

What i think we need is 'make dtbs_check', with some additional flags,
like W=2, looking for such deprecated properties being used.

	Andrew

