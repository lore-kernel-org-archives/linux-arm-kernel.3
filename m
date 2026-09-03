Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9ABC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khFuOBkB1vjsFgU/yUzBAHiABtuKryqUSfIss3DInIA=; b=L1927kqCjZt4RioJcscom62KBI
	oIGDMbpbQ95ALK4sZyXTJ6Aa0WtbpPGCoCOyrEmicm5OK9mzswEX0TgKx9a6gfUHsgyjPyNIQhpVj
	ATdsjQOYf0nJzRfzF1HrMDGo8Ng781GX5w0wff8cR0TX9BfXLtNJKysBdk99LyCMZ1jXbEnoForfK
	EDLmju7HhWJmKH7SgKu+inTj1nvnpYR1GDFTNBv/w+Rh/VcBLQPuqCG5Sm0MkMCPbWJxvspwdbems
	kALHbmFwIAbdQsJ4f5L3XuEbHACMj2QamfBXhDDKn++6MXWnU+rQOpVXjFJWBLpXDqlmeRQMakTEm
	6YE3Fq0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Da4-00000000WQ5-2uZj;
	Thu, 03 Sep 2026 19:58:40 +0000
Received: from mail-pf1-x461.google.com ([2607:f8b0:4864:20::461])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Da1-00000000WPh-2Zu6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 19:58:39 +0000
Received: by mail-pf1-x461.google.com with SMTP id d2e1a72fcca58-8541875f596so127943b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 12:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788465517; x=1789070317;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=khFuOBkB1vjsFgU/yUzBAHiABtuKryqUSfIss3DInIA=;
        b=GMOGLOdAWSZFjc9qyXXmeNbxmOUBcIABR+j7cElf+zdkAJ2/Gf2HgKS8perBi8l7Mb
         IDQVNzXzM5upUKJlc1Lu7ImHVCqN6HuCNKEH56dE1KwrpzDac5zNfheoDOgzJvHL4p58
         wt2HuIa6Ws2to8fVLC6lelNIVSQAdCeaGTwbPc7XjyRstvMyvgzikfSnqczngmpVoK/3
         A/stwJTOdHi46MV5Cor2Cf+GRTrqBJ1XsBs/wDfwnkfXbaRHlQB79cGup7RVDlxpUOG2
         t2/RARSaAMwOrJ6xBq6FGiYYhI0TCb+y9fG91Awbx7k3JSObqvaha+k6w5d3tLYSrRzl
         vV8Q==
X-Forwarded-Encrypted: i=1; AKwUvBy4eOqo4f2BNRQtn8HZvMqM41kSd73qM1HTSfkisU7XgoywR25S30QklP7EBnJOx+/xcgbM37+JSfO6/Sq8iyxq@lists.infradead.org
X-Gm-Message-State: AFuF++lWvPfmXG4lptj8fETSPgP5cNdW0ej26eWauci4f7Zz+/EfP2T6
	MERKIIdmKEHPx/Qpg3NTnQV2vhNGBmqt/FWb7fkP/Wzv+ROMjwWQYiDB9oyIpDLQgAWHoZX1JeB
	GHe1jaBRtrrLvjTs51/y7oNGiLBEGoVQyDNTpJ/hDdYuRne3YlBOSgUOfTqEeNw1nxKYm/31DT2
	k4rMVuRS5PfX7aLpABK9mEAyELVp+Y+GCfD4nTCyJBYeiCQ03s9UIuu56970/teNeOjrKr3DZNL
	9b95sOT4atG8tKQtIeOUROwUq3NDUeZYDc=
X-Gm-Gg: AYBFou2YG5K9hU8hlgC0peTTcnrrBDLmg5ZQvxVcTBn8/lViMrO+NW5s/mQwqWbz/6G
	DQC+LA3mSI10sN7V9iXVDQB5PHvbHyXEBqdqu4+brd10ys9xr0gNgNlDnpSQypea+GWjTByWtsj
	cBi/SEmT1TDCrjL54IZ9iAxCgnWzTWLw/33O59Mg8U6mtZ5gDMWPBrQvUy2T42meoK/F3egFePs
	btBiarPxj7TefapD2d5X6GPxhZ+vVjIM3OgaVuYWvjUPD+dBhsMicJ9DaFtdSuUXQw1eam6jdpo
	2Z5tHRGUq+tffN6YQIBJ7dBqBZ7SCxzcwH/sUT53mVF9kzV2av+mycSKsZWJCld2q5+5+pTHvtR
	TfW/sKODkElr+ffkVGVOIBlUVwScog34KCDEmdWLsnH7xq3oMvx/5dA9YT/JaGrLvw+FBzfqia/
	cprAImYhTLMOoDfjQhjJT2GyiCfiSqspR/nfUM5Qqm
X-Received: by 2002:a05:6a00:1405:b0:846:de21:3da4 with SMTP id d2e1a72fcca58-86168e8abc9mr1372947b3a.3.1788465516635;
        Thu, 03 Sep 2026 12:58:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8614e59f912sm212227b3a.2.2026.09.03.12.58.36
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:58:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ec3146553so52617285a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 12:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788465515; x=1789070315; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=khFuOBkB1vjsFgU/yUzBAHiABtuKryqUSfIss3DInIA=;
        b=cHu0MFK3swejFFRbuX/yH8pPquCajCVNV5aTlqi4YcreYX/Hj4nBNNXcsU0FEc9wZl
         SRtg2i/vsJBj0mtkrhaEcEp4tBllKlfQ1yBlbiu+YduDhC3HTrXtKrB3MWHeEfwKzR4J
         y2BMSRjI6FLxhCK/xyqbxXlqEG1iU604YC2N4=
X-Forwarded-Encrypted: i=1; AKwUvBzDlP8e9a5OnSCwUyqLopwIZSOLv7dnmeDNufQpyU2FYnHjbYuqp75fKoYehV2eV+S/u/3cCMpYhrMxQPsulBUB@lists.infradead.org
X-Received: by 2002:a05:620a:450a:b0:92e:8310:7369 with SMTP id af79cd13be357-93980729fd5mr85821285a.37.1788465515164;
        Thu, 03 Sep 2026 12:58:35 -0700 (PDT)
X-Received: by 2002:a05:620a:450a:b0:92e:8310:7369 with SMTP id af79cd13be357-93980729fd5mr85815785a.37.1788465514680;
        Thu, 03 Sep 2026 12:58:34 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fbb70f1sm45535685a.40.2026.09.03.12.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:58:33 -0700 (PDT)
Message-ID: <2c71e79e-af7e-46a8-ba2f-4a89bd68a91f@broadcom.com>
Date: Thu, 3 Sep 2026 12:58:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: BCM5301X: AC68U: set WAN MAC from nvram
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
References: <20260805190156.6942-1-rosenp@gmail.com>
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
In-Reply-To: <20260805190156.6942-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_125837_685217_6083D839 
X-CRM114-Status: GOOD (  10.26  )
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

On 8/5/26 12:01, Rosen Penev wrote:
> The WAN MAC is offset by 1. Set in dts to avoid having to handle this in
> userspace.
> 
> nvram size found from a random bootlog online.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

You are doing two things here:

- assign the MAC address from NVRAM
- declare the switch ports along with their label

Please split this up in two separate patches, thank you.

Also, enabling port 5 is problematic, see this discussion:

https://lore.kernel.org/all/20260831085217.391-1-strst.gs@gmail.com/

This applies to all of the similar patches you submitted, therefore I 
won't repeat this feedback.
-- 
Florian

