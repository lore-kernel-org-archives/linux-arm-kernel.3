Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397F2CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 20:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUrqc7BcglwR9vmo4HsZlUa9qx6Ep9oVQMWGk598+u0=; b=thLA+RFaYnhI+DEOn4xKRaEISh
	q7q6t5WTEMpNRpC14GQlXSGQbAKDsWGWxeSMtFV48ITJIT0PD04svl4+fj/f5WpEoEmBkSGP/5d7n
	rpLsw1P1SXWqvwlNcOmEBSGBWRpLqKTKjJ6ORmS0qvWoe7CpmwT0mSq6nq9bQAkW9KuvFWKDgk3tI
	s5EL3sbDSgKgU0Dyf35dGoCs8tU5bmkDYuj4jzA7cUov1O+KKx391SMftla0NGnZkYpUUUcePEKTQ
	qh8MBnMwpH+MrdfpK0v50raf+lXBaxsI2LGEEBybjuFWFKwf757DToFZWilmvRCxilaN3TE/sCMY0
	8YgEyL6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGmz-0000000ELew-03jX;
	Thu, 04 Sep 2025 20:42:37 +0000
Received: from mail-pl1-x664.google.com ([2607:f8b0:4864:20::664])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEh9-0000000DZ5b-470E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 18:28:29 +0000
Received: by mail-pl1-x664.google.com with SMTP id d9443c01a7336-244580523a0so14907195ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 11:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757010506; x=1757615306;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zUrqc7BcglwR9vmo4HsZlUa9qx6Ep9oVQMWGk598+u0=;
        b=eZOzMPcp1j0CwZr+5i4eNCWU/ig4Zl5zfQV7G4t83vOI67YEvJP5rqYxniAX3vqfta
         +HdoP2WInEKKb3nNv1agNzs+NlZlhbv2lCnyCZfn5utM0Q9jYr4pMaZlMKXveqe3s4Qq
         gC0GdOdEf4rGsbcszIMMSNGUs5Ra/jK2RQW0pLzhT0hGgbDzmGl+w7smWtZbV9cDxJ7t
         N4I6zUrFwDwxuIUk/gg5EMC2jzuD//IKBjiotsYdq4+QDBLBXFe5pQJ2UBIxNs/nPK0t
         zEK/M9TZD2ulIOTZK/KPyHJGTcznaU+lWrniLjvf678yqIwfKJN65cb5vTIrtNveTxFH
         2Yug==
X-Forwarded-Encrypted: i=1; AJvYcCV0AnR6JchSm3ODVku2AgavtIJEK/VsuZRTgK5A2RuwaSWo2tbQsC6anlGkBi4aOWUVowOMCzk//5LGwzHi1Yo5@lists.infradead.org
X-Gm-Message-State: AOJu0YxkpWg533ubGxpnMfWrYtg/uQsCiu90+1YuFN+8gFFvI29WYY9j
	cCbKmGE3d38xeNrT5z/90avIoS3i5+faJOSZPR5NceuUREqjJ6xHJQu/jW7tAvHT0XU5XRIB9Xd
	N0fxdnM2R1nmyaBtYTCWiQraZj0USZ3Cyc1zvQAze+aTJN0ndpovKu+bP2buh6TLQvilgwgXnIq
	y0+mJ/kJM4f43UkdsyVNS6y++pqzIGuzTwaThS7aprO2rMwSHbguIjpk8IxpIVItD70hWLUY0mG
	Aa+JVovc4DHQFv+nsjjNTJbLylEzlnqbdk=
X-Gm-Gg: ASbGncvx2ZIDyl26n1tF916adp9Vc7kPWNgLIfH2BnBELxKM4E2PZDYTCkUUKnXeGsZ
	iIioOfLs0GabSGGexrMHRoaVAcxTiqLY+DGPXYmlstBZo1z+/HBTxOQCfjaKCfSAOvzCLQdQJAA
	ZldHrMJMeeNPdCXEac6u1y9IYueLtWJDKVP8QENAFK550SXOXHFoGu1qknDdIG/slIVlAKIetrm
	KUMaYDqp5heXicT39g1khy+e1CUh+7A/eoHzqVsPOYy9CYQWtP3DdnYGwGox4XMMFz58CYpa1M6
	0SIb9XIgrnfihwqqrEE1uPNFJY6Y1qt8dkIC48rBpSbZdrvfAGbQJlYPgLeS3zCQfcRrwsQeKJj
	QJFrhfx2yJhrwnLtgQ5ezIgkdKsftAHSa/6WkDgZS79KykiUG+fusKkMjuHdBM3brjSIIblcSnv
	2GUKpn
X-Google-Smtp-Source: AGHT+IF8K6Y0o7zalkfJ8BjuFpbHmlJa8hx8xh1EULyEhjs9TIVafcwNVVauMx/TMJbwbuFg4NVm7/LptI3c
X-Received: by 2002:a17:902:c94c:b0:249:f16:f086 with SMTP id d9443c01a7336-24944b321e8mr235142335ad.42.1757010506451;
        Thu, 04 Sep 2025 11:28:26 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-24cde7c71a4sm1077865ad.18.2025.09.04.11.28.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Sep 2025 11:28:26 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-726a649957dso25584806d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 11:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1757010505; x=1757615305; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zUrqc7BcglwR9vmo4HsZlUa9qx6Ep9oVQMWGk598+u0=;
        b=eNJ6Ulni/BtZt7BV4TfyWRc01imR/v5ChdRcngJ16rWw/3tsJWBRiutFUCaJ57JsgU
         Ls+7KvdiOmCTuQRg6J06T6Z1V54Gv32JEo2jygokv74HjDvlj1y7YzJt54c7ttv73lz1
         fuW5DEfOLFZpDvIHfiPu0pxpo5uHUkJNfCXQc=
X-Forwarded-Encrypted: i=1; AJvYcCX53Tv4p/qnP36qv9NXpj1B+DdiHztMjyijmbD0aT6Y8wcKZFlGSf+i1SeXjY0FdvIwHs/pjXSW2Vdgei1dhSiN@lists.infradead.org
X-Received: by 2002:a05:6214:f2e:b0:721:ecaf:500c with SMTP id 6a1803df08f44-721ecaf6105mr113127046d6.52.1757010505045;
        Thu, 04 Sep 2025 11:28:25 -0700 (PDT)
X-Received: by 2002:a05:6214:f2e:b0:721:ecaf:500c with SMTP id 6a1803df08f44-721ecaf6105mr113126596d6.52.1757010504453;
        Thu, 04 Sep 2025 11:28:24 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b682faa7sm51543216d6.66.2025.09.04.11.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 11:28:21 -0700 (PDT)
Message-ID: <e1af06e4-4583-45a9-8404-34a01103e92d@broadcom.com>
Date: Thu, 4 Sep 2025 11:28:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH 4/8] clk: rp1: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>,
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Andrea della Porta
 <andrea.porta@suse.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
 <20250828-clk-round-rate-v2-v1-4-b97ec8ba6cc4@redhat.com>
Content-Language: en-US
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
In-Reply-To: <20250828-clk-round-rate-v2-v1-4-b97ec8ba6cc4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_112828_141679_EDBF7303 
X-CRM114-Status: UNSURE (   9.15  )
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

On 8/28/25 17:38, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Applied to drivers/next, thanks Brian!
-- 
Florian

