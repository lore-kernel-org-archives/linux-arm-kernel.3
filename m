Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB0FCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3V6A5lDiavzZwLllD/c1kzY8BzxthpvBTQz20JmIds=; b=kiv2oSQf2+tZ0S1RbsatySzUxv
	y/UUyfACqWMyitAoqFtNSxVYAbaQywhVf983oj8plgMqEy88uZ6oSrR6Tuuz7zPmCVfUgkfUZ+DE3
	wZgBCITuAUqyuPLEJEKmi97AGV4Zdh4hwPFGgxhQb3PeMcmhDqZTyXnhZVcCNbrwVbYWmS5xhErEg
	j4XkugFxyD+69Bt/s9GxbNRISFXr5hjPIo/HKmBPeeaK/OR3E74+MaL/lTaPIZ9vw1PKrSRcixy40
	KSa/61krQHH/pFEtwiOpuEbHR+a+hYmgappGvf6JpV0ww3mS9L1M90exFzM0dbFKNHVMwg4EV9u3a
	njrY/Vpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNE8-0000000CzV2-0zmt;
	Mon, 11 May 2026 09:47:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNE6-0000000CzUZ-2I04;
	Mon, 11 May 2026 09:47:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B1F85600C3;
	Mon, 11 May 2026 09:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99EADC2BCB0;
	Mon, 11 May 2026 09:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778492821;
	bh=BNrk5xl69HBmuVU58US/4LQ9osluyk+emTVHe4tINHo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KwPjA9tVszv+OUAwQN1ulEdIgTWu3AHXQt9h9NAuldKp+C3KvVbtbcnnAMSTOQwdf
	 69JkGOXvMgQT6hHSLdtLtABhu5bVFl7WM5I7prPR7p05hIVpBfA5RRS5cC5N5bA5gy
	 HHkZSP05haKe3vHuLp0BMX07E9u5dKURbtzoa2mA/J4qOgDDmLQH0uKFiE7wzavtLt
	 KOfyqOKcDx4HCf8CCM6w2sUHF8tX91fL4tRHYHiogvxn8POBnYMlDyIn5bhMc2J21N
	 HRSGf+W6Gnqi75SlaiU/m9x9GWtIVmJEgB2beZPbFQIX7gK5QmGWn+WRLCLFDkamzc
	 a8IFouTzyU8lw==
Message-ID: <556b78d3-f353-4f0b-993b-d4566f55a9b1@kernel.org>
Date: Mon, 11 May 2026 11:46:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/mediatek: dsi: Add compatible for mt8167-dsi
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20260505214541.333657-1-l.scorcia@gmail.com>
 <20260505214541.333657-3-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
Content-Language: en-US
In-Reply-To: <20260505214541.333657-3-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 5/5/26 23:45, Luca Leonardo Scorcia wrote:
> The mt8167 DSI controller is fully compatible with the one found in
> mt2701. Unfortunately the device tree has a dedicated compatible for
> mt8167 since 2022 and it cannot be changed with a fallback nor removed at
> this point. The only way to get the device to work is to add the
> compatible to the driver.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

