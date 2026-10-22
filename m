Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DEB606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 17:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FkS3KDW+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aIigL8Htvs1Eri4VcHQ6P7by4WWQ9ht1cFwpEUONgJM=; b=FkS3KDW+ztsfno
	ptk0ehHOfnEghj5O304fTwC4H7UkzNWrQgONteiXQhLQ1lISDdKwasBFR36sJCd1ezrSCX83ZpAm+
	UNpEvJHsbi6ewSVI2zBUYYiwCToLD+wzKfmzitM1jb0R/4MM6+hkEC0VQBSSyIvnRJLgDEiCbGceg
	HJ9Fz8GD/CP/VLSnDsalwJXF1rBd8lUfHd9hbYzTsllIxYNprLeJCuQCcRFom4735J+rMUqGrAwpS
	aYWF2+nYdYiQLX8R5G3/zg5uoRrCF3N/z+NbQ6ESE6HYQJ89fLJo/MN51pJNfUwyOimrmiAYEa8ZB
	lBXRQA42+WFOkomgGxZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwaq-0000000EaIp-32R3;
	Thu, 22 Oct 2026 17:28:44 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwao-0000000EaI1-36YB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 17:28:44 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2001dd4e7so448615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 10:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690120; x=1793294920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIigL8Htvs1Eri4VcHQ6P7by4WWQ9ht1cFwpEUONgJM=;
        b=jYDTwXapkZCITLvMEP5lboGzIVXdkh8GqOljnyxFYmX+SIO0eHpw1iB010GZfA+Ncz
         Mb1m3NjQsAgxbE8mfamjWuvip0n8oQ/g5bSRP5V/0QXr4mhgdePZODEmdKqQ7OiDSGBM
         GZNy22hwh6zrqmlxXD/KFivJW4RvqA62p9zecxCqMBRa04055evxJHYYyr/TJ+WNeDzL
         KPtIL8/sXt+npJX0gc6EFJOVTXGpuXE88ZAUWM+fARpi2onxoUL5iVwsrynOE/4qyFrF
         qL02kXSh32tcbuqxoIhtmyYdhJ7tRYK8PwjaWeFK2jC/cammlPls78WrmfCjwhQQEEIu
         McWg==
X-Forwarded-Encrypted: i=1; AKwUvBxzDOkDnS/bhLfh9dIj/Uw0xjP8J3GYjMsqSnPANJawC8ndAiWZo2G9fb2pPyVpyLXkxagK9Qnzb/xup+HMs05a@lists.infradead.org
X-Gm-Message-State: AFq9FYKooHWvqFjpYnppzsso8f1cmvGutRRtdzs8/9kBNQaBOeiDasZE
	C/8pg8uN/7n6AQadmXwFknIChUcko6t5O4JCooQywRnwHWr0sUV5kyCn
X-Gm-Gg: AYBFou3FyWyb6VanB3oJoBOsTREhJEMa0y80O3NmUP5dIgI+kcP4oZP3CPWjjx8vI05
	7dH5FIymk724tpYIO+L5glFUXvNttNAVajdJ7l82vQPBQluPkuFYkfrrBmP7NUKYAAdyDCXZonU
	zqAwo21G8Jc5eMLnvxymNZoiwcNRG3EUIKABKfiX9g14aLhYRElcsw+2riabMX+lnhoBDdhDu46
	qQIYuuGOnAZgSLScwEG0OT7qRn4KwBDLfvF4wZTAF7PK2ypLAr2QQMwh1GJdO2auAH2LFHgoVxZ
	FBLKcpSlSce9E3+9httg6MEHHVs5fcO7Q64l6DQPv+AZIk3WmGiiv4afuFYOmgcy19PsQVbt5Zz
	WWU/IguLzdI72/gWRgytq5ZW0KK8IRXQX18cr5G4V7oH898RilpIkHcao5fp8Y8y4SF8a7ciSDo
	MDmzd/p3MTnVEOeG38HM4kIb2rwdQLv8+Lkh4d51FRHNngGP0x+XXCJeVNYXShlbvmL/tj5yGZ+
	8+sMh7ZYMTd2sXLtGGaVbru1YWPZu88YgpOSk9Nqe9rx2oYJ0yLt4sNd0DwL+nRhiw9Y1m2CTnp
	sUvvxePZxg==
X-Received: by 2002:a05:600c:8b4c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4a20729f92bmr52278535e9.8.1792690120279;
        Thu, 22 Oct 2026 10:28:40 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210361ad6sm11491635e9.7.2026.10.22.10.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:28:39 -0700 (PDT)
Message-ID: <1ca9d46b-02aa-41bf-b184-2a62f8a284bb@linux.com>
Date: Thu, 22 Oct 2026 18:28:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] net: stmmac: dwmac-meson8b: apply the RGMII delays
 the T7 way
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-5-tanure@linux.com>
 <CAFBinCCpo28jZkQnup2=iofwh02GOMzxJ82hGHWctiWzcKTxUw@mail.gmail.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <CAFBinCCpo28jZkQnup2=iofwh02GOMzxJ82hGHWctiWzcKTxUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_102842_971114_FE875865 
X-CRM114-Status: GOOD (  22.76  )
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

On 10/10/2026 22:49, Martin Blumenstingl wrote:
> Hi Lucas,
> 
> $subject caught my eye because I didn't understand why there's a "T7
> way" for adding RGMII delays since we should be following a standard.
> Patch 8/8 in this series documents the standard. Can you please find a
> more suitable $subject for this patch?

Ok.
> 
> On Sat, Oct 10, 2026 at 12:59 PM Lucas Tanure <tanure@linux.com> wrote:
> [...]
>>   static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
>>   {
>>          u32 tx_dly_config, rx_adj_config, cfg_rxclk_dly, delay_config;
>> @@ -411,32 +455,34 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>>          dwmac->dev = &pdev->dev;
>>          dwmac->phy_mode = plat_dat->phy_interface;
>>
>> -       /* use 2ns as fallback since this value was previously hardcoded */
>> -       if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
>> -                                &dwmac->tx_delay_ns))
>> -               dwmac->tx_delay_ns = 2;
> The 2ns default value in case "amlogic,tx-delay-ns" is absent hasn't
> been necessary since commit 093d23db4fff ("ARM64: dts: amlogic: add
> the ethernet TX delay configuration").
> That commit is part of v4.12. So boards using RGMII and a .dtb without
> that property haven't been updated in more than 9 years.
Ok, so for v4 the code is moved probe into the function only the older 
SoCs use, so it is isolated there and the T7 path never sees it. We can 
drop it future patch.

> 
> [...]
>> -       ret = meson8b_init_rgmii_delays(dwmac);
>> +       if (dwmac->data->mac_applies_dt_delays)
>> +               ret = meson_dwmac_init_dt_delays(dwmac, plat_dat);
>> +       else
>> +               ret = meson8b_init_rgmii_delays(dwmac);
>  From the discussion in v2 I couldn't understand the overall way forward.
> I get that new compatible strings should not rely on old, incorrect
> behavior. But what's the path forward for the other SoCs?
> 
> [...]
>>   static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
>>          .set_phy_mode = meson_axg_set_phy_mode,
>> -       .has_prg_eth1_rgmii_rx_delay = true,
>>          .has_pipeline_clk = true,
>> +       .mac_applies_dt_delays = true,
> This should be a callback function pointer (apply_delays or similar,
> to match set_phy_mode) unless there's a way to make older SoCs also
> follow the "correct" RGMII delay specification.

Agreed. V4 will do it.>
> 
> Best regards,
> Martin
Thanks
Lucas


