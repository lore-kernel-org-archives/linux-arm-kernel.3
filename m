Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF33CCF2DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6HJywsKHh53IEWEiQpClvaHw8ghTVJq39aZi8BPCAo=; b=QjbHLnr6TDC1rh9ImBFsjLdZ45
	IAPG9tYmCpEXdHvCAGFbQ1a26uD4Ik9Vqy0tdUVeAf9Pw2VP3B6ldPfE8hJWVCNoFKyzuNvTjaq7V
	B2x4C3I1cLF8dwV4MBZHORcU+xLFupdAc9XOJRiXCLVVE4LyI/y3Tf8dRTO8iWD11XW9BKMHv9b6j
	2icPuNN0j9xl7AG47ykSkPNkp4vN0MzwMywv+u8kv/oidGK1HgJkPfcrSsmKq1X+LGch5wRsoFmvW
	NOPPdQnOjdSidBvJ/sjqMLLRwP/EJn1tWPjyxTb6TGmiFKFuSqBTgm5mkFaBKVOXITdbj/6YUnoJI
	1H63qkUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn4B-00000007SXC-195R;
	Mon, 19 Oct 2026 13:06:15 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn48-00000007SWC-0O8m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:06:13 +0000
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::109])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 636532018D2;
	Mon, 19 Oct 2026 15:06:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792415168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z6HJywsKHh53IEWEiQpClvaHw8ghTVJq39aZi8BPCAo=;
	b=ez3IQRq12gsTNGODFXZzRllu3D9nArUc50OhODwJaryVGgHgr3lKN7z5gkUq6YGAjiBkUx
	I+JWC6O3m7yg7a0Fsk8UHpl7Kwi+tRfbmM2dQ/TjHhg9GkDfT0OPQFAjJk3vsks4Yc23Tc
	6Hjq5bdr5OtWFxAXHZrvOLHFWLR6uAqMYoPJJJKGcBKZ3pjxj+AWEeDdQ1jAsA7djkQlUc
	K7azMvWs+RYWvE+WT7da20JU6yngSf6tUbdZqyouLP2JSg0uYbATSuxHCTzBUASiEFYk59
	jFWfZHTuX/OlnY61kxayWjrPBLpHMUF9xnvKekXnkdMuFFcziWxnaFvrWw37RQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792415168; a=rsa-sha256;
	cv=none;
	b=F7JKLT4pj0z1IeY8KRGE7/e/m+c9gCF0VBc2EaTEwJSlsYbpsJnScsEyzsdavR66yvdd86
	ixgx6UZ6X+rhM0u0JXN3gL5VMCfZNJDywNGuHY5wt/pkxaGKOwY2pIvyYmCEunjD+0e4E1
	fAsn/exgsqqgCXzrsabpzDqQQI0KSS51bavBaOSurR8reOWek9BiDtfxjM11J/nws15SJF
	1REqCkSOvKewpJ3mWND24ryHn0jAuL3iUaAZ2h/3+ld9snd0G7iFuVepDvYoyT2ZSq/ikb
	T9S2vO0BLIYQaQUQ77NA2qy58kbrFpGE1mpiwpawa2mFukjRwwl4mqZnf4jzOg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=mfe@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792415168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z6HJywsKHh53IEWEiQpClvaHw8ghTVJq39aZi8BPCAo=;
	b=MUrUnoHjrAdHgjnvm20c8PmZCK0FBPh1LvuZaMvM2bIqEKqibe8Aszc6D45bCGucyjN8HF
	iH23iMTePkaohvp2UGF32FVgnMhF5ePIey+cVS781J/VDPcV3qoJDE5OSoB8kPvLNKxDy5
	KnzRsTug3JRoIeJyjwZnPjYVWAnvGI5WyP/3U2lfZZ88XHnQsUPUdoCJKyqcmuBKjbMRwn
	YSJkz/9HgI22oNOroCEaSbAtc0T5S/TkYRab5wO4cBGgIpjjHsXyDY9pW+5bVw8QqVB+vY
	Mjm+snA6iInjdYHZvd645cJwW6XLsrLSyOAHc81SYfUv/RkgAMlVaiJDniXdZw==
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1064)
	id 4CE841C0145; Mon, 19 Oct 2026 15:06:08 +0200 (CEST)
Date: Mon, 19 Oct 2026 15:06:08 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Joy Zou <joy.zou@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add i.MX937 FRDM board
Message-ID: <2l6vjbw6nkyq6jouilhhg7kebnuka25z36tu6yecyc5hpogluo@kljl5qqoz7s4>
References: <20261019-b4-imx937-frdm-v1-0-76d949a61954@oss.nxp.com>
 <20261019-b4-imx937-frdm-v1-1-76d949a61954@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-b4-imx937-frdm-v1-1-76d949a61954@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_060612_299179_34A87E75 
X-CRM114-Status: GOOD (  12.37  )
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

Hi Joy,

On 26-10-19 19:10, Joy Zou wrote:
> Add DT compatible string for NXP i.MX937 FRDM board.
> 
> Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index c8290a83205b..af10cac62f90 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1570,6 +1570,13 @@ properties:
>            - const: toradex,osm-imx93
>            - const: fsl,imx93
>  
> +      - description: i.MX937 based Boards
> +        items:
> +          - enum:
> +              - fsl,imx937-frdm           # i.MX937 FRDM Board
> +          - const: fsl,imx937
> +          - const: fsl,imx952

At least to me it seems odd that you specify two SoC compatibles here.

Side note (obviously not something you could influence):

NXP should really work on their product family names. If some
i.mx95<foo> is compatible with i.mx95<bla> I would call it i.mx95<foo>
and not i.mx93<foo>.

Regards,
  Marco

> +
>        - description: i.MX94 based Boards
>          items:
>            - enum:
> 
> -- 
> 2.34.1
> 
> 
> 

