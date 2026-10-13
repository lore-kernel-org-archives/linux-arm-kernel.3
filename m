Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60ADCC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 22:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/miz9Lfh7xZMzuebR+YhuDBg0DBR9c75BI7+0l2sLI=; b=zDom8nA5mdUF3XKec5CfHgh9RG
	nC8HIQ7Kd67s7vTexkv6t66digaJt9jr0HFQW/1HVTHDRx6oB1OEuiZOi59HKw7owEeW5N6rtB1+g
	V8FftJoW46S6ZV0sTh2X1dE+RbnvpsNoxPIlOSxULSrIkZA4jgCsitZhdK98TN2wHIOinyJAfGczT
	EPiZPzCp0ZaNdnUNsEN8NbqS2DmH924vx5MJvS4UzQG8GuahGNKY1mhJ2DrEBsFY2uPjG6rAjmzA8
	Th1Yq1CAP3Xjv2uHr4y9hzRIk1pC4t+oGXRzrRA2SXs9R1hiZsjPz6K5zHWr+ZvZEBRVCs9Wfq+La
	Z6lvzp4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGktK-0000000E7z2-3oAF;
	Tue, 13 Oct 2026 22:22:38 +0000
Received: from mail-qt1-x864.google.com ([2607:f8b0:4864:20::864])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGktI-0000000E7yd-23vR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 22:22:37 +0000
Received: by mail-qt1-x864.google.com with SMTP id d75a77b69052e-5351748222cso26809461cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 15:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791930155; x=1792534955;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g/miz9Lfh7xZMzuebR+YhuDBg0DBR9c75BI7+0l2sLI=;
        b=d1Fz6KernV/h55tjKHC6tj9JfkMApWSl/QpDVduda2J5C/DsWSckeKxahuFTcfkM8q
         SnXMZPD/OQJpjMpEa/H7pnfAOnvWnLzDx4JTHnwn5K/KhiAzpcrKIGk/q5b6kOzVUqO8
         U65rMnWPCPpisrO/MYOiKniONZ06e/5lOHg56gQuclhCqzHerE6FHoN5RCDRvxUKLXwz
         L00pJMpI88vxT/cvZjdyH4vSbnkGdbBMrlXZWgFS/bZWJVpvOCR1YdyQQcFsfXgJjcEa
         LV7RWMDN7rR8UZ2XS0dZiDBqMCCxNmVuSUrs9isv8oivQbpx/jeDt8vsuu77Calqhog4
         ppsw==
X-Gm-Message-State: AFq9FYKr4bYvhuIkkhcfGlWiAvkqHz/57v6waK65lRwikWHjsWprtoJZ
	BcqeVzwAAd3CbzEE9yqVsRFrNcXGsTkZjdIuTpwNBPT2HgP5V20Oz+ffQvi+54Pp33Z0zt1xZza
	cHbrGnIA2WIH3n02Q2MJb1WoY5jOgF4FpRByDIqTug5TlvgtLv5wpWlyShu6nQRxBNZDlD2REx/
	mdRUYeS2QaFcIMyvqkZXnbyvIs8AcsxsnhevweIvN/vLGCsiHinHHvUDNlBavu8pSoi83o9RA/j
	bxKmyMR47AYgSumB1Ez6ov8KWSbL+nvZQw=
X-Gm-Gg: AYBFou1ZYOR6xVZGrT5F3IsGLtvxHwbMFTZweN2kGgLRLXKPY0kllV+BxRqnCk1O9n5
	df+NIudzcfp4M5Z7JAwGlO83gxos4uCMY4Vj21o+OIS6azso8Rr1jx3g+G3TexRPD/P7QPv3hZz
	q93wNd4sP5ESpffFjfyphD37Ra8p2bJL6aPYRgZPksSrKltUAIH3ITqlatoaSPOlpE+wdRb3Orz
	Q4ywNlW5CSpk85kXCAskSpqgXOArPGyQHGm5rOpyuBFHdb1o5YcQrtwSLSFfsHbQNvpd1rZUWdp
	rg53CEMSN3LgN7hWnUxyCWCuY6ATQEFTU2QVSaKw+JCmDONCqKTZLPn1oQeij90RBaLq8zBwnGx
	XRGC9dvxz6bauvALY2Cqs2rvkCJPHroYXnziTwllvx/daf7i4+prqa9i9YfLTLDl0nnc9HwhCh1
	q3sZ8SZjjdYp5iBqJNUonAcXebDEtSDXF5AYZXlwW+14o=
X-Received: by 2002:ac8:5993:0:b0:535:baa:a78d with SMTP id d75a77b69052e-5359f46ccbbmr225334961cf.10.1791930154580;
        Tue, 13 Oct 2026 15:22:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-535fc8b69e0sm44721cf.31.2026.10.13.15.22.34
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Oct 2026 15:22:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35a4d2e39acso1138346eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 15:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791930153; x=1792534953; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/miz9Lfh7xZMzuebR+YhuDBg0DBR9c75BI7+0l2sLI=;
        b=Ugylatv3fiU93eyLVZhNBSYxxtKgJ2RcY80MqErED9rafD2nIixCIHIJQ5m5xwui5J
         YPuVXw9z/T26aCaqCv6DtLuVvVo2lS9JVA4Xd+R9iiKFUFvj79ohytcyEchpgtbSZo7J
         YQTka7Gp67SMICEfH1v9POfHICmxi3x9QYwuw=
X-Received: by 2002:a05:693c:41c7:10b0:353:5cf0:df09 with SMTP id 5a478bee46e88-3537df8d300mr20367545eec.8.1791930153084;
        Tue, 13 Oct 2026 15:22:33 -0700 (PDT)
X-Received: by 2002:a05:693c:41c7:10b0:353:5cf0:df09 with SMTP id 5a478bee46e88-3537df8d300mr20367523eec.8.1791930152421;
        Tue, 13 Oct 2026 15:22:32 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm35948289eec.15.2026.10.13.15.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 15:22:31 -0700 (PDT)
Message-ID: <b1666e68-6ea3-493b-9880-e896d15193bc@broadcom.com>
Date: Tue, 13 Oct 2026 15:22:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ARM: bcm: Enable SMP on the Genexis XG6846B
To: Linus Walleij <linusw@kernel.org>,
 William Zhang <william.zhang@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org
References: <20261012-genexis-xg6846-smp-v7-3-rc1-v1-0-a51d4afde4a7@kernel.org>
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
In-Reply-To: <20261012-genexis-xg6846-smp-v7-3-rc1-v1-0-a51d4afde4a7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_152236_550564_B4BE26EF 
X-CRM114-Status: UNSURE (   9.51  )
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

On 10/12/26 01:03, Linus Walleij wrote:
> When booted through CFE and mainline U-Boot, the XG6846B has no PSCI
> provider. CFE powers up CPU1 and leaves it waiting in a holding pen.
> 
> Preserve the holding pen, add a board-specific SMP method using CFE's
> GPIO mailbox and a wakeup IPI, and disable the inherited PSCI setup.
> Tested on the XG6846B with both CPUs coming online.
> 
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

This all looks reasonable to me, would appreciate a R-b tag from 
William/Anand/Kursad here before taking this.
-- 
Florian

