Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC53CCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/99BtUSJCpMpbGC57bGg7MI/Qo99HWfOutRr1kcbc54=; b=yPtSHX4W8jZ0iAHqCq7aIzG1Nh
	rEvR5OF5oaSjolm1dYnW+gNOkr498HbMVysQin8XYWQkDg+YWXo2ItHg5G3KHCETSLjyUf3NQKYTt
	SwvPPIXsY7A9grhiy2PWmRnZnaL+n5aSMLnN4EXmjDe3qZxb6Om1FgWNHb8LgC1/f1WQY17teK666
	mXvU9I9ba3IdWTVdhvZA07+15SYm/r0LGRf8BbV1H5+XbXePxBP89aO4XILu09aJnKasfYxz4lvvj
	wmKxwprFFynG5rSqrPBPwA2OkoSQO8vGx+N+0lFCLuGlJQAUoSZSqMO5dcvjCcc90Tbz65Vwrf/WR
	0cFSiaMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPOG-00000003uJo-48Gl;
	Thu, 30 Oct 2025 09:56:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPOE-00000003uIe-0vEv;
	Thu, 30 Oct 2025 09:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761818174;
	bh=WvybbrxQC7xpFEbmIAT4BCpykfs8com5ayDGPmW+4Gg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aepXyd1+E9wjCTbPm8FjKmWX5cbmUEfZepgfuu7m775MvfyKGxj5t3biFLJUhBsaP
	 BlI4hnGsGmz4KBUC2HL5oKkQdZgI80XiqUTVVTk8CRCx54/5I1BeQXWmMDDBau+02m
	 QmkULgfO2DIAZVmbphGwIjQZilrt9wRtNPbvAqowH/OTrzp7nodJoPfXSPMqNkq73N
	 fTbFNqTSrs4CxUR4KcBDsmGWAufjQjENajbIPzujuECyCrh8/HoXJbfYVW+qFLB4XZ
	 XlPMGEpyj2iHq8znx1U0t0XUbg4Tth0mgzYkzoGUZlLdrRMNHzANo4PzvSk5KMK7UY
	 On9+nctzT84TA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 289EC17E009B;
	Thu, 30 Oct 2025 10:56:14 +0100 (CET)
Message-ID: <51705227-9172-47db-a9b3-3c8ea3fa5338@collabora.com>
Date: Thu, 30 Oct 2025 10:56:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible
 for MT8189 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251030-mt8189-dt-bindings-wdt-v1-1-975971ba29e5@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251030-mt8189-dt-bindings-wdt-v1-1-975971ba29e5@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_025618_448627_2BD2DFD1 
X-CRM114-Status: UNSURE (   7.31  )
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

Il 30/10/25 08:40, Louis-Alexis Eyraud ha scritto:
> Add compatible string for the watchdog block on MT8189 SoC, which is
> compatible with the one used on MT6589.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



