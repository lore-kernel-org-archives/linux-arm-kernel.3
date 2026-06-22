Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC53CDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 07:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9jNnyNYGY1NcwfEUerNCQvkVxFVg9qCMrtvtRAXFJA=; b=qBCoHOBt/XfTUqvxeSqBmgfrju
	sM9GcMJq3bhXuLMELZhmLi7JPFQWTz9LSVNAVQ93TR3p6VAzZROkcHu+Uf64wVVXK1Xs+WY3aaknx
	77n6HhqKXmpqtqYCZUPYLfKb0W88tccDcSFwD+jck9tuo66OXL7ROmCnbWoUvAGSaqYG9F22/keVM
	vOtvZBMxhHMT1uxQATURP1Z8kc2WNoxidzkv0vfH10NsbUd1qW4IGZByAgW2AaUn83UkY3IyjbhnD
	IBy0lxKf6z1CSSjjwYYRxqUt5bXYHk63LPUCrsD3wrIc+isjQ8aITI1RBYQeMpstIplSN5goMh7Cl
	kYnK+34A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZTF-00000004a8H-0yZV;
	Mon, 22 Jun 2026 07:53:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZT6-00000004a6m-0G2D;
	Mon, 22 Jun 2026 07:53:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=F9jNnyNYGY1NcwfEUerNCQvkVxFVg9qCMrtvtRAXFJA=; b=VLKldH5485znscUBJ7jdzHIRV9
	n3k6ppQ//qWUe8aHhkIJM1rhZmDzzgK0MH7+bOtdKrEThTsyIk6mgKsY9+Kxhcjjfm4bRqSv38eVJ
	hT7NMgTUR/IE2lzo9XUFveK5Rt4wa8O0LGiGrr7f19UDell2Z/QiLD9fJjGC7F4MPPgA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wbZSe-008nM7-NQ; Mon, 22 Jun 2026 09:52:52 +0200
Date: Mon, 22 Jun 2026 09:52:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	devicetree@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	netdev@vger.kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
	weishangjuan@eswincomputing.com, horms@kernel.org, lee@kernel.org
Subject: Re: Re: [PATCH net-next v8 3/6] net: stmmac: eic7700: make RGMII
 delay properties optional
Message-ID: <4eb42700-c46e-4d21-8db5-dbd65f83d57f@lunn.ch>
References: <20260610012727.848-1-lizhi2@eswincomputing.com>
 <20260610012937.911-1-lizhi2@eswincomputing.com>
 <eaa645fc-be06-4a15-8c2f-6e82129c4715@bootlin.com>
 <30229cfe-b395-4d0f-81ef-eb780ac26599@lunn.ch>
 <512b77d5.993b.19eed207fc9.Coremail.lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <512b77d5.993b.19eed207fc9.Coremail.lizhi2@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_005320_125098_416998E0 
X-CRM114-Status: UNSURE (   7.61  )
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

> I'm preparing a v9 of the series. The next revision will address the
> issues reported by Sashiko review, mainly DT binding schema and DTS
> warnings.
> 
> Before I post v9, I'd like to check whether you have any concerns or
> suggestions regarding the driver changes.

From what i remember, i think the patch was O.K, but i've looked at
100s of other patches since then. The commit message sounds like the
basic design is correct.

     Andrew

