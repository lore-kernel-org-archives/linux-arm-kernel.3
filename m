Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F36C54F4D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 16:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldrGXYVfZqZof6XV0b95MEUdQpAbYXx4kQK0AyVaZ1M=; b=dLnoFncmEimDyzaBuzFJU6hAeq
	88ipew7TjMqqnojjFJSSFigjlpPs4GdREbeo2wEu0XIxaQb4Nih8nDsgdNQvpnCLPZL+hPkempbaL
	AvTOUgtpsxjyMN1JJoT98Bh3lRDfuBtSnTSZ5gi64WRAO/9Fq1CnDzkniHpj703dtL8ysobuqOJ89
	UVEaTZgRdLyY/89I+Km4U5PjNrF92+UAPys8noIX8OQ3lfj8BaGrCT0RrjAc1PQ4LZAv6vJVV4FBX
	4IXKWN9hqv/15kSCYlm9Q9qXkp1B7U14yOt/hZgL3bG3s7LxchToExrgcbERp+aTP80x/xm8ygmSq
	0sp6tLpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokXh-00000005oUi-3lKP;
	Tue, 28 Jul 2026 16:20:33 +0000
Received: from mail-qt1-x862.google.com ([2607:f8b0:4864:20::862])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokXd-00000005oT5-3oWn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 16:20:32 +0000
Received: by mail-qt1-x862.google.com with SMTP id d75a77b69052e-51c05dcdf49so200381cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 09:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785255629; x=1785860429;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ldrGXYVfZqZof6XV0b95MEUdQpAbYXx4kQK0AyVaZ1M=;
        b=bjdN6iC6Gvm7ZRQA66qpHuzT0P5jZlr/Y6MJPlg77ijRUJ1z38NCNKcSaP5lu9trBJ
         r7tS2uca/LQSf/XCldn+k8V1SucqqhgaJ0XiS0SmUECwCigbc5dIEbwyWSFHTqf2hThZ
         ngjP+qZrwvHxN7ieZY0OilEG64HoMIse+hpwh+r9r9JdTq/6onsf2EBUMDYnwCcVdTNS
         rw0Z3mN5+EuTw6c4IojZG55Yv786x6ROrsva2jXhNkEPuCRxfALCUP+CEjQIdF8NDIQi
         yuE8fdFoJWENAWy+CGZELMrMXArwN7GKx5PtJ7EaQD5CenrxcMMpKzDFDglbzJp9ELOW
         hFMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmTdgz1Z4vDfFj84v4waah6wdIpvUBBittP6W3q5vYEVUDg+3QnbyjIo9QPdbcaKbFoR2z9Rm4PTPD3sv9yJlk@lists.infradead.org
X-Gm-Message-State: AOJu0YymYvSsHSgl+TX0Bh4+tT23BbwiI5CXfw3cim6GKsGkcP4pe9R4
	aNzoEbnFiBVngyqv7bJ/3KifodPP30TuYVgFzLrbYemjwojYOchs3LH7yVAyKt+hF+5FZ8ZXIVA
	MbGJ3n+K7g9IMPN0+JQ6lW310kllhL7zetFdfqUhu4hdtSMtGI7yKJIM0CdJ6z61kcYvgzSiE5d
	5Bo81lzq+bfrZywJx0bmbjGx7Ct75c29J+YWycxBn1KLBTew1j4XNww7K4IfdbihQqa3hvwLfLe
	mpa85eS0gS+m0VBAbiotKR9RnGOE4JvTWg=
