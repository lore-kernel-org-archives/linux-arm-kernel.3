Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DF4606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 12:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RSxUyO5j;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=JVGkergG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Yzm5KfrMMhSQL0Yf78me4QaQ2CKP9r2dKDG+lFJrjjw=; b=RSxUyO5jYdVit4
	7WbKDDEjXd+EuW0M2kuOml9dvgHnzZm3wSNUR3CFIHmRSGgdSyXZqrExqtibINIc9RafbqMDNGk3k
	cYRQ8/X+XJD5vbOcvf9VIjBry7PRlYrQjj/y5S9z1ll9/2O4e0mX7vDNMd4PO0wKcYKlIM3gliU8h
	3BUBrjTDpXhsJ9qFx4k51Hr4Ezb/4VDyKCQOR1nFmp7THVQje6iHK7LWLSd55p5XZbKrrdyWiSsWk
	jAvgVl1yj9B82lSRa97LP3BBwC2EUx9UGQGeuNXeb6p5z5u2hLzCTZiNZyLYmluRHVrf+NGlAk4M3
	aRl4MRfWm1h0hcYn9k7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2Vd-00000006vwV-1HBV;
	Wed, 28 Oct 2026 12:12:01 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2Vb-00000006vu3-0LuL;
	Wed, 28 Oct 2026 12:12:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB6FF15B5FF;
	Wed, 28 Oct 2026 13:11:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793189515; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Yzm5KfrMMhSQL0Yf78me4QaQ2CKP9r2dKDG+lFJrjjw=;
	b=JVGkergGGn/tJs4X7LkEAPKkZk34QvlpZPHWX5xQEsoouO7CwrWUR9a4q93k4ERlhvZPve
	GcV5paJAhqfBt/coxtS486lXuJEkhbUOfMXmGgegDtgi5QbIPgyXAdFEuUkTcbW1dANozs
	IETk7PUFxBsNvIodov/HwD9NfX4JiBWnrCJnh4xpnSi7pXEwafabe62NRFC3rxsXDWSxzh
	WPOWj7H2YfFPfz01suNcwdD6YuvmY91NDlKLGdTWWjVmL3GddiHH0mKAnnM9ny6Y0BCvaV
	zoDpfObWYO7RqJE3woFv7a6tIOD0mvnIDpuS2JiQ1f104r6yWQthKEyLsNgKLw==
Message-ID: <64c2291a-f9c8-49cd-965f-5bc735f1b4fc@cjdns.fr>
Date: Wed, 28 Oct 2026 13:11:48 +0100
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
 <d4564675-fa56-42df-8c5c-cff14f7884f9@lunn.ch>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <d4564675-fa56-42df-8c5c-cff14f7884f9@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_051159_308179_E0A8A876 
X-CRM114-Status: UNSURE (   4.95  )
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


On 28/10/2026 03:07, Andrew Lunn wrote:
>> +static int
>> +mt7530_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu);
> Please don't add forward declaration, move the code around.


Sure thing.


Thanks,

Caleb


>
>         Andrew

