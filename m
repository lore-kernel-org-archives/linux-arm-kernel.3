Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D08C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 10:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJdIMmnpov6Cm0CDabiA7dqWzHI+BqBdHCkb0Wx0GVU=; b=exSXeM07hRRVzvpSEWpQTFkStD
	CKVvuOapoGY1OX9KdsLbj+d02iF8N+oi5EHCOm3hSOZSfQstkJzVUaNi26Mn89L99JSbXK1brRAd6
	Ganv4W9zx5QfoVvGUDX+vwDxDOkZ6HMJCnVVhhYtXEhr2hRGGQ7dvE6IhziL0ay00LmtKAz97mRMX
	wMUdhiXR6CWYIdXTaHDydEnl4BNFbI2tvuYdKBlSbXw2zpyU6E/AdHRlON0iJLlbJc2mSQZ/tTRFv
	39p0FBXNe61nXFZ9hgVjpQb4QOVF3wZMOHM6VTeWZuV6GOO+sRaZXG4meygSZ6keCSke6j9is5jHH
	T0Uxq9pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0I39-00000008bmZ-3PlI;
	Thu, 03 Apr 2025 10:43:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Hkx-00000008Z7k-1l1W;
	Thu, 03 Apr 2025 10:25:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743675906;
	bh=5ZlumXE4eA6n9IKFNUtNELbrczkDxiyZ7QspXaMiG2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q1uxrldsJCjCKJPZ9kpcpfnYcwsfTox+YRnygYOGSPmROHyNP8kSWftO68mMg0O1r
	 HzgkM3WaTrZwSem2eQmHef/Wp1LK70x40UpliHjObtV0jnA7meaJ3BG5rg+luAqGoe
	 +YSzvlaavhc89XYxQvIJ6TYG6VrQhMTKnN35+5SUZcOLjzmoTgPtEGBSdWplSubNpc
	 i3HEl9WMLVUPtxMDPL5hvEHcubHl1WNnMEeAvJlZ1Umz3zl30ClojdKAkENT9kd0GU
	 d3jyFRw0YYKNwkRJ8hBUgNOpjX7CEn2kf4tApGDDbF2wXr+xs3IFpuoBWnL38z/lpB
	 HNs3TFcZYYvDg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C7EA17E0B0B;
	Thu,  3 Apr 2025 12:25:05 +0200 (CEST)
Message-ID: <d6f5568e-82fe-4e89-9943-0c63df4248db@collabora.com>
Date: Thu, 3 Apr 2025 12:25:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Fix pcie
 pinctrl dtbs_check error
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250403-mt8390-genio-common-fix-pcie-dtbs-check-error-v1-1-70d11fc1482e@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250403-mt8390-genio-common-fix-pcie-dtbs-check-error-v1-1-70d11fc1482e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_032507_612057_EC25F7BE 
X-CRM114-Status: UNSURE (   6.75  )
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

Il 03/04/25 10:05, Louis-Alexis Eyraud ha scritto:
> Rename pcie pinctrl definition to fix the following dtbs_check error
> for mt8370-genio-510-evk and mt8390-genio-700-evk devicetree files:
> ```
> pinctrl@10005000: 'pcie-default' does not match any of the regexes:
>    '-pins$', 'pinctrl-[0-9]+'
> ```
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



