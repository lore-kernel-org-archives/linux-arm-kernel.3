Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46465C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 08:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dQ8YaRlPH8leheSk/R4RK1kv8p6nuXuYIhHCLiJSfw=; b=Lg9sqn9c+9p1s1qR+rLzQoP/Rx
	HutuAw7/U1zVIwpL9VuUBWbw4B5UWQKbYiuGE4p0Z2Ep1UzNoPdo3TP3iGolTjt2HwKbF0bGj9bHg
	FU4K1HOYSy4MDC/7jdw4KvSEOI7vnHss/ix9Rwk3gH8I5IOcdlZuxqmRz+dd45zbTgfUYcobfQawt
	cJ1MUrHVXaGFcyIsvvn3r8dYa7ya//1kuw72fuBQjDwYbZ5J+ok5TkuADv96lX/T5R6yXf+TFUna1
	qXRtAceqTRKaHNDxr4Ni8VhxYPj7ErKcFycBnJ41UOnb9f2yXfkqzHZZoYjdM/B9dwD+dlvC+/5f4
	w+pquiAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhh2-0000000AuTN-0Fdi;
	Thu, 26 Jun 2025 08:10:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhZ0-0000000Asee-2g1M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 08:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3dQ8YaRlPH8leheSk/R4RK1kv8p6nuXuYIhHCLiJSfw=; b=oFv1FQMDH/Tz+OBC5qChk1l6P8
	395y1OId5p42efMwHjjuhLS+fTIwrfsZr0q3lel7P1LDJmcOCanUL/7OwfMOVOpCxnc7PUy/SV1WZ
	GVa9D42034UJKVeUwuZ95YySR+iURF5IkFwxbumR7mplKUSOGgV5mhDIHk3LsGoCiNg0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uUhYg-00H10f-Vs; Thu, 26 Jun 2025 10:02:10 +0200
Date: Thu, 26 Jun 2025 10:02:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH net-next v2 3/3] checkpatch: check for comment explaining
 rgmii(|-rxid|-txid) PHY modes
Message-ID: <c954eabf-aa75-4373-8144-19ef88e1e696@lunn.ch>
References: <cover.1750756583.git.matthias.schiffer@ew.tq-group.com>
 <bc112b8aa510cf9df9ab33178d122f234d0aebf7.1750756583.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc112b8aa510cf9df9ab33178d122f234d0aebf7.1750756583.git.matthias.schiffer@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_010230_671592_D6A748DC 
X-CRM114-Status: GOOD (  13.73  )
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

On Tue, Jun 24, 2025 at 12:53:34PM +0200, Matthias Schiffer wrote:
> Historically, the RGMII PHY modes specified in Device Trees have been
> used inconsistently, often referring to the usage of delays on the PHY
> side rather than describing the board; many drivers still implement this
> incorrectly.
> 
> Require a comment in Devices Trees using these modes (usually mentioning
> that the delay is realized on the PCB), so we can avoid adding more
> incorrect uses (or will at least notice which drivers still need to be
> fixed).
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

One question, how should this be merged? The two DT patches might want
to go via the TI DT Maintainer. And this patch via the checkpatch
Maintainer? Or do you plan to merge it some other way?

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

