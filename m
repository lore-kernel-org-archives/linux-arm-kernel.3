Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99772CFA45F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAxKTtO4kugd7yM0ZwL4yTamECyLObrP7YDrcb1pBYU=; b=OLLD80CwRZyVUjGPdEBNFsW0n7
	JEGKcY1bprkZry62iyDx54cgI3hBa6qW0U0QYxTkWg5Cm3HI81IOmpDC5v+FFAPwaqqZ+HpTqadh1
	aPK33LU4IEpcryFKzVE/TNmvVjcVKa6WBLN7vTnoVZfoVEv+/HfJxuuWec08QYG2NdfR5UKsMLUc4
	xnSK9h0UNtnuD86eDOyeLhlPPzNfuEPbyU5fdsCZT1hKhe2pFOiijvNm5ACCb2e0S3TS1G5lFXKHf
	2EQ0EO3cNFP9xqpysxdgM4RLKjdeub5jU5kETBU9vnTUFvclCbwkjx9/4aMelMxoL6cbXIW9ZV/P9
	Pz24u+EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gsx-0000000FeAA-2Ujb;
	Wed, 23 Oct 2024 19:19:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ec4-0000000FEV3-4C8x;
	Wed, 23 Oct 2024 16:53:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iAxKTtO4kugd7yM0ZwL4yTamECyLObrP7YDrcb1pBYU=; b=jODv4VM3sPW38wKNHiSrxUwmm5
	ESPeYRZZyxQ8scznMtH6Enc4Zx1Kc9U7QCwx2Eevi676iWYYJ//lWtDPY/vSVFKDmYunjCUD7AUKS
	Lt1reOI7jc/W4gXXJVK5NQUawryVn3PuRU/01HRZ58YhStp2hW1Z18RdvQA5/LbjE9OplybVjTwzR
	fyskxrWRWoHQKEdwOEc1TP9+pikOWLqmYlg24fi5+Xh4IyxGU/efqShW+yNjhi+N/tQ6jhj+79inG
	rCUsb14YFc3BKiY0iyBX4mgX+Y/Caz29Lxgq0wbY1VCKAoO7xquBCsBRExqYDmAhlugm80Wl8AWks
	fpJ090gA==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ec0-00000008TPc-2Gfo;
	Wed, 23 Oct 2024 16:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iAxKTtO4kugd7yM0ZwL4yTamECyLObrP7YDrcb1pBYU=; b=d+un5T1MRvoFgGi2vvDYjQNQGu
	cG9TbCVi3QEkrBQ20xMjkz3Dr9do61nv/DV6xicVCFGjY/1BlYjm2UZW5kGBNqY9SbKKX/f8cxkQz
	JQVXS2Vk5bE5vAkVFiyG/PACeHqWSXjYdkhMQnqtiOc6AlAIl+k8bsClGn3T2DjMp4jU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t3ebi-00Azfr-AO; Wed, 23 Oct 2024 18:53:14 +0200
Date: Wed, 23 Oct 2024 18:53:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next RFC PATCH v2 3/3] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
Message-ID: <87aad5ff-4876-4611-8cf8-5c20df3559b3@lunn.ch>
References: <20241023161958.12056-1-ansuelsmth@gmail.com>
 <20241023161958.12056-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023161958.12056-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_175332_729639_B455E247 
X-CRM114-Status: UNSURE (   8.27  )
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

> +	/* Enable Asymmetric Pause Capability */
> +	ret = phy_set_bits(phydev, MII_ADVERTISE, ADVERTISE_PAUSE_ASYM);
> +	if (ret)
> +		return ret;

The PHY driver alone does not decide this. The MAC driver needs to
indicate it supports asym pause by calling phy_supports_asym_pause().

> +
> +	/* Disable EEE */
> +	ret = phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
> +	if (ret)
> +		return ret;

Again, the core code should handle this, unless EEE is broken and you
need to force it off.

	Andrew

