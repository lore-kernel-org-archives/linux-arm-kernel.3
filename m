Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E481DC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 00:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRxt5bNcq0KFIUWWDk++WfM7/w774UvMYZBKcqgvy0I=; b=nUsVPAFIbBTQetI+rRflSu6yFH
	KtPl08UzhpfjVO4DBtQG4BVzkn9K3CAyTdiPIr8iA9AU+91Ezgn+h6dh7OhPi3bSqcBqM1aVOU6bm
	wfBLtWcsY77LJU4gbD19341Y5l1JTLsP3yAbVRIxqJU2f/nK1wWmHSxaTln2j/AUbybefcp8QKl1r
	xPiQdX5m9rCiU7kstwQFE/EPShzVOk6euCbwJsB8TTfrwWYqB2ayQXbEEC+fNWgEjkr7/C4pbPnWJ
	Q8aeXudfWiOLOjOa1nlVKKVEkXw3o1eefPp0o2vXgsLo14SwFuA6ml0DasNgZ7S9MyudLoaR3Zwqk
	K5rCB3NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2d3T-00000003SXb-13P1;
	Fri, 04 Sep 2026 23:10:43 +0000
Received: from mx3.wp.pl ([212.77.101.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2d3P-00000003SWn-2kre
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 23:10:41 +0000
Received: (wp-smtpd smtp.wp.pl 34823 invoked from network); 5 Sep 2026 01:10:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1788563432; bh=lRxt5bNcq0KFIUWWDk++WfM7/w774UvMYZBKcqgvy0I=;
          h=Subject:To:Cc:From;
          b=StFo6qBCk9liGPIDwPPaCtirR2jKHG17SjZxdPCWETy2h5Hpueb6BCkagSTAxIcaK
           OCiXAXBEaDa/TYHbQxj8WGmdircS+zhgGg1VaG6/RN0h6FzwhRUrCcF72WRrBG6OXu
           tO96MOkgrG5SMO6TUzXxuyVWFX5HSjFM/FoNNZOa7mlk1owpqNqee6pjBinYRJSnYU
           ebg+su43J6t5qRg1JFjFY/itkIAMT6gMk0cxSyUEH4r3BXtbeENHJoIJcyNGR+Lsbz
           OTNQvslzo1v8WlhuUpT9pCb93YXOZAQXjTE4hXVcS92J7uP9YR2OsIA3BMNqt6MzmC
           11mblWPVRzDSQ==
Received: from [192.168.3.224] (83.5.244.153.ipv4.supernova.orange.pl [83.5.244.153])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <f@lex.la>; 5 Sep 2026 01:10:32 +0200
Message-ID: <780c9e93-ca6d-4481-8709-c8e5058f0073@wp.pl>
Date: Sat, 5 Sep 2026 01:10:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v5 1/2] net: dsa: mt7530: populate lpi_interfaces to
 fix EEE support
To: Aleksei Sviridkin <f@lex.la>, chester.a.unal@arinc9.com,
 daniel@makrotopia.org, andrew@lunn.ch, olteanv@gmail.com, nbd@nbd.name,
 lorenzo@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 vladislav.karmanov.dev@gmail.com
Cc: linux@armlinux.org.uk, dqfext@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260903123644.23800-1-f@lex.la>
 <20260903123644.23800-2-f@lex.la>
Content-Language: pl
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <20260903123644.23800-2-f@lex.la>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-WP-MailID: d74ba4342b350b5adcc9cf718c4b901b
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [MeKM]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_161040_158201_DEDFD439 
X-CRM114-Status: GOOD (  30.65  )
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

Hi Aleksei,
I'm a little confused by this patch. At the same time, there are patches
floating around mailing list to disable EEE on the MT7530 PHY[1]. Does
the EEE work, or is it broken?

1. 
https://patchwork.kernel.org/project/netdevbpf/patch/20260904202800.3410838-1-vladislav.karmanov.dev@gmail.com/

Best regards,
Aleksander

On 03/09/2026 14:36, Aleksei Sviridkin wrote:
> phylink_create() decides once and for all that a MAC supports managed
> EEE, and it requires the tx_lpi ops plus non-empty lpi_capabilities and
> lpi_interfaces. mt753x_phylink_get_caps() leaves lpi_interfaces empty.
>
> So ever since the conversion to phylink managed EEE, ethtool has
> answered "Not supported" on every mt753x port, and phy_disable_eee()
> has locked userspace out of turning EEE on. That undoes what
> commit 06dfcd4098cf ("net: dsa: mt7530: fix enabling EEE on MT7531
> switch on all boards") arranged: EEE off by default, but reachable
> with ethtool.
>
> Leave the speeds above 1 Gbps out of both bitmaps. PMCR folds
> SPEED_2500 and SPEED_10000 onto PMCR_FORCE_SPEED_1000, so
> PMCR_FORCE_EEE1G would govern LPI on such a link, and that is
> unvalidated rather than known unsupported: MediaTek's SDK driver sets
> the EEE force bits for 100 Mbps and 1 Gbps only, and the unit of the
> wakeup timers is undocumented with the port clock at 2.5 times the
> rate.
>
> LPI stays off until userspace enables it, but the EEE advertisement of
> a PHY that advertises it out of reset comes back, since phylink stops
> force-clearing it.
>
> Fixes: 9cf21773f535 ("net: dsa: mt7530: convert to phylink managed EEE")
> Signed-off-by: Aleksei Sviridkin <f@lex.la>
> ---
> Ports that support neither 100 Mbps nor 1 Gbps are skipped because on
> MT7988, EN7581 and AN7583 port 6 is 10 Gbps only and shares
> PHY_INTERFACE_MODE_INTERNAL with the user ports, so the interface mask
> alone cannot tell them apart. MT7531's internal PHYs keep the
> advertisement mt7531_setup() zeroed and EN7528 keeps both bitmaps
> empty, so EEE stays fully off there.
>
> Two pre-existing things this patch makes live, neither addressed here:
>
> - The unit of LPI_THRESH is still unspecified, as the comment above
>    lpi_timer_default says. Before the phylink conversion
>    mt753x_set_mac_eee() wrote tx_lpi_timer into the field directly, so
>    the raw unit has always been what ethtool showed on these ports.
>
> - mt753x_phylink_mac_enable_tx_lpi() sets the PMCR force-EEE bits
>    without checking the resolved speed or interface, relying entirely on
>    phylink never calling it above 1 Gbps. A check there would make the
>    driver robust independently of lpi_interfaces being right.
>
> v2, with the full argument for leaving the higher speeds out:
> https://lore.kernel.org/netdev/20260824024117.46154-2-f@lex.la/
>
> v4: lpi_capabilities is mac_capabilities masked to the two speeds
> instead of both asserted. Every port that reaches the guard today has
> both speeds, so nothing changes; it only stops the bitmap from claiming
> a speed a port cannot link at.
>
> v5: comments cut to one line (Maxime Chevallier); no code change.
>
>   drivers/net/dsa/mt7530.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 2b7be091c056..3e61eb3c2b1e 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -3172,23 +3172,31 @@ static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
>   
>   	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE;
>   
> +	priv->info->mac_port_get_caps(ds, port, config);
> +
>   	/* The EN7528 GPHYs report EEE capability, but negotiating EEE with
>   	 * common link partners (e.g. Realtek GbE NICs) results in an unstable
>   	 * link with dropped frames. Leave the LPI capabilities empty so that
>   	 * phylink disables EEE on these PHYs and refuses to enable it from
>   	 * userspace.
>   	 */
> -	if (priv->id != ID_EN7528) {
> +	if (priv->id != ID_EN7528 &&
> +	    config->mac_capabilities & (MAC_100FD | MAC_1000FD)) {
>   		u32 eeecr = mt7530_read(priv, MT753X_PMEEECR_P(port));
>   
> -		config->lpi_capabilities = MAC_100FD | MAC_1000FD | MAC_2500FD;
> +		/* LPI above 1 Gbps is not supported */
> +		config->lpi_capabilities = config->mac_capabilities &
> +					   (MAC_100FD | MAC_1000FD);
> +		phy_interface_copy(config->lpi_interfaces,
> +				   config->supported_interfaces);
> +		__clear_bit(PHY_INTERFACE_MODE_2500BASEX,
> +			    config->lpi_interfaces);
> +
>   		/* tx_lpi_timer should be in microseconds. The time units for
>   		 * LPI threshold are unspecified.
>   		 */
>   		config->lpi_timer_default = FIELD_GET(LPI_THRESH_MASK, eeecr);
>   	}
> -
> -	priv->info->mac_port_get_caps(ds, port, config);
>   }
>   
>   static int mt753x_pcs_validate(struct phylink_pcs *pcs,

