Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC82FE87824
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 13:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqEfoVQW+S/wbK56us6FBxe4eLE4pqP9qq5Ho+feXg0=; b=st+dSZm+XkjseB+/jHyzj4nIXY
	4libmU4pV6S9zxtXMLlPtBldN5f7vTlHnKRsVM9jYYOGeFzo34cMVw6GXMWRgEf7py5FsqfyqzsBn
	GvMtGUsmcnUZkjP01MHTXCX24Nzm4Dw2ssDnbj3yP01/TiCdPp1Kggcr8OH4yqob3NTZ/NcZidN6c
	DDGi8DDYUuHKHUbKLFHP8N3UKI4hAh3NvLiwbzUwy61bsxKM5xedmgFVvR7487WLxolFhzthtO+0R
	b7cfIE/3dC9h2L6iBCm1dC8m8iHBAkLOAIbm4EQ9SEBmFX5BBXRLNPxdKqRPUkLJ/2YgGvGZLQiVI
	Zo7U1MfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGGW-00000006eri-18vS;
	Tue, 03 Feb 2026 13:16:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGGU-00000006erA-08T6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 13:16:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DqEfoVQW+S/wbK56us6FBxe4eLE4pqP9qq5Ho+feXg0=; b=DSo22puKAJc6J757xa9dy+juua
	N2WMkIep7hEbXa7+auSowaMb+3Peyv9KGFR2dXunWxoLrJXF/S/oH4DKNVPhbrNaU6mZsXsHSW6Ro
	8VZqdy47XMKB+Hfk2dnd/1a9YbYeN0uX0b3xS9wAIgPckBzrmrj0UGRGAi1XF6tpE0/8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vnGGB-005wry-Ku; Tue, 03 Feb 2026 14:16:03 +0100
Date: Tue, 3 Feb 2026 14:16:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Min Lin <linmin@eswincomputing.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk@kernel.org>, Bo Gan <ganboing@gmail.com>,
	=?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>,
	devicetree@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	netdev@vger.kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	weishangjuan@eswincomputing.com
Subject: Re: Re: Re: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock
 sampling control
Message-ID: <dd8e35c7-d7a9-44d1-9929-5a6a1cfb4f05@lunn.ch>
References: <e6f7da45-3dec-4af6-a5b1-a72210bf24f4@kernel.org>
 <43923bf9-6202-4147-8eac-5bd7bb653fd4@gmail.com>
 <bd202cfa-d6eb-4d0e-982d-b49795dd25f7@lunn.ch>
 <009aefc4-fbc9-4f91-9230-23d18c281bf3@gmail.com>
 <73ea5619.2b71.19bf847c80d.Coremail.linmin@eswincomputing.com>
 <aXeydXuWEMDz-yVM@shell.armlinux.org.uk>
 <32a1f814.2c79.19bfe173225.Coremail.linmin@eswincomputing.com>
 <973f2b4b-bf8d-4a77-a27a-47495bc21ff8@gmail.com>
 <5c835fe9.2d60.19c0325df03.Coremail.linmin@eswincomputing.com>
 <43c97440.30bb.19c221bd137.Coremail.linmin@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43c97440.30bb.19c221bd137.Coremail.linmin@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_051622_072022_A3217CCE 
X-CRM114-Status: UNSURE (   7.39  )
X-CRM114-Notice: Please train this message.
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

> Do you think it would be reasonable for eth1 to have another different compatible
> string, such as "eswin,eic7700-qos-eth-quirk"?

I think you can argue the two Ethernets are not compatible with each
other. But i personally would not use 'quirk'. Maybe something which
says how they differ?

     Andrew

