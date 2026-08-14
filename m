Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F940C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 10:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qb/LiS0W/y7yHH9+e9qvnb8YEVHpUvl7FHRXw8WQl1k=; b=oDyIRh8/z1Zt+SYZ6mvLyiAj/D
	UInp2bhwzWggr9U63rnrmzt1Go6NikuyjT9gSdVfIr3xAohQdAMadKU5/HviZjZMvRC6l4J4EKpJs
	w1R7c88FamWHLd5U53poVS89/OmNMgYWVhsL7xpX69PQ1UiuAcEsjb7o8O3PpqARhKPDh/V983Nf0
	qCe+lGusQtXhawTeiAUVny7H9sVqHZighGi/YAh9CFOa83Qm5lze9nm1fcI6c5zzMyFYKSYag85u+
	xA6RSVh8r60AxC+WTnVB9Hc1M01gePP1Qm++kDDBF3zMNEj59TW1R0d8vfa/KLGi8GlJni/NDKD6V
	yzCp2V2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wup2R-00000002VGv-0mw5;
	Fri, 14 Aug 2026 10:21:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wup2P-00000002VGf-371h;
	Fri, 14 Aug 2026 10:21:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B308601DE;
	Fri, 14 Aug 2026 10:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03A01F000E9;
	Fri, 14 Aug 2026 10:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786702880;
	bh=qb/LiS0W/y7yHH9+e9qvnb8YEVHpUvl7FHRXw8WQl1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YOQIcoe74kRChWbmv/mXVEEfZslk1rIXehTZgx5CDMkKuRpWJu3eNzEYwCxAYDHIF
	 rGAeFTLXL624XJXehQIEv2NlHuZ1glC0iYB+OkXr7JUbFlccXhtpXVzjjRdQ0ajgZ5
	 cr4dc2//RkfO+zrYTLfzXFQOZUeXbjDJiMwplmREsy+myyWeOZOo7E/2+shinsbFyt
	 Btf73cOA/INOO6XfrdFBpa/W8kejnGUZ7lMDivb0RQIM4c8iqfaGnFvWa7o24ofMiL
	 pp5jkK0XYqVMhb+j/d3X1cX7tYM+HEyGYFGI0+KGx/Z9vNs223tNhnPanHcf3oQ0dQ
	 TpAMjIFvNQ3pA==
Date: Fri, 14 Aug 2026 12:21:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladislav Leonov <vlad@zlab.su>
Cc: linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Simon Glass <sjg@chromium.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 11/25] dt-bindings: i2c: rk3x: Add RV1106 compatible
Message-ID: <20260814-resilient-handsome-ibis-d5efdd@quoll>
References: <20260810121121.210040-1-vlad@zlab.su>
 <20260810121121.210040-12-vlad@zlab.su>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810121121.210040-12-vlad@zlab.su>
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

On Mon, Aug 10, 2026 at 03:11:02PM +0300, Vladislav Leonov wrote:
> The RV1106 I2C controller is compatible with the one found on RK3399,

Add RV1106 I2C controller, which is compatible ... /

One sentence, one line or two lines.

> so add the "rockchip,rv1106-i2c" compatible to the list of variants
> that fall back to "rockchip,rk3399-i2c".

No need to repeat obvious parts of the diff. Explain non-obvious parts,
though, if they are.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


