Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCC1C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 21:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAD7zwQqN+OPa92RBnAFe2Ct2f8yZB8iRkC4rSgwxKA=; b=RtW7ZN9DiCqCxKGdeQP7WtmEg5
	XXWLzqTfVd9Wg+a55Eo6dhhlmTVD7mlTc/uSeMcZRJk8zToXHSM61Mpzr9Lfag8oQYL9ytd5XKqAV
	T/f6C8sLc/RGpbgj41hRf6yHlloaKUBoNDHYlAGQa4Asv7Se4ybkzVEVuFxENjzwQ8R5CkNGFsB9g
	g/MzlcAyV/vGm3rflEVpHN5oP+7QF9AcXiQvmbkdQIqk8sIF5EMV+lUaEx8/F2FRXgjrasNzPDfXw
	xHEsgs+5qjv2lFdNm0DZjTBSYJKbJ6P6Z598eSk2z9Y0mOybWLi9eaIkaFNYzw6xl5m/5WkrHafg+
	rsqtDHMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qgN-0000000CC16-2cBp;
	Thu, 24 Sep 2026 21:08:43 +0000
Received: from mail-qk1-x768.google.com ([2607:f8b0:4864:20::768])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qgK-0000000CC0M-2Xj1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 21:08:42 +0000
Received: by mail-qk1-x768.google.com with SMTP id af79cd13be357-939ebaf1956so5148085a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 14:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284118; x=1790888918;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UAD7zwQqN+OPa92RBnAFe2Ct2f8yZB8iRkC4rSgwxKA=;
        b=fi7wh4JQHTQJ2PsAzJ8N8vH1c2FxZsC59j6Pcw1bZhSPexT5mCXtd5ptE5enmIxYDl
         AGMt8ny8Mrzio6uOFcHePEzkIvVEZ8SMfH82/in78UXbRdQsNfPyCAm8axQTiLOJWsH0
         9Fny8gxi7oLIkCKp47s7XJs6wr5AIv7BkJw8fVB4+iwZlc9DrqFFkaGC9AZsIGEprOEv
         HjaEN4DNzvnRNTyrlo1Z36IwUVX7RZ+8oJt9F4X5RE2DqfGezYOwoYHwYpf/Kj2+pHBk
         vCC+ZRfAPGXPDqmU3ZqE9HeslK7OgWI9CdNV1XU338wDDHv1uY0y8etb90d6g0swFLuB
         ld6A==
X-Forwarded-Encrypted: i=1; AKwUvByJl6NvYrkdioXhY4Qs2gJpAAPVYLdDPcyLAR9DNMB1IQUkp4nxKK0luO3yMLk32aDFCmvHUxhSnwRkkVcU7h5Y@lists.infradead.org
X-Gm-Message-State: AFuF++kPxh8Whmyv6Bg657IAHXpeJGzMZ5g8/slzpUsFzTAKY12cqwfz
	kzYNpG56LzlUYxVf72cI3pNDAUMA+nSFRg4mWppGUMVNuJocsEHWd2u0+hfjdFdjaoF8S+2s7AL
	7vbfUIPesmOPgJyoaR9yQHqD8XOXhr+n3BuUS9nO4AfbMtpWrQl4a323GwTcQy+dM7EZflP5tbO
	/brpzutya89UZCDttfNgYgwp75A1lPElO0Vie90VDjCTpLEU0ia4xgkjJEtkEIifS2LeuSTBhn7
	vd++chCRzavcArvREIJnW8WdQjSfpYeaaD+hQ==
X-Gm-Gg: AYBFou3DItnGdu0o90Y0t8rULvt6A4RlTOM0rGdNAIlKoHhOz9OoX0lw07xUIuwukhC
	FBN+lRBsKh2nnkVSPtRMS9+WOGRY4TT306ApR0Ep0patD+ZODv0VWu9lSfxjQSeJ5RKqqz8adHw
	NBVtPrGZvUDBXENHXcaPqbqHjmhKQyoW21lxK9T0YHAvcVh3DfHnzALignG/EyDlPMZMWVjEbi1
	ygiDrLcKolbrKdO7ARKOFbHyRyYtGLCHdcLz5r+4pgqO8XmenD0kaRRvpBiREN1DZI7/Yh4IaxS
	EG+E+yqFi/UlT+nk5myR71AwIjLywRi8sLfFHibXxg42FFw47UboxzAVJ3IervgJHWfOGneSWDv
	KO6NnPsOdf9F94w4Pkwr8QiScatAYiby20jrbtld51negGz3oWoOmfFfn8P35hNzU1lIIlGmB+Q
	SksOIuoUeN6E2+/ZlgW0WJDzrubr2KMXcSqDk6jxu2pIM=
