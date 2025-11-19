Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87046CF258C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 08:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QaSmBLtj9d6N/bgXjYQJX9wEhabWlwA+rn8pvnB09C8=; b=roD9WGPmau3oJPNyDbQ4k5do14
	fzG0MGigm8xEAkzt+MsTWTwDCIhsPnrs+hw3OOcL6wiH1TCrOSdYA7CYhNsRv9gjFH5sbGkt5Be4C
	echaoI7NDsDXlkCwibsC3+/fweANc/uBl5PRwTvQYcm1HRUwlboNit8cJvZg6yfMi5J5WfvoaNIF+
	F5RBGZMRdqZpa/Giaswi6nOnf2seOU8egzLpQ5V59EIK3DY0pMkEP6xcJ59wm8a1dRGO7zfktmTzq
	95VCYHVhI8rXqCgIx8CmJoGHVUaC69t0cqKxofEZy1nS1d5D1ArxTNjN0QHY70490XpewXMJNd3bc
	vWS01UHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdda-00000002ncR-02xN;
	Wed, 19 Nov 2025 08:34:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLddX-00000002nbU-2rZ8;
	Wed, 19 Nov 2025 08:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763541237;
	bh=1Pc5fBlhsZRdTIzwz2Wk8NOr8hOO9wcu82HCeysKRwk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=kjsTtw1PJuGX6Mv1xUUq6YRgSSs3tyKfWsV9SfMHkCQV11DsLeiF5Q1IlSWZFIOLs
	 6YRq74PzDdJTQNwRBujSx9zKpia9dAtzWgsr7jeT2f52844SwQX/y+l1/rwijtH9Qh
	 UvbuQN3vIe2CKVGeSlLiT5JZDz+LEFnYr3+azqh4KOE2K7gqlA1wnu+ZdaeuJ6YX0Y
	 Zr8epnbJMh2FlqeXhTp7IvEFA4Ukg+jsPVtV9eyg0smv3Bzeg4u/r9pJW6phmOnzQ+
	 9gJfhJB3fMF+gAPejSh8ROpDS2qSVNo/NgF96G6X8CRReXrTqxPB3xlm9JgFu/uVKV
	 FcGonuD9BQP7A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C2B3717E0154;
	Wed, 19 Nov 2025 09:33:56 +0100 (CET)
Message-ID: <bb84228f-2aab-4b82-b787-37fe631007e7@collabora.com>
Date: Wed, 19 Nov 2025 09:33:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] dt-bindings: soc: mediatek: dvfsrc: Add support for
 MT8196
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Henry Chen <henryc.chen@mediatek.com>,
 Georgi Djakov <djakov@kernel.org>, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org
References: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
 <20251114-mt8196-dvfsrc-v1-1-b956d4631468@collabora.com>
 <20251119-alluring-jellyfish-of-chaos-4f5bd8@kuoka>
 <39fba430-3841-4bf2-9fe7-44f372ff4a16@collabora.com>
Content-Language: en-US
In-Reply-To: <39fba430-3841-4bf2-9fe7-44f372ff4a16@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_003359_874249_ADE153EE 
X-CRM114-Status: UNSURE (   9.56  )
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

Il 19/11/25 09:32, AngeloGioacchino Del Regno ha scritto:
> Il 19/11/25 08:41, Krzysztof Kozlowski ha scritto:
>> On Fri, Nov 14, 2025 at 05:53:55PM +0100, Nicolas Frattaroli wrote:
>>> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>
>>> Add a compatible for the MediaTek MT8196 Chromebook SoC's
>>> DVFSRC hardware, introducing capability to communicate with it.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> Incomplete DCO chain.
>>
>> Best regards,
>> Krzysztof
>>
> 
> Eh yes, Nicolas forgot to add his SoC on all of my commits, whoops :-)

his SoC!??!?! Ugh. I meant SoB, and I should sleep more, lol

> 
> Cheers,
> Angelo


