Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7437BC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 10:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IftDcBLEzSiQbgf2isdjm2z55VuW3CywyYeGy9hjvhU=; b=rK9cTSuZwfv80Lwu1ws+haKdxN
	QDu/vV3SbR1v6OPtoY8tohVtxoARpwarjDLu7ir0/sE0YKtbJldgXoNFSA5zZhYQgWaGb++qlhxpA
	1D1zZGefCkH8yWme9srWYyAE8ayCOpKvQdkyrUGBd5/hqG+43vSF5m79qiSi88Kv09XRH5FuHOc5h
	7agA1+AWNWrLeV7K6ur6iuv/5w4x916ue5rHvMhzdNXNdy2ojcdVoyXpOPD+zfTF9pTxNW8rK3S1c
	qMhSJDkJJAydcjrirIa4G2sKkF8gfpYMntvjOJLMFNnoZV+nsZrd1U2dA6yqJrfwQc7z4TAxojLsT
	em3p662A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dGj-00000005HlR-3L1u;
	Tue, 15 Apr 2025 10:11:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4d4P-00000005EvZ-3oaM;
	Tue, 15 Apr 2025 09:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744711148;
	bh=vymqsKww4x6vksA8VtZI/fKOGW2FY+7jrdaZBFUWKnU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TE82IOSvUEmzPXbMQJ2EoP851YmhYFzTC5zQPgwfF33E0+gAcUdGwbEJFP8OXBQXd
	 yGBZJI+CeWbXAgkEYhpr74oLj5KPjK9P9yvMRhfMaf7NFBcLdcaSI0au0WXYUNyaxQ
	 v3zkD7kVVnjWm858jX9dLieI0WPu87ky3ykYHWSrvWI5pDTdpGv10JBeFTOGRTMhUz
	 wnds/V/dmY+o/xfDll9c5NQHS5KAe1ylm/sdNZyjkdPPw6CvH6v3mCDLWvtiRZhO5n
	 KtRsNpdn2nGSJz4lF/HchbJd1h/rDGn1e7pwH5YkPuma+lXZWT49l/b4lRYYrIXW5V
	 UX1enncHHBECg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 53DF517E0FA7;
	Tue, 15 Apr 2025 11:59:07 +0200 (CEST)
Message-ID: <bbb81e79-95da-4cf9-9eef-7cbaea191ebb@collabora.com>
Date: Tue, 15 Apr 2025 11:59:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/5] dt-bindings: power: Add binding for MediaTek MT7988
 topmisc power controller
To: frank-w@public-files.de, Frank Wunderlich <linux@fw-web.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>, Sam Shih <sam.shih@mediatek.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250413085806.8544-1-linux@fw-web.de>
 <20250413085806.8544-4-linux@fw-web.de>
 <700af1ab-f43e-4583-8f0e-27e5d4424338@collabora.com>
 <2EA2BDB0-E1C9-49BC-98FC-5048905AA036@public-files.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2EA2BDB0-E1C9-49BC-98FC-5048905AA036@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_025910_133664_7A2B6041 
X-CRM114-Status: GOOD (  11.87  )
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

Il 15/04/25 11:52, Frank Wunderlich ha scritto:
> Hi Angelo,
> 
> Am 14. April 2025 12:25:23 MESZ schrieb AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>:
>> Il 13/04/25 10:58, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Topmisc is a systemcontroller used for xs-phy and ethernet on  mt7988.
>>> Add binding for it.
>>
>> That's the wrong binding... check mfd/syscon.yaml :-)
>>
>> P.S.: Is there any reset controller in topmisc? Any clock?
>>       If yes, syscon.yaml is also wrong, and you need a driver for that.
>>       Remember: If it turns out *later* that this has clk/resets and the
>>       bindings are already set for just a syscon, it's gonna be way harder!
>>
>> Cheers,
>> Angelo
> 
> Ok based on the power-domain-cells property i guessed powercontroller is the right place.

power-domain-cells, but without any power domain assignment, so that was wrong :)))

> 
> But based on your suggestion i tried moving compatible to syscon binding and made dtbs_check here.
> 
> I can confirm dropping the unexpected properties reported by syscon binding (power-domain-cells,clock-cells,adress-cells and size-cells) are not needed for function (xsphy and ethernet).
> 
> For verifying that there are really no clocks/resets in topmisc (have not found it in public available register documents) i asked mtk (waiting for answer).
> 
> Also got it working without the syscon compatible by changing ethernet driver too (after this change xsphy was also working).

Perfect, a bit of a cleanup and you're done, then!

Cheers!

> 
> Eth:
> https://github.com/frank-w/BPI-Router-Linux/commit/d866e648717800b6f6395ad36c38f9effcf0498d
> Xsphy:
> <https://github.com/frank-w/BPI-Router-Linux/commit/0121a94df99700487704ca056b210b13db07e90c>
> 
> regards Frank




