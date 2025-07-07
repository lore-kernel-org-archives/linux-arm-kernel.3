Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B8EC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 05:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BlIKahVx3rBm1wC9uHNC8wv0C0VIEu4Gk7kXTTjb/e0=; b=K5c7g6lgvjp28o5bpxWwTvrlFq
	Ni9y6uhtNxRHfjJ99bElOu/m4jnpZnNHtfBcD5X00Jy3aOUJ8ITtZj7qTH/tXhNzyOLhYE8voEiLj
	HcYbTW/e/zDSbCXDwCoMAtU0mENeYbEsddy9X0rdwFpWgzZoKoRiPTgEo5vNenXR+MdVBjvrP/10I
	dY4QovaoQMzOCZAolS4nkMIVO4pqStPSAzfRvhL+ks6RDZfrGT1d9+9CcS1KusOb7xlcpnkDBkE+Q
	X2JTbf9+ga4m0tQrPBMlVoPEpJqypFpHrnf+z8a+yaNAsfWavOFcg2UhrcHpwJxxrigmo3JEBPPjQ
	tBLLPffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYeov-00000001UCs-2rOf;
	Mon, 07 Jul 2025 05:55:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYejr-00000001TkS-3mEo;
	Mon, 07 Jul 2025 05:50:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2F2D1A52C99;
	Mon,  7 Jul 2025 05:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4264AC4CEE3;
	Mon,  7 Jul 2025 05:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751867402;
	bh=H1uS+lRJDdIKeULrbOYxVDA++ia5TLO7SuOj0M3uK/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dIut4TWp53JwMnw9mex2FsExLGQGUavwebot/I3b/t4xvw0IIJk3dPFPV3CAF+0eq
	 /fWy9f3vAMXBRl4DZFFWTEuIWnztk0EYLXmHR3yWtFoTjDrL+EKH6KC5VKtTKLMm6T
	 HP7sP9REben2i/iLwmdN5Qt5BypVMEu1SN6VYzgZ1Dn+nTCNc06wbkdX5xi3iyD8wd
	 KVDuiaTyKjYQIfrZ9ag5OZ+5a13QrodgbuReDEqA61toH6f8R2zvMn++eQwxLnlfUu
	 UGa9GPrt5QIX3IBMjkFIrXeLdRFN093xAIhwUFsbAO6t32olgE2lR6y0d46f5wBZys
	 +9khuLgxKw+6w==
Date: Mon, 7 Jul 2025 07:50:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shangyao lin <shangyao.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 05/13] media: platform: mediatek: add isp_7x seninf
 unit
Message-ID: <20250707-lavender-peacock-of-patience-fdc712@krzk-bin>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-6-shangyao.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707013154.4055874-6-shangyao.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_225004_000296_30208DB5 
X-CRM114-Status: GOOD (  13.08  )
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

On Mon, Jul 07, 2025 at 09:31:46AM +0800, shangyao lin wrote:
> From: "shangyao.lin" <shangyao.lin@mediatek.com>

My most frequent comment last year to Mediatek. I even asked to come
with some internal procedure so you will not keep repating the same
mistake in author's name.

Any success?

> 
> Introduce support for the MediaTek sensor interface (seninf) in the SoC camera

...

> 
> ---
> 
> Note:
> The PHY operations have been refactored and separated from the seninf driver,
> but there are still some issues to confirm with reviewers in this v2 patch
> (dt-bindings: media: mediatek: add seninf-core binding). The PHY part will be
> moved to drivers/phy/mediatek/ in v3.
> 
> Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>

and here the same.

Best regards,
Krzysztof


