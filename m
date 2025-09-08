Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E65CAC58B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 19:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1oX2n1bcYACr1d/N5jIcG0TvrSxDp22BmGSY57OfoI=; b=F0QEBslZ+86V6YIBt5XmIdjXDG
	ki+rgSkGwWYBzTVD9nQI/Mk1To52FF06sPdxXtEgahtTBP+pxhaJnAgI5ip7ikWJzGTjmjBHsjK80
	WU8/Cq0AroSBFwjLQuOSPep1/vsk0KJzYGXSaH63hitmalAhU858hIt8TAW2YO+ecoHsEhEWB4wWS
	Za2l7lpbTm7lpYTxpVE5eFLhXEYImgM68whftcgFkurUo5uvkoccI2U4TX5vwVDqjti+I+YpjvSDF
	m/nXBuOqEhJ9lu3oE9P/yx6GKd337Y0wWF2nd0KU2awiolCZZ6bzqpscir3n436mo5TWLvZ2nXfRB
	iUURtbug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhYu-00000001tV7-2kxT;
	Mon, 08 Sep 2025 19:30:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uveex-00000000jCr-3c1O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=y1oX2n1bcYACr1d/N5jIcG0TvrSxDp22BmGSY57OfoI=; b=JrNMT+uHKuZLPfW4kbs+t7RVQC
	4CN4RCqpBUBunLv3rKz7wvuR4akU+wLbt2OfJ/kSBXFZmSzTfn0NOi1UbG+uHsTHSPwmvnet90NP3
	dJQbLN/X/AOktre/hIR0zBPSu022O6nhOaXdI3PMHIgX3qeje7U/4GDyGXuS5BwfqW4A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uveem-007gjr-L4; Mon, 08 Sep 2025 18:23:52 +0200
Date: Mon, 8 Sep 2025 18:23:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"moderated list:ARM/CAVIUM THUNDER NETWORK DRIVER" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2 net-next 1/2] net: thunder_bgx: check for MAC probe
 defer
Message-ID: <7580c3a8-d502-40a7-868e-838d5fd44e8d@lunn.ch>
References: <20250904213228.8866-1-rosenp@gmail.com>
 <20250904213228.8866-2-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904213228.8866-2-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_092403_898983_975AA6B5 
X-CRM114-Status: UNSURE (   8.36  )
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

On Thu, Sep 04, 2025 at 02:32:27PM -0700, Rosen Penev wrote:
> of_get_mac_address supports NVMEM, which can load after the driver.
> Check for it and defer in such a case.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

