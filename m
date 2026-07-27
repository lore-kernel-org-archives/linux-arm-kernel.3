Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AB7C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHPzcDe9whvn6csisg2KBrBErWBPeg/nrhsmnx8o07w=; b=YP/7KfVl8G65fJiAmHHJ1f1OgN
	6c2SITaYts18QSo02Ld82TXQJmT72T5HAhbzwPAl6dCFH+glE5xEDPsMhkHUNtVyAXHU5+ku7Zi0c
	Zn5P2IMbNpvbB9PzpiJncTcshRLaYlmvUkomYMJWoLtEyY7IuPu+E2kNkBS1SusKCGyRU7cHFogwz
	Ob66q2f5UZygVulNyosbmREB+/tfWsjoVhUZ7DM5es7rfzVxN5eU+gAoy27Kzc8at3LXAjgXi365L
	vXEuQGTkP3RO8/Bg3dJqW3NVDh4GeuOBIHQJM6zQ+Mff30byIEAvEcMCAz3+bqV/ZPKw3eMouqAGk
	kuI+3bkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOFh-00000003Lsi-2c5w;
	Mon, 27 Jul 2026 16:32:29 +0000
Received: from mail-pl1-x664.google.com ([2607:f8b0:4864:20::664])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOFd-00000003Lqk-2uud
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:32:28 +0000
Received: by mail-pl1-x664.google.com with SMTP id d9443c01a7336-2caf228a910so22180695ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 09:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169945; x=1785774745;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QHPzcDe9whvn6csisg2KBrBErWBPeg/nrhsmnx8o07w=;
        b=Dk77CHOb8ebf1//zA2xE8Pc/w2D4XbRyeeVKSE2O46WInDAucPhHmdcXUFIHI/a9oJ
         BhwxI4NPYfhOed18PWIIfIzEkARS0xa5wqiWJiUquktut2FxqSS4MCUZVhaiLztpEiwo
         C3xTtOceywKDZf2wvuTzIs+4kfTIgzeoyGrrlvf7fB6LOHM84k8Bm4DCg0jiYAfA++NR
         z33GbN+mx+1x/AfaC59YTpOpj+xTjgwQ7X90iLFuT4GSiEERHG/dq+RTKDNSSkNwgnnn
         /s1Z2UrcIh08qfxdZTR5LluMqwI/1q9u2DU1KWe9EdM+KS3cUCKUKOCnTtniyeMqpXrZ
         fdBw==
X-Forwarded-Encrypted: i=1; AHgh+RrGXGoJty4kp6aVEGjuT9aAnjLKQWoEcasCc/h3ZDwHjdjYrbYfNEBavkgwIRSh2szz3iRub688LWeCQUspgTTD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/ZvLdTyRAnloPuwf64+9528v8X+h6TtFXC9HQ6ioSGbiUfV1m
	IonJD9DNrHgvWKB7bKdz7JRVAQmatbJ2nTOIl+lr4LP1PMqMjwwzZGcQA7d+yc27X1V0nVaWkxE
	YQiQml+FCyLdd0pf/H1k+81JUtvpyPYvU1m4C95UcvDDFedpv6ob0Y1TJH1NLuNYg0VbH8VtsB2
	rg2uoxkLUamw+Y5qDxDhIJ87q6WxxCKCweqbUHJSDWpJ0TISO/NLZWnaFewSWGpdOnX3Xls9yy6
	L2/EGl9LHf6+JXU8s6nQGgjvXD279pYd/A=
X-Gm-Gg: AR+sD12aQC7yssi97z9pdWLHceRG/YcKk2BQmoiMVM7nFRkI19iNt+MkPzVjGEgsBFH
	UtTNLdso5DhIfKj9QODotQhtaslXhVAgXJhe0gmrYafqAVBg3W2lKbG8+i4eApUDo97aGPBK90O
	UAraPlAfAX+/CYjRzJwPmfv3hts93iSWil/zgZ8IJRNBeoi6kXB4M5yyq3kkaVx+BThp8Ac+QjI
	xiSBhxnXNErpxt/sVo1og0g9T/blRpux5/yxAxVu8An7tzE/mbGBwgEtm1tzcRtXSp8DrrafanP
	U8aHISXzjyXQouBVrNHuLULyc47ZZb+h1XRBr1mv3TAvwtOf40b+rqo9zz3ZrHZYKdV8rK8xpoC
	l1Y5LPSG7idmLOv260GzD+kSLD/KTFAZxL7E0OtGqHmBGVKxZXjaTjJyy8RTvnds9g1Mi7qv8ig
	+Le76N96Ky+rgDPtvVeI620I3BlfUY+CWO591op8tF
X-Received: by 2002:a17:903:388e:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2cfde78b810mr85548095ad.5.1785169944496;
        Mon, 27 Jul 2026 09:32:24 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2cfde5b557bsm8239445ad.17.2026.07.27.09.32.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2026 09:32:24 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so3383966a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 09:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785169942; x=1785774742; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHPzcDe9whvn6csisg2KBrBErWBPeg/nrhsmnx8o07w=;
        b=UaNyakZA3WTdaCkmYqc3Xct8Z0GAPssjWTv8Xl3xGUZdoDRFwKqnr7Z1T3aqmrshoD
         aptar2WFeeQFJBkal6uXZhX4Fh6cKi1fvsDwkNjTMyFahuU5tV7zcsUsEjjoY79OXLd5
         LB40PStHPJDMMQn/n47Cq2HgpMfvPOI222arI=
X-Forwarded-Encrypted: i=1; AHgh+RoBjTlqeS81airYCMLapPLXdoAu1uB6RjVlUR9kyKqfRHd/jR03ihLHejikLs5VXBl1qHkMW/hgkyrc6M4A+kCw@lists.infradead.org
X-Received: by 2002:a05:6a21:497:b0:3b4:605c:2163 with SMTP id adf61e73a8af0-3c67d9b1dd2mr8795673637.4.1785169942645;
        Mon, 27 Jul 2026 09:32:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:497:b0:3b4:605c:2163 with SMTP id adf61e73a8af0-3c67d9b1dd2mr8795637637.4.1785169942083;
        Mon, 27 Jul 2026 09:32:22 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e6054598asm14918234c88.1.2026.07.27.09.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 09:32:21 -0700 (PDT)
Message-ID: <7ae25c84-b960-47f8-b930-a36d5edb89e8@broadcom.com>
Date: Mon, 27 Jul 2026 09:32:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: BCM5301X: EA6300: fix USB3
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM5301X ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260725215809.9464-1-rosenp@gmail.com>
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
In-Reply-To: <20260725215809.9464-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093227_478975_C7D1051A 
X-CRM114-Status: UNSURE (   8.57  )
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

On 7/25/26 14:58, Rosen Penev wrote:
> USB3 needs to have a GPIO pulled HIGH in order to function. Add vcc-gpio
> to do so.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied, however your patch did not apply cleanly because there is no 
srab label in my tree, can you submit that patch as well?
-- 
Florian

