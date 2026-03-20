Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C621099B37
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 19:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuJW3TBVNL5rt2a/+qn2HmhsvlFQt1It2fxtCdI3ujE=; b=mnFixkz0CFgeiu9OXnoDmk3Fuj
	41CnQqbyxuMb7w+AKobEu4bwpyBOXtHrIN0fyxTEChaSHg7ijCZ1Kmt+malChun5MjSB8VfN5uSCj
	FEll9FOcHbJnI8kXh3tHrbNfukcvd295P/ZC/CMhhL/O6KZjKbHJRrqlqV+ImdkeqE7r9vOotfdxl
	/BqhggyjIk7FhY9AdfLCchIgEseqs8omlzYBrWOgyf2ksiA8UNNXzq8vZBIPKlq5WW03VPiBBI5/m
	2fhg/mK6Jf1Kd38XWU8KTBQHjHj8DK8nx6ySd+WeiTLCVdHj2YEd9t3TbUgP5iIrqdiyszJCYvixQ
	tyrzXrYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3fmm-0000000DWS5-2Qx1;
	Fri, 20 Mar 2026 19:45:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3fml-0000000DWRy-1eN3
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 19:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=BuJW3TBVNL5rt2a/+qn2HmhsvlFQt1It2fxtCdI3ujE=; b=jhaB/4XVSjNMNgeNpkS6b9sryn
	OJmw5+exPiDO9ucoEEjqGov1Rp7jjTgUHwHMasErEBA/xZ7ltzDuQcjbznfB/BAshsnCMQ+OSH8qP
	UpsmoE6DRq6JUJ/KHA+TFeNd5W7n3dtTFjLcSXYOlyvOxSizovb0Cf9t+ejqfVtYkjQlhIDJTEFD+
	2lWxlDQDG4l7e42HDotbjWZpW15BfGQgGXZzIoYowkdsfeQHvDSrYnMzSPJpt5ws/x6NK1PrBwJuH
	FSdZs5tqoM2YNRj/5rYpLOa/jLdYQqPZkcciUiEAdXiFTXfl65fd20en5Y0MEpn/Xl/jLPceJXj3E
	0sKgFA4A==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3fmh-00000008HYg-1TJT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 19:45:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2D487C56692;
	Fri, 20 Mar 2026 19:45:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70AD8600E0;
	Fri, 20 Mar 2026 19:45:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 270C910450CC8;
	Fri, 20 Mar 2026 20:44:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774035905; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=BuJW3TBVNL5rt2a/+qn2HmhsvlFQt1It2fxtCdI3ujE=;
	b=YD+TfJQRAhpGsUsFY1kh5fdIAAF9CqyXudXNquKWNdbwBpGhMPzoelzjG3+WgIx5XNsL7R
	jsrKax+pF5ksGNfZTGtnPriCmgokA2WESmtTDLD5saZ86cMGE6mY0T0v0IKHJjm+oT4iC5
	VIlyiZmCWSO5Ht7EblUn8yoZeiy/9aZTxdZXshMUwpHVNZtlqz83MSRq369qjm/GU2EaET
	Wsibnb/r2t+MO1DwsDOTcmrRV6LYILCF6ynf3EmEAKmXw8wZGWho3hXuLdWZFJjAkP0+zQ
	Y/UZ3xIPm1CuqpmSs0iQ7LNDzMyC1idDAB2iD7uzaaYs0J4mrGohaPPPYS9HcA==
Message-ID: <5bfb0ca5-1618-48af-824f-07bbf7c35e9a@bootlin.com>
Date: Fri, 20 Mar 2026 20:44:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/6] net: stmmac: cleanup stmmac_xmit()
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <ab15_JvLGFtUH_3x@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <ab15_JvLGFtUH_3x@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_194527_512642_8AE54677 
X-CRM114-Status: UNSURE (   7.10  )
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

Hi Rusell,

On 20/03/2026 17:46, Russell King (Oracle) wrote:
> This series continues on from part 2 of the descriptor cleanups, making
> stmmac_xmit() more readable.
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 103 +++++++++++-----------
>  1 file changed, 52 insertions(+), 51 deletions(-)
> 

Tested the entire series on Socfpga, no regressions found, and perfs are
the same as before so for the series,

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


