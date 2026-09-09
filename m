Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F07BC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 11:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPBIL7xp9k71Jeokn/0hO8JzhFF0Afrctk/+t5BAEHE=; b=IP2H15z6C1P8aFirqTGrpslMVV
	eclwwR7B/j+46y49SlTBGX4ei12+ZM5RWM7KsjrZo5ahyTFAoypajot4ZNzAy6ecvTK/GwyVEOV2I
	TMNpGF5cmYeooyCYDFF6o67S5rFHvG7jPgdtq6spLdg8JysLVPhWmsifYWmWN0KIXUkwpL/QCOXaO
	zjdwG4zBMgg4iPIdH1R2y6j2I4CHK9rxFpeCN8WhjCEtEW+K1SYlUzxuVQ3V0+GcLeOj9ODHMU9iM
	sgiqWrknCHdg6imbvVohEBAYsUikv/ftUdKxS0wK7nhaAUAg6Qw32SQjXN41KXOOWQECq0okaYEo1
	EFoeOZUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GYJ-0000000BaO0-0zRh;
	Wed, 09 Sep 2026 11:33:19 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GYF-0000000BaJl-004b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 11:33:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DCBDEA91C3;
	Wed,  9 Sep 2026 13:32:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1788953583; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yPBIL7xp9k71Jeokn/0hO8JzhFF0Afrctk/+t5BAEHE=;
	b=sbRE2tYkP1k8m+7VZC/tSY0yzOQ8YBnjJnZvwjHUTlqrOFt2S+IFcDWSu6pyR+oAtqCEqa
	x8JHfGwqVz7NMO/Fod8/lA9KeBM58l3Kv5BpRWDcyWGpG4LTsKTVSnNkt4khTC6k2n6wbg
	aTbFeLXHYiMu60j+b2fSDKzQ+1bLRVFdpvnedgmYC/wZVWaVOJRZ3DIaRvr+krDKWRXhPa
	D8CPaES0bPYr1YRgt3c33kt2leHuIqp9gxrmMj0fmPTC+7dGlLE11tmNab8vm6zsuciAaY
	8Ifwj7UmXpl/WF5PZJiOq3uP+aKNCpJ0k4jx3Kq8XVhn3ITd22PEXi+8VreUVQ==
MIME-Version: 1.0
Date: Wed, 09 Sep 2026 13:32:45 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Emil Renner Berthing
 <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Jose.Abreu@synopsys.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, PKneuper@dspace.de, David Laight
 <david.laight.linux@gmail.com>
Subject: Re: [PATCH net 2/6] net: stmmac: selftests: Validate EEE based on the
 actual LPI timer value
In-Reply-To: <20260909074740.1247762-3-maxime.chevallier@bootlin.com>
References: <20260909074740.1247762-1-maxime.chevallier@bootlin.com>
 <20260909074740.1247762-3-maxime.chevallier@bootlin.com>
Message-ID: <2f268c9ff187ba59f69d37dd4e4ba99b@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_043316_780849_475B4756 
X-CRM114-Status: GOOD (  21.05  )
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

Hi Maxime

On 9.9.2026 09:47, Maxime Chevallier wrote:
> The EEE selftest is a 2-step test :
>  - It validates that we enter in LPI mode with the
>    irq_tx_path_in_lpi_mode_n counter
>  - It then validates that we exit LPI when sending a frame, with the
>    irq_tx_path_exit_lpi_mode_n counter.
> 
> The current state of the test lacks 2 main things :
> 
>  - We don't know exactly when was the previous frame sent (it's from 
> the
>    previous selftest)
> 
>  - The timeout is hardcoded, while the LPI is entered after a
>    user-configurable delay. On top of that, the timeout loop uses a
>    pre-decrement iterator (--retries) that actually only iterate nine
>    times, so 900ms while the default LPI value is 1 second.
> 
> Let's therefore make it more deterministic :
> 
>  - Send a frame at the beginning of the test
>  - Wait for more than the lpi timer value, we timeout after about twice
>    the value,
>  - Then send another frame, and verify that we do go out of LPI, also
>    with a timeout.
> 
> Note that the test's goal isn't to validate the LPI timer value itself,
> only that we enter/leave LPI mode.
> 
> Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  .../stmicro/stmmac/stmmac_selftests.c         | 33 ++++++++++++++-----
>  1 file changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c 
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> index 6503678b646e..4564b9f29194 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c

> [...]

> -	memcpy(initial, &priv->xstats, sizeof(*initial));
> -
> +	/* Send a frame, then wait to enter LPI */
>  	ret = stmmac_test_mac_loopback(priv);
>  	if (ret)
>  		goto out_free_final;
> 
> +	max_duration = usecs_to_jiffies(2 * priv->tx_lpi_timer);
> +
> +	memcpy(initial, &priv->xstats, sizeof(*initial));

Is the LPI entry already counted here? AFAIU with tx-lpi-timer=0 on 
dwmac4 the
MAC goes directly into LPI after the frame, before 
stmmac_test_mac_loopback()
returns. The loop below would time out although LPI is working.

Snapshot before the first frame, and take a second snapshot right before
the second loopback for the exit check?

> [...]

> +	memcpy(final, &priv->xstats, sizeof(*final));
>  	if (final->irq_tx_path_exit_lpi_mode_n <=
>  	    initial->irq_tx_path_exit_lpi_mode_n) {
>  		ret = -EINVAL;

nit: -ETIMEDOUT here as well, to match the entry check?

Thanks
Nicolai

