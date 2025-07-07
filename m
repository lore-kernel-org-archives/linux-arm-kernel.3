Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA64C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 05:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/j7NyuV/AK3q9Ia/DlforBWsL0uDc+k7QjS5jpN6BA=; b=L9vj0Q8qIAB59+1z1R9O9+WUIW
	MpRNdki+PTwfvypyUYwItnY3p5CsFkaIROt8VHV3+KuSNQ+/MJW8XkVd8x7ZGip7p2j/02hnSMlnR
	jAvKTzmnCIYknpghfH2j1WWWQckFCrw86aVKH23xIxfC2RyEoD2HUr7VARAAYTycW7gKrwVVXiEIu
	SrQnBHpIYpzxeoDOzXVWaXEtbNwKJb4sGpIU0zzOYAZgpvyilSOq3X8+bHk1iBX8G2fBFlCdOVIUD
	k4HvoOOc4EYM7aYzLXJEqJbiqoMXpFLyPcvhuo1QyHOhzJcjk6fLOGzuLzpJXeCK+Ri9EhKt5fLNq
	o5CWlGdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYei4-00000001TYz-1O5q;
	Mon, 07 Jul 2025 05:48:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYeen-00000001TCw-39C1;
	Mon, 07 Jul 2025 05:44:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CAFB36112D;
	Mon,  7 Jul 2025 05:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC0AC4CEF4;
	Mon,  7 Jul 2025 05:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751867088;
	bh=eu+GHjOCvCqVRqoV63kexKMOhEID9n+g92CJ/14sRIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qVvdJli/K1bLN5V7IZXJn+i7qVsLuHc04/BVVu7V5YFQuxNYCzJnanl9TJV2s4u4O
	 ZrYzzUNlEbYPm0iGu0leOc9FRhDw1RzZ2Y6QTKnld3ga1v9KY2GDAaTyTYJSTkHeMJ
	 9/5sMnr7/NfIVCuOUImcIEz2yItPERe5vrvxp6l+UPoNO6hbUu3po9+7pQSM5/H8jn
	 4jqrYKWakPv7gzCU0XmEon3BoGMGnE8P7Ek6epBomcO3UUGVX8Nw0TSz3Yowxp32xi
	 Wz9AIqm0PqpNKmKRUHwkmq7CDwGSve7eYuOwikbIAg+ux1ePKm0yvT7jTY6YnLAHyA
	 y1GFlrPylvORg==
Date: Mon, 7 Jul 2025 07:44:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shangyao lin <shangyao.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 02/13] dt-bindings: media: mediatek: add seninf-core
 binding
Message-ID: <20250707-merciful-electric-jerboa-bb5bae@krzk-bin>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-3-shangyao.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707013154.4055874-3-shangyao.lin@mediatek.com>
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

On Mon, Jul 07, 2025 at 09:31:43AM +0800, shangyao lin wrote:
> From: "shangyao.lin" <shangyao.lin@mediatek.com>
> 
> 1. Add camera isp7x module device document
> 

Still no SoB, still not tested, still no checkpatch...

and also:

...

> +
> +...
> \ No newline at end of file

Look, you have patch warnings. Review your patches before you post them.
You should reach internally to mediatek colleagues to explain you how
this process works. I really do not understand why mediatek has so poor
quality of work and cannot improve over last 1-2 years!

> -- 
> 2.18.0
> 

