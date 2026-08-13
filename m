Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73483C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 16:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=er5DRGv9RBWWCyOmoSI2svQn2A2+M6brn7eWG6JBVlI=; b=ayo8f0sV94ApltD5CGHkx6qG3l
	77xI7wYJ0Er+LZFMaqOfQMUwG5kpb1Gfa69kLNVzdMoXFmbZXLlDeo4cP0LC8YJts7aYdv3K/OQSU
	hM/+JgKTDdVrjj7tTjHM4AiK96KOpLlraM7GWyF0arje+EkQ5bpfPcASoX91XvQhacHnnXgEVFXJ3
	MAFPB/TOlQIed3VySSDDE0180Mi3rSx918dLxUbXucCMHSQzGgCvGQ5Achc6n58Tt21GM+D4Dy+1g
	TcSGFECj4EtzwnE3w34/KlpevCia6Va2WKOBxyR4OogyVcSOc41JUjHxosYTQZcZ33ytKQKCTwLJM
	LDY8gpdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYO5-00000001AXp-2S1t;
	Thu, 13 Aug 2026 16:34:37 +0000
Received: from mail-qt1-x864.google.com ([2607:f8b0:4864:20::864])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYO2-00000001AWs-2qU0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 16:34:36 +0000
Received: by mail-qt1-x864.google.com with SMTP id d75a77b69052e-52d56b08213so6707491cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 09:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786638873; x=1787243673;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=er5DRGv9RBWWCyOmoSI2svQn2A2+M6brn7eWG6JBVlI=;
        b=CPGWGE59DwslY9DpfdaKRAniB1Y0DWzXO+Ro5KQGCsfZuFmETpkmFXGbpkeGs8HmYB
         e/LMXJtk47fjki8c4IZdBhh8VOPXiU/kmLbpdAjgizSHeZ6lguNoQLW7Dkz7EnRKyqkE
         ddFiKEuFbnu6OzJTbvTFmL0Px9MMwNf3a5HxNiIhA6FYy/QOlEp2TLWNXD8PGLt3/lHt
         d7rUiSV2TFxA+jQHFe50PjkmZe8pl8shkpAjJ1UVTkePMnl67otDalPcdjQI+ZxKW22+
         NCe51JRdra2t0qmoIk1CC/IWnBUxwh0+cOClVSfAbJ52O1e0XbuBTnn1yw+PzNQ+3pgM
         hr4w==
X-Forwarded-Encrypted: i=1; AHgh+RqVLxJovDBddU58ovtDSi/uyJY3i3Er8Zo5mhkKga+vXeGNY7HrZeTsBRG2+bzWez+eJWfI+UKZyWthn7t4Ivgu@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr/1v/3NolFK51pgMYzDhS8yl1iYp9qXAX35MvVvC9nhYG6a8R
	xYr6WhjFWlaAObuqzY6vJyq6xk/CyhsRvM0UOLaOAMY53hCcpWQyaWVr99yVt3YVdvCPkZPA4qt
	ZNb3l4PXCnWcQ7EY+wNwSoCfwwkFODshkj2n6OZIdyhbMa9DW9eLYJiieFWY23/NI4a2skKbbEO
	6Yjdg1xqHzn48BuiynCKeW8pRAzumg4LFLv+S+lQp5pk9melYWUkPkI960G6Hj2JJRcQdIRxSan
	GD0WcldH/ln+vzOoW3owvvFqNj1ZFHBc4M=
X-Gm-Gg: AR+sD11tyi1erQGUd+L1WrFjqMs5zXsF1Q54veiqYd53OtxWnzKIAAEVDfRsaYW/zGo
	JKKtrQyZmsmEgCdSRNrKUkDoLUhyhHZmNDEYohDUZ+SDxiIrc3K373kzHrlAfpRd3U+0Xq1WSQD
	za4CnDFvnZlQgjpRxLoLh96juJOxJTUxZCVwOnVNnlgqnAfb8EtoLO3klAPJIe9jxeT4Pbq3l4Y
	DzCvAZGFbM6s2HHO5KUjl5XYq+ufEUcyhGMmV7ntYjihBfPZLirl5kz/dBBSgpVzvN2f+byhcxg
	w8WGaI08bREuB0HNouUdW6ccEp8LLK+7NyoQXgwx7pJYNcZera2vFE9WV+4/ZEQKWeRL+18RoGY
	Ts1vlmXTlX7t+ptcdB/p2aPpMq3DWZHNvSbweZ9XdIuyHLiolM5VMvdiclQig+Qe4/P39Y7pp2q
	v/0Fiutgk+aeFwBlT4A1kSiUinX9ogFTth0o6SRQ==
