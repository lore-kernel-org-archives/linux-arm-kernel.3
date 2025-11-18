Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5465CEE343
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 18:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6escJsy+cDt/xGuVF5sLz1hYdQq4kG1CujcTZp9D/YQ=; b=r47VpTC3v+LfUQQQ8ZBHDE8p5m
	8z75LE2Q4lVEeitW8DjVNrf/vPW6dgNesrMRwJJXpy9AEv4YtZGOdAu+EedgtM3QKkEkaZIGlqA36
	F5Q1rdpvtuf3/4HZqm9kSvbC6/mEHlsEbOEuSxuryxJFwPyxKtEGHiCi5qL3SnnHqbwtVFxL2HlBJ
	QDw9dvjjDl1ctGVGX5NxgfmIjaAzq2E20HoTLDGmpXGVwS70uZNH9ftijzoJmNUmlXNWyZx+C+N+r
	cvgLraaFnjUB0ZUkeouXJyLHPwBSPsKI2Nh8MFtIjFLFAUOVkrhNo6w2hhUPRAkWBrWtbWgQk1QB2
	XPQ/itdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLQXy-00000000wzJ-2ZIb;
	Tue, 18 Nov 2025 18:35:22 +0000
Received: from mail-pf1-x462.google.com ([2607:f8b0:4864:20::462])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLQXu-00000000wyL-3Gus
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 18:35:21 +0000
Received: by mail-pf1-x462.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so4724831b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 10:35:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763490918; x=1764095718;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6escJsy+cDt/xGuVF5sLz1hYdQq4kG1CujcTZp9D/YQ=;
        b=B92FwXRr+V8XPHqD5x2H6t6M+l1EMl5rhY4YoikucMt3tCzSua/hn2LEs0wpcgC6f8
         ttyfXR54UCHrnHT3h4QF1pMeX/5fFO4e9f7TS9r4T7q4cMxS/6WtUQUwUYaPRJXOX/Y4
         F0yNZcrj1SS3CTqLQV1fjZ1Jjw6HzfLAQlPK8MFVmp1iFSwrLc54ZO3xSWXeRFSLPacd
         5Ar71cLEBNF3bBB+g2M69tfPD4Z6okzMtZK9X65V5hxMdJhL03FW35XJMxg+oiJm0yiO
         6EWeIcD6OLaYWBRCDgg4D0T6wAwhf7EPrjPGUIxjd0vVLs/BVQtMZHS4QbSVcT/BMqlA
         d5cA==
X-Forwarded-Encrypted: i=1; AJvYcCWKkG4PClMAoj+UtnTMKLK8V5PTTqr59oXQV+b0R/DFLyw4m3npLiwYjNBoakyxNEW/rkWJ0IyvX8l5RN0I8G0p@lists.infradead.org
X-Gm-Message-State: AOJu0YzwB5vfmomr7sA9Qjt7tfLLNYMcPPeYqWa3EEfU5qmamJ67u5AN
	x8KRXwRN2Da1b3GiaQFhFwa+i1OFiwtmF44Og8vgez6yPTNzXewKrkVSbNKVAk6ENrUXvqpL1sG
	4GnZJxDHPZYwfHyfQlj8PrFSKHGnoM9CoAuw9X+fEdIHO8wnGml47UQzWqUk9q+dhDdaoyJQ17F
	DQYrCPp6/Qal22n5+h9R4ZzvMr+elilz4s4SOseAZ3AVWu2AUtcHbbIrvomSaEjxMu/sqdF0V69
	Xwp3EgNNcU2xa/cb9A+OXmeDLK7DCsCXXA=
