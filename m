Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A56606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 16:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ty5N2p82;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RCyQRZGX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GjQwvDz4mWIuZZ+lNXDjzqnPWz3b8NLeIsPBGcLEPHs=; b=ty5N2p824nyt2p
	inysx0tE3IbSEsaKvB0IOY1FyL1apUEY1f2Roi3O4ckYnJo6+PFrKw5XlS/bWPKi/cbj0voL8pYPP
	BoW1sd6uafI31UfC1OX+3myXGpO15OQ3l4gDa9JzGc39pbRgwKnxDUow0tZ4mdR4BHe/WFmP77APV
	BZGmfics1lTt6AGWx38Eu98/naLGU8wfWa/pak9hCYn6jIkThD5TOdu4kJ31d0nipycfDrG2Ky+qY
	WmxYg/OXMn1gZ1Hpt7laqEFJEQxXhMlC+CnF6ZZ7Qldb85+F8vb+Tu6wKr4R/gKEDScnoZ8rhHytW
	Tfc4kOEIGL61C0WdS7QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT6O-00000009oru-49Yo;
	Thu, 29 Oct 2026 16:35:44 +0000
Received: from mail-dy1-x1363.google.com ([2607:f8b0:4864:20::1363])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT6M-00000009oqh-17QW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 16:35:44 +0000
Received: by mail-dy1-x1363.google.com with SMTP id 5a478bee46e88-353804b591eso3603344eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291741; x=1793896541;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GjQwvDz4mWIuZZ+lNXDjzqnPWz3b8NLeIsPBGcLEPHs=;
        b=fA5ZJvWcXIo3LwgRWiconp+FepStTYSxcc7q4c7JotLxKyCv9IA+O3qYHh4juilKTn
         8i9r5C2xQIY7Z+6jnPr4a7YXtdFhuMxTExwoCJYFOQZ3qnU90fJYfHICYTd1ICAN64fL
         4SwG2hDL3reIk6jvO/nwyrxeqRMtCDYbTcpojXgXjqKmOCsxagAP6M9e/O9Bz4bIFlQS
         LW51kXIZKToAiDpATezSUnrooxMG6H+KMkfAFV3v74fpUQ4n5KPJToOAySsL5BJ6oNPn
         V6y2O8CvDu/+5aHmQjhNvXTVGZBNIFZZKY9nvSgEDtUSxV3ekAjNaPXdQkwbi4x42nIp
         vOMw==
X-Forwarded-Encrypted: i=1; AKwUvByXA7psndH9hlAUPUDZqcGcEGjjz7gFEBe9DdD0a7UJxAstPf0hRVyrSfybx7Vo3uTliFejJD+iRcOQ8CoU62zN@lists.infradead.org
X-Gm-Message-State: AFq9FYLRd2ZJjOz/dQ4yswgfeOf4H4sM4dOAHkVE6uqRD21d5SoOz1XU
	K7XhihItNiK3In29bkbhYaRqd6bsPlKOTjtEQlhoga+IHH6aTbWLQlcDIgNyRtstO7VC9/+Oiiw
	fAenZqX7ZnQa7Lteue4htqHphKVahrOubAKoYf0yM5bdSG24fHuuitf8MnKVV9BD3HMZ55X2Q0S
	Qckeh+P8r28gT+e2ai9cdgQPHVc31VpbcCuA7S/Izfl8/czQice6gIqMrgDFeYeoWJAsqwNCZBh
	BeBJuut85Cw/PW68KblDhS080hntJeZR7+q0A==
