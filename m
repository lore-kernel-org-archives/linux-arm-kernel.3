Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB0E1099B2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYHI9ZcwdBnBRWoYvHZn9L/zxUC92mcsfUn7OjmWmmU=; b=pgKtaOIb9JiUlV2mojJLnMwMqd
	GGfQ0so0l7oFlqU8wLqIeqXd8E0WqjiwyQWlFMF9txH7KdQkmvJqXtUmh3BUM4/BnUzIKUzY4nqOB
	nt0IRnDtcYlOUblBy9+itZKaji2B07rYhGx/3QS/kZtKwiVSAiTuBZ/JLrSxIkmtswphmTDK71+Td
	rJ9nbRT4EigsrqGGeie7WjRbgH6SPyryVVam3w3G+NtUc7vGETR3aygTG/7z1Ip4JSfNJx9lFktmB
	OykXOG4sBmH7O1lt9SlYy1bKRaYhyLsCvxVoAoeIp2v9fvMIW/MveCqm3a0YBr8hEc8PaHoh85HkC
	ag/7s9sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dfE-0000000DFuW-0qvf;
	Fri, 20 Mar 2026 17:29:36 +0000
Received: from mail-pf1-x463.google.com ([2607:f8b0:4864:20::463])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dfC-0000000DFti-05bS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:29:35 +0000
Received: by mail-pf1-x463.google.com with SMTP id d2e1a72fcca58-82a7ebc729dso949702b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 10:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774027773; x=1774632573;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SYHI9ZcwdBnBRWoYvHZn9L/zxUC92mcsfUn7OjmWmmU=;
        b=ppN3IUm24Gng60UOHtOSvhddxztqgV8EcCyznul5PxYya0TP57Yn5Ku5NfHo8eshNq
         7wYUcSP+wrGxjjV+39KO9jIJv544bPRzmjBKo3na+BkjLH4MwM+rM2TDGzidGITbQF3q
         HgVOopPGz4XgLio0zIeFOA0uPXlAA9AR8/WxPK6RC7i1hw2X1cg5OR2xqhGQQRri20w/
         0IRvy4FIqQAFgiee3FSNKz75yoldsN4zoy3sRjGZGh9DZY8KQVFdlziurd8qvKJLdXRa
         odieYpTLcCLCAwqUSjmWUBha6/QYqZjGSHSeGpQLtMTJwnApKqlD6manHt+9M6yM1ZZl
         Ufow==
X-Forwarded-Encrypted: i=1; AJvYcCWdesObsAGRLLw+qXu6WY0AA8jqLRpAI0ge2twAD5NDqiR4ur/Hx4oMQ21k3JtNYBzm7AamQTy8Af8akAzydgVZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxMJCJHFuxhnA6EPDgcecRhpycxeoF1sXRwhhGEbQB4PNqt5DWO
	KXPk6fZRRnNKpG0kvlbUqGUCLJeVC6rf+H9YwVtQntINT3Kt45SEKjRKmS3xBSN7+8iyb3IQ4/j
	wSwyTjy0IpI/MiAcFBJaFpwAoP2JdaXjJzSLNQD4YyTzJ60gIRRJTQ0gloTQ6Q2PAAPe+88/gQM
	+a5jG9PaQyyHX5cBrUn/qCWeovFnV/IVW6UNFNz21LGz9xuIHze3i/JHstkwfUEl+BBvhmMXm4X
	F/BktZrEXS764AP7oLZMwliKNC5MjX9F6E=
X-Gm-Gg: ATEYQzx6y7ZrW59Mnq8U+pWWvIgl0xH1DY5+WW51YbUcLp14K59SjZNm5rn6lKRWoXm
	+Z9DxwqwnvoOTvzUvF1fHYTa4udbj0oLCY5j2SaAcL09tcI+d90lrMBVhJ5Mac+eTxep9/GjHSg
	Bxp3Z0KMqJ2anMH2pm5SFeHEovup7Ab9GX4oBE3qTMZIW/er4y7j+xoeWZJIajjAD6mxwIFQAO7
	9LF6yKThLW0AbXeSUA2x2lqWbMi5affRky+ta0AEFrptQYg+nhUzOc4aND3I4cZno9jV/jbGiqv
	m0FMpD3rxT/0YxxHS1A7M3PZtkFTYkGv8YOl3gTKXM31yAzq9ny9I3bD8+/vpJNILKvzApzJUHS
	Ss1FdIZNdx6D9LFRiQNztCvufFsxONsIVU9iXvuAZZf1M8BjdIJPmPfKa7i2F6hq2UzSF4VHCYQ
	ze4OqAOZwMVsQLopVi3qXjBN+AsAe+x0UUaHN3Bda6xrQD/WB3I/CFWc3wv++xjQ==
