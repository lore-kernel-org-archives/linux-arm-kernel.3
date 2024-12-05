Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D6AE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ew9eUrSmHvp+/BpUXzSJ/NJ5oQW5fmvHcrRu0748BzU=; b=GmQa/+dbk6RIcP4fzs7m3VNY8n
	MJheAAI2sElr4wUNBpU/4YcvzgqdGykJuMKvpvaztIXE6YzHox8R1EoMYzb+XRSyPtt4tzBS7LQYm
	BLkeA+nngclMdhMjEku0RGgWEecwK0JIqV0rEmoCRnl8gKF7/zgqqjBMDbY5In3ts6Ao4J5TogEpL
	Vy22fFxh0JvjuyxYenMPgfUU59Qsh8AguvrjXBCfr0bWyrAuOx54Io1sfZJEyuJ/pb2P7AZZ5fSZV
	JRrmgOAP1ybty+tnfwZKNc6hvonNTbMv+r49iBEHeRFEfuFAZD4FkICPghEWG7iMItTkZ4+yoa9m0
	euImJOiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBCR-0000000G00h-3WSs;
	Thu, 05 Dec 2024 12:43:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBAU-0000000FzXK-0ntP;
	Thu, 05 Dec 2024 12:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733402476;
	bh=TIUfoiuf+uk9O/2fQ/WEL3uhx1zcvF/y1gFWOs4F7Lg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SZClk9lKWFlqBzcgV7HZWrf9ptMFSkIisSZ9pw7Sz5PwO6SQRrDuNw6FJqe78t8YW
	 sIXBsr3hrVCkiOGW79y0gVN4SLsR1SQBPsQIVL7mMSbK8H1Omwb9LOvAidJFnnvV4g
	 NV4/ISnWgOLPPRRHU+DjBv2FVQMaXy4R3kFDkiM7rVU27tlJIu83KoW5xBRcSaV9B2
	 /ynOd+5zttIF38yEsWM9NCXQogZx9gxnAohu+DbxiaXmRpqG3SdwObpa1DNhJRZxKS
	 0CI1kCtumK+R6qJdPFP22CqPnXtsc4MEF2vdv+nOMU+lZsyFZ1AMCXjmtRc929UWcb
	 UvesEUB+deD9Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0928A17E369C;
	Thu,  5 Dec 2024 13:41:15 +0100 (CET)
Message-ID: <8290aaee-4ee6-43ec-9555-9a746e0db3a9@collabora.com>
Date: Thu, 5 Dec 2024 13:41:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add
 compatible for mt8390 evk
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org
References: <20241205-genio700-audio-output-v1-0-0e955c78c29e@collabora.com>
 <20241205-genio700-audio-output-v1-2-0e955c78c29e@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241205-genio700-audio-output-v1-2-0e955c78c29e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_044118_393257_751F0CC6 
X-CRM114-Status: UNSURE (   7.50  )
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

Il 05/12/24 13:13, Nícolas F. R. A. Prado ha scritto:
> Add a compatible for the MT8390 EVK. It is compatible with
> mediatek,mt8188-mt6359-evb so make that the fallback compatible.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



