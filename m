Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12F6CCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 15:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Of12R2/s6Y32nqdMblu5w/EJ2U82C1Y9iZtrzWl2jI8=; b=q7jgbj5QesYHOb0doz7f7y2rm3
	aoqnsqHJxyqJEakIxXrGHRjaFLpJgk1CBZhQ7rxQLUErFPyoZQkkFTH2Eg5qhVm35u2N23+rI0vxx
	q6y38iZnnMMv/cs2qKjl1Trv9DIdV9O87/ywqAy5gRwakK/j6pw+Je6DwXjk+qWp/wT3lE84o2dFu
	jgs5EtQba9H4Y2Q1Nofie5M0XNRm0c3JiZaN1rmOlWxdUsINrvxZANQ0pimTc+lvQDslqieGGw9HP
	wuPIWzxtNouKdcB++ZWJzt2NE1946NvdvfafJANGu4AAumJKIIgF1dWlnaar75t0lTIFEUGjABEzs
	82OkjeIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjwZ-00000003I2L-2FiY;
	Fri, 16 Oct 2026 15:34:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjwX-00000003I1C-0fOY;
	Fri, 16 Oct 2026 15:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Of12R2/s6Y32nqdMblu5w/EJ2U82C1Y9iZtrzWl2jI8=; b=p43ClLlAXvrwzZYF3VFMYYYtp1
	MulZNOFu+FXdeWWlGCXD15G2to0kiVJ91U8VBIEk9U+L+awogmOX6qOt9ZX6+nbAH+U4wJttS8DbH
	bddjkx5W0RQAGOeV2O3FMNrUIG/K84Czya4QJSRqHmSUgfDQgogBOAVFveqHT7lTHS8A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xHjwE-00BAjb-1Y; Fri, 16 Oct 2026 17:33:42 +0200
Date: Fri, 16 Oct 2026 17:33:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Biao Huang <biao.huang@mediatek.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Dumazet <edumazet@kernel.org>, kernel@collabora.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v3 1/9] dt-bindings: net: mediatek-dwmac: fix
 unit in rx/tx delay property description
Message-ID: <08b7abcf-a738-4ad8-956d-a6205046151e@lunn.ch>
References: <20261016-dwmac-mediatek-mt8189-v3-0-25daf2bbcf35@collabora.com>
 <20261016-dwmac-mediatek-mt8189-v3-1-25daf2bbcf35@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-dwmac-mediatek-mt8189-v3-1-25daf2bbcf35@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_083401_198120_8F918EBA 
X-CRM114-Status: GOOD (  10.96  )
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

On Fri, Oct 16, 2026 at 12:31:05PM +0200, Louis-Alexis Eyraud wrote:
> The "mediatek,rx-delay-ps" and "mediatek,tx-delay-ps" descriptions say
> their values are in nanoseconds but their names with the "ps" suffix
> suggest it is picoseconds.
> They are in fact used in both driver and devicetree as picosecond.
> So, modify the two properties unit description to fix their unit.
> 
> Fixes: 150b6adda6b1 ("net: dt-bindings: dwmac: Convert mediatek-dwmac to DT schema")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Maybe this patch should be for net, not net-next. Documentation fixes
often are. Lets see what the Device Tree Maintainers say.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

