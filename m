Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B9CC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 21:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhQNshvCXIPkUBAiZ1HVr959ghqg7qmUVnDF+ft1oqo=; b=e53mska/q9al9r6RwQaSnFMFpY
	7PZo6Z+pU7RSM5gQQEas3L3uDYo5HxAHf5XJx62HII9WaviBl/1MmHb35+UI2cbeSsQGJSodf5T/N
	nJxDdQ7c13YfGkynSP39QRw6Kbipm3+wAPBUNtrEeau7/DXmoGd/jEX2gcOyo16Jq+IEjBjgeSjf1
	CIdgJCVWdRxVZ/M/38C/PclAZpGyU79v8FfLS0jzgl2z7MDZFb1d0rIY5/K/BRE7OPDGTj/YZHszC
	zkmb0Z3Gq2lgAMgyegQyBdVkbfSytUe6Fqx30+447G9ywZGkDj5N0o+oxY7Qe/tisHTp4K7VQMAQJ
	YDVo21rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6z2f-00000005EZf-3QVG;
	Mon, 21 Apr 2025 21:51:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6yrs-00000005CRd-2sCw;
	Mon, 21 Apr 2025 21:39:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DA300A4BDEC;
	Mon, 21 Apr 2025 21:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C098C4CEE4;
	Mon, 21 Apr 2025 21:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745271595;
	bh=T3GkSIIQ85SqUH3WTbvVEGRU5qdWavvOZ0ZLlcEvrUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iU9s9Bcfqu3uHIwjgQ0eNghHcyH1y1w0r93nVf1yUypGDtnIszxb5sUUpL6YBG73p
	 xpBKhoEeP8gERBAzbUpvIW+gRMVaDGFqed+xeViaRjmjDNPy3LmofJpLYZv3PvXDdb
	 twnjyuAunL+0wGt2l2RIGceTCenSnhLa22QS0PdOY+x4+fe6mCJk+ypueyWVjyFnau
	 XhHNWzIaiKvI5tH9hzAbuQtJ53/fjD1acdFPx5FanpzY2XAHegyICHR4XDtcisoAeY
	 Udir0Otptffb9eLkTbuJZKN4f9kooMyXrjACE4girwIFhAHSQbFiAU0zk6HJKGkNcw
	 LHt0OkMRI1Hrg==
Date: Mon, 21 Apr 2025 16:39:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	linux-mediatek@lists.infradead.org, qii.wang@mediatek.com,
	matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, krzk+dt@kernel.org,
	andi.shyti@kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: i2c-mt65xx: Add MediaTek Dimensity
 1200 MT6893
Message-ID: <174527159303.2974989.13770361241529717897.robh@kernel.org>
References: <20250416120303.148017-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120303.148017-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_143956_790689_3B4A4695 
X-CRM114-Status: UNSURE (   9.21  )
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


On Wed, 16 Apr 2025 14:03:03 +0200, AngeloGioacchino Del Regno wrote:
> Add support for the MediaTek Dimensity 1200 (MT6893) SoC; this
> chip's multiple I2C controller instances are fully compatible
> with the ones found in the MT8192 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


