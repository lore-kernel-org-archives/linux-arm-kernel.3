Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA79CA0EC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 08:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACQiy34NkYJw2kJjJ5R/Oqei2/18MROjJOp5VL4InbI=; b=lok7C5GJpG4KX139aPUhgtgPRE
	7RC7fLFLTWz7XccI1ec8JFasha8fR8iKTwLgEWn7pgIpDHxvarRD/TP2yA0o30/5LnF2m514XPrh8
	DrQ4jC1STkcPauWeXlf+8t1nmzTPwmxjtQzC6+2zBrb6vzbayXa1FHxbv/mhVvzIcdWzpQeC3Rt3I
	2gVNxHcONYUU8lX4lb6Ls5Tkz5CgpzMM0A3g4a0NEL5hV2VKlHqfGsi+jIgwpPx/CKTPhWnS5tsDD
	YBLBP1u4RGnwHliM7g4rnv9AGhnD1dlN0d7LxZhLzmexAJQs8t9odxJ/p+V8OVuFv8QNkWluC6RWT
	Pru79MUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNS3-00000006mWY-1L7N;
	Mon, 11 Aug 2025 08:00:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNHV-00000006klQ-2jsd;
	Mon, 11 Aug 2025 07:49:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C9BC4589B;
	Mon, 11 Aug 2025 07:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2564C4CEED;
	Mon, 11 Aug 2025 07:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754898561;
	bh=wJOiDdjpV92cFWsEgXBRyCwAM5FN5aB8jQmUBXkj4jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SuRdQsHppCCzKTz8G1v+Zj2MCmum7EcEc6lgQWOCiG32wxatxqFjzCls6lr/mdv6H
	 tMNmou2ayFVOa5KNgqj31IsU45YQmtPoPlFx6cY4uwWZHey/AsIECNWWr3UHXfu19u
	 RoJHqxtOzmeFibiyXsdhMs7jCWQXzqUDeff7WbOAuubn+REVI9gCJ3tZ0gQm2NOK2Q
	 Dq95ITr0zo/QZmKrzOn0I7bBrRaO9VUFQr7Zft3a/cj6w2ra5MykBnl9DxIPnRFcle
	 ayOycVi+BwfsYsdgXsXeeBAEPZJPqb8jtB/o9W93YiOCVWu9fpYGaxYVM3VPyuKtkI
	 XRbQAZ6Zomcfw==
Date: Mon, 11 Aug 2025 09:49:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jay Liu <jay.liu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/6] dt-bindings: display: mediatek: ccorr: Add
 support for MT8196
Message-ID: <20250811-brainy-impartial-emu-da8b46@kuoka>
References: <20250808125512.9788-1-jay.liu@mediatek.com>
 <20250808125512.9788-4-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250808125512.9788-4-jay.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_004921_714460_40A3AFE3 
X-CRM114-Status: GOOD (  11.15  )
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

On Fri, Aug 08, 2025 at 08:53:58PM +0800, Jay Liu wrote:
> Add a compatible string for the CCORR IP found in the MT8196 SoC.
> Each CCORR IP of this SoC is fully compatible with the ones found
> in MT8192.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml     | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


