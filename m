Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CFEE784BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 03:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvwP2ct7zq68s5hSfNgeL76OXBDp/GBP12sA1uxwdbI=; b=aRqq/13nJswRI3DzvQA+fVwMYU
	7iL/sOqaCrHBr8PxdPtgq6081I+YVYI9JiqT6DqbgAxrz1d+5JWF4UpalqpWJlMGk0ZU0EVpD3jjF
	fsHqFDjph0mDi4FqEe/f7oXAurxToXtXPa2RxkP10FxyQ9Ot1535DmB2FTWD2WUIkW6psRNpHuOoR
	WbszP33HPIqPNxOUhOg3XAGS5DgIjGSQf7ZCLH8u+/F1/SXqrscWzR5OXQ5KUuLhWRi+CBQGt2c8a
	lwPURfwtWTFL5fd1+LjgdZA/W04g2XXR6rOzBinNqfUlxYpH4m/+Leqo49vVAcBE1NDExw7lagB1n
	Ztr5vOoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va3po-00000003HB8-40dL;
	Mon, 29 Dec 2025 03:22:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va3pn-00000003HAy-1pc7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 03:22:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CB7A60053;
	Mon, 29 Dec 2025 03:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA0EC4CEF7;
	Mon, 29 Dec 2025 03:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766978534;
	bh=iMOwSeRjpeTdmhpbDFTXK3GxNzK21mVjxmWjTae4W0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LYvj2dcflad8dWsJ/37E/ZrG96khd1FdNl8iNIrzRLOiduGwWhNL4aLcmb2HN0Jwl
	 PYyJrsQZQh68FzIggoGUeB9E5Nh4QBkQWxY0T9LmQ0hXYvRrsGOCTd50ICrreWyYWW
	 lU2PQ3oI7zuo9i6qRxGfvfJB8n+Og0fXkA/XzhAt34z6Bu4sNfI5V4xpUTQbdkLVtB
	 Nky0fhx+WvAYYGAuiIcVXrUlYCAjARBxmCGX8eRj3jNg7Nzh9txDmOUeDlSg/hElSK
	 e6fhAldWXq/WV8xRfbQly1nC9XnQQduWMi1yzFaKUxh4s6URa/B6m7Mnx0d6r8OVK1
	 19dcYSmTq03tw==
Date: Mon, 29 Dec 2025 11:22:05 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	richardcochran@gmail.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: imx943-evk: add ENETC, EMDIO and PTP
 Timer support
Message-ID: <aVHz3aDIptmJ5llD@dragon>
References: <20251116013558.855256-1-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251116013558.855256-1-wei.fang@nxp.com>
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

On Sun, Nov 16, 2025 at 09:35:56AM +0800, Wei Fang wrote:
> This series add ENETC, EMDIO and PTP Timer support for the i.MX943-EVK
> board.
> 
> Wei Fang (2):
>   arm64: dts: imx94: add basic NETC related nodes
>   arm64: dts: imx943-evk: add ENETC, EMDIO and PTP Timer support

Applied both, thanks!

