Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9862D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 11:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tDTVgWTR;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=m59PuZSH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yKdfPzMRS/kwPXscycDGzlcjovJBQwAGTa4z13VzbQI=; b=tDTVgWTReltct8
	DGyYFp1hK8ZI3BiGgQAMvR7EucxXXEeci768ehhApPrpanvqm7NJmbPq5/VhWs2/OQTJBZgDh38iB
	aUv44aHWMuoZgb34oQQayPQ1HE9uNUaX2/80mnG+JHXL5pldNm9gmmoFm3+giPl1gpNq3iiXbmz7u
	OPP2zz2KI+7IamlvCKiNhU9wMkiITQyNuGWlRlWTFTCcgAgz5NywMES4gfLxi4xn4NvnDV9oPmk56
	Vsn7881v4tNkhJJqjy5yYVVBK6TYu4CyaVU6arSyRkvW9Z8lzA8Gv5Vklfzr6fGKB9l7rTJ+8QtoR
	9od0NE2w6DeANsHvW99w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1go-00000006qSN-2I3Q;
	Wed, 28 Oct 2026 11:19:30 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1gl-00000006qRJ-33Zc;
	Wed, 28 Oct 2026 11:19:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 17AC6159721;
	Wed, 28 Oct 2026 12:19:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793186363; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=yKdfPzMRS/kwPXscycDGzlcjovJBQwAGTa4z13VzbQI=;
	b=m59PuZSH0wQWRO9g5AKyqgoruvEOgJ05UH1RBowvozLh4c0D7H8AJ26PyakRtlinOM4ufv
	BTYUDPZuRQL2RTJvtudK5LoGl/TCl+D+p7e1SElHrXce5jiI/Ap3RBqGKeLpcyfGv6yM+Z
	4NOK5BYdKEedmrwXMu0mAqNrwh816Z1vAQcsx0AiClAsXSR2HZvwo19wH2W55PMhrMoHm3
	t7esB+H7DBXHwd1LbsRPKBQgsumglcmvEXC+N/j2xIC/XOZuLqCSvTfLP8xsds7ksQwIB+
	GfgzQ4/LhBGLAc6F2Y0MOb9RTuW3q2rQn9dmNu6phmmMY/4L5i3yCc1ml8MQGw==
Message-ID: <9f955484-1ca4-44a4-84a9-cc1d062efcf0@cjdns.fr>
Date: Wed, 28 Oct 2026 12:19:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 6/7] dt-bindings: net: dsa: mediatek,mt7530: add
 econet,en751221
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
 <20261028011317.1557238-7-cjd@cjdns.fr>
 <f9249c6d-ef72-4723-a3b5-8d5375e53744@lunn.ch>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <f9249c6d-ef72-4723-a3b5-8d5375e53744@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_041927_967633_E60771ED 
X-CRM114-Status: GOOD (  15.89  )
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


On 28/10/2026 03:26, Andrew Lunn wrote:
> On Wed, Oct 28, 2026 at 01:13:16AM +0000, Caleb James DeLisle wrote:
>> The EcoNet EN751221 MIPS SoC integrates an MT7530 switch memory-mapped
>> in the SoC register space. It is similar to the econet,en7528-switch
>> except that ports 0..3 are 10/100 only, port 4 has a gigabit PHY, and
>> port 5 has no PHY, but is in some implementations connected to a
>> downstream MT7530 multi-chip module via a TRGMII link.
>>
>> The downstream MT7530 is similar to the MT7621 multi-chip module and
>> has all gigabit ports.
>>
>> Add the econet,en751221-switch compatible with the same constraints as
>> the other built-in switches and also add the econet,en751221-gswitch
>> multi-chip-module switch whose port 6 is configured as a DSA link port.
> Is there a use case of the econet,en751221-switch not in pass through
> mode? This is where you could have a different dsa_switch_ops
> structure, which probably makes the changes less invasive.
>
> Even if there is a use case for not pass through, you can still look
> for the property in probe, and decide which of two different
> dsa_switch_ops to pass to dsa_register_switch.


I think this was pretty much answered in my reply to your patch 3 
review. Without insider knowledge, my understanding is EN751221 is a 
common die, and it's packaged in a variety of different EN751x (DSL) and 
EN752x (Fiber) chip modules. The die has a switch with 3x 10/100 ports 
and 1x gigabit port. Chips with a 'G' in the name (EN7513G, EN7526G that 
I know) have the MCM switch and use the on-die switch as a passthrough. 
So yes, in short there are real (and quite popular) devices with both 
MCM and non-MCM implementations.


Thanks,

Caleb


>
> 	   Andrew

