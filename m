Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A57C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 13:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7USUcfV0I1Yg99L+APaMvaZnzCp9MdLbRhyP8bt7Po=; b=f1XFrbVpS0msY6EWGU4M3Y2ThS
	LMw6hG0y784ONp2JJjCH4lZv/WchRgNY2HrWLglOBVP6TgVtzRdtvu2Ccq7PL+1MsetKvXCM+1qbB
	hlMUasmjimxA+PSD5/zQ/V8bDuvtvAvhHN860U+Aa+xs7zpe/eaYyl58uqCRV/bljWoNvUgGehnaN
	m3xib7oiayc9NftcW4943ju5AjGQjLgjLfpT335x1IkS4TmVikIb+l9wRdVnnl1h+S2Cw+x5cv6AD
	JWwArxuruhj4fTG89+r5AVsL4AD2WZmEP5NoMYodlF5JSNxZJrdeVeOp5/rsNglvhp8Yrex6jCEzE
	hWuEorLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IfE-0000000HCrJ-2LJu;
	Fri, 25 Apr 2025 13:00:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8H3Q-0000000GvV3-2NsO;
	Fri, 25 Apr 2025 11:17:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7DE844378E;
	Fri, 25 Apr 2025 11:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D956C4CEE4;
	Fri, 25 Apr 2025 11:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745579832;
	bh=WhwOteXj64XGivhOiwvnlcDEYElHNPlWxr/veIpt9QA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dwrSyhc0nfxJs4zr5Kxh7IyD+y3bTA/T0NqycOb19T2Nz/ENOIm0cY8YCKP50LdWP
	 ubRqbt78/ak+GhrafY1iSKp1NeKXyY2IuGIwPG+apCSBMsw4Ll4N1CuHM15IPdvEz7
	 JL+qWAZcK34SOQjgZTisUb4f6iKokg65BA7Jg3mY=
Date: Fri, 25 Apr 2025 13:17:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: phy: rockchip: Convert RK3399 Type-C PHY
 to schema
Message-ID: <2025042559-badland-uncombed-c484@gregkh>
References: <20250416202419.3836688-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416202419.3836688-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_041712_625239_58BD93E9 
X-CRM114-Status: UNSURE (   8.47  )
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

On Wed, Apr 16, 2025 at 03:24:17PM -0500, Rob Herring (Arm) wrote:
> Convert the Rockchip RK3399 Type-C PHY to DT schema format. Add the
> missing "power-domains" property and "port" and "orientation-switch"
> properties in the child nodes.
> 
> Omit the previously deprecated properties as they aren't used anywhere.
> 
> Drop the 2nd example which was pretty much identical to the 1st example.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

