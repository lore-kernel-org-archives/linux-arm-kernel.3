Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01813D12D59
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 00:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fau7G6sjEi0y036rsC9jXaCUd8fRYQLfiS++NIMzDpM=; b=BmKHxkInA1we4DP4QNdlXPCun2
	zp3C0Hyqfyrh/dFaS5cek/L0bOcxJoZ1VHjf6SmT20Y8efHRmx1GCtTPeE1TEA42CpHJ5IorapBQw
	s2rSEUR/lmZwgvzUd7JEOkDQPkerMqfAjch9DdkYRRvHC0uQxdM8E/3c7Sia8hSVMSFeIim2yfT1I
	avz0+qoU728ER8xEhYjpKnFOhOOte/MJNvKaQvScbadXc5efpUgGS9MFxoD75ezzfSLCrMW27DAeN
	3KbIfYHX39HP2Buu6vj0ehH5g0MtMTFvqLMKcR1N5uLj68SNktHGCdqFQyta/gxuegF0tpDucWmJE
	LkMc4sjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAHy5-0000000FuxX-1B6s;
	Mon, 11 Nov 2024 00:07:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAHwI-0000000Fuog-2IlY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 00:05:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 23293A41347;
	Mon, 11 Nov 2024 00:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F58C4CECD;
	Mon, 11 Nov 2024 00:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731283552;
	bh=LEbk0UwzMReWGMLM1N0ZN67ounf8WzkA5leISWNctcg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Rgls9w2RaznQ+91jdI4cssdxWso5jSndTFs3MQMRGCKOkHWtccDPVuLuHTwnQ2Pks
	 JqsIyuk86QeOE11KmSrxX1aL4mDG76MH53uKpS/PZEf1wcuimcXG199AXJFnuwyAmH
	 A1gnW0fWpI4xsemcmd1qCW6lVUHh65W7Hdu9epTCTq2Ex/7BeLN+THiwlEUxVRR5oP
	 lUdHVjGmItx2L0W73fc3JOlqbQu6G9mMcS/snX1L/ype6AQdFNBBO9+AXtERM7ol8d
	 cH9y+tu2NyAtO5Nm4Gq59+bK/HGnv3H9rEbO0KSkxGOuV65CawlGZsQgi9S7oHjcBo
	 TXIdRvJZ307+g==
Message-ID: <c6dade2e-fd8a-4a7b-89a1-b1276d8e9106@kernel.org>
Date: Mon, 11 Nov 2024 09:05:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH v1 2/3] arm64: dts: marvell: drop additional phy-names for
 sata
To: Frank Wunderlich <linux@fw-web.de>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241109094623.37518-1-linux@fw-web.de>
 <20241109094623.37518-3-linux@fw-web.de>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20241109094623.37518-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_160554_708736_93CE1E59 
X-CRM114-Status: GOOD (  11.82  )
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

On 11/9/24 18:46, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Commit facbe7092f8a ("arm64: dts: marvell: Drop undocumented SATA phy names")

Isn't a Fixes tag for the above commit desired here ?

> drops some phy-names from devicetrees but misses some. Drop them too.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  arch/arm64/boot/dts/marvell/armada-8040-db.dts     | 2 --
>  arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-db.dts b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
> index fe5d6cb9d692..9d45e881a97d 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-db.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
> @@ -307,11 +307,9 @@ &cp1_sata0 {
>  
>  	sata-port@0 {
>  		phys = <&cp1_comphy1 0>;
> -		phy-names = "cp1-sata0-0-phy";
>  	};
>  	sata-port@1 {
>  		phys = <&cp1_comphy3 1>;
> -		phy-names = "cp1-sata0-1-phy";
>  	};
>  };
>  
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> index 5043cf2eb33e..0d4a5fd9503f 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> @@ -345,13 +345,11 @@ &cp1_sata0 {
>  	/* CPS Lane 1 - U32 */
>  	sata-port@0 {
>  		phys = <&cp1_comphy1 0>;
> -		phy-names = "cp1-sata0-0-phy";
>  	};
>  
>  	/* CPS Lane 3 - U31 */
>  	sata-port@1 {
>  		phys = <&cp1_comphy3 1>;
> -		phy-names = "cp1-sata0-1-phy";
>  	};
>  };
>  


-- 
Damien Le Moal
Western Digital Research

