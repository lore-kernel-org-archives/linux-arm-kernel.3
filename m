Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C598EC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 16:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/v+sG3TD6jlERhEZjj4JDFveXDMRMidR1SaMnbjck9w=; b=UMlOVrGVSDXYUnwELdgWdEPukX
	Pgq8LHeUsVa5QTIkTv0kcso6cE20C5brdxAwvulbQjrbt7K9B9yKpljcOV7upukyMlJG7dUSqg9Fe
	SCCD3t2eItWgAfjqQQzH3lXoclK4GzMLrNqEK4Rs9GGtIrrKg22EEZ6wB06PMNRHfHLw5U46JFxv4
	qKnTJofohoT/Er/m4/lbtI0s/TB5hHCSb9mbE6P+bCBBJC/NSN4sF/oC3Mslsn9dyDFC14s10Kf57
	dG2V74rfRcDWv0VT5u7ojayRb7NnwyEhWxC/GtBiT+zUHJpzp3rxPpVduOGfpNJ6zRYIbi4Od2Fj+
	OB6cQDPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQL6-00000008w9y-3rSY;
	Tue, 18 Feb 2025 16:20:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQEG-00000008ucK-06RV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 16:13:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/v+sG3TD6jlERhEZjj4JDFveXDMRMidR1SaMnbjck9w=; b=Jlil5M0o3R9rb3t3PBPnDyNjWf
	rwe6CYWwux1Fnga6sHKoWl84G7d8BUb3Q3ShtwqBUTFhP/AkvdSAnT0ng5LzjovAGacDbnMRfo7WS
	2mzW28ZKoVORAWY77+8Dx89RqD86A3RKjMCuWDUsCQSHAUWOJVU3g4pRHOBb7PV3xikg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tkQDy-00FLX1-UW; Tue, 18 Feb 2025 17:13:30 +0100
Date: Tue, 18 Feb 2025 17:13:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Philipp Stanner <phasta@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yanteng Si <si.yanteng@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yinggang Gu <guyinggang@loongson.cn>,
	Feiyang Chen <chenfeiyang@loongson.cn>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH v2] stmmac: Replace deprecated PCI functions
Message-ID: <c88920f3-ec6f-4ee9-a1d6-8423668480d0@lunn.ch>
References: <20250218132120.124038-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218132120.124038-2-phasta@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_081348_061143_5C3D4A28 
X-CRM114-Status: GOOD (  13.67  )
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

On Tue, Feb 18, 2025 at 02:21:21PM +0100, Philipp Stanner wrote:
> From: Philipp Stanner <pstanner@redhat.com>
> 
> The PCI functions
>   - pcim_iomap_regions()
>   - pcim_iomap_table() and
>   - pcim_iounmap_regions()
> have been deprecated.
> 
> The usage of pcim_* cleanup functions in the driver detach path (remove
> callback) is actually not necessary, since they perform that cleanup
> automatically.
> 
> Furthermore, loongson_dwmac_probe() contains a surplus loop. That loop
> does not use index i in pcim_iomap_regions(), but costantly attempts to
> request and ioremap BAR 0. This would actually fail (since you cannot
> request the same BAR more than once), but presumably never fails because
> the preceding length check detects that all BARs except for 0 do not
> exist.

Thanks for the extended commit message.

It would be nice if the loongson Maintainers comment about the removal
of the loop. I will leave it a couple of days before adding a
Reviewed-by.

	Andrew

