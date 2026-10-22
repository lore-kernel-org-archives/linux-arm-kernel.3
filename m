Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757F0606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 17:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s+hwfCGO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HmShLIi0Try9xlFwdP7Bt6IdYlCRVmbmMWtY33HkzA4=; b=s+hwfCGOWn2X1P
	7IRLVqbtFGD/FMi913J6vFWiunPMChGq3gNJaiCswHWMWAAdvleVBYN5gENAz1ge1o11H26Stn2GO
	Vs6qH8g5koOuT/U7eJDzvMCjDJAyCQIpDrrvlMHgLTS8SiTNXC3H2lDWJSi6aIGkl5GoV7o6U1Kig
	h4fT9XK+liy86mBrQumlXh7jRe86sOnAUztKui56IOwQFkEvl3YIUmZvpYTQPbd2u3u5uonxza8lz
	eRew3G78Oz8E75cueEEUBAIZ06CXz/af9AtLETmtRLOFo0FnN3h04kQyNgdm8rQXzFuGtnYSjpDkC
	MaKzVBziY9TTUVd/SBIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwv4-0000000Edfx-3sSv;
	Thu, 22 Oct 2026 17:49:38 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwv2-0000000Eddw-04Fr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 17:49:37 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so532035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 10:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691374; x=1793296174;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HmShLIi0Try9xlFwdP7Bt6IdYlCRVmbmMWtY33HkzA4=;
        b=XtaBeDhg2XEgNirI+HQh7A9TfO8YG42WzBITndvriD0DRP5KYPreUg1Z7np0XbIAPd
         lBfC+m8bHgthDZr8d/JqXiINleGLr8DFkcO57EcX2an8TBh131++X77oHrSiY3WAVRTS
         zEiesT9SkdS0iEyN9/OT0zYtkZBlsXxACi72EpYGdEQM9dQHx+rCWXx66nRlXkmU1Wdf
         A0wqMcPJX1BcdMz0Jw9K5zLTpxguhkoJaeOo4/+3kBBWvRh0gcXZvq1WyXu+5+QA6NZ8
         whaUh31A+KypU1Cw9aliWLzqA/K/nZqVpw7/nsafaM/iBLvZT3u5TwkI0RuFQsBK5Qq9
         ZOeA==
X-Forwarded-Encrypted: i=1; AKwUvBxTD6GErCXb8LbQLMwiLgypjUoboPv3FY/j+7B2W+HFgbPIaaLBo/HGrD2q12W03gxWhGiePMih3ABGrHczJyDT@lists.infradead.org
X-Gm-Message-State: AFq9FYKVZD4XWbaqZMN5vh/RYKUoDShkhLMGp/ClmMI7bzsYeIxLqk0Y
	xaz2YwyPh/xtuTiU3ywnnkVVDBfTHHsSZHQ1K34UGEOkMj85TPgpGjXX
X-Gm-Gg: AYBFou38rygTdmiPurCmbAnr0uwx7O8KSopqRwFNCKUPBF7s51mVqUhE2oRArHih3l1
	siTIqobL5uAVqRzNpyMQft3+HOjV1/7ZrMAjIuYrCkgNc0xpchTfGnrxEV+OO+4o9J8NyzlXu6m
	o2L77Y5+fnKGDHlWQU0ZY0dPhVEdFsYrgHuAqDhh3yMvpvPwVw+eMVfOKNnKfVobK7vXG8Q09g4
	HEnoNJ0Tf4KMHwrzW3VLAyr7Xr0KDG6u0pqr3zP/OG+JhN/UVGIu8sgTmrM+rgqIU/gu83lMAID
	OQU0tHBv3Wk7KMBQj5FfiI21KClvhwDcCtENQmZevRkrck1j3PmdKkvzFz2tANQCLIDSGSjAXfp
	iI2pQe4gYMkuFvyezlEf9p6ZpEPiuSMlodTkP+MQcmqDORWxkbF8Z690J/bess2MPbybiWd9tsg
	60nFjlZcB6PLFPo++Zt2EpIrfvrax7ST7eBBMlZT8Pr1x7EhDJtEzheD2FTOVZNA6QOobFGppPg
	y7od5iZme/I6oskApgn2+L4vQKDKRWZk9I4uLh94pTVpw+b3wjKI9k/b+yc/T4h6xscOjTq+lvU
	wljByBIZCw==
