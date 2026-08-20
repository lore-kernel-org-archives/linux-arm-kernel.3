Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED07C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 14:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxlVhm2iZdvl6splt92kTKGhaPF1bkVXKJNBeMgxGvg=; b=h5YlpAU9kHcmDwG/CTmLgutPAe
	jDn5MhPcJboIXvlLgUKCedFBptht9nvbx9fTqQuPL7KMq2HPEn/mWkHFqq2qxPrlvtN4UFNkJ8mX5
	v2x0ONAHyKhvN2hWbZrZA/ydLmwLa3c97dBtCgTryWvi5RWkqDJllnZAMx6l2HUd+uOLE3UVvKbIr
	mbmCi4xAjCvRxuvJn1xMm+FV019wYCsl4LTDs+qhnlPEuoDpDNecTggyykJ3oh/LkY+7p+cszDOlV
	eXndtb6JvF7JoGAky2fJ9EOBxwP3pAxQGTSRMD/54GR1Q1h8mgAtFufNbY2qkuqI5/wi5pZW0o/PW
	yPU5Tyew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3r4-0000000BiTM-3SNO;
	Thu, 20 Aug 2026 14:34:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3r0-0000000BiQf-07gX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 14:34:53 +0000
Date: Thu, 20 Aug 2026 16:34:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787236485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rxlVhm2iZdvl6splt92kTKGhaPF1bkVXKJNBeMgxGvg=;
	b=ny1S9SmjOp9NsmmNoh0Q09yETWOdwBOilfXZtbTkRhnR7rODPyAaiH7HCuXDx1/nnu8fw+
	ekFOfRiaKLGotpX0d8+XPfnid3pxR/un1Dc5meRE0srYponRN5WL1yC1WiyHbUuQcksiLz
	9jWYvnFPRlKDk6mbo8mGfAYaD4hzaoWzsEWPGJJKaKOxoCS9WQUgxXBC7sq/Rz2KO97GaW
	emewRRneg9jlc+AJerldFZTEaU+RgQb6QWob4is03ugQJSInxHRyopYCq0RaIwFIJA64vJ
	6hDACW5iMDSBAjoA+yoRqWClovg7p9HqnXkDfV5nB4rLkyhv/+V9BXKcr67oUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787236485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rxlVhm2iZdvl6splt92kTKGhaPF1bkVXKJNBeMgxGvg=;
	b=1ZJxG6NwzDUEYTjgcDSPNZ3ftByYfwAjdMnF0ckgCPF8aiHGptGcgYtUA7AQQM/weqhabd
	h2aGVaP89BB86UAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	UNGLinuxDriver@microchip.com, Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Bjarni Jonasson <bjarni.jonasson@microchip.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, kees@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH net v3 2/2] net: sparx5: fix sleep in atomic context in
 MAC table access
Message-ID: <20260820143443.RTYj4Q3u@linutronix.de>
References: <20260817-misc-fixes-sparx5-lan969x-v3-0-c7c7fef723a8@microchip.com>
 <20260817-misc-fixes-sparx5-lan969x-v3-2-c7c7fef723a8@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260817-misc-fixes-sparx5-lan969x-v3-2-c7c7fef723a8@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_073450_222973_6592F2D9 
X-CRM114-Status: UNSURE (   8.78  )
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

On 2026-08-17 17:41:59 [+0200], Daniel Machon wrote:
=E2=80=A6
> Fixes: d6fce5141929 ("net: sparx5: add switching support")
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
=E2=80=A6
> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c b/driv=
ers/net/ethernet/microchip/sparx5/sparx5_netdev.c
> index 1d34af78166a..4dedf5d92641 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
> @@ -249,7 +254,7 @@ static const struct net_device_ops sparx5_port_netdev=
_ops =3D {
>  	.ndo_open               =3D sparx5_port_open,
>  	.ndo_stop               =3D sparx5_port_stop,
>  	.ndo_start_xmit         =3D sparx5_port_xmit_impl,
> -	.ndo_set_rx_mode        =3D sparx5_set_rx_mode,
> +	.ndo_set_rx_mode_async  =3D sparx5_set_rx_mode,
>  	.ndo_get_phys_port_name =3D sparx5_port_get_phys_port_name,
>  	.ndo_set_mac_address    =3D sparx5_set_mac_address,
>  	.ndo_validate_addr      =3D eth_validate_addr,

d6fce5141929 is v5.14-rc1
ndo_set_rx_mode_async has been introduced in v7.1-rc1.
Youngest LTS kernel is v6.18.

What would be the "fix" for the kernels v5.15 =E2=80=A6 v6.18?

Sebastian

