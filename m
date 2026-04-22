Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0473CF9EDC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 12:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clASrg+WTACfIVmwSPZRwPOparTt2388K44CIhnQt0o=; b=rLGohQFoZFK4Fg2ZD5HD46ivOL
	PC7u1dMyk8+kdf1M1ImtjjyfEVBi4X9tNTbmla31P7Vd7rTOC6WBOjGKLhzV78jQ+7VkIdnHjpFjW
	wZVaKhJSzJsY68VblN+nYFSR9XCyiul0cPsgQXA3C3gl5CqtDjzfhV8eQIUU5VQp/fJNKzSpsfDrX
	3WgNhvkvN+3QzD/v+HDIUTreIQLEuN3mLzcjvHWhfOsdFM4IKCBDMmc9P/fxWZzDFYQ4mr5IqekiI
	I0hre+nFdLckb86VqBEs291nDys08ArszL2xPV2FhkkNW+vISY8S6xlg1QkFBUVmruzNgR0a6+eR7
	DzwJw7zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFWzh-0000000AEst-1tco;
	Wed, 22 Apr 2026 12:47:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFWzc-0000000AEqi-0AkA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 12:47:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=clASrg+WTACfIVmwSPZRwPOparTt2388K44CIhnQt0o=; b=VXhwhb/do4tzvuXj2cgIdGZQ92
	8Ecq2EzXt9SYjNlwn2KgOjZiWBkSLFhza+L7R5eO2Y0VZUzBKe2RsebYQc2QzCw0pCBOc5+V4tW+k
	z+PhS+Trd7bz8WhH9dUVhNYToI57Bo5nDEyTLKNyIzjJ7YFmjI2OsmqYPU0CChqKxKl8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wFWzS-00H1yx-2Z; Wed, 22 Apr 2026 14:47:38 +0200
Date: Wed, 22 Apr 2026 14:47:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jakub Raczynski <j.raczynski@samsung.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
	davem@davemloft.net, andrew+netdev@lunn.ch,
	kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] net/stmmac: Fix typos: 'tx_undeflow_irq' ->
 'tx_underflow_irq'
Message-ID: <f1d51362-ca8f-481a-b9c1-400ab6422686@lunn.ch>
References: <CGME20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6@eucas1p1.samsung.com>
 <20260421115008.2690541-1-j.raczynski@samsung.com>
 <7eb9e4d4-909c-4203-833d-bd8b664fdfbc@lunn.ch>
 <aeiJ3zr4WJAm1UCk@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeiJ3zr4WJAm1UCk@AMDC4622.eu.corp.samsungelectronics.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_054748_075066_4891D825 
X-CRM114-Status: GOOD (  11.87  )
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

> I don't see anything wrong with it?
> - naming is correct, same as stmmac_extra_stats from common.h, as it
>   wouldn't compile otherwise
> - string length is ok, as max name length is ETH_GSTRING_LEN=32 and it is
>   not close
> - ethtool just polls data from driver and in my tests it is ok
> - all instances of 'undeflow' are changed
> - 'underflow' semantic is ok, 'undeflow' is just not correct
> 
> Please correct me if I am wrong, but imo no issues with this patch.

ABI

This name is published as part of the kAPI. You are changing its
name. User space could be looking for this name, even thought it has a
typo in it.

     Andrew

