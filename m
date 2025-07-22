Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E71C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 07:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJO3dbpw9xarIQaEJ3OwJFXXSeV8363U+Y3VHM5slF8=; b=mQmkUF/2RGCJDBOz/lcUn7QtUA
	1QsaUY5c2O2NeKJIULq7CrW9FE+UM/2s83yAREjoaXHL2S5y0VD0LS66IIfwvjkhNjyElpA9LDNIl
	LSEcHBVEg91doV6bNnp4roqTDQJkC2iWZE8xisLwYRITVZ3UDMciP7nqyplfJqQzPBPE0+yRj6we5
	d/FxsfwGf1mSppIZKZijMoiu8AjjZxuGb3/8EYYloNtWihDyLry7mZsZmux1cOnBCQ2feBhBMOMIY
	+tQ+fvI8D9aUXAVukOobQ4qI9XVzkU7RTFC10FYytF8XnPwl06KKUDr3DgsZXVFoj85xYFTLz+eHp
	XLI3U3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7Ld-00000001cYT-1XeZ;
	Tue, 22 Jul 2025 07:23:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7J3-00000001bSs-3CrN;
	Tue, 22 Jul 2025 07:20:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AD0B442C5;
	Tue, 22 Jul 2025 07:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DCEC4CEEB;
	Tue, 22 Jul 2025 07:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753168855;
	bh=D/qLVppq36iQHh/jp2D4snN5Gi/I9boTC8d0En/VQ04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N6pG3no2kAqQquA7w9b69deneG/36FsfavHaBYvNGIm3lVD03CaAgCDXdRzA8wRWv
	 5qh6qUQl6Gp8Qi4qqsV36PknfEzyep2mKfDApKokMu2a3duVYXyxaPRLVdWpX/z5HY
	 QWWtU/Xv2i3zBR88ffu0zcoi+eEF6uGEhXzq8Rh+8pelp0LKBestNFeqz48KC0CZWQ
	 0kBYUgN+A2R9vaxVE1EUstl+qDs9o8blklrMsD8GI6Sw5g1JFxmtQqI2VQ78ZGmCED
	 mM+kgXfYSauiUabUTQf7eavEV9VF5enX/74FeW4UjP1GoqWWdvE1TQN7vKfCuZ1gbI
	 HKwIEku0RstoQ==
Date: Tue, 22 Jul 2025 09:20:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laura Nao <laura.nao@collabora.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org, 
	rui.zhang@intel.com, lukasz.luba@arm.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, arnd@arndb.de, colin.i.king@gmail.com, 
	u.kleine-koenig@baylibre.com, andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, 
	bchihi@baylibre.com, frank-w@public-files.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 1/9] dt-bindings: thermal: mediatek: Add LVTS thermal
 controller support for MT8196
Message-ID: <20250722-dynamic-truthful-mussel-9cdf1c@kuoka>
References: <20250721081459.16278-1-laura.nao@collabora.com>
 <20250721081459.16278-2-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250721081459.16278-2-laura.nao@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_002057_823458_E72F9D04 
X-CRM114-Status: UNSURE (   7.82  )
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

On Mon, Jul 21, 2025 at 10:14:51AM +0200, Laura Nao wrote:
> Add LVTS thermal controller binding for MediaTek MT8196.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  .../thermal/mediatek,lvts-thermal.yaml        |  2 ++
>  .../thermal/mediatek,lvts-thermal.h           | 26 +++++++++++++++++++
>  2 files changed, 28 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


