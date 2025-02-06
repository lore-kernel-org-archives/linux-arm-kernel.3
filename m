Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3905EC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 16:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2zTCdAiwjtGMltpjeuEXZsdfuHYHujZVn54Jf3PZ28=; b=PWkFagpC1x1CNdNY0hmaIlye9H
	ElNJtfhftSJV+/4H7BKsHkE9Pbv3iKOuZoKHByREhBokrsrYQ7uzzdRPXxdzG9DuD0GwSf7Z0iY7Q
	/LL61BzYpPcpERRj7ZbHikQTE9D9l+ChbTdYKlKc5z7Ln1e5KLwjNPkXriU9YNM9PIp06IK4Nk4W7
	wgnphy3mUjuKuNMmWxE8oJ31YzXlnYElVlRtO86XyBwl/Ew9gDE5nmyF74KwS1435HWS/1mWOTFuB
	ZZYEHQ7j9SOUDZiEF4Z4dh+zRvM0IB40ybY8vEE3+Z+n5i//LPRZ0YtXZV55Eef/ncEdNMBGHq3M7
	QkkSqZew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg4c0-00000006puT-0L2L;
	Thu, 06 Feb 2025 16:20:20 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg4Xv-00000006owV-1Rpl;
	Thu, 06 Feb 2025 16:16:11 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7229C25BAE;
	Thu,  6 Feb 2025 17:16:02 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hyL6I1G5C-bU; Thu,  6 Feb 2025 17:15:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1738858540;
	bh=Art8KyjybfoeMsnHABrcEmWzkyDUcEOdHCbqDbJH+iQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WoPMQMphaWzP9CeiXeEat/xaNv13qpR57gZ4ZZv4MlMnvrnMPnN3kO4QIpqjFu6gE
	 S1ELpMzJHCILHrn+eLo1BM8n7WHjRtX6khq0Dq3vG+Z76Yx0AbppnNSq+vEFTaq4+g
	 GhixIAbTP5K1DtQrb2jWzPvZF9jj68vjpyREtL2vcM2o+d4G5vm0ciP6NupzKyLlrz
	 fy0XdClOAdGjnbpC5/FUfD4ZSF9Sd6VfS2IuGdSVCXezMIDEf9gKk1gmE40uNU4YlW
	 DbjjlD7efyOQ5KAf5SWPlu2Nq0PZIbxTSEuMScAN0uFTYgTomNtGs78bU/Q0vdiS12
	 MWz8hdrqZDl0Q==
Message-ID: <19c8e021-d2c8-44b4-968b-153d798c140d@getgoogleoff.me>
Date: Fri, 7 Feb 2025 00:14:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
To: Ferass El Hafidi <funderscore@postmarketos.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Artur Weber <aweber.kernel@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
References: <20250203174346.13737-1-funderscore@postmarketos.org>
 <20250203174346.13737-3-funderscore@postmarketos.org>
Content-Language: en-US
From: exxxxkc <exxxxkc@getgoogleoff.me>
In-Reply-To: <20250203174346.13737-3-funderscore@postmarketos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_081607_795592_1FE7093B 
X-CRM114-Status: UNSURE (   9.91  )
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

> +
> +/* Wireless SDIO Module */
> +&sd_emmc_a {
> +	status = "disabled";
> +	pinctrl-0 = <&sdio_pins>;
> +	pinctrl-1 = <&sdio_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	max-frequency = <50000000>;
> +
> +	non-removable;
> +	disable-wp;
> +
> +	/* WiFi firmware requires power to be kept while in suspend */
> +	keep-power-in-suspend;
> +
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +
> +	vmmc-supply = <&vddao_3v3>;
> +	vqmmc-supply = <&vddio_boot>;
> +};
> +
>
  um it seem the sdio wifi module/chip connected to sd_emmc_a it is 
actually connected to sd_emmc_b

i tried to enable sd_emmc_a but nothing showed up in the kernel thus i 
tried to enabled sdd_emmc_b and there are a sdio device showed in the 
kernel (sdio:c07v8888d8888)

<https://matrix.to/#/!bDDAcbaDDYYwsVgelj:pixie.town/$YUSQIZ-pF22j9-ElrCst8XCUg1pac7CzWbUinNZL9HI?via=pixie.town&via=matrix.org&via=dissonant.dev>

acc to https://paste.coreelec.org/CoolersHurry 
<https://paste.coreelec.org/CoolersHurry> it seem it is amlogic w1 chip ?

(well on my board it is amlogic w1. there are some variant that use 
other wifi chip )

