Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B1FCCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 02:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yBUiDnk5LURBwQZm67BoqBiJIBTGhP42z4gZtJLXCw=; b=cUi5Hiy244bXOQVQW6bx4c84hi
	5XTgK4I6q95MgUO6oBQytnWi6Fp/sDB8chDfmPm/46I1sdq9YSrAQ4rygQaEVy8ibxm9/HJBoocYT
	1EOTu1/qsCUJmWNNac/IkKOjYZ6mqKaHfFgoDdY47XIKlwC0cUXgXe0xwcDo49yQRBNTFUUytM3JK
	Y1bXxC+oZkFEZtrKXWQw7uyFC62J6y8Z7nuTxCd3jpoymdp21h4nTE/QeDnhVkeBOZP1GgXWiUOs4
	gIbJ/qHsrvGe542jl+gPNFdoWpRpDVmSTDS0WfrG3Vq/DVmO8NsqLxTGAzbebRX+oFFGcKG6Tvnsi
	ofW8yOFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB1zQ-0000000FYvv-3w3B;
	Tue, 21 Oct 2025 02:20:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB1zP-0000000FYvi-3u58
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 02:20:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A3D062240;
	Tue, 21 Oct 2025 02:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66558C116B1;
	Tue, 21 Oct 2025 02:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761013243;
	bh=x0ieJfyYvJXAZ7rk++9oKlSo4Fi5eCEJJwes5tOAPWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wp640UuCShqyd928hwlUFfIzb0CoGBeBc+5IS44JSgu2qRZrrvxp70aYlKHogfrEz
	 cZdhmIhrTdwRmOvJBJFsDjCYZRInfHFtT5BblWOXERDXYcwmj27gz35k9oiO6I3N3B
	 hvn9eKLnGxUUKUrtXNFEYZmGGl4Lx8eTFqtfMbwDaEJj3Or17OFx0k133UjCvHxaVf
	 iaA7pqVLj34AvbrI8xmzu4rSv9tJy6qZ/qqBCG7BcfhbJeHCCQD60+apXBMntUU2tK
	 HNjQgy1BUfGXakq0oqmBukvaxpj1UUW2TaZQx6ii6XJPY+QnfqBEfe7g0gWb1X3UEJ
	 BWowvGdtwxZVw==
Date: Tue, 21 Oct 2025 07:50:33 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert bitmain,bm1880-pinctrl to
 DT schema
Message-ID: <gztk52lhda7mck6m3umpxaprydhux33d6kbr34qmj7nipopbcw@yvkhntk4nhqa>
References: <20251013191235.4139259-1-robh@kernel.org>
 <CACRpkdbduyWoJ7ob55btTwkCSQWDB9_ZObL3osLVYgiuB5Lk4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbduyWoJ7ob55btTwkCSQWDB9_ZObL3osLVYgiuB5Lk4Q@mail.gmail.com>
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

On Mon, Oct 20, 2025 at 10:58:30PM +0200, Linus Walleij wrote:
> On Mon, Oct 13, 2025 at 9:12 PM Rob Herring (Arm) <robh@kernel.org> wrote:
> 
> > Convert the bitmain,bm1880-pinctrl binding to DT schema format. It's a
> > straight-forward conversion.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> 
> No comments for a week so patch applied.
> 

FWIW,

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

