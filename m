Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96277D3EE66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 13:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XzxhA+Nhy4ZZx54Vy5qeNF2xnFTY+RX8ZG6FavNryCY=; b=hrFum3Mx//Yc4ewwAfJ1rp8M9F
	B+TI/9hlM9dycBkMCPjYpcSukxQ1vAu3DYC3Cxa84Txqg5bc6oJPzUEd/T515Jcwb9CMoQPkDUFZl
	1Y4gK2MJU2pQ2ln5En30862rNSs+a4A7Vc1foU2wL/2Go2zQGhyPQ3uFH2iAC5sLaNpswTtNumGjL
	66x7lWzpozQ8iiMlCFs6bt+Oqa5A8reVI/1ftxB9AwX+YZ7gaC338+fPvfkfg5qf79rnasl3Q7lOg
	R68Xt4ecE/q0Q4UbhsOAfH8Hys2mookVqFkmD9NWaQIQ6ZC0q8iCMr5W3N+NwU5tEoiVm9mqkr80O
	xK/K5+5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viunn-000000079jk-3w3p;
	Thu, 22 Jan 2026 13:32:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viunl-000000079jH-1egZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 13:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XzxhA+Nhy4ZZx54Vy5qeNF2xnFTY+RX8ZG6FavNryCY=; b=1gs/ABcO4f/fJ6sCte6yUQLW54
	F6qevsqoMUi7OHuNNKGuSsNSO0rS9J7tXfCVx5OEI/b08ghbKlloonMqBowJ+b5Z3DwW+Aqp0MnW+
	Xta7d8k3Mnx9TT69ws036tzVSHmsU3hVBpYUv3X10LHOR8A8SqTKQpmQwG7oYP+kiIAE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1viuna-003ybI-MC; Thu, 22 Jan 2026 14:32:34 +0100
Date: Thu, 22 Jan 2026 14:32:34 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: Re: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock
 sampling control
Message-ID: <59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
 <308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_053245_432995_0A0F07AB 
X-CRM114-Status: UNSURE (   7.83  )
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

> On EIC7700, RXC and RXD experience an internal skew before reaching the
> MAC. At high speed, this can shift the effective sampling point by
> approximately half a cycle, causing the MAC to sample the wrong nibble
> on each edge.

You say internal. So the skew is fixed, it is a property of the
silicon? If so, why a DT property? Why not just hard code it in the
driver? Since it is internal, different boards should not need it set
differently?

	Andrew