X-Received: by 2002:a05:620a:19a8:b0:939:a199:45b4 with SMTP id af79cd13be357-93c43cd3c45mr104272985a.39.1790284118082;
        Thu, 24 Sep 2026 14:08:38 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93c448b0cd3sm10048285a.4.2026.09.24.14.08.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Sep 2026 14:08:38 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c26012cd0so6653991cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 14:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790284116; x=1790888916; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UAD7zwQqN+OPa92RBnAFe2Ct2f8yZB8iRkC4rSgwxKA=;
        b=FFbqsf/GyMHIas6ojiG0DuYAgp+UA17mZHgNJKBC6Vz6TjqoJhNSJYx8Q3yj9Hr9NT
         JKUGTvZnR8KrnuGwB5L8qlJtcT0jENc/WMjzsH/cTf008SEWsrk+JtMHrADg3bUeC8Zj
         4axUJQxovdzrNheaDBppLGEgh1u/9Dj5EsVN8=
X-Forwarded-Encrypted: i=1; AKwUvBwUSXtxK4+Q+GHhp5gGADzRG5jtYeCp7ayqPOq6SXAMGFYM79uqyAPV/AfYCi2/hmAmq9e/I/6Kx0l49IVI3tVh@lists.infradead.org
X-Received: by 2002:a05:622a:5814:b0:532:e568:7edd with SMTP id d75a77b69052e-5330b6cbdc5mr8966801cf.55.1790284116633;
        Thu, 24 Sep 2026 14:08:36 -0700 (PDT)
X-Received: by 2002:a05:622a:5814:b0:532:e568:7edd with SMTP id d75a77b69052e-5330b6cbdc5mr8966321cf.55.1790284116200;
        Thu, 24 Sep 2026 14:08:36 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5330c0a4084sm2150791cf.23.2026.09.24.14.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 14:08:34 -0700 (PDT)
Message-ID: <ff78ffe0-aa86-4679-a983-12d393a0cd7b@broadcom.com>
Date: Thu, 24 Sep 2026 14:08:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Add support for Broadcom BCM2712 IOMMU driver
 (Raspberry Pi 5)
To: Daniel Drake <dan@reactivated.net>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 nick.hollinghurst@raspberrypi.com, james.quinlan@broadcom.com,
 Jason Gunthorpe <jgg@ziepe.ca>
References: <20260825-bcm2712-iommu-submit-v3-0-7f143e7289b6@reactivated.net>
 <arUJxhEDFYSIUp4e@8bytes.org>
 <19ebea19-c7a6-4135-8abb-1f139ce1f74f@reactivated.net>
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
In-Reply-To: <19ebea19-c7a6-4135-8abb-1f139ce1f74f@reactivated.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_140840_717651_CA47D8E3 
X-CRM114-Status: GOOD (  14.61  )
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

On 9/24/26 14:02, Daniel Drake wrote:
> On 24/09/2026 12:30, Joerg Roedel (AMD) wrote:
>> On Tue, Aug 25, 2026 at 09:56:03PM +0100, Daniel Drake wrote:
>>> Daniel Drake (5):
>>>        iommu_pt: Fix test_pgsize_boundary() failure on narrow-OA formats
>>>        dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
>>>        iommu/generic_pt: Add Broadcom BCM2712 page table format
>>>        iommu: Add Broadcom BCM2712 IOMMU driver
>>>        arm64: dts: broadcom: bcm2712: Add GPU IOMMU and IOMMU cache 
>>> nodes
>>
>> Applied, thanks.
> 
> 
> I'm assuming you didn't apply the v3 version of the series, since that's 
> an old submission and you also just acknowledged my plan to send a v6:
> https://lore.kernel.org/all/arT-U_Rp0ZFMyCD7@8bytes.org/
> 
> I'll go ahead with v6 submission now, but let me know if you prefer to 
> handle this another way.
> Daniel
> 

Joerg, did you also want to take the DTS patch through your tree? I 
would prefer to carry it via the Broadcom ARM SoC tree to minimize 
conflicts on my side. Thanks
-- 
Florian

