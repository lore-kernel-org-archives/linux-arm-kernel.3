Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD1E606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 17:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bcLG900Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=90PpyRvqw50zWmq9+jh1atWjcGYKGRTrDoZ7I20u5a0=; b=bcLG900YfGn5rE
	ZDfkmqV/o3AOJUVsqRpxNhd1d4+hUg+bsKNjJQVMSO1aypjh7STpRdkyfn+iWSY4+l3CjxIMbKgvr
	e9YVJeMpO9g5wenbcxSZwBbiHyKe9h56yd/1PadQXHYxpdddfJ9qUlDVBw4g0LndnQkhrG/yzy3Ci
	g5OxOI4DtOn5bqLxIo50XtfY6nAMv31fFbL4h6ksVFljx2ESJRzVMYsuytI5P1vzwFGwZWizaCNMT
	E04TNcuFpCAFcte7sWkxwezMzzeOPh20vu5JI9/PA6hFVBzIpxLLvre8GgLbTfiPGcVepczKukT7X
	YInbtpAULtzjDA7BqlmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwjF-0000000Eay6-37I0;
	Thu, 22 Oct 2026 17:37:25 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwjD-0000000Eawn-0ZGa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 17:37:24 +0000
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso26546f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 10:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690641; x=1793295441;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90PpyRvqw50zWmq9+jh1atWjcGYKGRTrDoZ7I20u5a0=;
        b=W66Z919JpAIg3wG6kLNKgd8GJVOqHjE1CL0M7aBqKYONYzdC9lAyv4P9jNnseU1hfG
         Yds0M+g2cVv7FkOBLAPS8/TkjIZs+Mad85W2HJYwxHQEoOhTJGqNkQ7kMkZ4g4xXy2Vw
         ZCCPb/RFOcWjv3nOEdiR8GN29rZJcqwDjvX2MaN83wBWFEqkDCFLkO2VRRspMuBplzkr
         aTxPhsh8fA31uRivm+WgMUJJypZtqOjdIb6LONs6pgXf0u8Lfwc+JFS/3FgMeZRdnnXk
         +rb4QuR3bWdlvxJjoCUE1qTPBkUiIOSuk0mnNVIVoaVwwBFTu/ztT7HdnRO0OCgmXjJ1
         X05A==
X-Forwarded-Encrypted: i=1; AKwUvBxOU4+XUnYBpiMHMKN6ZjAT+173ikyOFOvFaO1tWZtOWza4xySBzAZ5LNsU4CXXY1STZsmSAd8hkBl0N5RdlJWq@lists.infradead.org
X-Gm-Message-State: AFq9FYLWpNtKpDrD6RYsSXhrChpACwdRY7uxRH8bLaKgolWQE16GcQZl
	JHrcXIZkDx0W5VRJdurvjFLm3G8ke0tauhV5ebxYZ1YYDNzc/6gWz4JQ
X-Gm-Gg: AYBFou19WD+21TSXNtWkxwuttYfCZpe5+62EdhiqURWTyWVzZ5yl/7Y4q2bTZuL11Ls
	02nk8SrByga8vhKijemGxOBP0BEJZAwxr769/iey02r4mZCMBMehojLpcbJrFNymrVVNLrWttim
	yDrNZuPoVy1UoklF2u6RrY/p2vDot6KiVfhfDBqGQmoiEir+9VRxrD5Y/ohqrK4eSx+MdmyPuNu
	uLG9aMAVPlh+Zq8MV1ppLhxpi2M0xq6qno0qeeiH5Q3S6kEXsbklmmqfOPU/vkzrnpI5C8JDoY0
	i1zPjTfExsqtXIbzMnrM/GzOTVLTpqZ1O4G1JgG8wIJTVpgpyv8461JPDxRdAma9t9He++8xi9z
	3mUiAE8u1v6/IOpXGf6MT/YN1+63G4XpPXrA5lkxkSwc67nj5H7eXM8HXw/baChYHghioiVG5zQ
	PvJumJZaxxjelfY8fFHE70jtvCu9n3n/c2fVESiShTCZSZykBvOtGnHFDETMijPysbOsKxj55kt
	SBf/PWHnRwcMcRYMpme699JNfB+wDuQKyqQn29yDkwI88NkGUxNWz5CwqAaU596DTiDNi3nwipn
	5hD9VyUTONb4SrHXWnU9yvX5Jag4TscD
X-Received: by 2002:a05:6000:4e:b0:48d:f3a4:a6aa with SMTP id ffacd0b85a97d-48e264f2be7mr9021652f8f.35.1792690640831;
        Thu, 22 Oct 2026 10:37:20 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f0bc2sm13391825f8f.1.2026.10.22.10.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:37:20 -0700 (PDT)
Message-ID: <00b94eed-fe1b-4cf3-a4ed-12813faacb86@linux.com>
Date: Thu, 22 Oct 2026 18:37:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] net: stmmac: dwmac-meson8b: apply the RGMII delays
 the T7 way
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-5-tanure@linux.com>
 <a1c0b76b-7b67-43e9-af15-3139f17d7fe7@lunn.ch>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <a1c0b76b-7b67-43e9-af15-3139f17d7fe7@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_103723_210236_84B3E6C7 
