Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75588C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 09:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:In-Reply-To:References:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5iKiuSrkfFW1vOqMips4NeNAs+6pdJP9BoxIMXarcY4=; b=fja5zQIFCYejWaixr9Vt6cpFdg
	TIKpuu9z2KUMAem6j3sBSHiHfXW78AUWDVhSJ9aZn/tkImWtY8htinj3chNg0aNAuHk0KbMF8+4Ve
	fJ7uwGwAZ8i+7DFYmKfHA0z6iIdf7BKA+SVnNXsfpdkMFLw9uulQPcMLcUPPT6N8+Z/Ahv5VOV/yA
	8mQUNjEIMwT6R3s5ij/3ZonohqVDYSl+ynYLabFvEV/uUK7bd6rGMbJX5thLs5qOsY7+KuYXTyTP1
	WGskJLuLT4Xh/536ajigfQBxtNIu0ZvesLwiWXHuAUakP2uOX9BgUtXtOBxKkr3XgGsnB5GSkflnC
	1luM0u8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYiCg-0000000HOQU-2W8S;
	Fri, 17 Jan 2025 08:59:46 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYiBI-0000000HODo-47sb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 08:58:24 +0000
X-QQ-mid: Yeas8t1737104195t105t50410
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [36.24.187.167])
X-QQ-SSF: 0000000000000000000000000000000
From: =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 13642672395322382177
To: "'Russell King \(Oracle\)'" <linux@armlinux.org.uk>,
	"'Andrew Lunn'" <andrew@lunn.ch>,
	"'Heiner Kallweit'" <hkallweit1@gmail.com>,
	<mengyuanlou@net-swift.com>
Cc: "'Alexandre Torgue'" <alexandre.torgue@foss.st.com>,
	"'Andrew Lunn'" <andrew+netdev@lunn.ch>,
	"'Bryan Whitehead'" <bryan.whitehead@microchip.com>,
	"'David S. Miller'" <davem@davemloft.net>,
	"'Eric Dumazet'" <edumazet@google.com>,
	"'Jakub Kicinski'" <kuba@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	"'Marcin Wojtas'" <marcin.s.wojtas@gmail.com>,
	"'Maxime Coquelin'" <mcoquelin.stm32@gmail.com>,
	<netdev@vger.kernel.org>,
	"'Paolo Abeni'" <pabeni@redhat.com>,
	<UNGLinuxDriver@microchip.com>
References: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
In-Reply-To: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
Subject: RE: [PATCH net-next 0/9] net: add phylink managed EEE support
Date: Fri, 17 Jan 2025 16:56:34 +0800
Message-ID: <06d301db68bd$b59d3c90$20d7b5b0$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQJuuL6961zeRYLpn6fcQniPsxo8VLH0BglA
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MfWa+adQHcquLmZRJwDoXE8Ue6YA3vC/4W6ziW+MDCRi4Pfd9dSQWLio
	Podm3GN7YNzzipmJI6CmnykVAe7xd8vRRaVp7vBmXfqy+cUwxyGrXlSOqbvNL9ZLaaqwOEi
	veZadcT48AQEjE1Xdeykj3EAlmD58M28QxXQ+lQJXo0ZwOo8WhigAOqY856zZoEAew3enQd
	ms22YLHwvO1GuBsEvU9USVr6G0WEkA7RN3gqI/kiOQaoOFUa5vlE/zirdzdbZqGtkGjSN3L
	IOoOt9ELmZvHIEMQLrN1uWDq/zKt/p6S6TKnDjfjVzVpOkZIuWEO4x7U0KDpAy/nZlZvB5J
	9oxgYb1drRG5I4uTXFOlaVdrUtFM1LJHletlojH8cgcd9VUEQawKPFAKGNqlW3nzH29BXEF
	tN8Ilw6rVt+LKVDGAUUfZBlphCDa2LS7EJCdR+4lok3yVyDF681X5S9FMglKNCCHS7U8Yw0
	oUWmUJGRhCm4d9OBxRWq9eKX9LHrVA5BRS9iTWHy1GMWnP6e5fhDZ5DxkfERsiMutEOZABH
	2XWvMCEJZ0MgNSBjBNG338oF2G9eQZCM1qIbMkJUOfBPZpDVbAXfU96UOfwWgI4OmEgpYP7
	MJ6argvuV2xInrw6D6Do6Ljz1nBAuo7I8Bnjb91qxm2ZYKJQkRewxtuPvet0yzH8KH9cLPz
	8FkkczTXA0YyuFMYJD4c82G1zmctA0ru8Pw0+3AMFDBDb5K8eXP7McIqLc8qRtl6qn/Ny/A
	F9NVQHH61tDzhlv5ywoBmHnsY7tH1Cm3QoSIgxazFnpVdaWmwQbg28ADB1VD5aocdhb3Pvc
	SFt/drIa/kNx+8sGijd2A4JF2MinwgawgkXfMMV3rM4kK0f9NM43mA6g/Nz5wtdai/BEcdh
	K3l7aoQwUk4ZwUyoFilRVAPmVlw+KWf4Tf6uYdjajrSIUGOHz5Ff+imcJR4owkFamdAeKVl
	o5VB8RIRH3AV06ifXS6N94sbSsGg/ZVgsZ60TkNWzRS0XXDZnfHR/5UmmpvJ5P00pGQo=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_005821_887684_E4159320 
