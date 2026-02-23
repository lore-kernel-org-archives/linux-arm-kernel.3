Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59576EC110C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8V8psmXfo8hyIGZcjW58KCT42psor/P8r1YSImT3V8=; b=NLEXXjz8NulswP+VufvovonH/g
	ZWYmb6BQ8dloS6wVdC+E1G4UYdhGlsaWYoNMrxPsexZqSWXI03zi53Xe4c7sLwVtbF93GlWVpxWCe
	5/zeCC1Zzy77/cD9sCnPoA3BS7dNcQJTdoX5ZVT1ADNhBvXZ9mgQch0cFW4XeNsH88fXYvDkmQKo1
	fAcIgvZp1LNQRxqu93nc/dBtlN1TbPArj+E/z+uwMTgNH8n3ZC4Zgc2AQTtgyNCRCidxToTcn3Lxr
	UCjrQDrZiTrwIczy8yO97d9t954+HxpcQlBXyCLKJCvjhMYrY39K55mRGOW7HeRiatGVJaCfy80J4
	Ez9LF8Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZlt-00000000mwC-0F5T;
	Mon, 23 Feb 2026 17:31:01 +0000
Received: from mail-yw1-x1164.google.com ([2607:f8b0:4864:20::1164])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZlq-00000000mvL-11GB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:30:59 +0000
Received: by mail-yw1-x1164.google.com with SMTP id 00721157ae682-79801df3e42so56153437b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:30:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867856; x=1772472656;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y8V8psmXfo8hyIGZcjW58KCT42psor/P8r1YSImT3V8=;
        b=aLUwVJAk/IbkxtOcE/9ZfK2+S4cip2jztRIdj3VYYXW+wIGl3gMIJ6qAEOaspolcnz
         fNuEbVz7IhySnXWlECdfXxhwR7jThOw0shuebMxVHgWuigfTUVSu4XbF5bD7fs6XZYnZ
         IS0krkHUvgf4bImq6Ju967JoSSJSHKo3v6fIPF6nP7/DIDUFA3iERplmUMdFupZose6E
         RLK2UxF8iIIGFu0X0Lqnt84Yb8piZAYRGDVfHJUGubMqSSQi9gYXc0FDR77Yj9dq6B+s
         0vCiHWJHTdyKbefzge9IplMCOv57N56iqX4qbbk7KMKTQXnJH0LK/8lb/pclsugC+A3Y
         xd0A==
X-Forwarded-Encrypted: i=1; AJvYcCVKPPim6/C59t27Tonyl848CKAQl+53pO15JF+kf9AITe+H1lWnXnFKs0vG4Kr6T1GxoqqMD9aBFCaw4y3BnAmn@lists.infradead.org
X-Gm-Message-State: AOJu0YyYliQ30vN34kpim8ox72yHk85Hjh7dlrr75/6kfh5KPvWP+Gav
	VNHXk+5/4OD5w2hr8h9mMn0tK68vRt9Sp4cJm1mX/MckUpSIS34TbvoGx7JSzWtpLlT6pXc+jen
	mQgCq2xG8XAE+nv1wV+Ner9+Nm2qrSyjgQWpEjakIizKIHy9cHTFutCiIeZVHRedMNdN9sn8+SG
	sSzplWKincDeCCUyO/yqTpt4W277wMTpgCBSeXrRQrQxxAn7Mi89z0GWrqb8wd295uRr1H466BJ
	l0cYt6bMQ9TCtUgYIkFFxC6pPIhr0haqjg=
X-Gm-Gg: ATEYQzzzcunZXTeAXPROCb5S2zS/4F3dG2JkAvUuVf9StjPHC3oHXwutcO67D9x5mhy
	9sd/zcKq3Ko8f6euQmvYKWOxArtpfWx98azldMfphWWXgxoC0suCsddJ7ihgq2y2JkqvCsKgudr
	hCHWi/zexitcIP8YSlvPHcm6ZXriYZOEhab+/3NLYI78FEipcMdIx7cq1yJe2vq7MRsXCuY3UOw
	C4KU+dCImCduMS8kfro6eOrkc4hFTI7TLzm6ZQt/wRh8czuRHIAQZ+NFSwPMlHlMkWye83JNZTr
	eaUboI8Ssx4Egdk1O+ezop48ym/OJBnt4vVvN5CSyG1ZV9eGLeh5zQa837vuM4PxGtfR96I8GcK
	YWMjtL7I7bnV+QiEFrkwpSSd8sszxAHxbAv/S//uXdpeH1rgrVY1X8nLe774HFXQACZVPDIcb95
	ux/n22GhI4WvFwmtomX6SVxmzDctyCa7pt0fj9AHf+8sedjTyZ2m5bQfcwpxKsgyra
X-Received: by 2002:a05:690c:389:b0:798:1498:21b4 with SMTP id 00721157ae682-7982bc6e9c0mr74064687b3.16.1771867856119;
        Mon, 23 Feb 2026 09:30:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-103.dlp.protect.broadcom.com. [144.49.247.103])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-7984fa4c8c8sm1675957b3.2.2026.02.23.09.30.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Feb 2026 09:30:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba9ef13a4bso4170547eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771867854; x=1772472654; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y8V8psmXfo8hyIGZcjW58KCT42psor/P8r1YSImT3V8=;
        b=GbVmrt4phr6B8MLlNANFeus1ZUCImwkkN04qnxfi0N8nydQdJ9PHRFRahmkhtXM0Qe
         3VlceQqklG2NAHLP3Wb0Xl8gl3pG2JVUpm6CpJDxaN8WM1/9OiCWb+5jKsFoEIiJF+Oz
         KOzJ5kaH+TQxmW0+cSEXLH/lTdLMYHvYkBtPU=
X-Forwarded-Encrypted: i=1; AJvYcCVFzXQyHh9uQV9LRNw0oQnsAsKMQFxiNC6R0a4DIPEd9Yy5ETsJ2d0OvwXEc7kR1GZRwBqLHTsGtAvnrRfw0Tb7@lists.infradead.org
X-Received: by 2002:a05:7022:6b98:b0:122:154:7826 with SMTP id a92af1059eb24-1276ab5845dmr3541897c88.3.1771867853497;
        Mon, 23 Feb 2026 09:30:53 -0800 (PST)
X-Received: by 2002:a05:7022:6b98:b0:122:154:7826 with SMTP id a92af1059eb24-1276ab5845dmr3541858c88.3.1771867852486;
        Mon, 23 Feb 2026 09:30:52 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dc167d3sm5627944eec.24.2026.02.23.09.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 09:30:51 -0800 (PST)
Message-ID: <73a783ed-ac77-4d4e-b1f8-6114c33ac33e@broadcom.com>
Date: Mon, 23 Feb 2026 09:30:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] i2c: bcm-kona: set device parent and of_node
 through the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
 <20260223-i2c-adap-dev-config-v2-3-d78db0a6fcf7@oss.qualcomm.com>
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
In-Reply-To: <20260223-i2c-adap-dev-config-v2-3-d78db0a6fcf7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_093058_286321_C749DD8B 
X-CRM114-Status: UNSURE (   8.04  )
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

On 2/23/26 01:05, Bartosz Golaszewski wrote:
> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

