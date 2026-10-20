Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6119606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 15:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hFtbnQzq;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ax5AhFXs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5WjqSdg7bDbQWoXup3QhnjevPSo+9ekUEMkZZRcrjI=; b=hFtbnQzq7pmKb/mui4fp/6FonH
	dh+Ep7sU1ckrsn2SPcnnbt4/P2syATCey4dfFeLje0Ie4Nnw5y/hDXvDgnAg4WTVoXd2/crEK2EPu
	zUZGsKygbtHGFP2tU64HtyF/qE7g4nisqpc/0/foE7HP6uG8IieK1cYqrILCS1yvxmz/KvnNMOLL+
	j3gS7Ok/fAItkT+aH+85SfEpMTY0MaKgHVFc/RIWB70RyUH2fqsOZNPZ/MHw0MS+rQ05n/K7D32B6
	XtHr0/LsUk0RJwQuakuH4jcN2fdZ3G/za+GnbEZjydbi8+E81bJBPcooicleLxZnxk+/AMsoSV0p/
	ezZjDdhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBwp-0000000A4o6-1UTT;
	Tue, 20 Oct 2026 15:40:19 +0000
Received: from mail-yx1-xb164.google.com ([2607:f8b0:4864:20::b164])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBwi-0000000A4mp-2R9A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 15:40:18 +0000
Received: by mail-yx1-xb164.google.com with SMTP id 956f58d0204a3-679e86015e2so827329d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 08:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510811; x=1793115611;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t5WjqSdg7bDbQWoXup3QhnjevPSo+9ekUEMkZZRcrjI=;
        b=nQmb+Ce6JMVu0Bf0C+eCrKAJuEUo5U8AiL3FSGHnylVwFZUrkCCX+svXsyV6H05+2R
         QlzecjksBst66fadfQMfOX/auYCBLYkLwr/Upw1FX5nibrjRIWTtFdJS12SFtA47GZyr
         xCmzA4gSgIvRglJ4GUat8uaIgRYosswOz0dhfvRQaj4kL8Y0FWP0YYgkDmyIJ8sr1Uvl
         5fCICVc4NuPRdU2uY0Vf7c2HJMd3iDCWTt9NAz6MW8cGBznv05hez25dhibe8jTIJl21
         l3U0m3ClB34aK2u9j8dT6P6j2wrPB1RgBtiZbAHm5QDK5lMgdQo36zySpGZT8Sg8jg7K
         Q2lQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCVPFfiJm34yVkkLqaI3gGKuae3MripBVzmxPKK1+m+7JQxGNR/NGj6SPUHQNeeGPIMn4ofeS2+I2t7v6RCP18@lists.infradead.org
X-Gm-Message-State: AFq9FYIuoV9GtypnV30bizKsrFxo5xwz+LxeDN4BX+94we2cEf0jv9Lu
	k60n2Rp/nOD3FlC4+eBE5uiWVuFUwZq4x25IQEBM6FlHoc2/cTiOxSI0uQa15fFGxIByWlYxqu4
	rvxx31SxFpfWhGOMcTXwsDeSi1wRZ8+7AQLo9ooG2pdOBmULDwgtH/PbBZOcFroGwe7DtifvuM5
	YD3+2SvBiCzZBvIEjRNKb7ykfh1vmRCXr2Uf8NpUqnLl9/piS+ZAtEXK/YIcUD53bOA0IvuY9Zm
	SOfL946v7cv4jdzlSJwBVvF98i1QK1FKcE=
X-Gm-Gg: AYBFou0x/A5XaWkkxkJei2+iWY6oT3t9P8QrAmc+1UxHoQLbAlNYjKERu2GYheeXfl6
	mZo2hQrMOF73rQ5iNTqXKJJniECt+mMUI5JV8CQEbnp6lffXU5lZ/j7mZw+RfMUE1qTR/voqac+
	sBIUCHdO3ezvj4rNQW06uUz5c5qy79zQqbzf2I63Ylp+0XRQvJQPGf8f4tzB6HP+e7KVLJdjGrz
	Lj7/Kba/4jXp9GkvLWxwhJDrgqD+NlksPaZ51dFt77G1nXCGtf/IQ+xwFiJnKugI1nxabxPDDsE
	Nct9RMIi8EE6/PWvu5YpWtl3zJzGnj/hyYlxNp4r0AEso++FpzFJ0YyTn5/uEb391F42DqeM99f
	slf19ErfxTy7fFkDKkHDn/NOm1yZoaNJIzLkZ+0UKhucH6EqnNiDzIU2TrfEveWFf+vF0GH07JS
	rRsM//mcpLgcb4bQED5184PBee1TosakU4XchRWAcZkLs=
X-Received: by 2002:a05:690e:d5a:b0:679:9942:8975 with SMTP id 956f58d0204a3-679fc0922cfmr871788d50.45.1792510811156;
        Tue, 20 Oct 2026 08:40:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-679b1f0a5c2sm256353d50.35.2026.10.20.08.40.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:40:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5364f562140so17042431cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 08:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792510810; x=1793115610; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5WjqSdg7bDbQWoXup3QhnjevPSo+9ekUEMkZZRcrjI=;
        b=ax5AhFXsOLjJqEsIDSeQ582Eh58/xeYIYGmNddvJ5EpKcXs6xoxGzzXIhAz6+6ZUHw
         F+Sm6d2Xa7BOzXDGxiwMSWvkfJjKHDHu/gdgt6p3xSM/2xsC3dkeI1/lS3q0V6PumgMd
         qW+iP4wdoJozQwKA7NKGtmKsWLR2f8JygiFIk=
X-Forwarded-Encrypted: i=1; AKwUvBy8snqorQjyRcYHBo4O0KoSYwt6Ga9H7Qct2eHGaosOYbdg3oNipmbDtQeLqr8OD9h8imamXNBs13YNgQaEadrV@lists.infradead.org
X-Received: by 2002:a05:622a:4c11:b0:535:b545:e926 with SMTP id d75a77b69052e-53686f3793fmr33774701cf.27.1792510810340;
        Tue, 20 Oct 2026 08:40:10 -0700 (PDT)
X-Received: by 2002:a05:622a:4c11:b0:535:b545:e926 with SMTP id d75a77b69052e-53686f3793fmr33774211cf.27.1792510809945;
        Tue, 20 Oct 2026 08:40:09 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5364de4d690sm92439221cf.3.2026.10.20.08.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:40:08 -0700 (PDT)
Message-ID: <6125aa53-4fad-46ed-b627-e0fce7df7b84@broadcom.com>
Date: Tue, 20 Oct 2026 08:40:05 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ARM: dts: bcm2711: give the GENET MDIO controller its
 clock
To: Nicolai Buchwitz <nb@tipi-net.de>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_084012_722623_9F092547 
X-CRM114-Status: GOOD (  10.25  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/20/26 07:58, Nicolai Buchwitz wrote:
> The MDC of the GENET MDIO controller comes from the GISB clock.
> Describe it, so mdio-bcm-unimac can get the real 200 MHz from
> clk_get_rate() instead of assuming the 250 MHz of the STB chips, and
> can put bounds on when an MDIO write completes for PTP.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

