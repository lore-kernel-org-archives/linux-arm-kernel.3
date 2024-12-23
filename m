Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F9EE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 11:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zhdstWoyqBwJGID/K6UTWUie++yFKLMRaYxYcOQUW0=; b=L0XbjDJ3YrlnrTDqU3641hlWDf
	Xm/IcVsdWPZg8g0vgMwEeqHzDe3BcFqEl1jAdBLes/fi65Lh0nNKvO02NLbViFgsLvDgbw0O7ImYb
	4f8bW+J/IP+31+7XllmgHWSSxeJLaxprBhAOk+EeUUkTd5owpJ5v+mYuyOZhVG9rDAHpf+WiCf2TR
	P+Nr6BFBZO/BYUpkHBRTXx/bFdmMJVG/fcxTeJnvGrRJfjk9zVEnGmUeZWNAwVCEtF8hc+Kr36C2u
	vBpjkX8dvmzdOz2+Xp01tTr2uu/UJXCnNty/4pfcscbvUm3o93aiTrSRBX1Y55CZ2HnPOsMaQ5USC
	JQqN3c6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgVu-00000009t6w-0TMy;
	Mon, 23 Dec 2024 11:22:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgMo-00000009rsC-0e3F;
	Mon, 23 Dec 2024 11:12:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734952372;
	bh=8EB61xX3VXXIycCwZZXBxODcQBwh+DUhjBmAxfgL0QQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qveWbVF2Jry1KkIWDjlhbJuQujpT0V6Vu2tkALDg6azdphIcp3yXMJdZ0N4LTFAAQ
	 LpJ8+u0sDXR90+H43upRLvcUbE2KE7g5HnjN/idfiHf0IkF93fRwFoGoYtgOI6mCzT
	 5NNEQbkDjH9aTJX0D9GhyoQuasfGmgdHQwenTwu9w3Kd8adhvjjMUsudStkkc8qH8c
	 py1DXGhgA64d2hEhGB8NBDe72Eptq2ym5k3zZOH9IQLiqgYK95uHA6rQEgBGm3afi6
	 zxQiWPssSxtCj0RBO9EUL0uuDt/hUkTogXtFZNreK0rCm13JM8/Sb5k29lDsXTY1z2
	 b61/X+StNP5oA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D393817E362F;
	Mon, 23 Dec 2024 12:12:51 +0100 (CET)
Message-ID: <6cbe2f57-a63e-4993-938c-7696a869dc2f@collabora.com>
Date: Mon, 23 Dec 2024 12:12:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: display: mediatek: ovl: Add
 compatible strings for MT8188 MDP3
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fei Shao <fshao@chromium.org>, Pin-yen Lin <treapking@chromium.org>
References: <20241219181531.4282-1-jason-jh.lin@mediatek.com>
 <20241219181531.4282-2-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241219181531.4282-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_031254_348228_06D746A4 
X-CRM114-Status: UNSURE (   6.29  )
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

Il 19/12/24 19:15, Jason-JH.Lin ha scritto:
> Add compatible strings for the MDP3 OVL hardware components in
> MediaTek's MT8188 SoC and it is compatible with the existing
> MT8195 MDP OVL components.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Waiting for an ack to take everything through the mediatek tree :-)

Cheers,
Angelo