X-Received: by 2002:a05:600c:4684:b0:4a1:d36f:1ba0 with SMTP id 5b1f17b1804b1-4a1fdd74b6cmr122177475e9.35.1792691373949;
        Thu, 22 Oct 2026 10:49:33 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21047b2absm13451355e9.13.2026.10.22.10.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:49:33 -0700 (PDT)
Message-ID: <a23b3a53-9cdf-4e32-8ca8-a80d927d65e2@linux.com>
Date: Thu, 22 Oct 2026 18:49:32 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] dt-bindings: net: ethernet-controller: tabulate
 who adds the RGMII delays
To: Conor Dooley <conor@kernel.org>
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
 <20261010105900.247342-9-tanure@linux.com>
 <20261012-suds-karaoke-efc4acf056af@spud>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <20261012-suds-karaoke-efc4acf056af@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_104936_073651_57964E67 
X-CRM114-Status: GOOD (  16.12  )
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12/10/2026 20:18, Conor Dooley wrote:
> On Sat, Oct 10, 2026 at 11:59:00AM +0100, Lucas Tanure wrote:
>> The informative section explains in prose how phy-mode, the delay
>> properties in the MAC node and the mode handed to the PHY fit together,
>> and says itself that developers often get this wrong. A reader has to
>> work through several paragraphs before answering the one question they
>> usually have: for this phy-mode and these properties, which part adds
>> which delay.
>>
>> Add a table that answers it at a glance, with one row for every
>> combination the properties allow.
>>
>> Assisted-by: LLM
>> Signed-off-by: Lucas Tanure <tanure@linux.com>
> 
> If the net guys think this is valuable,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
Thanks, but I will drop this patch as is wrong.> (although for something 
like this, us acking probably ain't needed,
> ehh?)
> 
>> ---
>>   .../bindings/net/ethernet-controller.yaml      | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
>> index 1bafd687dcb1..bba27a9feb61 100644
>> --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
>> +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
>> @@ -339,6 +339,24 @@ additionalProperties: true
>>   # has added. Failure to remove the delay will result in a
>>   # non-functioning link.
>>   #
>> +# Put together, with the two properties in the MAC node, this is who
>> +# adds each delay:
>> +#
>> +#   phy-mode    tx-internal-delay-ps  rx-internal-delay-ps  TX delay    RX delay
>> +#   rgmii       -                     -                     PCB trace   PCB trace
>> +#   rgmii-id    -                     -                     PHY         PHY
>> +#   rgmii-id    present               -                     MAC         PHY
>> +#   rgmii-id    -                     present               PHY         MAC
>> +#   rgmii-id    present               present               MAC         MAC
>> +#   rgmii-txid  -                     -                     PHY         PCB trace
>> +#   rgmii-txid  present               -                     MAC         PCB trace
>> +#   rgmii-rxid  -                     -                     PCB trace   PHY
>> +#   rgmii-rxid  -                     present               PCB trace   MAC
>> +#
>> +# A property for a clock the PCB already delays is not in this table.
>> +# It is either the fine tuning described next, or a mistake the MAC
>> +# should report as a fatal error.
>> +#
>>   # Sometimes there is a need to fine tune the delays. Often the MAC or
>>   # PHY can perform this fine tuning. In the MAC node, the Device Tree
>>   # properties 'rx-internal-delay-ps' and 'tx-internal-delay-ps' should
>> -- 
>> 2.56.0
>>


