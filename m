Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13695606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 12:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K1MOc8pI;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GZoa9hHz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C2rZnyIbpP89ye6bG3lNVVpR9E9Mquq/SRfP5Fdrzig=; b=K1MOc8pIFCJel70ygUsyXbmr3c
	/ojbRiLCcbouGtTVLhuZogiIf7W82CN2a9748lymFt0A3G7K8ZyNp2y5BynOGPk6zYKJuNc0Ohh3U
	ZzXpIEgQ3S0+9hbCriX4+56ZqN+KE05PXdcP4YMDr0pRjkB6Lv5tb/xQu4e4TJgyR2U1ixBIQ1V94
	dzn+bykcpq+WEJrDwTVlNdwFmAUkGrJziL9rZKTJ4lym368ouzQLZkoYqzjvRSWXCx0Sm3NyKUHwo
	XKFUOERgy5ECxRwYMcxxrkxxB/rDvzt2AxknAXCkQJmtVG3IgkyZtcKpmyufiHMaysVFQr2+KkNsl
	XpxeQ41A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlKa-0000000Bcns-2JqH;
	Fri, 30 Oct 2026 12:03:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlKa-0000000Bcne-0H4w;
	Fri, 30 Oct 2026 12:03:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 03E0643D4F;
	Fri, 30 Oct 2026 12:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151AF1F00A1A;
	Fri, 30 Oct 2026 12:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793361814;
	bh=C2rZnyIbpP89ye6bG3lNVVpR9E9Mquq/SRfP5Fdrzig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GZoa9hHzPrOnevW6nL66UFfYPR1bLjl/Gfh/ByEq9wZG4JLMlRqe5GnOZgMMEUEV6
	 W1t9xyphqrFdCQYwAmTUVv9RVvqRZEj/zrZ5Lx53Pk7O8/VXPoRh8ayBKktFqNZjoy
	 qNkJESDbPI2FJdxyBabtcv9YkR6rhYRfTkbFxV6OXEMsTaJGXiSt7viFo8A4nE0I78
	 sLObvsJS7/wq77PxHoToLRpedX4wsxSHfCP441qmRdeAdEtunwv7ylwgOHKFLoMscJ
	 mKYZIK5hSb8LMqIQvkmIUODAR0smixNBAXB8+7h3eMy+0YTTTmNoVjQOoCU9252Ylp
	 Fa++KEnxgQ/Dg==
Date: Fri, 30 Oct 2026 13:03:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, Xu Rao <raoxu@uniontech.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
Message-ID: <20261030-adaptable-vagabond-skylark-bacc90@quoll>
References: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com>
 <20261029172325.3425046-2-vinicius.eduardo.pedrosa@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029172325.3425046-2-vinicius.eduardo.pedrosa@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 02:23:24PM -0300, Vinicius Pedrosa wrote:
> The USB 2.0 PHY in the Allwinner A733 works with the D1 settings of
> the sun4i-usb driver. Add its compatible with the D1 fallback, as was
> done for the A523.
> 
> It gets its own compatible because the driver has to clear SIDDQ
> before releasing the PHY reset on this SoC.

Each device gets own compatible.

Above suggests they might not be compatible, which feels confusing with
first paragraph. I don't get why you are making two separate statements
about the same - first paragraph says A, second says B.

Just one paragrap and explain whether they are compatible or not.

Best regards,
Krzysztof


