Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D7CD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 09:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHkz3sXS4xRmbb1n3DFi1LDwAUWzmiQpx7m6JbKmtvo=; b=OREI6fGcAGfd0x9Cc7Wef/Uqbl
	1BlYKpXaMMSvuVF55+v1bwbPyxkEboIu+b+hiX+RHOE2xUIJSe8jEeSFVNgBDWS0832vBu8Y3crmG
	dbFIUjmrpBc6jhtqFzOUZ2hh860aWwryMDn/jX7eV6uhJNRaAVJwrSnuLRtkl/Gmri28+wRuhMArX
	7eqBJwOwyedZJ0zQ6dO3/Vrr+E6steVVsxqutj7TOyim0Ov1xaAtfxW5bqk3MPO35XLKeAlwrSOGZ
	Phc4Oy3slD2EjWjkfCXkhoGD8v2BnQDz59i/RmmQhRHFwxuKcXQkvYT55q7pZ9eBr2qqUc9mJudwH
	UPeoCsdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQijF-00000006LYO-48TU;
	Wed, 03 Dec 2025 09:00:53 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQijB-00000006LUJ-1sH7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 09:00:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jHkz3sXS4xRmbb1n3DFi1LDwAUWzmiQpx7m6JbKmtvo=; b=CoIXvQcMRkDNGCsctbpohlDp4F
	+U6Tbx3RfNFLbpcEOydCHRRJjLnZzeLL3udR/kPvCw8rnHwoqeCNjLrv4PEsBX13+LAh7p6JtXp0g
	uI73XgyUP5WdIKYk29gQfhVApE8wmkGyzO9puw9yUT62TXHvHmlSbxmIP9PQntj72KmU1SKWDwxkt
	OTD2qQADd93dlMqS4zlftwCU816lId2dflBn/JM/cauX7W3ebBphDcYtDAPYkkwPj1mg6WbMbij1o
	ayn9luvmXm8RMdzVryYpEtNv8CU2b/mYpJaMTVKRyPP+npGTZt8/PZa/TpGUCWBlQWGzgYPeBvpSL
	IbrsFREA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:45380 helo=[192.168.69.116])
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1vQiGZ-00000002WWi-1Mau;
	Wed, 03 Dec 2025 09:31:12 +0100
Message-ID: <304467a9-4c7a-4722-9e70-4d178113c33b@norik.com>
Date: Wed, 3 Dec 2025 09:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: imx: fracn-gppll: Add 332.60 MHz Support
To: Marco Felsch <m.felsch@pengutronix.de>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, andrej.picej@norik.com, c.hemp@phytec.de,
 s.mueller-klieser@phytec.de, n.wesp@phytec.de, c.stoidner@phytec.de
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-0-9c14be6c7478@pengutronix.de>
 <20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-1-9c14be6c7478@pengutronix.de>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-1-9c14be6c7478@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_010049_651475_41DFCA30 
X-CRM114-Status: UNSURE (   9.83  )
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

Hi Marco,

On 2. 12. 25 14:44, Marco Felsch wrote:
> Some parallel panels have a pixelclk of 33.260 MHz. Add support for
> 332.60 MHz so a by 10 divider can be used to derive the exact pixelclk.

Reviewed-by: Primoz Fiser <primoz.fiser@norik.com>
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/clk/imx/clk-fracn-gppll.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
> index 090d608672508a8819dc68eedec5b8d4a2c140c8..579f76494eb041dfba58b8cd10eb2453a0ec4178 100644
> --- a/drivers/clk/imx/clk-fracn-gppll.c
> +++ b/drivers/clk/imx/clk-fracn-gppll.c
> @@ -88,6 +88,7 @@ static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
>  	PLL_FRACN_GP(445333333U, 167, 0, 1, 0, 9),
>  	PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
>  	PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
> +	PLL_FRACN_GP(332600000U, 138, 584, 1000, 0, 10),
>  	PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12)
>  };
>  
> 

-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com


