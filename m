Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3303A606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 15:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=an/Vummx;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=sYN7Wb4W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2Pak5tnRuTRRR5lgI3SQ+wNVW+vIb8vrbTpuoRT98Po=; b=an/VummxdnvazI
	a/yF9WgYE8K1/c68cGigaxAonEkce4QSyHui7DQthetCxRhg6pX/Pq/ues3xZgh1FlnaNp5tlTac1
	Eu1mjO5cra6QUP01W13v5f/E6R7FrgBy5Zc61r32UVY3t4CAZYjd1INoKAKlDFWLOn6HMKaqBEWIf
	v/CMPaJZp7lY+KbIKm3lODIbFx0VJH8+vMutAPB1z9WPAsjEhuruxCj+VdQ6roo9JYxH0+LhW/9I0
	E41SaEB+o1os+J1O/qY1/f86VzlpTb3EqXLIaEZ6Jg6SJLSqvmlmQjidtQ+2QJjbIvu9BvrUyqiyz
	6+95cJco6ZR94MDphF1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5CU-00000007IQf-2iwB;
	Wed, 28 Oct 2026 15:04:26 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5CR-00000007IN8-2e4T;
	Wed, 28 Oct 2026 15:04:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 923E7161DCC;
	Wed, 28 Oct 2026 16:04:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793199857; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=2Pak5tnRuTRRR5lgI3SQ+wNVW+vIb8vrbTpuoRT98Po=;
	b=sYN7Wb4W+yUTIRGpnInR+C9sIBvUi21SE2TULkltVcRLjMFYLQChN1xOKUe5DSzQ9aQP8p
	sqwWe+gBK2LjIM+o4yq4j44QgOpPnHtC6f49TkFrnJEdPTSF1ON/dUUrdgKy+nMSgmSB6L
	lLC48jrjJFDPSDjIUyU9it2XAwOMFVX2PXRDUIcC2TTJNqfljXiAzlicnGLPj0T5OdO8eS
	VOtmeUnKaajXekF9RTwjMyY9d7BOpOv4N73nSAY/1L/xfgwVQk8HkWBwzD9tPS/g181uRr
	QYBOMqLrqZ+0EWyMkCXKyMjtAI+AQ0cTRl/dZ8K3w5INT2SeLIwi5XbBQ5dT4A==
Message-ID: <8ebdebe0-a8a2-4e35-9ef6-41999547e2aa@cjdns.fr>
Date: Wed, 28 Oct 2026 16:04:06 +0100
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
 <acf55987-e96d-407f-a4a7-1c78178a0c7a@cjdns.fr>
 <bdde8389-008a-430a-8d0d-14edcb4050b4@lunn.ch>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <bdde8389-008a-430a-8d0d-14edcb4050b4@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_080424_081749_5BB61D6E 
X-CRM114-Status: GOOD (  31.65  )
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


On 28/10/2026 13:50, Andrew Lunn wrote:
> On Wed, Oct 28, 2026 at 12:59:23PM +0100, Caleb James DeLisle wrote:
>> On 28/10/2026 03:20, Andrew Lunn wrote:
>>> On Wed, Oct 28, 2026 at 01:13:15AM +0000, Caleb James DeLisle wrote:
>>>> The MT7530 / MT7531 can connect via either MDIO or MMIO. In MMIO mode
>>>> the switch provides its own MDIO bus which connects to its integrated
>>>> PHYs, but also can be connected to other things, such as another
>>>> switch.
>>>>
>>>> If the MDIO bus contains another switch, then the upstream switch
>>>> will register but it will not setup the DSA tree because the
>>>> downstream switch is missing. Without the complete DSA tree,
>>>> mt753x_setup() will not be called on the switch and therefore
>>>> mt7530_setup_mdio() is never called so the downstream switch never
>>>> registers.
>>>>
>>>> Update mt7530_setup_mdio() so that it can be called multiple times,
>>>> export the symbol, and call it again after dsa_register_switch()
>>>> from mt7988_probe().
>>> I would suggest just moving it to probe. Don't also have it in setup.
>>> KISS.
>>
>> I don't think there's a way to do that which will work. And I guess I need
>> to add a few comments to explain why. Basically when dsa_register_switch()
>> is called, one of three things can happen:
>>
>> 1. return error (often without calling mt753x_setup), typically this is
>> EPROBE_DEFER because the ethernet driver is not there yet.
>>
>> 2. return 0 without calling mt753x_setup (because not all switches in the
>> tree are yet probed)
>>
>> 3. call mt753x_setup, complete setup, and return 0
>>
>>
>> In case 1, mt7530_setup_mdio must not be called, because it would be setting
>> up an MDIO on a driver that's about to get deleted.
> Which is fine, because when the probe fails, you unregister the MDIO
> bus. That should work. The second time around, you do have the netdev,
> and it should work.


When I tried doing this it did not work. The first issue is that 
mt7530_setup_mdio() uses a static int and increments it to make its ID. 
And normally this would create higher numbered busses but still work, 
however from what I remember there's something (not mt7530) that 
searches for mt7530-0 anyway and is unable to find it. I don't remember 
now what was doing it but I remember thinking I would need a global ID 
generator with reuse of released IDs.


Furthermore, I think I'd have to test all of the PHYs that are 
downstream of this switch because this is the first time we would 
actually be asking them actually register and unregister multiple times 
each startup, so if there are bugs, then they're kinda my bugs.


So if this is a requirement, then I think this patchset will need to go 
on the back burner and that support would probably be its own 
patch/patchset. So please let me know how you're feeling on this because 
I don't want to put too much time into the rest of this patchset if it 
is going to have to get shelved for a while anyway.


Thanks,

Caleb


>
> It is not great, you are doing extra work, but many DSA drivers are
> structured like this, the MDIO bus is registered in probe. The bus is
> scanned, PHY are found, and then the probe fails, and the PHYs are all
> thrown away etc.
>
> Hanging one switch off another switch like this using MDIO, kind of
> pushes you in this direction. Typical DSA setups don't do this, there
> is one MDIO bus which all switches hang off, sometimes with a
> multiplexor to make one MDIO bus act like many.
>
> Something to look at which might be interesting, Vladimir had some
> patches which allowed for partial switch topologies, where you could
> take a switch in a DSA setup off line. Maybe there is something in
> those patches which help, you can bring the switches up independently?
>
> 	    Andrew

