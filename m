Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6437CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 16:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpGyoQykc3liLZie3yUFqmZ5bf5eC2Ns8mV45/9/ryw=; b=Wn61LsWFKJe1SKCXpqz1Rd/KU6
	0eri0gd/YJfUXBLlo4hPR62E9GKUzjnMes9SeK4/BGMw3pskHz97SRUpRoOLStpIOwIWBINj2Vgd/
	yU+vux0LhrAefLXQcCChn9/NkR+lfqDXhyDwwL25NWv6I7pbusJ6yGrPLlX9VCOe5/9YWO88zTkwq
	KbPIIBUpuXedPyPc4oK2XkfYDozUzyqs5AJTgPLLKh0mX7wKt33E22Y3bKdXj66s+0bXlS4T/1/Yo
	GZ74OhXzWyL6LP7CKjCoeTXfRrZw6GjsT0gMi38mGxxFfXEVbvGVLt1PwruXGvto17Vp5pP4TMHSV
	JI+PmuXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI78p-00000004up9-46LP;
	Sat, 17 Oct 2026 16:20:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI78o-00000004up0-1rhH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 16:20:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 45D8260AAE;
	Sat, 17 Oct 2026 16:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346DD1F000C4;
	Sat, 17 Oct 2026 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792254012;
	bh=QpGyoQykc3liLZie3yUFqmZ5bf5eC2Ns8mV45/9/ryw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NKCLBzIspt3WK/W1vyS0P5NtbOSFGGOuReVcNtQArGkc/GGqhEctHmCW83O/RR/Hk
	 o/ftvfeED7Gm4Ma2Mt0LBd72yCCU10UTwyMawkfutRux8VX/7mUltBZuVCBpCGI06U
	 lqIv3Le2E5WzpzFoP0jnHnSTOsxhUVRc7gCYW3vlN74mcf42j+r1qUTCWDHeyJLBKD
	 CR/vHj/BzaxE3Fg0ySJiKmsjLdpfR+xoDjlRe9fd8tmbd9IlK4ALYXdxL/uo1+yVTf
	 suFeK4aVA8vTGq8JpZISvbOJL4fnPhKJNL0v4V/M75jHX2q7Tsw9LKMYJn6Xq9kDzp
	 2ieuUcLTtee0w==
Date: Sat, 17 Oct 2026 18:20:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, 
	stefandoesinger@gmail.com, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/24] dt-bindings: pinctrl: pinctrl-single: Add ZTE
 ZX279128S pin mux
Message-ID: <20261017-lion-of-noble-management-d94cfe@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-10-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-10-ghahramani.navid@gmail.com>
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

On Wed, Oct 14, 2026 at 08:20:49AM +0100, Navid Ghahremani wrote:
> Use pinctrl-single for the verified PCIe and external-PHY bit selections
> without guessing the unverified field layout.
> 
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


