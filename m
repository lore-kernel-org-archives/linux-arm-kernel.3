Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E578FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 14:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odfisOKLb+4yvBy7AJ37qHBwXC8cw5zHJIG7y4mEJ/0=; b=X+PSoSwVtvJQp+bjAiHGdhCrih
	l1mruUaL2VpRIUpaRxF4aPqclxOoTPxGtUTS8UnXT7gzEchZf6kMQ/4uuNWEf3ctESVt0mVsC3W3m
	heqkSm9kKD7QAq8dAZc/YFTjUtNS5nQpAXJrZ/P5/C/1S2ZQVjl7vxMC+uz/ROXDjQfQ0CW9QEBt2
	wyAPnx4qKaUZObySitBUvMoyS+grIis4Sc1Ih9loXQirCtQiscAn2nDsy8ETSVW3Q4o3LbZ2BOHhM
	xRIYyBOQmLz5hslj5aNTF9h8IzvOYWZ5+FzbjiwaCQW8dlN1wpHVLy/Gymz4UF3uOQRjC2gURPoXN
	SJh53Kyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIS2c-00000005Z9e-3fuG;
	Thu, 30 Apr 2026 14:06:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIS2a-00000005Z95-2E1A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 14:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=odfisOKLb+4yvBy7AJ37qHBwXC8cw5zHJIG7y4mEJ/0=; b=XR
	qQ7vFu0LANTE4mm9ix8Cgztidd9/ZquCyUK52yVFPuQkm5lA+iProb2QG98KcUuj8BRdUyali4w+T
	zG9zkQXaIC2wUnl+2rx33fzfb3xFiypXO6j5ybYInFDr+7zSh6p2Ise5RUbF307L3xY6+bXOi7Sma
	TbT+nrZPd4U9qIU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wIS2J-000gvp-5P; Thu, 30 Apr 2026 16:06:39 +0200
Date: Thu, 30 Apr 2026 16:06:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Alexander Dahl <ada@thorsis.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: imx8dxl: Add SolidRun SoM and
 HummingBoard
Message-ID: <d0c9d2c9-3743-4ee6-a2d7-692118903141@lunn.ch>
References: <20260409-imx8dxl-sr-som-v2-0-83ff20629ba0@solid-run.com>
 <20260409-imx8dxl-sr-som-v2-3-83ff20629ba0@solid-run.com>
 <8efbafe3-0a8a-4005-960c-e8fe62cee719@lunn.ch>
 <bd2e73c5-2e61-4ea1-ab3b-42a6573b31f8@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd2e73c5-2e61-4ea1-ab3b-42a6573b31f8@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_070656_571955_D5755149 
X-CRM114-Status: GOOD (  12.38  )
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

> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> >
> >     Andrew
> 
> Thanks!
> 
> I don't know how to keep this partial review for v3, so I will send it without.

You can add my Reviewed-by. It is on record in the archive that it
only applies to a subset.

And in general, nobody can know the whole kernel, all the different
subsystems, and the details for all the DT bindings. So i would allow
some fuzziness for Reviewed-by: for a DT patch.

Interesting, an Acked-by: might actually be more appropriate.

    Acked-by: does not necessarily indicate acknowledgement of the
    entire patch. For example, if a patch affects multiple subsystems
    and has an Acked-by: from one subsystem maintainer then this
    usually indicates acknowledgement of just the part which affects
    that maintainer’s code. Judgement should be used here.

So how about:

Acked-by: Andrew Lunn <andrew@lunn.ch>

and you can take your pick :-)

    Andrew

