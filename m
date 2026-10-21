Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60866606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 17:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pzmW3CnQ;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RF3YvWkB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hOuabnxLm0beCp1h5BHdKuYcbUneAYJ9aWN1l0DLgQ=; b=pzmW3CnQDbRBL8ld34xbWUoSCa
	B/b2qsH8HBT4xYf5wKSX5JSsgutJ174WEdvuMltVZt+CmI45a9+tkhW3N3eGKTbycyHsqgyAWStrw
	ahMEkd9iWOC6KMgj1RRZ7AMOyWGN2BrhRNkGo8IusJO9APsN9S4OW9W++tG6px6+X6Pfi18rp7b6V
	d3zvdF39hIwM391MM7UE3VSZdRrjm3rAsWChHITSFNFoeDrvAEb1bTlsza/OzBs9mQ+cpvQ853qKk
	qHmK/GSGxC7UlPGAoKJuaVQLYnGyGjoK8xNhXI4xdhEN9fxpeKBIGp3LybUUrOFBiKueVDZ7wnvde
	0tJxcLnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZi2-0000000CVRR-2Nck;
	Wed, 21 Oct 2026 17:02:38 +0000
Received: from mail-pj1-x1064.google.com ([2607:f8b0:4864:20::1064])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZi0-0000000CVQk-0Xzy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 17:02:37 +0000
Received: by mail-pj1-x1064.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so801697a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 10:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602155; x=1793206955;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8hOuabnxLm0beCp1h5BHdKuYcbUneAYJ9aWN1l0DLgQ=;
        b=qoDyfiN0TR79Hn7NDS1MTJZsrJJeagIJsFeXOzaTMgaYhnO8xlnDUgbGZ3yCr/rEBj
         vhDO2HFHQk8QloC63IG820rlNqAmsRGKkk0It7ZaArp/XsyyFGOyqc3Xn2eI/aCVhpVP
         sY0qsiYv27Fyv/KrVf/gHymOXooLPJO5Zy2rJvYJUbxYES891rYUkm/ak54aPoJTtpqz
         jni2dxBSZiy5HUmF285I7qVQ6sHpMzipmttrdhUCxPF51oYVvE/5R2NyZA1B6KaMkzsJ
         G0Af7y23EKGn2sAlhzFslWvv8RDn0+fgIMAyiBxBZ7AEiAtgIzLlaS/NokXW3VcncqA/
         nPbQ==
X-Gm-Message-State: AFq9FYJ32diDkcyedc3ZHra8/XfjbndxTONSHu3uc2yf5gWp2rZpMcP/
	ylxX9F/RiO0ExP7ROhyZqt64L0gG1/nQn2bQ4h12grw4fIlW1FtaZpIr+s41lRhYVop1PofcroB
	rQWqVjwS7sEHw0tHXObPYs03dzyF+/hOXHWyoflmkTwTlkGo1xmUyfZ/W82zkH6fGtzXsMpcUcl
	zl7O6jPwYvaGcZPj+DHR8ibmvEuEAaSvXIElgGbE0kn5iKF1FO04qiNZsOGR5AcrL1WeUh6QA/0
	NVCfvAHVoQ82MEwPcjuE/eN0t+fkIxCfIA=
X-Gm-Gg: AYBFou1eHRjgN8VBikYjly3EZNuM3Sl7j6Pn+9N/U4WjVlIpq8IR/bpo4uIw8e+Vc1w
	N4UTmoEx+RGWgpSQf+qRdHEIuSAIGoxNUMbSMLdVkh/wmYrQz0OPVmYKodRa1QHsZmHWOLM+zS4
	K/fwywa88Sm87RDoBISMpisP3AzddCPQ7XjQ4dSbQyJK1dQpUiZ+eanK6ltR74B46V7I8cFEjUu
	pziiK1YmREqFGGHlnIRMlpblM+4mqGFH6j2unOCKcCtMwRToDzJ2W8AerctteFxKzd5JlUXsaVS
	TjCUrny8gV5opS84+pLzEeHwqa8vPnrbQ+OyrljVxK8+yDC0uLH2KvBo6TLrsX5aqaaQihw7ZcT
	CpDP+yp2/mqmfgr4I8hxXWQZuWfV+lzl16AMtJpaIhA4QDA/AYRVxb0jFl1SPRJ9/Ogud9T1xI5
	av/izKY8BbNabf/qFuvPPZ7KfISeIozpgYwKJnhIuY
X-Received: by 2002:a17:90b:2805:b0:3ac:97bc:4c7b with SMTP id 98e67ed59e1d1-3ad86f44843mr2254428a91.14.1792602154516;
        Wed, 21 Oct 2026 10:02:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ad85f76161sm784899a91.4.2026.10.21.10.02.33
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Oct 2026 10:02:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad7030e886so1117833a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 10:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792602152; x=1793206952; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8hOuabnxLm0beCp1h5BHdKuYcbUneAYJ9aWN1l0DLgQ=;
        b=RF3YvWkBDlNRlKBhbFxCjg3o8EtHmHZezlvBJpy4TJAB3Izor+nJKifL0ZsqD96hmY
         oPJlZxD3JX6tCXhdOpuMsC0rvHdQG9o2qFXn25TOlAVsW32ZUwPt3myGiCHTJC3pW4gj
         yYN83sYP8m/NCkpc78qhnPtQQau4ujZ3jGJjE=
X-Received: by 2002:a17:90b:582d:b0:3a8:d71:5fda with SMTP id 98e67ed59e1d1-3ad870b2e7cmr2118636a91.63.1792602152341;
        Wed, 21 Oct 2026 10:02:32 -0700 (PDT)
X-Received: by 2002:a17:90b:582d:b0:3a8:d71:5fda with SMTP id 98e67ed59e1d1-3ad870b2e7cmr2118588a91.63.1792602151503;
        Wed, 21 Oct 2026 10:02:31 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4890c56sm333869a91.2.2026.10.21.10.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 10:02:29 -0700 (PDT)
Message-ID: <45bc44ff-664b-4a18-bdcc-bb812220e2e6@broadcom.com>
Date: Wed, 21 Oct 2026 10:02:26 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Fix SATA support for NSP SoCs
To: linux-arm-kernel@lists.infradead.org
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
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
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
References: <20261021165555.652102-1-florian.fainelli@broadcom.com>
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
In-Reply-To: <20261021165555.652102-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_100236_183652_96C82126 
X-CRM114-Status: GOOD (  17.84  )
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/21/26 09:55, Florian Fainelli wrote:
> This patch series fixes SATA on the Northstar Plus (BCM58xxx/8831x)
> which was broken due to a number of things:
> 
> - the SATA PHY assumed separate PCB windows when a shared one is used
>    for this generation of SoCs
> - the clock/reset (IDM) was not being configured by the driver which
>    meant that depending upon what the boot loader did, or did not, we
>    could have had the AHCI controller still in reset by then
> - on some reference boards, the AHCI controller is not DMA coherent,
>    assuming so leads to all sorts of timeouts, data corruption, etc.
> 
> Since this touches several subsystems: DT, PHY, AHCI and DTS, I would be
> keen on having Damien merge all of those via his tree if acceptable by
> the DT and PHY maintainers, I am OK either way for Broadcom SoC.

Argh, looks like I submitted patches 5 and 6 twice after I had 
re-ordered them, the correct order is in the cover letter:

ARM: dts: broadcom: Use noncoherent SATA DMA on BCM958625HR
ARM: dts: broadcom: Enable SATA on BCM958625HR

Will wait for feedback and resubmit if necessary. Thanks!
-- 
Florian

