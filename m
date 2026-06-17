Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70267CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 07:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBpoUxlFURwMzl39lkkX4tmx4aM2S2NACZ/n3dp5+so=; b=a/xWcq7z8uQQ5SF+c1FJ9/fe+8
	MaRgc935LN6uICCPhUjvhFhpkrC0QqDyFN0zzh1SmAGm8udUGGaiNs9GaNHng/WyY/vCW+DVE5bDQ
	4XakpjGK0+8YxrrGzuAoyIOPD5Q3v7QFZ7fAGfYeH4ZyE81UU/Z8vhKwYYGvpnB/ZQEEKfkzwywUe
	BOhmO9M1F/pZ4YvM0cA5gaNK7+deaH/srzOW7KroFVVsXpp2pJiOXes9BVA4cE673Udvt/IM4vIDi
	c0tM8MgQaA7fj6UmGvUOHfZskcmi6lDNukBgD5EODS9fVPG5dqZvfr/yRRluiPuBQlM7UHV8K8yWR
	P7XLrauw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkFx-0000000Gm0Q-2Hcv;
	Wed, 17 Jun 2026 07:00:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkFx-0000000Gm0C-0pFJ;
	Wed, 17 Jun 2026 07:00:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 23E0C600AB;
	Wed, 17 Jun 2026 07:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8631F00A3A;
	Wed, 17 Jun 2026 07:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781679611;
	bh=XBpoUxlFURwMzl39lkkX4tmx4aM2S2NACZ/n3dp5+so=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W5421pE+zesDptUzhst7HpNXtPpcGlPo/CiLMC/qhE8rYuSI/5U5sNi0I5eArizU0
	 QvPq4kaZk0RNSQ1jWAf3DhbbAHcSTsnYhjRXUJxqoqJdcPEekxE9yuL8uqHpfcmxrp
	 ZoVKs/bNRjW2nxQGhG1vy9geof5PQ/m1HL8eAFuuIqSZj9zex6hUnPkC00/uIg3f0Z
	 /VtC3/amaHyT/cu1heN1M44vFzjhgg4B7WXr6YxAQ8sfU+VG6SvhT2su7RF0K1+KP/
	 brpGHo9m+WoaRJKWcIrPW+NY2lIeKmfXhYaNbJdQ4LgT9SmJoe+KEHT5JTco6zyYSm
	 AKtQGmL+zh8uw==
Date: Wed, 17 Jun 2026 09:00:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4] ASoC: dt-bindings: mtk-btcvsd-snd: Convert to DT
 Schema
Message-ID: <20260617-fuzzy-lorikeet-of-joy-f6bd1e@quoll>
References: <20260615185810.11804-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260615185810.11804-1-l.scorcia@gmail.com>
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

On Mon, Jun 15, 2026 at 08:57:50PM +0200, Luca Leonardo Scorcia wrote:
> Convert the mtk-btcvsd-snd.txt DT binding to DT Schema format.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
> Changes in v4:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


