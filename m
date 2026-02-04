Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7485EA7944
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 19:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlx7imhS8egX26fBI66YJcapLdUQv4lJsXpksytMu7E=; b=Wt+4l7EQYF8dXCy32Hyypr435r
	iszg2dM71prcg/ZmZSUw95ylzC0XfvKNtcXqsyvX+0o0DO5ZfJ5u+dTPDe6Rtvgm4RtQzOU7/Cybg
	futVlAznsTEi0xKd4/s9EDoP82QpjHQtVrdDQGb7mEbUA3EJpzkEpEYEz7ns0wlOVdAOokb7JjMW2
	Ahlyvh62sZI/0DhJZBVkbSyIL5jRwTtNfI97IEB85ckuQK0RJdZ/O5LZN5pF+GNoWSyse4DWC8ctQ
	sPpNYX8CCM8dAuHddf7m7/jmDXYZSwW1O5cWWbapqNfqNqPBnG2QKqzyT5nV10PU/F64/9j3F59dk
	ZVtd8bhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnj0D-000000090F4-0lSo;
	Wed, 04 Feb 2026 19:57:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnj0B-000000090Ee-0Ws2;
	Wed, 04 Feb 2026 19:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=xlx7imhS8egX26fBI66YJcapLdUQv4lJsXpksytMu7E=; b=dIvU9IvgO3p2j6fNWBS7K6IHZu
	SXBMK7cCzcttVrJkGOcvsIiSmsyVXNcr8tiQo8l+3bmQ5dhW+Q6qf6C+C1gK5btrMOVy59fLjJEyt
	9pEbloNKFVhF+TAMbfK9Wv0D1EuIdPJ1kdkOKNb8QhjvmQP0OdeBZ35dAsBAo+NXQyle4KkI5C1cH
	vFRFzfFk2I+z66IlowQ6TnkbNrH+lfdd4EmwlYixiY0oXv3UF26aAGekUlhkmiyfeYxOpwdMsgw2f
	le+XSgzInUdW8BemnIxcQmF97bpj4TkpQxUz9DWkTq2TzCs8F/ZeZpqLY3nEn/krNCtb9j9facFVo
	vCTK22eg==;
Received: from i53875ac7.versanet.de ([83.135.90.199] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vnizy-0070uw-LC; Wed, 04 Feb 2026 20:57:15 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andrew Lunn <andrew@lunn.ch>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 1/6] net: stmmac: rk: introduce flags indicating support
 for RGMII/RMII
Date: Wed, 04 Feb 2026 20:57:13 +0100
Message-ID: <3535226.C4sosBPzcN@diego>
In-Reply-To: <E1vnYxl-00000007hol-3XiH@rmk-PC.armlinux.org.uk>
References: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
 <E1vnYxl-00000007hol-3XiH@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_115727_168567_9C64C53B 
X-CRM114-Status: GOOD (  10.94  )
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

Am Mittwoch, 4. Februar 2026, 10:14:17 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Russell King (Oracle):
> Introduce two boolean flags into struct rk_priv_data indicating
> whether RGMII and/or RMII is supported for this instance. Use these
> to configure the supported_interfaces mask for phylink, validate the
> interface mode. Initialise these from equivalent flags in the
> rk_gmac_ops or depending on the presence of the ops->set_to_rgmii and
> ops->set_to_mii methods. Finally, make ops->set_to_* optional.
>=20
> This will allow us to get rid of empty set_to_rmii() methods.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de> #px30,rk3328,rk3568,rk3588




