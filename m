Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768CAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 16:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7fFB3vRviS+SAq8MySgtijtTpItKoaFOog02r7EO7A=; b=uaNZMXExn1CoLBed45UO6w0oiW
	d92ZX5ENTCvKQQfVuMPm/2J5EtDYt/J8StoGv7aulZwh0TL59pizD245ncTp0aBqRElPfweEjxm5/
	0vWaUMAJFBv56EnGXT9UacWR5B0GRGGBIKNSfzp3GBqOdMpg1wkPQzayIch8m98N8FkZzgfU9NGcM
	6jjMOAJS3jplzrxOyYn0T1x33IVG+IlgRlrOWNNFU9DIFNTrnGTN0h5tQbeXyzFq5jhrfRzyskOpA
	1N/oMYKy2b2r4ljpliKF5A0Wtu2TDnrP8eBJuHTNrnpoQ1amKwcOjwKH+CFefN91sBl9CLCCcuka6
	nhDzd3kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmY2-0000000D782-3ygp;
	Mon, 06 Jul 2026 16:51:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmY1-0000000D77i-0kDU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 16:51:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C365A4197E;
	Mon,  6 Jul 2026 16:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1BB81F000E9;
	Mon,  6 Jul 2026 16:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783356716;
	bh=o7fFB3vRviS+SAq8MySgtijtTpItKoaFOog02r7EO7A=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=dDXU7toPgKIuALtUfdJzUkg/X3+XXOCKb8BmFZIGaf9SExJ3O5MX87fW2cIKMu7JG
	 19iQqLA65DYi+8wtkbRoWjW9YifvpZ4ZGA1riUGFVhGWRaEkBh84i7XhX2DWXtI99u
	 Ea2ycWGpc1M7vpfSEAXfI2UuRi6jQMkmhqda+0iYBUBwCu9S4XSDvuynQ+erx4cYb6
	 E98vP9owXf7td7SyRNtLaaNPOWFAgC3rkhn72QPQoz/O7sjSaocAJnMl2FG+nUiOYp
	 SCsO/Lv+IvobC33YyMuvjIi+z9igAK7mGgxpmsM6u0zSorotNAL169vmjaUA5KrlBB
	 c6x8Yk993s/PA==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706101951.341727-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706101951.341727-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: allwinner: sun8i-h3: Correct indentation
Message-Id: <178335671460.3965045.10345566187999207328.b4-ty@kernel.org>
Date: Tue, 07 Jul 2026 00:51:54 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Mon, 06 Jul 2026 12:19:52 +0200, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
> 
> 

Applied to sunxi/dt-for-7.3 in sunxi, thanks!

[1/1] ARM: dts: allwinner: sun8i-h3: Correct indentation
      https://git.kernel.org/sunxi/linux/c/5ede58393a70

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


