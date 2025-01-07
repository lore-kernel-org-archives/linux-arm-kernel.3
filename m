Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF63CE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XE2LBycvBfRVASiRxD8GRnH5rQbRkw6izbBARG4PHOM=; b=p7NE0/ydF8JBwue0/NYqUbMRdi
	RJd2GOpEhSuxnc+f6sdnqBaeVfPygAvFisjJhelLbrc1knt+t99mcY03uIcw5nqtgbUJ9MwVA6hAI
	h0ZEwEs1oJdu7E/VB5B8OWmAERGSeWzlpN1FN1HDyuohnzZqxei1jwyEa6WOXRtD+AMRaEBzpvM2N
	44ZELOyzkMZrDVov8xUGCKfNnPG5Gz0ZgTSZFcE6MtjNMnyfJ++P3X4OB3bXOarvT2m3N5Qz2lrOK
	OeSE5qAB8TxDg2uBkeVnWlsWDTaBTZMB9PIOppyzxcEFm6wXQjgrGxZIoGqdQKVSDwcD7P6jWzvfo
	SR2HtRxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAYn-00000005CuG-1x3a;
	Tue, 07 Jan 2025 14:27:57 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAUM-00000005BV2-1pQb;
	Tue, 07 Jan 2025 14:23:25 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa689a37dd4so317126866b.3;
        Tue, 07 Jan 2025 06:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736259800; x=1736864600; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XE2LBycvBfRVASiRxD8GRnH5rQbRkw6izbBARG4PHOM=;
        b=d1OhV/G55O71tVL+NLL9gTStbeQD4/Etxfb4AxrFDcFyOClYauyLsrA8QKCAbYAkk9
         JKcijAMEc22b/dQ3Lryyyl4zSH73+RMILUB9+RriHAQSnFJ1kBMwjgyj0XrY3Upn8KcF
         xmnJfdmRJCQgRJCc+s8Ig1s6SKoK+0zdL21KkVXEDk9GsUy9ruId7BCr72K0v3x//l8Y
         BP1KkFlyNabsabNNp4zW+nwiIC8aabfKU4j32VwooAZj31iPgfCs+3TBBCp493rZajnZ
         9o+DWmPK9747Pj51OSzBDSFyXUhAFt5JtsLTugJqeFcM8qwB5paOTwsaPxdTfItqQEft
         jeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736259800; x=1736864600;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XE2LBycvBfRVASiRxD8GRnH5rQbRkw6izbBARG4PHOM=;
        b=NnmIw5CKP1L9QMJ5RaK5VpZxJFgxtkwfWVILEesWpAFGqiD1RgAR1g8ZDT2CfA82cW
         WA9BC0kVTX76J4VXKrRLeNq2DVa1GUfRp5XG3qsL8t+pSR/6FHl89lFKCpvZ0O61wgt+
         Ht2GouRImlm8wmKAFbKvvS8o2fpATvE/K4rqNft0LzN63eamcaDuATBNAhbibtK47low
         2a2x38w9mcm6iMkeaPdre3cSn1e1W06yqnH6wtZqvQuJ//C3YMlwJ8/rb0F7COn2JP3l
         WtotESq1I422E5GXByXkO2KooMEmYwBce81VqLKnjO2rq/RWpXCpiw/aiq87wdVO5drk
         SGWg==
X-Forwarded-Encrypted: i=1; AJvYcCUt70B+ps1eMooRdlac4xc8et+SxC+3AYNp6V/JZNqiBP14FQPFsPxPhr537y7xKwE42zBhufTh5mRbMbVMk2g=@lists.infradead.org, AJvYcCXsNAbj0q1FKdyVSqCGuKp9xp7Av0MXgY23boqExrui5p1LN8NbxhTR4VaHoQ6AjqddLyeEEeIePDkLgOlAMrWW@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyu0tiLe5jBHhX71QNIRZm1lDNZMfOmKYKIjeyjliZvCzFY6RN
	OwoyqSMaO1kCOquoWDJC27eV3sMK/V/sXDjNIGCVKckW+zV6q3Me
X-Gm-Gg: ASbGncu3Gy6AKTbw94clTmDOYBvqkyt3DvH7XK3yPA36dHObDLA77yxaeYH/3ipwiYi
	hLu2dl5Iapv6diwiCUW/Kzx07wNgmzPBDAdf8ta5DCCRa0EryzDiA+35K/8sdqgTz8ecb5jd0xg
	ZHkhZW1gieTVkv7hnz9BE680NRSJ7RvqYvBm0bfNGmUSB+B/qqNJiCRAK8tNDn2V/9NpRpMas6y
	XzpUCFcqsd5rOJUCtn27uTgUAtQcoLUde99inAqdlvOtvmLAX6kYlnPADKpAxZpt89fCSEw6WFA
	zR3iHP02NN0U9VPn7VmcDuetdaooLmODaoKgDljreqa/gacJ8+nKSt264Wq5EBuzGtw2cvS2wm+
	6eNNMadx0SUVFSW8rDowwWVPSW/Q9YDc=
X-Google-Smtp-Source: AGHT+IFTKXq+cflhxmBLnsZ30k5zI/b1GmBG/qIWiM0wUuk9AhpVGKtgpK8+7CvsgQoYKL8T/INBNA==
X-Received: by 2002:a17:907:d87:b0:aab:71fc:47a3 with SMTP id a640c23a62f3a-aac3379034dmr5727225766b.60.1736259800081;
        Tue, 07 Jan 2025 06:23:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fede4csm25126108a12.63.2025.01.07.06.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 06:23:19 -0800 (PST)
Message-ID: <b7705a4e-5559-4fe3-a302-4c60d7224e49@gmail.com>
Date: Tue, 7 Jan 2025 15:23:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next] net: phylink: always config mac for
 (delayed) phy
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, bridge@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250107123615.161095-1-ericwouds@gmail.com>
 <Z30iUj6DE9-fRp0n@shell.armlinux.org.uk>
 <4b9b2a9a-061b-43ad-b402-a49aee317f41@gmail.com>
 <ed29e632-332b-4af1-bf7f-97498297e731@lunn.ch>
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <ed29e632-332b-4af1-bf7f-97498297e731@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_062322_476181_8182B212 
X-CRM114-Status: GOOD (  16.49  )
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



On 1/7/25 2:20 PM, Andrew Lunn wrote:
>> I think it is because pl->act_link_an_mode stays at MLO_AN_INBAND, but
>> it needs to be set to MLO_AN_PHY, so that only the phy determines the
>> link state:
>>
>> phylink_resolve() {
>>     ...
>> 	} else if (pl->act_link_an_mode == MLO_AN_PHY) {
>> 		link_state = pl->phy_state;
>>     ...
>> }
> 
> phylink tries to determine the whole chain is up. As Russell says, it
> could be the PCS has not got sync with the PHY for some reason. So
> even if you ignore the PCS state, it might not work. This is actually
> a useful pieces of information. Does the link actually work end to end
> if you only look at the media state? If it does, that would indicate
> the PCS is maybe missing an interrupt, or needs polling for change in
> state.
> 
> 	Andrew

After phylink_mac_initial_config() is re-triggered with the phy
attached, either by the patch, or even with:

ethtool -s eth1 advertise 0x28
(switches to sgmii)
ethtool -s eth1 advertise 0x800000000028
(switches mac back to 2500base-x)

mode is set to MLO_AN_PHY in phylink_pcs_neg_mode() and the link works
end to end.

So the an-mode can be 2 different values, one after link up and another
after these ethtool commands.