X-Gm-Gg: ASbGnctolSQ9A/AiyrYj2BZfJfVMa3x840QtZpXlmTBExrC++Y9d+4/k7AE0Yosh5It
	A63rR4O0wvsOJXZBLY9dmnbefXjSi9pNTq1ffuYSYS828R2krcyZOtSx4hGEUIJMKT5eGn94wFr
	XrQsskY+nA9LBIgMR/TjTi/m6D5g8V0gTOKRet1GBKqkChYeUqbg1t0/JKxcMhaQH0KB42ssOeJ
	gHg+eXRZnJTwDobHSSVCWl7j8FJTvhtScpUlubST9M56ZVdFTx4uD/oqireZaDFm+7eltOr7Y0R
	ZayVbCil/CGUWVHU9ve4RnY7cdngCocJ7dsBAoIgAO2lm4NsPBklUIGtnfuaNNAeSUUmVjqjxfg
	TzbIF/9Q4d8zRD8TZNf4yRfwmhHM4H6AXnWXHz7cWb5HrIa2ifrSBN4ahy8wof1u/u4qQ94Nr2m
	ONjHwXpd928vEI/cHy7m8hIr+csbjogIHUmv1GidbV2ZzOdVioEkRb
X-Google-Smtp-Source: AGHT+IEWYoq5AL0Xli/qWbZztPE0kBWqbbts9ZkNlp0isWNKFXEvRypQOGLLizZZkY4hST2Avsv5Zh5KyUHP
X-Received: by 2002:a05:7022:7a6:b0:119:e56b:98b3 with SMTP id a92af1059eb24-11b411ffe86mr7012615c88.26.1763490917684;
        Tue, 18 Nov 2025 10:35:17 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-103.dlp.protect.broadcom.com. [144.49.247.103])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-11b06091270sm1518634c88.0.2025.11.18.10.35.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Nov 2025 10:35:17 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-bc169af24cfso4672197a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 10:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1763490916; x=1764095716; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6escJsy+cDt/xGuVF5sLz1hYdQq4kG1CujcTZp9D/YQ=;
        b=C4I9NqoPf+zoieSGhmup+z1ZyxVYu+H6iRdhWUirWN2TDooQTLm4tuQR5Mqmr/ysTD
         Qb3wV5OHrS5cAd5woj7wQ6tw5oqC8HbnSr9AN6Tw23IOOzSGjxIsi3r+GqxeuWiidbO3
         VoGlIcqXsvueinU+XtOezirrUJ3TXcMhX1x+w=
X-Forwarded-Encrypted: i=1; AJvYcCX0yqTSFXiyZPUrVoLW4hWKffhkHS0Y8g+9AFlQzf9pfBf6ZlaE8wSUX/+9beRXh6eeFNtP6XuX1NCehcLEvGVb@lists.infradead.org
X-Received: by 2002:a05:7023:b07:b0:119:e56b:98b9 with SMTP id a92af1059eb24-11b41306c47mr8310678c88.32.1763490915761;
        Tue, 18 Nov 2025 10:35:15 -0800 (PST)
X-Received: by 2002:a05:7023:b07:b0:119:e56b:98b9 with SMTP id a92af1059eb24-11b41306c47mr8310641c88.32.1763490915104;
        Tue, 18 Nov 2025 10:35:15 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b0608860fsm52865160c88.5.2025.11.18.10.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 10:35:14 -0800 (PST)
Message-ID: <6466b7da-eb8d-41d3-b3d5-9845eb6067a2@broadcom.com>
Date: Tue, 18 Nov 2025 10:35:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] gpio: brcmstb: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>, Doug Berger <opendmb@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Hoan Tran <hoan@os.amperecomputing.com>,
 Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>,
 Romain Perier <romain.perier@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
References: <20251118003229.26636-1-jszhang@kernel.org>
 <20251118003229.26636-3-jszhang@kernel.org>
Content-Language: en-US
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
In-Reply-To: <20251118003229.26636-3-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_103520_584081_EF248079 
X-CRM114-Status: GOOD (  10.73  )
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



On 11/17/2025 4:32 PM, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Acked-by: Doug Berger <opendmb@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


