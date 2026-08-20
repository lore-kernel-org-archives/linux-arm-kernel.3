Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E6EC5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 21:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EvwSXRxb9J8E1d/2epUBUSc8FSlEoFftTDkK/JBgJcc=; b=B96xjeogVN+J1KgKkeLropttzJ
	bBycjCNz2wTbJaG3PjbZ4iEptxAW44d4ICLAnAyou4O9KfJ9PQkr44rDZfGRTO+KyyELJAkErazYX
	Faihf/3BjR4GNFZCp3Pnbbja8ZJnAHVVxTo5/86A5H+ttSIYNLejZIfg6rmj5V3VBCKP0ExLpDg65
	kletCTa5H1XJ2iKgKZcl/4GHblJ4wx6y/28EhGNdn0hhwPXYzSdfJFl6GT/6vDQkwuiO/SqUcI9u1
	CmcN8FqazqIRl49/HRGGcMfNWdA2bJkCPsE6c1jkdqgqAsWEMWnzPnJarL2pnr+YtoqIExmYPxpII
	q0gXLgmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx9uQ-0000000CBtT-3IcQ;
	Thu, 20 Aug 2026 21:02:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx9uO-0000000CBso-23ue;
	Thu, 20 Aug 2026 21:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=EvwSXRxb9J8E1d/2epUBUSc8FSlEoFftTDkK/JBgJcc=; b=es6UCJRLDTAY1chKmX9GHIaQQo
	+DLoTvMoIHeGBQQoGDG55Mo7ki1zuRY/fI69Ctk24CD8qC1w2EsVwDOciwfoc+D2GX4NjilPrUoBj
	SlnuHQ9aud8/JsyAgyPiRHudxs5FVylkKV8VokYyo+Kp94yxsOI9bdvOi5QJksJc/ySU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wx9uA-000qSi-1m; Thu, 20 Aug 2026 23:02:30 +0200
Date: Thu, 20 Aug 2026 23:02:30 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
Cc: netdev@vger.kernel.org, chester.a.unal@arinc9.com,
	daniel@makrotopia.org, dqfext@gmail.com, sean.wang@mediatek.com,
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, yangshiji66@outlook.com
Subject: Re: [PATCH net v2] net: dsa: mt7530: do not advertise EEE on
 MT7621/MT7530 switch
Message-ID: <108396dc-0067-4b1c-b270-9d42e2b9a96e@lunn.ch>
References: <20260820202844.1821687-1-vladislav.karmanov.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820202844.1821687-1-vladislav.karmanov.dev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_140244_530710_E4E26286 
X-CRM114-Status: UNSURE (   6.00  )
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

> The MT7530 internal GE PHY advertises EEE by hardware default. The
> eee-broken-100tx / eee-broken-1000t device-tree properties

These properties are not needed. We know the PHY is broken, there is
no need to describe it is brokenin DT. The PHY driver should just
disable EEE. End of story.

     Andrew

