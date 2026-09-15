Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2360DC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3n8Dt8JvPMMO8BuW7lqztk2z8qFFdCmvnz/BIiU4i4=; b=zhe+7Pr0mkmOvxNVIr1CM6LL6W
	/CoplvhAaW1sQqtrkpwUiSY0Nk97ToEQ2lFMZfOzkcVw3o7S8CvRDMzuKLyxUqFBGTFFDWih3qCO4
	cwop3DwJ8PQhqV8tiGgfp1vx24jIT2tOlOdQ6C7AZhZP2hZBRUsWiAqiIJTM4gDOkqFF6RByJKVpS
	nitdfni6HovZlvjdMFYnLILY434GjolHTRX13QN+RQwk43slwgIdOTyx8A0esIGOm31hjyYrOlqK1
	FB5gQA5P+XbRTQZKR0d9r4Y1hhGV6pMGXEe2skeQegnJW1e8WRvohhQ7rN2ekhtTcXo3MlWm5jyKP
	RFICpcUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qbd-00000005x9H-00u6;
	Tue, 15 Sep 2026 10:41:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qbb-00000005x8s-1WgI;
	Tue, 15 Sep 2026 10:41:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A088D6025F;
	Tue, 15 Sep 2026 10:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0341F000FF;
	Tue, 15 Sep 2026 10:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789468898;
	bh=Z3n8Dt8JvPMMO8BuW7lqztk2z8qFFdCmvnz/BIiU4i4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iU6AAjkPFj9Hj++Naq1Vg/Iw8Lq0NmiMSmqpadRnNFRqDno/tlBiPYKNOi6mQZUKF
	 7sc+8uED3EnNp5wG1Fjn1tgFv6dVwfhqA8TJUqTSh2XVViQlfsnH9rVTYuiFx4uIE6
	 CBzEIt+hSSsEGhZmHVinPX1QbgTqvxKFBKbnNDgCwejNbO5zEbjiFSYXLCeIBx3/6s
	 CsU+T9SsU6C9iogqZ53Fjlb842ByauU7ePGPT0OdagNK6mCPFEbU+bRFeNgKmZDiD0
	 c92vmfgMn/IMVRknXNXzN8DXVl25iAOO9t93mWY++KsrfKlNGUFXpF466DWAGjvQ0h
	 nrLic9XxcCmnw==
Date: Tue, 15 Sep 2026 12:41:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>, 
	Alexey Minnekhanov <alexeymin@minlexx.ru>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: panel: Add Novatek NT51021
Message-ID: <20260915-determined-nondescript-hedgehog-fcda08@quoll>
References: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
 <20260913-qcom-novatek-nt51021-panels-v3-1-266bc5d7e8c9@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260913-qcom-novatek-nt51021-panels-v3-1-266bc5d7e8c9@mainlining.org>
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

On Sun, Sep 13, 2026 at 05:50:16PM +0300, Nickolay Goppen wrote:
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +  - avdd-supply
> +  - havdd-supply
> +  - reset-gpios
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |+

Drop +, not needed.

With this fixed and without fake tag applied here and to maintainers
update:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