X-Gm-Gg: AYBFou3VIJNoQ/41an1rFZkP8Op6UzKbSNCl2Etolux2Gk52AKhaqTxqobaVH67fU8h
	u/IDgx1403y+23NBLCxmuBzddsEwba1laRJ7FTlEHQFZTGVPOm02fk5FdQ31UhWyyKj85XVvLd2
	7jqMvD3cWVlS+beY33G3NehQyuCIF2sJf9tGT9hk2Ju72cbeC6N2135XRAxRdQeewbaafbZ8CWb
	9uUGVTU+CBFSyxR4cFefwhrMntqyhtaiRxvXXYr3C8hJ8n0wrhQgLGlf2E4OldnJqXki3qzVnUL
	2jpuh+c6oHxCtb82Uje6KlVTkogdMBPoNxLhGKMJKaN1GcAm6Sv8wWZHXz+YWhMrUOw8BRe/ehy
	8XTR+09BtmBxp9rPMBep3DubyHmaGdbykWrPOCwThGnFPaozL6Xj6spCtM9hqeQkamMm6xgfzgP
	fvo3G8G6pydJmEyFXnFd+3ymRTkBnti63hL4Kc/e7X
X-Received: by 2002:a05:693c:83da:10b0:36a:1f:9b74 with SMTP id 5a478bee46e88-36a203bce76mr8792985eec.27.1793291740681;
        Thu, 29 Oct 2026 09:35:40 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-36a4139ef31sm1257eec.4.2026.10.29.09.35.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 09:35:40 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5376f1853bfso47709811cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793291739; x=1793896539; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjQwvDz4mWIuZZ+lNXDjzqnPWz3b8NLeIsPBGcLEPHs=;
        b=RCyQRZGX7fyryFDiLLUaSJcaldvel8az3ObbyFv/bnZFhNcHK1DwK1LKgKs48OwU4q
         9vsKzNR3JtfU2ya0LgqjhiLZikZkfLsyPaKabHNTs6mr6c7O52h4P8Aq7WAt9eRHK9Lr
         r5LvkiNm312eytkWSolXMHB7Ws5qAivOWtNhM=
X-Forwarded-Encrypted: i=1; AKwUvBz9nsOu0oip89j3gb9sbNITNnGvYkhoElU7IpSMep7U7nUdezw3VRRMJh4iX/VaEAbmI74OlRfUStt3jIdeTtY6@lists.infradead.org
X-Received: by 2002:ac8:59cb:0:b0:535:fc2d:b7c2 with SMTP id d75a77b69052e-53fcb7f9340mr101251931cf.33.1793291739313;
        Thu, 29 Oct 2026 09:35:39 -0700 (PDT)
X-Received: by 2002:ac8:59cb:0:b0:535:fc2d:b7c2 with SMTP id d75a77b69052e-53fcb7f9340mr101251311cf.33.1793291738724;
        Thu, 29 Oct 2026 09:35:38 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca31b46f3sm272576d6.45.2026.10.29.09.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 09:35:38 -0700 (PDT)
Message-ID: <cb6c4485-90c4-4ea2-8df8-4e1ccf47dbb1@broadcom.com>
Date: Thu, 29 Oct 2026 09:35:32 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] dt-bindings: ata: sata-brcm: Describe the NSP IDM
 registers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Tejun Heo <tj@kernel.org>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:BROADCOM IPROC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
References: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
 <20261026191618.3178830-3-florian.fainelli@broadcom.com>
 <20261029-versed-automatic-orangutan-43cfde@quoll>
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
In-Reply-To: <20261029-versed-automatic-orangutan-43cfde@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_093542_313425_EAFCF578 
X-CRM114-Status: GOOD (  11.68  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/29/26 01:09, Krzysztof Kozlowski wrote:
> On Mon, Oct 26, 2026 at 12:16:14PM -0700, Florian Fainelli wrote:
>> Northstar Plus uses the SATA IDM block to enable the interface clock and
>> deassert the core reset before accessing the controller registers.
> 
> And which compatible in the binding is "Northstar Plus"? I tried to map
> them to arm/bcm/brcm,nsp.yaml but nothing is there, so it looks like you
> are making changes without having actual compatible documented. In that
> case this is not needed. Make changes WITH documenting new compatible.

There is an existing compatible defined: brcm,bcm-nsp-ahci. NSP = North 
Star Plus.
-- 
Florian

