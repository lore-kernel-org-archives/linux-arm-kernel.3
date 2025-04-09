Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF32CC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iay7Qa9sHNdJmcKXfDHG/I+AIXVYDO+D/QQZnAThWT4=; b=AyGERIni7g1ObeL+Ylb3iZb6Vp
	OJrwUk0BoHzR/ocBu4SZLZyVw77irQo8lf/2Rdk8V/sN7TOD4MLFy0UjQMy2Gu8ISxWmDU7WgrQb0
	dvmJq6qGZSrSoAOfcgRs5D0QU2rTtLUVlUQs9buTrxpkD/hO3SsEJHyehhg3wI1xNgqIdaHQUVGm2
	eoGcWT3H8c4Y/7BZi+wgHeNPfCrK70QzhXV1Ank+ULEyOvFpdrbcTI9GJS4oVyqbcouLjmNPbecB/
	prUdUgn3R5cM3TPXsTLDFiTTwB/jUvVCIpEcmBhS8750XGpycQsYNsBmvREZWelNmtDOF8n4tztU3
	X5Xlm9MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dLj-00000008dXE-01he;
	Wed, 09 Apr 2025 21:52:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cdC-00000008Wu6-1Pf2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 21:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iay7Qa9sHNdJmcKXfDHG/I+AIXVYDO+D/QQZnAThWT4=; b=qba/6MvMpUVqbjjCqTUqeAW+ne
	H+o9Nsni77/pVeMjpWzHLi5WCNgJevjaPJ8xhwIIpr0YtybM40VTypQ3eX82igMkWUYgClhYpK1w5
	UEcDIHOHgdzBuEgbIJ3FO7uvz6bRITBehc+JonQGPEZLyr8vyyJCzuTZSWiOfRfo992w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2ccw-008azr-2R; Wed, 09 Apr 2025 23:06:30 +0200
Date: Wed, 9 Apr 2025 23:06:30 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [net-next v4 3/5] ARM: dts: nxp: mxs: Adjust XEA board's DTS to
 support L2 switch
Message-ID: <b380c764-5a46-49e8-9241-675a6b9d85b6@lunn.ch>
References: <20250407145157.3626463-1-lukma@denx.de>
 <20250407145157.3626463-4-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145157.3626463-4-lukma@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_140646_371741_BC55D4DD 
X-CRM114-Status: UNSURE (   8.28  )
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

On Mon, Apr 07, 2025 at 04:51:55PM +0200, Lukasz Majewski wrote:
> The description is similar to the one used with the new CPSW driver.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

