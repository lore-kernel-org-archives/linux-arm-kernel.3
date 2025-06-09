Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660E5C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 09:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joBlEjrgr9muiP0UDjGGGTEJ6Vs1HF+Fy4q2Nr/4iJc=; b=EnujvbYMvrxjKgljDrY9678QQk
	MyT2PV+bg1zKWHB/9dCHRFLyxSzBHOCN9iK4EikuaVf/L34eg9P7aas3hVXx4xPv9FUqaAmJMefUW
	rH9pdk05H7iDnkqRxZciDMLxB6gOssyF1AfucIyNF/EZUa5PGSZiNuNnKFj727b2hv2hXlL8RJJmJ
	FKrR70zwwyN0ib08mpknebYF0MHvIX/bb9ex6jE3RzI/lrGt96XCNl/kKLPeBTQ19tiNFIlxm3TYx
	a++KwzzS9WuH76oma6zOVhWszc0Y2igzNBrtm/hW9oEBziioT+k2wpxsLfY4Ay3XvL1KzQzkc6DZ7
	fbO+TIKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYeR-00000003kVT-1Ywv;
	Mon, 09 Jun 2025 09:18:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYSQ-00000003jKq-3Hnh;
	Mon, 09 Jun 2025 09:06:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=joBlEjrgr9muiP0UDjGGGTEJ6Vs1HF+Fy4q2Nr/4iJc=; b=d2TvmF6njbZP0r8VPzRz1pdgRw
	D0cGitUZxFqVoVAdpgEyLxt/bO6IhuzyPF1TWutbiciAOvR1zlTJB5b59Df0npsAiZseMTfbPsG5j
	f3hBHLG5LFVosHfH9fARI9OzCu93O3Wb7VnQow+eoxZa7MFsP3qwy+FQnzg5NI2faW/ibEjapB3ro
	6qJsxwqPcvAdy6AKnabOX1lRjHyO8/x+gUoWzT+vp3vz7COQwC2tRYN/dCQTxxwWpORh3+JVWfkls
	K5V0iUGo1JOOPeX3rP9NnQTrEJ7Lmw9cqSQZ0VCKrsprZzag7Rd+nGhz1GqPwYDZXFTvWrzZkWnqg
	ZbQJZ44A==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOYSI-0005iM-T1; Mon, 09 Jun 2025 11:06:10 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: i@chainsx.cn, Hsun Lai <i@chainsx.cn>
Cc: andrew@lunn.ch, conor+dt@kernel.org, devicetree@vger.kernel.org,
 inindev@gmail.com, jonas@kwiboo.se, krzk+dt@kernel.org,
 krzysztof.kozlowski@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 quentin.schulz@cherry.de, robh@kernel.org, sfr@canb.auug.org.au
Subject: Re: [v5,0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Mon, 09 Jun 2025 11:06:10 +0200
Message-ID: <2607600.Icojqenx9y@phil>
In-Reply-To: <20250602153500.1831349-1-i@chainsx.cn>
References: <20250530031046.166202-1-i@chainsx.cn>
 <20250602153500.1831349-1-i@chainsx.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_020618_817688_74F0C289 
X-CRM114-Status: GOOD (  10.96  )
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

Am Montag, 2. Juni 2025, 17:35:00 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Hsun Lai:
> > I tried to replicate on top of master=20
> > (24de2b9da3e28df323c1e096538ae1e035751adf) but couldn't, so I guess we=
=20
> > can simply ignore this warning?
>=20
> Yes, the same situation occurs here,
> and it has already been answered by Heiko St=C3=BCbner(#2):
> https://patchwork.kernel.org/project/linux-rockchip/cover/20250516012402.=
580468-1-i@chainsx.cn/

Now with 6.16-rc1 out, this should disappear.

But I'd assume that bot check might have moved the binding out of the
review queue of the dt-maintainers, so I guess you might try resending
the series on top of that, because we're missing an Review/Ack on the
binding.


Heiko



