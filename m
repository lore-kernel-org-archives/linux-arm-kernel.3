Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B13B606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 01:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sFORxEoK;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=OHNvGusE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b+REZnCfFDdefm9jnJVSHPmWlkqHTOnFekI0S/9L5S4=; b=sFORxEoKs87qdZ
	HoEJmQRDMj5Ue+hHNDBDlkv+h5gN3JAV6iJkhcXtBB6Ie9QFMcvbjNlta1KEfAXkCK341rps+ahSM
	3n7A4LoWOmlSDrVLJQlVvKDdsbJ9HjY43rwfTTx2yRdlFYLwJBu135C5fImAxtKf6sbf1W7MTCQeQ
	xPGjpaTASIgfWCu6I+2c6J0mS0Aisu5pJjaOPw/EulcRwkGjbeoEH+oCqJA25a4thKznWb2+4gqna
	sp6MGPMMbTOjPKoSWkFcgVFmTQDMBhdG4vjlp5Y7haSuthVlamEODBxXvEfuNintOV2dKlA1o5PnM
	fi3YIJ5GUrYPe0inTVaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLsHF-000000061xe-3Ddg;
	Wed, 28 Oct 2026 01:16:29 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLsHD-000000061xI-3ThT;
	Wed, 28 Oct 2026 01:16:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0C44F148E28;
	Wed, 28 Oct 2026 02:16:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793150183; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=b+REZnCfFDdefm9jnJVSHPmWlkqHTOnFekI0S/9L5S4=;
	b=OHNvGusEtM6K3h6Z0yNFqbB49cR1kbiI70swtRDWeuc3Ke0YpIwKvELrBgFEuXM5BfHGtT
	uKsfHi/SBUegnadBVM7sl2zc72DgL8sS65JjKMbLmEREhJmqXARDzM18QjnYVb8jAmm5N8
	25qMwO49OF2TPyytIdVAlinNc/DFSjWVxCd+eoZC2X1b07emIk0wEtqQ8av5t0A44OshPK
	YEILFNCM5flsHNCfsEIeet9Br9fIwfoAGjrftxz+F5T57ivLOdX+PKw0wtoP+wuS2E9RDO
	iGE+po2Z+lobkZEi8KBa9Cs7XtoQl5tdu4TTG1i/rkY2c86VQs87T8CBKQOBOQ==
Message-ID: <86c89435-581b-44dd-9308-f77332944b7f@cjdns.fr>
Date: Wed, 28 Oct 2026 02:16:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 net-next 6/7] dt-bindings: net: dsa: mediatek,mt7530:
 add econet,en751221
To: Rob Herring <robh@kernel.org>, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 chester.a.unal@arinc9.com, daniel@makrotopia.org, linux@armlinux.org.uk,
 arinc.unal@arinc9.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, naseefkm@gmail.com, b.larsson@gmx.com
References: <20260915174643.253660-7-cjd@cjdns.fr>
 <178967820050.22033.18093714968849770785@kernel.org>
 <20260924154955.GA337010-robh@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260924154955.GA337010-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_181628_058398_B8379D1E 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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


On 24/09/2026 17:49, Rob Herring wrote:
> On Thu, Sep 17, 2026 at 08:50:00PM +0000, netdev-bot+sashiko@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 7 potential
>> issue(s) to consider:
[...]
>> The analogous MT7621 case does not collide because the SoC root uses
>> mediatek,mt7621-soc.  Since the SoC compatible is already released, would a
>> distinct string for the switch, e.g. econet,en751221-mcm-switch, work here?
> This needs to be addressed.


Thanks for the note and sorry for the delay. I've just sent v3 with it 
changed to econet,en751221-gswitch. I did not see any standard for this 
and the name gswitch is intuitive for owners of the EN751221 chip 
because switch appears where the chip name has "G" in it, and it 
provides gigabit ports.


Thanks,

Caleb


>
> Rob

