Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86930CCFA07
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 03:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKcdMdVUcB++neaXWMBwYyImzHSwG/N24sLqEytUYkY=; b=APxI3C4SREXdnu0Ttu/UIfhOJG
	EyC4Qk/bjomncZkmc2Tke6WfqvoW8tDsbFSpIJn+8Sr9BVIJo13/vv2xfiEWO+x4t2qjnNKqJ0mfA
	3L22opHvA88RCgCoZRvsmrSD6f10MZNY0uckSNhOqFAhHHhMGpWR5bS3/M0Z57ZoM8iWCokv77Vbo
	WYaL3ZPseTaFCWGepDnlk3v0ff2bV5UZNSVAwMP60LbjNNg+8PJBw7CZOLss1rJf14pup0jWRM/4/
	BsOzEEx9UC1n1xLJDoyVMxPf2l6TnjxLTeO9RTMklD6Hcfv87gZyZm4kuDH6ijgCDmEmArXsVkqwY
	2RxqLxMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG83B-0000000B4s5-2KC7;
	Tue, 04 Nov 2025 03:49:41 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG839-0000000B4qx-186A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 03:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KKcdMdVUcB++neaXWMBwYyImzHSwG/N24sLqEytUYkY=; b=Rp/1RkqfFdft8wuBvYka9zL9cx
	CNK1zBVvheHgxEvgA12K3H++qoqgHv0N0at+AD4RyEfKhnKqbGYWkMoLVN2BeoJe/LRt29ANKTkNX
	hUy+7UU69/9XNJI1txi2rLjg1487X5K1IdO/TOISULFGdhupCnOuJiimTsCRY67x2Nx0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vG82j-00CqtK-Be; Tue, 04 Nov 2025 04:49:13 +0100
Date: Tue, 4 Nov 2025 04:49:13 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Po-Yu Chuang <ratbert@faraday-tech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, taoren@meta.com
Subject: Re: [PATCH net-next v3 3/4] ARM: dts: aspeed: ast2600-evb: Configure
 RGMII delay for MAC
Message-ID: <aeb33ab2-4a50-4651-8bd7-8fa2bf854c87@lunn.ch>
References: <20251103-rgmii_delay_2600-v3-0-e2af2656f7d7@aspeedtech.com>
 <20251103-rgmii_delay_2600-v3-3-e2af2656f7d7@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103-rgmii_delay_2600-v3-3-e2af2656f7d7@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_194939_307075_13A659F9 
X-CRM114-Status: UNSURE (   9.14  )
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

> +	scu = <&syscon>;

This property can be moved into the .dtsi file. It should not matter
if .dts files are using the old compatible, it will be ignored. But
having it in the .dtsi makes it easier to .dts files changing to the
new compatible.

	Andrew

