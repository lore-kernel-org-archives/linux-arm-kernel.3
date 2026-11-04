Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2AB606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 07:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t2qcv5pF;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lVsptOrK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FwddSV8gjKPLCgQSFLRj949WDVGR/jN2Co6X4wj9CHE=; b=t2qcv5pF1SnJ0P
	4hG8ZQxh3PLs/GSyzSnT1o0bh9Mf3uBbiQ1QODw0e6GcnmExzyGBeRT9CPhCKZio4g73TVRdF4bdp
	0VuqINKuhjDdnAfiE8aneH0VrWofPB0OBNKO1rgpFk0+4TkRi5OjVH2cLfOg+8Ex6TRoEgEVphX01
	b1YPTjE+0olKpRUyo+raiiqVZgBd0DwDrFAqjpciXCZEY/FIkTZkZae2lkwe1iqUjmmV6DXOKcTXQ
	CVcDmnY7X8ExFJ9BCBjCfSXCnVyOy48LayKokTfUNm6c4SaGkX4NrHb9jzmPbNTe6PTBot9UqDmI2
	/4wHTmM0GBFpJXsh5D9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVts-00000004dDy-0SZ4;
	Wed, 04 Nov 2026 07:59:17 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVtm-00000004dD7-4833
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 07:59:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8C4F91A1452;
	Wed,  4 Nov 2026 07:59:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E22460770;
	Wed,  4 Nov 2026 07:59:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D3A9103291CE;
	Wed,  4 Nov 2026 08:59:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793779146; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=FwddSV8gjKPLCgQSFLRj949WDVGR/jN2Co6X4wj9CHE=;
	b=lVsptOrK1Zz3jAzDZnQknIIQ56jf3OxAnl47CL/Gf9A13kNPIuuNDyelE8xn4n3Bftm/gv
	tjvzyR38gj0OTgMwS4euoaQnuomvxU4awLnb7fWIDD0EacgP1pMsB2NGTQf1xKEasEmPAx
	PPzgqj+y4UkXegTSv4jx9a3g2KHqnBwWBMVATy4dLXlkqNzqbO9UA+wtUngiIhZr5CvaRa
	JOIBTpQ9zbbSYQspKcWXrEHkyhdLOuLtllkGbbh9PSpgpvoZBU8/O1Xma/2+cVLl7Nzz7j
	XqS6Kyjs+/f/ZMIBC0/AkVlLGwlnJAthIvt2/Q1HoCIowxMa6YJwF9W3BJ81iw==
Message-ID: <963ddb89-fada-4340-b767-285ce9362d1e@bootlin.com>
Date: Wed, 4 Nov 2026 08:58:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/2] net: stmmac: Add the Siflower SF19A2890 glue
To: joseph@telaak.dev, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Chuanhong Guo <gch981213@gmail.com>, Russell King
 <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_235911_178418_97FA2581 
X-CRM114-Status: GOOD (  24.48  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Joseph,

On 11/4/26 08:22, Joseph Telaak via B4 Relay wrote:
> The Siflower SF19A2890, a MIPS SoC for home routers, has a DesignWare
> GMAC 3.73a. Its interface type and RGMII clock delays are set in a
> small configuration block next to its clock and reset manager. This
> series adds a binding and the glue.
> 
> The glue is based on Chuanhong Guo's driver, which read the RGMII delays
> from a factory flash cell in the delay line's own units and always
> applied them. Here the delays come from rx-internal-delay-ps and
> tx-internal-delay-ps and are applied only when those are present. The
> interface type is set through set_phy_intf_sel.
> 
> The delay line's step is not documented, so I measured it: sweeping
> each delay register over 0-255 with the link at 1000 Mb/s, the working
> windows repeat every 145 steps (TX) and 144.5 steps (RX), which is one
> 8 ns period of the 125 MHz RGMII clock. So a step is about 55 ps. The
> TX eye is about 3.1 ns wide and the RX eye about 1.75 ns; the delays the
> bootloader programs, 17 and 10 steps (935 and 550 ps), sit inside both.
> 
> On the GL.iNet GL-SFT1200 the GMAC is the CPU port of a MaxLinear GSW150
> switch over RGMII with no delays on the board; the GMAC adds both.
> 
> The MAINTAINERS entry that covers these files comes with the MIPS series
> "MIPS: Add support for the Siflower SF19A2890"; this series applies on
> its own. That entry is also why checkpatch's question about updating
> MAINTAINERS for the new files is left unanswered here.

hmm not sure this is the common practice, usually you update MAINTAINERS
along with the driver introduction. This should be part of this series.

> 
> Tested on a GL-SFT1200 with the GSW150 driver:
> - each of WAN, LAN 1 and LAN 2 links at 1000 Mb/s full duplex and
>   passes iperf3 both ways (160-205 Mb/s out, 262-273 Mb/s in, well
>   under line rate; I have not looked into where the limit is);
> - 10 GB each way through LAN 1, after which every CRC, alignment,
>   error, drop, overflow and underflow counter on eth0 and lan1 is 0;
> - 50 link down/up cycles, after which the link and traffic recover;
> - the MAC address from the factory partition, and ethtool reporting the
>   link with no PCS workaround.

no PCS workaround ? what's that about ?

Besides that, nice and simple glue, thanks ! :)

Maxime

> 
> ---
> Joseph Telaak (2):
>       dt-bindings: net: Add Siflower SF19A2890 GMAC
>       net: stmmac: Add Siflower SF19A2890 glue
> 
>  .../bindings/net/siflower,sf19a2890-gmac.yaml      | 110 ++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
>  drivers/net/ethernet/stmicro/stmmac/Kconfig        |  11 ++
>  drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
>  .../net/ethernet/stmicro/stmmac/dwmac-sf19a2890.c  | 158 +++++++++++++++++++++
>  5 files changed, 281 insertions(+)
> ---
> base-commit: 7b6ab4dbc156e2f96419715130b3d5738a306c93
> change-id: 20261102-sf19a2890-gmac-4fb4808f869c
> 
> Best regards,
> --  
> Joseph Telaak <joseph@telaak.dev>


