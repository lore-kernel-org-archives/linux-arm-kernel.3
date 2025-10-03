Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758FACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iozFpFYaZKSD23+QEqnOpovnNuv86N9KGqCqWElkBuQ=; b=NZ1JYrR9kLyyU43X+TJOyvORpE
	VD8Rej52M35bLyW1LQg474NxZqQR1ITEYChHyff2Wuw9m6fPxqT+aI4PoYj02rHRB3qQv0h7i3J/8
	l9hExhTNM4FWscs+gnaxs27HUb40v4op6GVgjJtBQRhvRDGQMuArkFXH/3N3dzDPgdsmH26PjMpbh
	7coDHGLN1Wiw6z3ula2e2B5IyEj5oQDaJspMQtSpq8CkfsHDW82SurR35CDiC8EeYnvoIcj9938eG
	QbKy/xlmFDjLzDuSG1OMrDQtqEh2KR43IctCRVz2aULRyWodr7Y4oLrHjPkjIlIfpKOu+SR15rKaW
	e0wiDnGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ftt-0000000CPA3-0SZC;
	Fri, 03 Oct 2025 13:32:45 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ftp-0000000CP9h-3mYU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:32:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 919881A10BE;
	Fri,  3 Oct 2025 13:32:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F5E460683;
	Fri,  3 Oct 2025 13:32:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58A1C102F1C20;
	Fri,  3 Oct 2025 15:32:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759498357; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=iozFpFYaZKSD23+QEqnOpovnNuv86N9KGqCqWElkBuQ=;
	b=VTKAuHmtxgyujEaNC8Ewq/1KOAAytiXK67xNcu2yreVBKKikYyOTsbf7c3YclMTtFnythb
	FlUIxfeSiqWd+DfYgU5qr/PFU2trrQcO+x6wH+DftiQHcNUejrK5S63vPviYOvOWOFexdM
	kzPZqL6SszQ2S8gVPtH0ly9/T8mBDwpSUQt57Qy/AIdcAFhM5QOe4GbuoLhRxeAswfTkyM
	KGcpHMTKo+MAtzPW4zuLPZdIhxY/Irgihbm7TtV/L4MHX3ygnaWk033IGQbxe+vw1yCGgx
	qkrDHZh3/ChQRmplaxDCnnIeV+D9v5DRUzuhqOj2R2F9XGoR1Jlgv1bfBbd60g==
Message-ID: <269f9150-8977-4862-b6c1-7a8f94776c59@bootlin.com>
Date: Fri, 3 Oct 2025 15:32:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next v2 0/19] net: stmmac: experimental PCS
 conversion
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexis Lothore <alexis.lothore@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Furong Xu <0x1207@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
 Jisheng Zhang <jszhang@kernel.org>, Kees Cook <kees@kernel.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Mateusz Polchlopek <mateusz.polchlopek@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, Paolo Abeni <pabeni@redhat.com>,
 Rohan G Thomas <rohan.g.thomas@altera.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Simon Horman <horms@kernel.org>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Swathi K S <swathi.ks@samsung.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Vinod Koul <vkoul@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Yu-Chun Lin <eleanor15x@gmail.com>
References: <aNj8U4xPJ0JepmZs@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aNj8U4xPJ0JepmZs@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_063242_270381_F13C5405 
X-CRM114-Status: GOOD (  37.22  )
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

Hi Russell,

On 28/09/2025 11:13, Russell King (Oracle) wrote:
> This series is radical - it takes the brave step of ripping out much of
> the existing PCS support code and throwing it all away.
> 
> I have discussed the introduction of the STMMAC_FLAG_HAS_INTEGRATED_PCS
> flag with Bartosz Golaszewski, and the conclusion I came to is that
> this is to workaround the breakage that I've been going on about
> concerning the phylink conversion for the last five or six years.
> 
> The problem is that the stmmac PCS code manipulates the netif carrier
> state, which confuses phylink.
> 
> There is a way of testing this out on the Jetson Xavier NX platform as
> the "PCS" code paths can be exercised while in RGMII mode - because
> RGMII also has in-band status and the status register is shared with
> SGMII. Testing this out confirms my long held theory: the interrupt
> handler manipulates the netif carrier state before phylink gets a
> look-in, which means that the mac_link_up() and mac_link_down() methods
> are never called, resulting in the device being non-functional.
> 
> Moreover, on dwmac4 cores, ethtool reports incorrect information -
> despite having a full-duplex link, ethtool reports that it is
> half-dupex.
> 
> Thus, this code is completely broken - anyone using it will not have
> a functional platform, and thus it doesn't deserve to live any longer,
> especially as it's a thorn in phylink.
> 
> Rip all this out, leaving just the bare bones initialisation in place.
> 
> However, this is not the last of what's broken. We have this hw->ps
> integer which is really not descriptive, and the DT property from
> which it comes from does little to help understand what's going on.
> Putting all the clues together:
> 
> - early configuration of the GMAC configuration register for the
>    speed.
> - setting the SGMII rate adapter layer to take its speed from the
>    GMAC configuration register.
> 
> Lastly, setting the transmit enable (TE) bit, which is a typo that puts
> the nail in the coffin of this code. It should be the transmit
> configuration (TC) bit. Given that when the link comes up, phylink
> will call mac_link_up() which will overwrite the speed in the GMAC
> configuration register, the only part of this that is functional is
> changing where the SGMII rate adapter layer gets its speed from,
> which is a boolean.
> 
>  From what I've found so far, everyone who sets the snps,ps-speed
> property which configures this mode also configures a fixed link,
> so the pre-configuration is unnecessary - the link will come up
> anyway.
> 
> So, this series rips that out the preconfiguration as well, and
> replaces hw->ps with a boolean hw->reverse_sgmii_enable flag.
> 
> We then move the sole PCS configuration into a phylink_pcs instance,
> which configures the PCS control register in the same way as is done
> during the probe function.
> 
> Thus, we end up with much easier and simpler conversion to phylink PCS
> than previous attempts.
> 
> Even so, this still results in inband mode always being enabled at the
> moment in the new .pcs_config() method to reflect what the probe
> function was doing. The next stage will be to change that to allow
> phylink to correctly configure the PCS. This needs fixing to allow
> platform glue maintainers who are currently blocked to progress.
> 
> Please note, however, that this has not been tested with any SGMII
> platform.
> 
> I've tried to get as many people into the Cc list with get_maintainers,
> I hope that's sufficient to get enough eyeballs on this.
> 
> v2: numerous changes, too many to have kept track of, sorry. As one can
> see, the series has more than doubled in size. Some are not up to
> mainline submission quality, but I've included them as they give the
> full picture. b4 may be able to do a better job at identifying the
> differences between the two series than I could ever do.

I'm not sure if you're interested in a proper Tested-by tag at that 
point, but I tested that series on socfpga with :

  - 1 instance using RGMII, w/ a ksz9031 PHY, and it works well, traffic 
flows, ethtool seems to report correct data

  - 1 instance that has the Lynx PCS (DMA_HW_FEATURE[30:28] == 0)

This also works perfectly, switching between SGMII/1000BaseX dynamically 
by hotswapping SFP modules works well, no regression found at a first 
glance.

I haven't had time t take a deep look at the code itself, but at least 
it works :)

Thanks,

Maxime


