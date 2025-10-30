Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA2ACCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=veR2ZPjXGHVT6a029WF5CH/RPuTwghhJ3ZwLr/C6ZWE=; b=HczeOl2FZXOmgvebiUHJiC85B/
	FYiHw1t3/NhiqtMOvpqIytaSjX/OPnrX0Y1k0q6YHEMTXGqDzgDUzY5Sso3pgqXIK1Oo6cV2OKeXZ
	RKo5/cqbsGwMhw9elDHAo0u8qMit60mu78I+BwYhwN27bpgvvUN30jF3aeGDvj84eVX4h4DqtTNRb
	eIhoMbrBkuiXfs9W9fNSrTLRcVYsnhfZVCJ9ssZ9zJShCRU6p7YxwbVuVRp3Ul2Uh/hF6fzE9mmLH
	U5SSCrayK5pvqa1PVNNGQ8zE9ByZbyk35ugEgO0VFrFS2j2fVYXvL1yT6B7sdmO2iqhEiOHXvpFiJ
	fwGmtqrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOsV-00000003ql1-0334;
	Thu, 30 Oct 2025 09:23:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOsS-00000003qk4-0XXC;
	Thu, 30 Oct 2025 09:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761816206;
	bh=vfjU7SCgYDMFO30HAISoEJD4pRpKsAR7TJkNaxWJ9j4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JugtqFC+5sJwcESTnYce/Z9hW6PCkhUdr3OUrtCBQps7TwlulwSe1IHWdn9Kla0hL
	 Xvw13Ev+kh2D874lIhsYXZcvqGEHb4sOQik1PqoctefIN84BULFmuYNOlwfBMyybbr
	 eRL+D7rZPxYpWe6L/xP5q/2GSQbSy+tmZPIb242VU30IsRGFbgLqzLkLyLKP5Ru6u4
	 VeX5DNw6DLD+LuqgdVKjKuZTHyz+rY9pSK+rrZfqJgOXW3WtLECwXciQlPXKbZhQ7P
	 F766y3alxzRVMaPPMXl4C62E+TfXcvoDeff0jBJDGk2oMjYQjKbdSd+iMUlwWKNz5/
	 60aBeIjub63AA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 54EC717E13DE;
	Thu, 30 Oct 2025 10:23:25 +0100 (CET)
Message-ID: <95335943-9b63-40d5-89c0-6d616f811e59@collabora.com>
Date: Thu, 30 Oct 2025 10:23:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: iio: adc: Add compatible for MT8189 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: kernel@collabora.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251029-mt8189-dt-bindings-auxadc-v1-1-cd0496527a70@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251029-mt8189-dt-bindings-auxadc-v1-1-cd0496527a70@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_022328_325948_63D9014B 
X-CRM114-Status: UNSURE (   7.13  )
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

Il 29/10/25 15:52, Louis-Alexis Eyraud ha scritto:
> Add compatible string for MT8189 SoC.
> The AUXADC IP in this chip is fully compatible with the one found in
> MT8173 SoC.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



