Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DB9606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fg4HPOkJ;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=K+31T/Z0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S1sqnnCjlRyaPfFD2qC02MEhZfl6DMtUczd0Q0Ki+2I=; b=Fg4HPOkJDZq2LB
	H6uFRSFtsyBHnHDDarGxD4GRRn31OFttYejMY0TIaSk10ze6He21tYf55k3fmEGhXH5jCC+3mvQYk
	yTX1EsrMOWb3P0QjDe3rfjt4NQ/L3qpD1eZRef1RmaZMP2MXJN/DrYeLPRUI8Lqxu78SJG1etATnh
	1+BQcOsncBKrprB6Rj8FN8s+hGXqXjk0OW4OsjhsRkpp1OagHc82+R5f1yOny3SfhXr/ySfE3l6Dd
	P+NeeiOz+fe/S2ww7lwhvQnilUENgucHPtfA+tMfDcPF2ImHi8sSd0GXqfnkQS7HWjuCmZQFgLwlJ
	0L7668arW7MFwxMvQtlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV9E-0000000A9s9-2R4y;
	Thu, 29 Oct 2026 18:46:48 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV9B-0000000A9qs-09wT;
	Thu, 29 Oct 2026 18:46:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C1B0B1AA5A6;
	Thu, 29 Oct 2026 19:46:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793299600; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=S1sqnnCjlRyaPfFD2qC02MEhZfl6DMtUczd0Q0Ki+2I=;
	b=K+31T/Z0FT7iq67pGafGa9MfRWGCryCiNanA3KAjiXb4E9m47xLVXgbhRXp8hAczcEY4Yd
	dI2pHubkLPVqJlRRGiOEZqVb96UJJqyXpgV3VB3tvOu23L/77EbSm9fqsNg2W9rTkHS78J
	1omgZ4mxaeIcwXAz/iACGd5Rj3BXaEiV1BZI1RdVKswxHU37h6y7k0HjkjOSRiqoLUJPlq
	4QeZxGTaS7wgy8u0BgEUFkDdIcGH05Sa/CTheN1ybyFg4S7qkg/dVxneUBsMwsRR8SRnER
	zzPUpAYwXY11/C516pFTPu8hBk3YCFEUUxdlARcMEK0byTN/qf2/KGWYI6AXRw==
Message-ID: <59118c64-5115-4eb1-86b3-9414087c4fd8@cjdns.fr>
Date: Thu, 29 Oct 2026 19:46:30 +0100
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
 <18472c61-efe2-4529-971b-82d877df6b15@cjdns.fr>
 <2b406479-8c3d-40e6-93e2-e7ad01d5f432@lunn.ch>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <2b406479-8c3d-40e6-93e2-e7ad01d5f432@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_114645_269177_A0858F2E 
X-CRM114-Status: GOOD (  13.83  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 28/10/2026 13:35, Andrew Lunn wrote:
>>> What is actually left?
>>
>> In v2 I was using special switch ops, and it looked like this:
> Sorry, i did not look at v2.
>
>> /* No manipulation of forwarding rules allowed in passthrough mode */
>> static const struct dsa_switch_ops mt7530_passthrough_switch_ops = {
>>         .get_tag_protocol       = mtk_get_tag_protocol,
>>         .setup                  = mt753x_setup,
>>         .teardown               = mt753x_teardown,
>>         .preferred_default_local_cpu_port =
>> mt753x_preferred_default_local_cpu_port,
>>         .get_strings            = mt7530_get_strings,
>>         .get_ethtool_stats      = mt7530_get_ethtool_stats,
>>         .get_sset_count         = mt7530_get_sset_count,
>>         .get_eth_mac_stats      = mt7530_get_eth_mac_stats,
>>         .get_rmon_stats         = mt7530_get_rmon_stats,
>>         .get_eth_ctrl_stats     = mt7530_get_eth_ctrl_stats,
>>         .get_stats64            = mt7530_get_stats64,
>>         .port_enable            = mt7530_port_enable,
>>         .port_disable           = mt7530_port_disable,
>>         .phylink_get_caps       = mt753x_phylink_get_caps,
>>         .support_eee            = dsa_supports_eee,
>>         .set_mac_eee            = mt753x_set_mac_eee,
>>         .conduit_state_change   = mt753x_conduit_state_change,
>> };
> I think you should be doing something like this. Either two
> dsa_switch_ops, or you add generic implementations for all the ops,
> which then call device specific implementations dependent on the
> compatible. This is how many DSA drivers handle different families of
> devices in one driver.
>
> I would avoid putting "if (priv->passthrough)" everywhere.


I just send v4 with a separate dsa_switch_ops for passthrough. Instead 
of "if (priv->passthrough)" it is numerous empty functions because they 
have to exist and have to do nothing successfully. I'm not such a fan of 
it, but you certainly know drivers/net/dsa better than me and if this is 
the canonical solution then I agree to align with it.


Thanks,

Caleb


>
> 	Andrew

