Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5048FCCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 01:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k56G06VhL+ssT5s3ZmRHxfaTb3QLLEmJ82I6TIL5buo=; b=42dgzsgzra8yqn9laPW30IXHTL
	g+mUMT/1bUq3niy8AHjFvUlB4OKNRH8z523KnoVDuATBTqQoHMzrA1ch/z6H7AmEeJni0sl+kMx/n
	H2Xs368h6I9/sftLlXa4RqPZRWWCyCrqQ4HRGqDzz21KwYfZ6D4+e6GyL8A1Kj5SUBZ3Iz/YF2TNq
	N69ofyPvqcRoE3sNkYZ0dvXlLRCLoh+odAciDshETbrbrZM1HBgu6j3YQWDuHl3+fnHeN0kCtNEOt
	v4iRST+yKEq7Ur70jSuaBupu37SkoIlEOXKfjybp8p25ogqd2HTvjqKPX0s7F97KywBT4TGFgZTpg
	leK6ha2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBk69-00000004kvj-1VH0;
	Thu, 23 Oct 2025 01:26:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBk68-00000004kvX-0Fsn;
	Thu, 23 Oct 2025 01:26:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C4316052D;
	Thu, 23 Oct 2025 01:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF45C4CEE7;
	Thu, 23 Oct 2025 01:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761182795;
	bh=tWLpPoCH5+m0T9D8bTmmZrdgyYAjQrhj1vJe92xH2V4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kPHi4rNsjNNgojJZjnHJvM3QdbWDXlEWQIABex9ix1ehpdbfQoaV1JqeGOKz7gQYg
	 qzqewwiU8PN6M2/zcosndWhepuJ0vFVm1bk9yiJYNhYANfnKhbLNoUK5WY57YI8kgO
	 zu/hkaKnx/m7BBWFlwWtq3VQoh4wObPDFJ2rNsdhHX0Nkf4Ou3Ajzt7qQF4HMJdOd3
	 EjrMtpd5+cl6JA6a0pH73A9C3kHafjDr2574dhtDaXb+9oVUfX8pB/kaR1bFnwHgxE
	 W6Y6H81pEqBJWJ7QyTvgAiWu35e9Nngojr0aLXiO7lcGZkpN5exjfEBONZ4NkCwP2M
	 rHVqc247ZGMMQ==
Date: Wed, 22 Oct 2025 18:26:33 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH 0/4] DWMAC support for Rockchip RK3506
Message-ID: <20251022182633.77f2cbce@kernel.org>
In-Reply-To: <20251021224357.195015-1-heiko@sntech.de>
References: <20251021224357.195015-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 22 Oct 2025 00:43:53 +0200 Heiko Stuebner wrote:
> Some cleanups to the DT binding for Rockchip variants of the dwmac
> and adding the RK3506 support on top.
> 
> As well as the driver-glue needed for setting up the correct RMII
> speed seitings.

Looks like its not your first contribution, feel free to add yourself
as the maintainer for stmmac/dwmac-rk.c (anyone else who wants to be
listed please raise a hand, Jonas?)

