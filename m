Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4376C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 07:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smWIbtcF5kjz7/1uYejyV++T3AJ8X5fqBmfLIQDrXWM=; b=UkwnUDPp4G8l1KCew69MZwFvl1
	nOKWZ2MZ9PSZDt/4EjbWvq+Ba/L9gotP22AVrAAtdhakqBNcxfygh+zd0mbaV6bwlFsshvGUCjXHJ
	6dB9ogAaUd3WG5IKdDGB9i+0kmWHMfirvrBGeOkV/y5l3yLtvH1HJoIa/x7eY9S5IR8/YtatAyShi
	y0UdXNid8FPD8x70ZQJlq7XKwwLTqtVJ6Im4OFuXGhP4m3ATY7UdsEMDkC/6mj0eNP7t103hJyOkw
	XD7jENpUNRtWzxnMhc4aRGvg8Z6xdvg5FzM4n3o1CbRXm/5U/Vtiiik81Ttbau5NYnWtp6B2NEIrJ
	z1zG2R9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2m4P-00000009UFm-3okp;
	Thu, 10 Apr 2025 07:11:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2laR-00000009OxL-2pVo;
	Thu, 10 Apr 2025 06:40:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5B774A498E9;
	Thu, 10 Apr 2025 06:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F84BC4CEDD;
	Thu, 10 Apr 2025 06:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744267230;
	bh=hIrIzISFokOzyuHO5ayNIza6AlGr5DkwM1e92dAAE2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ej1Zai1YttQ06yOc6v3zdnUZYvEFWXJrVClrHT1ZQummIb2GUBXGA1wB9ELRMN6Lz
	 mGRfCbth9VDTacPbP4RDiTG1wZQGu/gSVxdxS8mIgWLrGW08OF5yz3LHdUZcPzx+BE
	 6ye/x9HxOplyiqeQLEOY7Vml2MSxYqiJGJmCcDBrCHqaOo25kVuH7vrZAdobNwAQIl
	 oemdhfF5sN8erOUFTxwOvzMtPLz8GWy6/IwmclwIwftQUQieFj9P51c3crthoRV3nj
	 2nUwxZ5pFrhWA50A/bGumIiQ6Cg2DO75nC5agKObJGIOUAw0Su3poPac9pY12BHSgY
	 Gi4HfPwL/DsUA==
Date: Thu, 10 Apr 2025 08:40:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 02/12] dt-bindings: mediatek: Add mediatek,
 mt8196-jpgenc compatible
Message-ID: <20250410-new-zippy-elephant-54bbcb@shite>
References: <20250410063006.5313-1-kyrie.wu@mediatek.com>
 <20250410063006.5313-3-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250410063006.5313-3-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_234031_807751_43549210 
X-CRM114-Status: UNSURE (   7.85  )
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

On Thu, Apr 10, 2025 at 02:29:55PM GMT, kyrie.wu wrote:
> Add mediatek,mt8196-jpgenc compatible to binding document.
> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>

Same comments.

Also: missing media prefix in subject.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

Best regards,
Krzysztof


