Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F8CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 18:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEp7EA5X0RhOA8vfzTocFtU0Jd6TueMyI9rfsA0bdr8=; b=WunYw8YzW41rKgld1cqry6v02H
	kH0XkSl0wAunEbGex+E1Rxp6qvAtwBhwCala0QIcX+sy/XuZ8Moj9BDC7xMxt2re5yAWYaykR5m55
	Pn9HjjGxtdaukPnOd2jd4klB/jChhRsHfvq0QJS9ZnnGPRjkgxvkAyZffIs0kTn3tc8L6DpCIjZIs
	Bb4/q8J7lgzKRVLggsSp/PK1paAhR5PiEkqOXq0LRSKQAdO6it6zjcNwyWcf42YzjUQgd30Ee3fMR
	d/rWBD/JMCdG/2MO9Q+/rdO5AAn0fA2ZvdYg499D/nhtFOCQSZhvkU1o0+g5MIpind9EC+N71pLQm
	MUsLItQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHGn-00000008R5N-3efT;
	Wed, 12 Feb 2025 18:15:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHFN-00000008QoT-0m8c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 18:14:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PEp7EA5X0RhOA8vfzTocFtU0Jd6TueMyI9rfsA0bdr8=; b=tgJ/oe5VVNuVEBpbtssebCVqXF
	atIXLVxbpWvptAu0rWsu54ZfMhdyS1SqnAJAs99CjJJY/uNg4dCrfGPkHFJWezouDfeWUR2pCMK+n
	f1xp/9I1ey7gUPzohHqHF/MxeNMX/beizUd3vMQYTiHr2dlVHVoqUOADkkSLikX3vyAo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tiHF1-00DTQT-08; Wed, 12 Feb 2025 19:13:43 +0100
Date: Wed, 12 Feb 2025 19:13:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Philipp Stanner <phasta@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yinggang Gu <guyinggang@loongson.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Philipp Stanner <pstanner@redhat.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] stmmac: Replace deprecated PCI functions
Message-ID: <885058ae-605b-46e6-989b-3ff52908e6fd@lunn.ch>
References: <20250212145831.101719-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212145831.101719-2-phasta@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_101405_221355_22717D40 
X-CRM114-Status: GOOD (  12.44  )
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

>  	/* Get the base address of device */
> -	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
> -		if (pci_resource_len(pdev, i) == 0)
> -			continue;
> -		ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
> -		if (ret)
> -			goto err_disable_device;
> -		break;
> -	}
> -
> -	memset(&res, 0, sizeof(res));
> -	res.addr = pcim_iomap_table(pdev)[0];
> +	res.addr = pcim_iomap_region(pdev, 0, DRIVER_NAME);

I don't know too much about PCI, but this change does not look
obviously correct to me. Maybe the commit message needs expanding to
explain why the loop can be thrown away? Also, is that BIT(0) actually
wrong, it should of been BIT(i)? Is that why the loop is pointless and
can be removed? If so, we should be asking the developer of this code
what are the implications of the bug. Should the loop be kept?

	Andrew

