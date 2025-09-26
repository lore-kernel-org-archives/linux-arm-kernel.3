Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57C1CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 13:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvU6KD7Ak/321B2u+fHBnh40uEfH4ng9JZ8nC2TDsf0=; b=1DAI8lQB8gW7eGO5nGr0dC+ydV
	5cvUuOdjb/aUtofVHMjswXHr33RUz7zCEZ5EG4ac6uU4X9JLN+Y9ph2bzuxBAkc1bSrJGv+NdMauL
	gDib/yS7cVYUEt+Zt6PZvnPR+5I91LMs14dYkUXPNhEDMJyctXZjBOg7sP3kE4sJNbJQ7+RcvyNRp
	BBOKfPi3FRuHdU/aKL0ToeAHBh8i70zdc8M0Ro18IawaKB8FMRdNzCh92nuIFVXVofpEsd3J7MJHx
	dTYaCP3guLuDC38jqrpr6LoCd/o+IvAFHouCZM4zWZTxW1C7A9HvSm7HQhSwP+rhOmE33Lk9Znjpb
	0qfVXfCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28HA-00000001TGK-0Tyc;
	Fri, 26 Sep 2025 13:14:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28H6-00000001TDU-3daq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 13:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kvU6KD7Ak/321B2u+fHBnh40uEfH4ng9JZ8nC2TDsf0=; b=bAxUBVmsN253AhMCtPQUHqMIq+
	QGk3woA5i14j6ZrLUoOzYYFzdnqQnmpMo/GKyccGGnv01zquk9TOyvQQeNGR+yVcs9l/5+ibX2SjH
	AAw+jHRo/K961zgv5jmm2OgLlSQjsgPiwYTbjpFD4GAP7k5cnPb/WbCOMeR7s8jdTMak=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v28Gt-009Z4n-OX; Fri, 26 Sep 2025 15:13:59 +0200
Date: Fri, 26 Sep 2025 15:13:59 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Parvathi Pudi <parvathi@couthit.com>
Cc: andrew+netdev <andrew+netdev@lunn.ch>, davem <davem@davemloft.net>,
	edumazet <edumazet@google.com>, kuba <kuba@kernel.org>,
	pabeni <pabeni@redhat.com>, danishanwar <danishanwar@ti.com>,
	rogerq <rogerq@kernel.org>, pmohan <pmohan@couthit.com>,
	basharath <basharath@couthit.com>, afd <afd@ti.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	netdev <netdev@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	pratheesh <pratheesh@ti.com>, Prajith Jayarajan <prajith@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>,
	srk <srk@ti.com>, rogerq <rogerq@ti.com>,
	krishna <krishna@couthit.com>, mohan <mohan@couthit.com>
Subject: Re: [PATCH net-next 0/3] RSTP SWITCH support for PRU-ICSSM Ethernet
 driver
Message-ID: <383e4a23-447e-4024-8dc9-fc52ea209025@lunn.ch>
References: <20250925141246.3433603-1-parvathi@couthit.com>
 <0080e79a-cf10-43a1-9fc5-864e2b5f5d7a@lunn.ch>
 <773982362.433508.1758892145106.JavaMail.zimbra@couthit.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <773982362.433508.1758892145106.JavaMail.zimbra@couthit.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_061412_901407_A4F84FF8 
X-CRM114-Status: UNSURE (   8.88  )
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

> No, this patch-set applies to both STP and RSTP. The driver and firmware
> responds to the port-state transitions and FDB operations through the
> standard Linux switchdev/bridge interfaces, with no STP/RSTP related
> logic executed in driver/firmware.
> 
> We referred to RSTP in the commit message as it is our primary use case
> and it implies support for STP as well.

I would not say RSTP implied STP, because the higher level
implementation is very different. You need to know the low level
details to understand they use the same driver API.

Please generalise the commit messages, mention STP as well as RSTP.

Thanks
	Andrew