X-Received: by 2002:a05:6a00:2991:b0:82a:110b:e216 with SMTP id d2e1a72fcca58-82a8c2801e0mr2829278b3a.19.1774027772872;
        Fri, 20 Mar 2026 10:29:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-82b03fcac00sm308061b3a.8.2026.03.20.10.29.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Mar 2026 10:29:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1270dcd11c1so2149847c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774027770; x=1774632570; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SYHI9ZcwdBnBRWoYvHZn9L/zxUC92mcsfUn7OjmWmmU=;
        b=Y5yOYVTALL/oFkQYJND5avrquewumY0VnheS+aK85XBPPJhxfnOEAXvtlmAg1zsncw
         GPH4DaWHdpBWi1vrSg9r3P20wtLagc0E3H6kLGnICj7wnBGUY91GVltzc3KJ+iMAAK/C
         uowA+04/Sc65PVE/cBPQcWRb6XwO8Ix11lbzA=
X-Forwarded-Encrypted: i=1; AJvYcCW2YV5d90EcDuz6AUupR0qY2CRfAr/Ms0owurVqumDq4eNYTIQ5Vl1bYrrKQqlU5394H7KrgOA8/8xKcKFVXedT@lists.infradead.org
X-Received: by 2002:a05:7022:490:b0:12a:6b3c:de54 with SMTP id a92af1059eb24-12a726b9b0cmr1784845c88.29.1774027770553;
        Fri, 20 Mar 2026 10:29:30 -0700 (PDT)
X-Received: by 2002:a05:7022:490:b0:12a:6b3c:de54 with SMTP id a92af1059eb24-12a726b9b0cmr1784823c88.29.1774027769924;
        Fri, 20 Mar 2026 10:29:29 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733b4a99sm2898825c88.1.2026.03.20.10.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 10:29:29 -0700 (PDT)
Message-ID: <b3212a44-2783-4c37-95d4-56e0b486c73c@broadcom.com>
Date: Fri, 20 Mar 2026 10:29:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] ARM: dts: BCM5301X: EA9200: add wifi definitions
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
References: <20260319035324.269905-1-rosenp@gmail.com>
 <20260319035324.269905-5-rosenp@gmail.com>
 <CAKxU2N8Vb3D0oEGPzOqvwsXSVLhJtxh=5xrd6qq-Yj2X8Rt5Rw@mail.gmail.com>
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
In-Reply-To: <CAKxU2N8Vb3D0oEGPzOqvwsXSVLhJtxh=5xrd6qq-Yj2X8Rt5Rw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_102934_068222_1AAB60C6 
X-CRM114-Status: GOOD (  12.94  )
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

On 3/19/26 17:29, Rosen Penev wrote:
> On Wed, Mar 18, 2026 at 8:53 PM Rosen Penev <rosenp@gmail.com> wrote:
>>
>> brcm,ccode-map and ieee80211-freq-limit are needed to be specified on
>> some of them for proper operation.
>>
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>>   .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 50 +++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
>> index 617fb55bc52f..7b1363aa1144 100644
>> --- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
>> +++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
>> @@ -93,6 +93,56 @@ led-3 {
>>          };
>>   };
>>
>> +&pcie_bridge0 {
>> +       pcie@0,0 {
>> +               device_type = "pci';
>> +               reg = <0x0000 0 0 0 0>;
>> +               bus-range = <0x01 0xff>;
>> +
>> +               #address-cells = <3>;
>> +               #size-cells = <2>;
>> +               ranges;
>> +
>> +               pcie@1,0 {
>> +                       device_type = "pci';
> There are typos here. "pci' vs "pci". Should I resend?

Not necessary, fixed it up while applying, thanks!
-- 
Florian