X-Received: by 2002:a05:622a:192a:b0:51b:e946:45cd with SMTP id d75a77b69052e-52d75214d97mr67007181cf.14.1786638873004;
        Thu, 13 Aug 2026 09:34:33 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-52d83eecdb8sm1511cf.3.2026.08.13.09.34.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Aug 2026 09:34:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e695a3b28so121047785a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 09:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1786638872; x=1787243672; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=er5DRGv9RBWWCyOmoSI2svQn2A2+M6brn7eWG6JBVlI=;
        b=ZHN8NnAMsLPOzLxJq6mbinmYHvd/K1ThnuCInqDje8zDlWV7wc1SzC/2xPjEw2HeZf
         oFVeFLdOUZVdnkNDKLJ6C4Jg7cqMC6yxSmcDMohIdYDzOrlT3i/qsyOzeLM3WrDzRMkK
         +MlumNpLFdjdNFYhmv2zR8adXcqmPW/OmJf7o=
X-Forwarded-Encrypted: i=1; AHgh+Rq6MMoNHDbHv5oH/r6I1xHVKps2TuMo9aFikp9MPdstYSkbCJJ95h/kE6ago0C70sRCEh3MqXMam0jB1l/xvmLT@lists.infradead.org
X-Received: by 2002:a05:620a:3726:b0:936:a184:3cf3 with SMTP id af79cd13be357-936c064fb1fmr644758685a.10.1786638872111;
        Thu, 13 Aug 2026 09:34:32 -0700 (PDT)
X-Received: by 2002:a05:620a:3726:b0:936:a184:3cf3 with SMTP id af79cd13be357-936c064fb1fmr644752585a.10.1786638871669;
        Thu, 13 Aug 2026 09:34:31 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936cdf54ce8sm21460285a.4.2026.08.13.09.34.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 09:34:31 -0700 (PDT)
Message-ID: <4fc52c7d-85eb-40ec-9e90-2a20f194c64f@broadcom.com>
Date: Thu, 13 Aug 2026 09:34:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] perf: Add Raspberry Pi AXI PMU driver
To: Ian Rogers <irogers@google.com>, Peter Robinson <pbrobinson@gmail.com>
Cc: linux-perf-users@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, Peter Robinson <pbrobinson@gmail.com>,
 u.kleine-koenig@baylibre.com
References: <20260812002728.2283079-1-irogers@google.com>
 <20260812052417.2361040-1-irogers@google.com>
 <anwuYYxLFbtDmmHx@willie-the-truck>
 <CALeDE9P1xZonVnZDExR_hMafd4mxahkjBVTDLJenQ6DKW5MSHA@mail.gmail.com>
 <CAP-5=fXd2HETe-484Pe5wMTGPiXbLheMaW6ZDpdD+YCtKoBHVg@mail.gmail.com>
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
In-Reply-To: <CAP-5=fXd2HETe-484Pe5wMTGPiXbLheMaW6ZDpdD+YCtKoBHVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_093434_756915_49D16394 
X-CRM114-Status: GOOD (  17.73  )
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

On 8/13/26 06:48, Ian Rogers wrote:
> On Thu, Aug 13, 2026 at 2:08 AM Peter Robinson <pbrobinson@gmail.com> wrote:
>>
>> On Wed, 12 Aug 2026 at 09:28, Will Deacon <will@kernel.org> wrote:
>>>
>>> On Tue, Aug 11, 2026 at 10:24:15PM -0700, Ian Rogers wrote:
>>>> This patch series adds an uncore Performance Monitoring Unit (PMU) driver
>>>> for Broadcom AXI system and VideoCore VPU performance monitors found on
>>>> Raspberry Pi SoCs (BCM2835 through BCM2712 / Raspberry Pi 1 through 5).
>>>
>>> Why are you sending four versions of this patch series, at -rc7, each in
>>> reply to the previous one? Nobody is going to review that.
>>
>> I'm also wondering why this is called rpi_axi_pmu where it very much
>> looks like Broadcom IP, and is possibly used in other Broadcom SoCs,
>> Florian can you confirm what this driver should be called?
> 
> I'm somewhat agnostic regarding the naming, and having a more general
> driver strikes me as a good thing. Fwiw, I based the name on a
> somewhat similarly named non-perf-compliant driver:
> https://github.com/raspberrypi/linux/blob/rpi-6.18.y/drivers/perf/raspberrypi_axi_monitor.c

Given this uses the Raspberry Pi firmware interface, having 
rpi/rasbperrypi in the name is sensible IMHO, but the IP is technically 
from Broadcom AFAICT, so using a bcm2835 prefix wouldn't be far off.

Ian, I am really having a hard time following all of your frequent 
submissions, would you mind waiting for feedback before spinning new 
versions?

Thanks!
-- 
Florian

