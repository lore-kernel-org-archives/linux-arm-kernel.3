Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FB4606A322
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 11:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=34j+y20A;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=jKNYHHxm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=siORJd7LZwDgICSKGjyivx+vmAgZhVMEqu8f43biolo=; b=34j+y20Al4o2Q1
	+rpc7y8YcAJuL1+o+1yvxy010jt6Ut68voPNISRIq2OAFG3o9qxHDsaSt8XtdJduGkyI9+GCntNxS
	N1IuYkCpzL0kgKHr//USQujpzYO/9+Y8HTfHgEiKHUYwrHQw+rZuq59rHnoucm3atJvfGWZPu4dGI
	Xz06CqiGP1gJ9BjNxL0JiacZrZtiKaetS9C3tXJWMdZe6RqKi1RMRSNG478TeI0G+w2gnTnZ+00kz
	CUYkvBRZAa8hMppb9tqYZ7p0aCMGe0ehjkRK2o+/qvNjV0OtGkzTOyP2LX74LSGXm9pIFyFGXMMG9
	JP4KHnOn7D74OHCa4r/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1WO-00000006pgX-10GH;
	Wed, 28 Oct 2026 11:08:44 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1WM-00000006pfV-2COh;
	Wed, 28 Oct 2026 11:08:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 88AA3156FED;
	Wed, 28 Oct 2026 12:08:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793185718; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=siORJd7LZwDgICSKGjyivx+vmAgZhVMEqu8f43biolo=;
	b=jKNYHHxmaC2APW0DVeupNPPz7wHexAQ7EnvAF8hRbuuPMiugJWw7ltkYK7lAd7fMF5mXyk
	pTIQZszFTsew90Dnnu+spQO5bb/5NHTB6MiWVz8Tq4FRygwp/GpnOsBAfyc4HNcAuxQWBE
	1M2zTnZgWI7NWzIKvSmzBeZbhngzRfS3CjU3B//8GhotEV+1J50qnp09KLvTUKGJmn97Gb
	zPVHK9KwXHVL4+JbRw1UJY3eQ4IQ6+Q/ruyqRsfWSZsfZFydkVAjKz3RiCbTMZFvAEQlxl
	ldUq5P1pCV9NStB6xLGl/eVM940SawUj4VDm7TaeL8IpFnitrgjDdp00bn0Ujg==
Message-ID: <18472c61-efe2-4529-971b-82d877df6b15@cjdns.fr>
Date: Wed, 28 Oct 2026 12:08:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 3/7] net: dsa: mediatek: add support for passthrough
 mode
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com,
 daniel@makrotopia.org, linux@armlinux.org.uk, arinc.unal@arinc9.com,
 Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 naseefkm@gmail.com, b.larsson@gmx.com
References: <20261028011317.1557238-1-cjd@cjdns.fr>
 <20261028011317.1557238-4-cjd@cjdns.fr>
 <734d4f06-26af-4bea-9c83-eb92c1b3b894@lunn.ch>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <734d4f06-26af-4bea-9c83-eb92c1b3b894@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_040842_952241_FCAF0B42 
X-CRM114-Status: GOOD (  17.65  )
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

Thanks for the review.


On 28/10/2026 03:15, Andrew Lunn wrote:
>> @@ -199,6 +199,9 @@ static void mt7530_port_fast_age(struct dsa_switch *ds, int port)
>>   	u32 val;
>>   	int ret;
>>   
>> +	if (priv->is_passthrough)
>> +		return;
>> +
>>   	mutex_lock(&priv->reg_mutex);
>>   
>>   	/* Flush all non-static MAC address entries */
>> @@ -970,6 +973,9 @@ mt7530_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
>>   	unsigned int age_count;
>>   	unsigned int age_unit;
>>   
>> +	if (priv->is_passthrough)
>> +		return 0;
>> +
>> @@ -1386,11 +1446,14 @@ mt7530_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
>>   	int length;
>>   	u32 val;
>>   
>> +	if (priv->is_passthrough)
>> +		return 0;
>> +
> What is actually left?


In v2 I was using special switch ops, and it looked like this:


/* No manipulation of forwarding rules allowed in passthrough mode */
static const struct dsa_switch_ops mt7530_passthrough_switch_ops = {
        .get_tag_protocol       = mtk_get_tag_protocol,
        .setup                  = mt753x_setup,
        .teardown               = mt753x_teardown,
        .preferred_default_local_cpu_port = 
mt753x_preferred_default_local_cpu_port,
        .get_strings            = mt7530_get_strings,
        .get_ethtool_stats      = mt7530_get_ethtool_stats,
        .get_sset_count         = mt7530_get_sset_count,
        .get_eth_mac_stats      = mt7530_get_eth_mac_stats,
        .get_rmon_stats         = mt7530_get_rmon_stats,
        .get_eth_ctrl_stats     = mt7530_get_eth_ctrl_stats,
        .get_stats64            = mt7530_get_stats64,
        .port_enable            = mt7530_port_enable,
        .port_disable           = mt7530_port_disable,
        .phylink_get_caps       = mt753x_phylink_get_caps,
        .support_eee            = dsa_supports_eee,
        .set_mac_eee            = mt753x_set_mac_eee,
        .conduit_state_change   = mt753x_conduit_state_change,
};


>
> Is there sufficient code reuse that this makes sense?
>
> Would it be simpler to have a much simpler DSA driver just for pass
> through? Or the mt7530 driver has a second dsa_switch_ops instance
> with all these functions set to NULL?


After sending v2, I discovered that some switch config runs across the 
whole switch tree, and NULL configurators causes those ops to log an 
error and exit early.


As far as making a "passthrough driver", there are a few things going 
against it. As you can see there is still quite a bit of shared code, 
also it would be inconvenient to use a different compatible because some 
chip packages exclude the MCM switch and have 3x 10/100 ports and 1x 
gigabit port, so its better for the DT to pretend that the mt7530 can 
simply do full hierarchies, though (per the big commit message) that 
doesn't actually work and we're relying on the fact that hardware 
integrators will not require something that can't be done.

Lastly, the TRGMII calibration requires poking registers on one switch 
and reading values off the other (patch 7) so I think that mess is best 
kept all inside of one C file.


Thanks,

Caleb


>
>       Andrew

