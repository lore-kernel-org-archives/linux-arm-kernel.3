Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C545606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 11:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ob+qMAcB;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=P4N3rUJS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f5NboUzo78TSvbEnVlTQueU5GwrKHZYmgsrDTsu8dJU=; b=ob+qMAcB8XNse+
	W1iT6L6TnMq5Pq2ctrsRKJpG/zRxgUON3PJURdoHBzHLEmHjf0/JvndSqWAsnqimu9g9ES8t7d4nr
	3E0ibkPwYxsWVhYAXgmYbaj9w/q2+bs9+ZGaU4Et5akEDGtyE9xKxQ+4ILGLbIRYebL3Tvp9wNpLb
	K/YYA9yCsUko/gfniwxK/1agBzA71Y6dihZRCvGiapZljJ/YmobHtuhACeNuTG0xk3YABbIfpFoxC
	yXKQVr3+Y98wepIVsWlefXc51lpioIg9yRjLEgI5JcS482WjPRtS8tb7dQh4aogakIfRX1T2bDfDD
	P6JSj0HrCDHNGLKpSnrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2Jf-00000006ud4-2ZeT;
	Wed, 28 Oct 2026 11:59:39 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2Jd-00000006ucT-33mU;
	Wed, 28 Oct 2026 11:59:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1914B15A2B6;
	Wed, 28 Oct 2026 12:59:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793188773; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=f5NboUzo78TSvbEnVlTQueU5GwrKHZYmgsrDTsu8dJU=;
	b=P4N3rUJSUM89fo9E2InG1shZOpy0XpXcOvgzNy28wcBa2dk4P+TiyEQhdoOKC2iZpyCfPD
	3ki45bzf6FsuR4HE9CJkmwVihB614DfRgS/1XQ+uPFi+9AMFDG1fWWwXOt2dzfQQ40M3iM
	yuGpbv53MOJ6vmorSa04cXulx/u/LT0azavSqBwvFsvyydeLefaE2bibPSsF3BgI2YyWkt
	nM5O2J2kEHb7kt0fXTbIUXYuG0QbnJCJlBx0jM6KzRffivz4eEXivXbeeDL5mrVjpWuf0l
	/kOdX6Q1O+75jHkfq5kQJjBmHJF9/NsjcJkyR2P/LWH3a4zE//wRaFyRRmisiQ==
Message-ID: <acf55987-e96d-407f-a4a7-1c78178a0c7a@cjdns.fr>
Date: Wed, 28 Oct 2026 12:59:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 5/7] net: dsa: mediatek: support MDIO switch downstream
 of MMIO switch
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
 <20261028011317.1557238-6-cjd@cjdns.fr>
 <f6fe9c7a-5617-475b-babe-da24cda815cc@lunn.ch>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <f6fe9c7a-5617-475b-babe-da24cda815cc@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_045937_947262_35404057 
X-CRM114-Status: GOOD (  21.34  )
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


On 28/10/2026 03:20, Andrew Lunn wrote:
> On Wed, Oct 28, 2026 at 01:13:15AM +0000, Caleb James DeLisle wrote:
>> The MT7530 / MT7531 can connect via either MDIO or MMIO. In MMIO mode
>> the switch provides its own MDIO bus which connects to its integrated
>> PHYs, but also can be connected to other things, such as another
>> switch.
>>
>> If the MDIO bus contains another switch, then the upstream switch
>> will register but it will not setup the DSA tree because the
>> downstream switch is missing. Without the complete DSA tree,
>> mt753x_setup() will not be called on the switch and therefore
>> mt7530_setup_mdio() is never called so the downstream switch never
>> registers.
>>
>> Update mt7530_setup_mdio() so that it can be called multiple times,
>> export the symbol, and call it again after dsa_register_switch()
>> from mt7988_probe().
> I would suggest just moving it to probe. Don't also have it in setup.
> KISS.


I don't think there's a way to do that which will work. And I guess I 
need to add a few comments to explain why. Basically 
when dsa_register_switch() is called, one of three things can happen:

1. return error (often without calling mt753x_setup), typically this is 
EPROBE_DEFER because the ethernet driver is not there yet.

2. return 0 without calling mt753x_setup (because not all switches in 
the tree are yet probed)

3. call mt753x_setup, complete setup, and return 0


In case 1, mt7530_setup_mdio must not be called, because it would be 
setting up an MDIO on a driver that's about to get deleted.

In case 2, we have to call mt7530_setup_mdio because otherwise we may 
not discover downstream switches (this is the patch)

In case 3, mt7530_setup_mdio must be called before mt753x_setup returns 
because after it returns, the DSA core synchronously enables ports and 
it will expect PHYs to be operational.


Only the DSA core really knows what it's going to do, so I think the 
only way to solve this without going inside of it is this patch where 
calls are made from two sites.


That said, I think it's pretty clear that I should put a couple lines of 
comment in there so that nobody is tempted to "streamline" this code 
into one of the things that doesn't work.


Thanks,

Caleb


>
> 	Andrew

