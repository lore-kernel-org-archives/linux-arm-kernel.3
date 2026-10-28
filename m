Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E585606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 11:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DRXE9NMI;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=Pl1km/oF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CevGQp+s1w1J24KtaW8+NnlonqWYYMxxCOLZ2QIESgY=; b=DRXE9NMIPCzmU1
	YLmQ/sPxMcY9OFJlR4GNCYoC+hKWb5NM9v/vQO6H1fogrKHdj8JMf5sUHVLab00z+rLvkHlGvD4Hr
	QxGfcAab0rhEohE9exfXGZbx0CEMqNzbStZEuOdXOlKOe9lkuufODJ0LO2SalrQPHaaJhH7qN1xEX
	XLJwBrfn2PMSoFkZt0dU8xGumWiJUHA4oAW55KrNdaOiyUF2FjZzWQAY65eZ/6YQW/zrD9jSUX9FZ
	6SWP4BvKjxnRjTNbMJ+SS2ChUwuXqAhfHj4ALciuC6bFtLBBCZy4xnnHmD+U68Q9apZNwM8psf/er
	gZQM0yNWpZ3PuXeD3AFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1og-00000006rQL-0ZP0;
	Wed, 28 Oct 2026 11:27:38 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1oc-00000006rOX-2l6y;
	Wed, 28 Oct 2026 11:27:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E16F415A508;
	Wed, 28 Oct 2026 12:27:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793186847; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=CevGQp+s1w1J24KtaW8+NnlonqWYYMxxCOLZ2QIESgY=;
	b=Pl1km/oFujov7U9vn/7PmrQGLNFYnU/cP8SNsfDLDBHYvir/Jn3mahgOhSPuJ59sYmoqvX
	CfOXb/EfnQu1Fn8NE1WUxyynR5JsDereRbofEGGwlD/NFgF7DKvyr0ox4QXGIZ+gjncfiY
	47cetQ+qi5KEc/xrFTURm/7nbjl7vLJ28+DQPyJV9dM3nEMk+rY/tVEPklt+RYqb8xcdQ+
	Lcvi+/GQIN751WRGVRpruLaIEuzSfKbnhhlWI9YAODcHgFIQEChTpqO39jzPze0WX0BEdF
	m2RotoTUCr+dBL60t14SfOfG+ZNBN3sN6kzA8w57hxRpzSwmlSgSesO540Hcnw==
Message-ID: <521b930f-0bf9-4373-bfbf-3e2570661ec9@cjdns.fr>
Date: Wed, 28 Oct 2026 12:27:18 +0100
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
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <a031f089-0b96-4fc0-b878-6af13414524f@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_042735_067985_57D74721 
X-CRM114-Status: GOOD (  16.55  )
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


On 28/10/2026 03:04, Andrew Lunn wrote:
> On Wed, Oct 28, 2026 at 01:13:12AM +0000, Caleb James DeLisle wrote:
>> MT7530 switches can be configured to blindly pass packets between their
>> CPU/upstream port and a downstream DSA port, in particular, without
>> altering the MediaTek DSA Tag on the packets. This mode is used in some
>> integrations where an SoC integrated switch exists, but a more capable
>> MCM switch is added to effectively replace it.
>>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>>   .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml       | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> index 90b3582b7619..e29fb8693498 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> @@ -73,6 +73,13 @@ description: |
>>   
>>         Check out example 7.
>>   
>> +  The MT7530 and MT7531 switches are capable of being operated in "passthrough"
>> +  mode. In this mode, traffic is unconditionally passed between the CPU port
>> +  and the DSA port which links to a second switch. To use passthrough mode, the
>> +  upstream switch is configured with a DSA link to the downstream switch. In
>> +  passthrough mode the upstream switch is restricted, with no other ports or
>> +  switch configuration allowed.
>> +
>>   properties:
>>     compatible:
>>       oneOf:
> Looking at just what is here, all i see is a comment. There is no new
> property? Yet the subject is "add passthrough mode"?


Indeed, I used "add" to mean "add documentation of". Per my reply on 
patch 3, I think we really prefer to avoid special properties and let 
this constitute (very) limited support for a switch hierarchy.

If there's another verb you think makes a better commit line, I'd be 
happy to adjust.


Thanks,

Caleb


>
> 	Andrew

