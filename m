Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7134E606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xLy6t7eN;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=SAvQBHOm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sXikcPN/2u2jcqxK0ic3WXRLLLyeXrwW2xb+LwiQxXY=; b=xLy6t7eN7oI3Rd
	B+AHnM1SzSpLENcSBA3ze/gDxJ+c+bcgaOXhJ+AAlSdQMEUQqp0EWWs7USPXlQjNFw/t/CvEfiCRW
	Emh9mm3oS/Xk2vBPWplZxWd2ClHSagbYW+V2bBAJGO7DeL9C8ROYepCStncHPJPOHQtApdfh9WzQT
	Ftv/ACVxE6SEcql3JwQFZXMZ/hpT99/zgV6t7CzCqRBaF17ZLBfPQ7F0v0Ao9Q0EHp6RCjzS9azF+
	dOcyeGsbjH1qBbod6UvolGOriDzJNXUn0fSZZ9unM2Bw1/uvUtDrpEdATWOX7rCkPpl/St2ff5Kub
	gYYtuQaT5EII53X5mW2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM45O-000000077fh-008x;
	Wed, 28 Oct 2026 13:53:02 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM45K-000000077aF-2BpQ;
	Wed, 28 Oct 2026 13:53:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D80E215FD22;
	Wed, 28 Oct 2026 14:52:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793195573; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=sXikcPN/2u2jcqxK0ic3WXRLLLyeXrwW2xb+LwiQxXY=;
	b=SAvQBHOmhiuyKvlXtM1AIKAj6CRqI92p5TarTfEUggze30z+GnbG565ZljxAgt9yHEC2dM
	uD5iBoqtnOoZOkDKm2IGdLODqoyp/e0jfOhfmpnSaikTs7D6Lenc1O1BbWgh87s/ma/Nyv
	vXgTMgY1W84l8PsDxj4I+9z1ztQDiCRxWVVACm3kSa6NgsrRAOPZ/Vhus041nsaRWalF1C
	DoCc3UPTBDy+cs4xKDWnbbmOkb4G/zZCOhvIYOmx+6EyMWoAV+2XadysA9Wdy/uPflREyO
	0119GI7xKpC5Bf/FgQbIOizvjAHIjyaiWdtPRb7F8nPbA73yEHVZi50bJKd6Xg==
Message-ID: <c6154519-98f4-46a7-ac30-076ebf588bab@cjdns.fr>
Date: Wed, 28 Oct 2026 14:52:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 2/7] dt-bindings: net: dsa: mediatek,mt7530: add
 passthrough mode
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
 <20261028011317.1557238-3-cjd@cjdns.fr>
 <a031f089-0b96-4fc0-b878-6af13414524f@lunn.ch>
 <521b930f-0bf9-4373-bfbf-3e2570661ec9@cjdns.fr>
 <a566aad7-754c-4960-b018-4471a0068344@lunn.ch>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <a566aad7-754c-4960-b018-4471a0068344@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_065259_071964_B5327E04 
X-CRM114-Status: GOOD (  32.14  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 28/10/2026 13:28, Andrew Lunn wrote:
> On Wed, Oct 28, 2026 at 12:27:18PM +0100, Caleb James DeLisle wrote:
>> On 28/10/2026 03:04, Andrew Lunn wrote:
>>> On Wed, Oct 28, 2026 at 01:13:12AM +0000, Caleb James DeLisle wrote:
>>>> MT7530 switches can be configured to blindly pass packets between their
>>>> CPU/upstream port and a downstream DSA port, in particular, without
>>>> altering the MediaTek DSA Tag on the packets. This mode is used in some
>>>> integrations where an SoC integrated switch exists, but a more capable
>>>> MCM switch is added to effectively replace it.
>>>>
>>>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>>>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>>>> ---
>>>>    .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml       | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>>> index 90b3582b7619..e29fb8693498 100644
>>>> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>>> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>>> @@ -73,6 +73,13 @@ description: |
>>>>          Check out example 7.
>>>> +  The MT7530 and MT7531 switches are capable of being operated in "passthrough"
>>>> +  mode. In this mode, traffic is unconditionally passed between the CPU port
>>>> +  and the DSA port which links to a second switch. To use passthrough mode, the
>>>> +  upstream switch is configured with a DSA link to the downstream switch. In
>>>> +  passthrough mode the upstream switch is restricted, with no other ports or
>>>> +  switch configuration allowed.
>>>> +
>>>>    properties:
>>>>      compatible:
>>>>        oneOf:
>>> Looking at just what is here, all i see is a comment. There is no new
>>> property? Yet the subject is "add passthrough mode"?
>>
>> Indeed, I used "add" to mean "add documentation of". Per my reply on patch
>> 3, I think we really prefer to avoid special properties and let this
>> constitute (very) limited support for a switch hierarchy.
>>
>> If there's another verb you think makes a better commit line, I'd be happy
>> to adjust.
> [Goes and looks at mediatek,mt7530.yaml]
>
> So pass through is not an existing property. You are also not adding a
> new property 'passthrough'.
>
> What you appear to be saying is that the MT7530 and MT7531 are hard
> coded by the driver into pass through mode? So it is in effect a
> property of the compatible? So maybe put this comment next to the
> compatible? And make the subject/commit message talk about the
> compatible being hard coded for pass through?


Perhaps I should rephrase as follows:


"""

The MT7530 and MT7531 switches do not support switch hierarchies except in
the case that a switch is configured with only one CPU port and one DSA port
that links to a downstream switch. In this configuration, the upstream switch
acts as a blind pass-through to the downstream switch.
"""


> Looking forward, what happens when somebody wants to use the switch as
> a switch? Or you figure out how to do proper D in DSA? It becomes
> messy because you need to add a property indicating the compatible
> should actually be a switch?


Full hierarchy (using DSA tag) is impossible because of what seems to be 
a hardware bug where switches don't distinguish themselves in the tag. 
However it is possible (albeit ugly) to enable ports on both switches 
providing the same numbered port isn't enabled on both switches.


If somebody ever implements that, even if they remove this passthrough 
support, users of the current passthrough capability will not notice a 
difference because that will do the same as this.


>
> So maybe you really do need a property?
>
> But DT describes hardware, and pass through is configuration. So maybe
> it should not be in DT at all, Maybe the driver needs to look at the
> DT tree, figure out a port is used as a DSA port, and put the switch
> into pass through all on its own? Once D in DSA is supported, the
> addition ports become available, but no other changes are needed in
> the DT blob?


Previously there was no documentation regarding hierarchies, and any 
hierarchy would fail at runtime. I think a brief note that this one case 
of hierarchy is allowed is nice for the users, though it does bend the 
definition of "describing the hardware" so it could also be excluded. I 
may be persuaded either way.


Thanks,

Caleb


>
> Sorry, going around in circles, but hopefully it helps you think about
> the big picture.
>
> 	   Andrew