X-CRM114-Status: GOOD (  35.71  )
X-Spam-Score: -0.7 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12/10/2026 13:30, Andrew Lunn wrote:
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
>> @@ -82,6 +82,7 @@ struct meson8b_dwmac_data {
>>   	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
>>   	bool has_prg_eth1_rgmii_rx_delay;
>>   	bool has_pipeline_clk;
>> +	bool mac_applies_dt_delays;
> 
> Please can you invert this and call it broken delays.
> 
> We should make it clear that new devices should not set this, because
> it wrong, broken.

Moved to a function for T7. And the previous SoCs have their own 
function which gets a comment that new SoCs must not use it.

> 
>> +static int meson_dwmac_init_dt_delays(struct meson8b_dwmac *dwmac,
>> +				      struct plat_stmmacenet_data *plat_dat)
>> +{
>> +	struct device_node *np = dwmac->dev->of_node;
>> +	u32 tx_delay_ps = 0, rx_delay_ps = 0;
>> +	phy_interface_t phy_mode;
>> +	bool mac_tx, mac_rx;
>> +
>> +	mac_tx = !of_property_read_u32(np, "tx-internal-delay-ps", &tx_delay_ps);
>> +	mac_rx = !of_property_read_u32(np, "rx-internal-delay-ps", &rx_delay_ps);
>> +
>> +	/* one step is a quarter of the RGMII clock period, 2ns at 1Gbit/s */
>> +	if (tx_delay_ps > 6000 || tx_delay_ps % 2000)
>> +		return dev_err_probe(dwmac->dev, -EINVAL,
>> +				     "The RGMII TX delay must be 0, 2000, 4000 or 6000ps\n");
> 
> tx-internal-delay is not listed in amlogic,meson-dwmac.yaml. Please
> could you add it, and list the valid values.
Patch 2 of this series adds it to the T7 block with the valid values.
That changes in v4, see below.
> 
> Do you have access to the datasheet? Could you check these numbers are
> correct, because they are larger than typical. 4ns, and 6ns makes no
> sense, the RGMII standard only calls for 2ns.

Yes. The field is not a delay line. It selects the phase of the TX
clock sent to the PHY: 0, 1/4, 1/2 or 3/4 of the clock period. At
1Gbit/s that is 0, 2, 4 or 6ns, which is where the numbers come from
(the existing amlogic,tx-delay-ns property lists the same four). Only
1/4 is a usable RGMII delay; 1/2 is an inverted clock and 3/4 is a 2ns
lead. And since it is a fraction of the period, the 2ns is only true at
1Gbit/s, at 100Mbit/s the same setting is 10ns. I agree 4000 and 6000
make no sense.

> 
>> +
>> +	/* the RX delay line moves in 200ps steps and reaches 3000ps */
>> +	if (rx_delay_ps > 3000 || rx_delay_ps % 200)
>> +		return dev_err_probe(dwmac->dev, -EINVAL,
>> +				     "The RGMII RX delay range is 0..3000ps in 200ps steps\n");
> 
> Please could you listing these values in the binding.
> 
> Also, mark that amlogic,tx-delay-ns & amlogic,rx-delay-ns are not
> valid for this compatible.
The RX values are in patch 2 as well, the T7 shares the G12A list
(0..3000ps in 200ps steps); v4 drops the 0. The two vendor properties
are already rejected for the T7: they are only defined for the older
compatibles and the schema has unevaluatedProperties: false. v4 adds an
explicit "false" for both in the T7 block so that it is visible.
> 
>> +
>> +	phy_mode = phy_fix_phy_mode_for_mac_delays(dwmac->phy_mode, mac_tx,
>> +						   mac_rx);
> 
> This is not correct. This function assumes mac_tx and mac_rx are
> Boolean values, the MAC is applying the full 2ns delay. However, if
> rx-internal-delay-ps is only providing 200ps, that is not true.
> 
> I would prefer you keep to the usual way of doing things. Allow the
> MAC to apply small tuning delays, but have the PHY do the 2ns. So
> don't make any modification to phy-mode.
> 

OK. v4 does not touch phy-mode. rx-internal-delay-ps becomes the tuning
the MAC adds on top, 200..3000ps. On the TX side the T7 has nothing
small to offer, the only step is the 2ns phase, so v4 does not accept
tx-internal-delay-ps on the T7 at all, in the binding and in the
driver. The VIM4 then uses plain rgmii-id with the PHY adding both
delays. That also removes the wrong claim in patch 7 that the RTL8211F
TX delay does not work; the real cause was a bootloader value left in
the glue register, details in my reply to Martin on patch 7.
>>   static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
>>   {
>>   	u32 tx_dly_config, rx_adj_config, cfg_rxclk_dly, delay_config;
>> @@ -411,32 +455,34 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>>   	dwmac->dev = &pdev->dev;
>>   	dwmac->phy_mode = plat_dat->phy_interface;
>>   
>> -	/* use 2ns as fallback since this value was previously hardcoded */
>> -	if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
>> -				 &dwmac->tx_delay_ns))
>> -		dwmac->tx_delay_ns = 2;
>> -
>> -	/* RX delay defaults to 0ps since this is what many boards use */
>> -	if (of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps",
>> -				 &dwmac->rx_delay_ps)) {
>> -		if (!of_property_read_u32(pdev->dev.of_node,
>> -					  "amlogic,rx-delay-ns",
>> -					  &dwmac->rx_delay_ps))
>> -			/* convert ns to ps */
>> -			dwmac->rx_delay_ps *= 1000;
>> -	}
>> -
>> -	if (dwmac->data->has_prg_eth1_rgmii_rx_delay) {
>> -		if (dwmac->rx_delay_ps > 3000 || dwmac->rx_delay_ps % 200) {
>> -			dev_err(dwmac->dev,
>> -				"The RGMII RX delay range is 0..3000ps in 200ps steps");
>> -			return -EINVAL;
>> +	if (!dwmac->data->mac_applies_dt_delays) {
> 
> I suggest you do this at a higher level. Either call this function if
> _broken_delay is set, or the other one.

Done through the callback. Probe makes one call, and the parsing of the
vendor properties moves into the older function.
> 
> 	Andrew


