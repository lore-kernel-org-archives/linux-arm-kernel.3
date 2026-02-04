Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D30EA7946
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 20:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nW+unrerB/cbLtA1UiEQFladZ+My5JzDyBWzNM95keA=; b=L6nSPt8BM7oWwyxD+NsS5ze7kB
	IizEuvQ9OLS6YYb+0PdqPyH7Qbl5C+gB7v9M33GsCxl8w8joB82cQnBvXMwX/85hX0v5WIkiJ2SBC
	ntJ+Qq49QpaN0rCIXjB1P4mOyKz3yIQG0ypfp4+j7UCOisQ1FkJ32PYtAqMFZh88MZfjSr4YUY0HL
	k0SUuDgCWnFmcRyGKSKxu2QHmZj0aMTwdqlSNtPzqoIzLlmRP29dEgpYWdoo5onNPSZNyG85SlPwB
	iZ+MNPsHBVqMgFrSCaXzAR+cX/DuR7w5rGMCfwbJhoBVF96UGxFVtn/2WLU/y21rg6EuQ0VNdnF40
	m64acW9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnj3P-000000090pR-371i;
	Wed, 04 Feb 2026 20:00:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnj36-000000090lQ-0VBv;
	Wed, 04 Feb 2026 20:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=nW+unrerB/cbLtA1UiEQFladZ+My5JzDyBWzNM95keA=; b=S4THZHFtHn/WeNSsp5GmKJNsf0
	PQ+Fq2ZQZw1LopvowKkt5kOr6E8H0dCasHBSbNJC/VPXjYa5k0h8GKXBLAq9fAbGFCDpRf0UZDabU
	aZ/iz2gp6/dOWdQ/Fjnl3pYJWfEizqNx1PdMYpJvwQvZnnOmxKQpJcqRI8cx8u4wFglbckWRm1MWG
	UL3B5zNUJxfk/oncWTojuVCE2wePliVAImUZH2usufSG1lnluz/lSpmuiU748wV52rFQSfxxM6t6t
	NVM9/O6k1kfRqSdd05l8WzVr05MEB76snbtaNJVzPDnDs7aWwvHuFAeAFYiDxmYOpWaoJ7Mza9vVt
	ob1myTXQ==;
Received: from i53875ac7.versanet.de ([83.135.90.199] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vnj2y-0070wb-UO; Wed, 04 Feb 2026 21:00:21 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andrew Lunn <andrew@lunn.ch>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 3/6] net: stmmac: rk: rk3328: gmac2phy only supports RMII
Date: Wed, 04 Feb 2026 21:00:20 +0100
Message-ID: <4037444.q0ZmV6gNhb@diego>
In-Reply-To: <E1vnYxw-00000007hox-0DqH@rmk-PC.armlinux.org.uk>
References: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
 <E1vnYxw-00000007hox-0DqH@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_120032_069266_C1E9E95E 
X-CRM114-Status: UNSURE (   8.94  )
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

Am Mittwoch, 4. Februar 2026, 10:14:28 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Russell King (Oracle):
> As detailed in a previous commit ("net: stmmac: rk: convert rk3328 to
> use bsp_priv->id") rk3328 gmac2phy only supports RMII, whereas gmac2io
> supports both RMII and RGMII. Clear supports_rgmii for gmac2phy.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de> #px30,rk3328 gmac2io,rk3568,rk3=
588

Sadly the rk3328-board I have only uses the gmac2io controller.