X-Gm-Gg: AR+sD13Qan8tKMZfSSwys6ujD4lUtJv9RlqdW/7otKj+z3PXqNA9FZFqEWY58emMuaH
	B04JjxP6w6ihLz3gZtKQRRzKXXK/3GFdDBfZXs2xEThiEVDfP3zSJD3GMXjNZFsQY2b8ahtCjCJ
	/O2QJpuJr4L2infQ+3A2qr/qHLbC7jjQll9gwaz6dd3cw+5UXuQhyR7vyykA4ds4iBE6JQu4JX9
	Ssowov8N4fiP+QfCAyPxRbHGyN8KrxsYOu4h0cFzl/MGufxEBm7BCma+c8YF7B7wy2V1FvoU/Az
	POlJU4WYucVN3TTe/lA9AyLYbsqrMcLPV5KcPUG4cy1bG1aKEf1Tq1YEkxz03kJnOwyjd5NShu+
	64cfQumTLZfibO7zTD3cyA+4G1UWmYr/bLU/SI6ekCpsw9siLw6mbSqhu98K/BwneNHTJn8dfE3
	JHnX5jbXtbjKjsEBNNyyDHKS9sxFB1CJaCHBty5zHr
X-Received: by 2002:a05:622a:50f:b0:51c:8439:14d9 with SMTP id d75a77b69052e-529d70e6e9bmr29502751cf.54.1785255628399;
        Tue, 28 Jul 2026 09:20:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-73.dlp.protect.broadcom.com. [144.49.247.73])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-529e2da73c9sm29711cf.13.2026.07.28.09.20.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 09:20:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bff5c7035so17021cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 09:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785255627; x=1785860427; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ldrGXYVfZqZof6XV0b95MEUdQpAbYXx4kQK0AyVaZ1M=;
        b=GeNIvOXGdZmsHL3kZf5hapBg1xX+scrRJo8Dk83LKPMNSF0fbPJ4qXa3MVGHcdqO1p
         KxPILkhpGF1OeK4ndXsZh+Fw6o4+zb1p+yaRcAgON/lfuNFSK/41vp3gdzykBfNZTEvk
         qr2395fR5581yf0RfE3MI+8pNpnCIaKAGNjHM=
X-Forwarded-Encrypted: i=1; AHgh+RrnuaokeqkoL3AjPgbUaxp6/QGj40dcUfx/Gdj8LHOCm9bFrcaYgE701s/MrCeSLynzfKJoZ4Af8yNCOBefrtFA@lists.infradead.org
X-Received: by 2002:a05:622a:50f:b0:51c:8439:14d9 with SMTP id d75a77b69052e-529d70e6e9bmr29502141cf.54.1785255627665;
        Tue, 28 Jul 2026 09:20:27 -0700 (PDT)
X-Received: by 2002:a05:622a:50f:b0:51c:8439:14d9 with SMTP id d75a77b69052e-529d70e6e9bmr29501711cf.54.1785255627138;
        Tue, 28 Jul 2026 09:20:27 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081dc8a00asm2538436d6.20.2026.07.28.09.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 09:20:26 -0700 (PDT)
Message-ID: <86243c3d-6680-4c2e-9eb2-8c1d5d390120@broadcom.com>
Date: Tue, 28 Jul 2026 09:20:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: broadcom: bcm7445: Correct indentation
To: Krzysztof Kozlowski <krzk@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
References: <20260706101920.341586-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260721172801.3591970-1-florian.fainelli@broadcom.com>
 <9a415731-0de0-4cb4-b6c1-fc78806f6414@kernel.org>
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
In-Reply-To: <9a415731-0de0-4cb4-b6c1-fc78806f6414@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_092029_974983_C4BA0A9B 
X-CRM114-Status: GOOD (  10.72  )
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

On 7/25/26 09:37, Krzysztof Kozlowski wrote:
> On 21/07/2026 19:28, Florian Fainelli wrote:
>> From: Florian Fainelli <f.fainelli@gmail.com>
>>
>> On Mon,  6 Jul 2026 12:19:21 +0200, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
>>> No functional impact (same DTB).
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>
>>> ---
>>
>> Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
> 
> It is still not there. Last commit is v7.2-rc1.
> 
> Your next branch:
> https://github.com/Broadcom/stblinux/commits/next
> has last commit from May 29. Something was not pushed?

It was not, fixed yesterday, sorry about that.
-- 
Florian