X-CRM114-Status: GOOD (  24.84  )
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

> Hi,
> 
> Adding managed EEE support to phylink has been on the cards ever since
> the idea in phylib was mooted. This overly large series attempts to do
> so. I've included all the patches as it's important to get the driver
> patches out there.
> 
> Patch 1 adds a definition for the clock stop capable bit in the PCS
> MMD status register.
> 
> Patch 2 adds a phylib API to query whether the PHY allows the transmit
> xMII clock to be stopped while in LPI mode. This capability is for MAC
> drivers to save power when LPI is active, to allow them to stop their
> transmit clock.
> 
> Patch 3 extracts a phylink internal helper for determining whether the
> link is up.
> 
> Patch 4 adds basic phylink managed EEE support. Two new MAC APIs are
> added, to enable and disable LPI. The enable method is passed the LPI
> timer setting which it is expected to program into the hardware, and
> also a flag ehther the transmit clock should be stopped.
> 
> I have taken the decision to make enable_tx_lpi() to return an error
> code, but not do much with it other than report it - the intention
> being that we can later use it to extend functionality if needed
> without reworking loads of drivers.
> 
> I have also dropped the validation/limitation of the LPI timer, and
> left that in the driver code prior to calling phylink_ethtool_set_eee().
> 
> The remainder of the patches convert mvneta, lan743x and stmmac, and
> add support for mvneta.
> 
> Since yesterday's RFC:
> - fixed the mvpp2 GENMASK()
> - dropped the DSA patch
> - changed how phylink restricts EEE advertisement, and the EEE support
>   reported to userspace which fixes a bug.
> 
>  drivers/net/ethernet/marvell/mvneta.c             | 107 ++++++++++------
>  drivers/net/ethernet/marvell/mvpp2/mvpp2.h        |   5 +
>  drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c   |  86 +++++++++++++
>  drivers/net/ethernet/microchip/lan743x_ethtool.c  |  21 ---
>  drivers/net/ethernet/microchip/lan743x_main.c     |  46 ++++++-
>  drivers/net/ethernet/microchip/lan743x_main.h     |   1 -
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  57 +++++++--
>  drivers/net/phy/phy.c                             |  20 +++
>  drivers/net/phy/phylink.c                         | 149 ++++++++++++++++++++--
>  include/linux/phy.h                               |   1 +
>  include/linux/phylink.h                           |  45 +++++++
>  include/uapi/linux/mdio.h                         |   1 +
>  12 files changed, 446 insertions(+), 93 deletions(-)

Hi Russell,

Since merging these patches, phylink_connect_phy() can no longer be
invoked correctly in ngbe_open(). The error is returned from the function
phy_eee_rx_clock_stop(). Since EEE is not supported on our NGBE hardware.

How should I modify the ngbe driver to meet this change?

Thanks.




