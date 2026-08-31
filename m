Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F603C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 08:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJhSr1y8SNVGJVWTrH8sOv+0JMoXHZb5RD+4Hd9G5m4=; b=u8ejoUrnccUXYwZRH+6WlW0I00
	Z8aGWGGAO/GNmrADiudid7XoVS2940e2ziGp1RapW8TKfB+khfCtBSBiGFQbh0Q1Xh1YI0wUqoG8I
	htdf4k9VeguOIa1Z8XvQWNycBw5qVe3n+DLM8vscHxYW+kNA+HUPzYUqvzDoldveCyWh5tVXBkZz5
	wy8Q485JEC9BoxMV6HJFuDsSLXymULJjXqbUyKOM7pxnOg4oIYz956oy69flWwUqnRJHaa0kd/Eua
	UbmOebPQq0TnJJclb2yxBWZE/iv83XDE3WG5pxaBX0+WCsbK7npVZ22C7J6yKpALESEhKzctCD+uL
	RN/xDEuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xjV-00000008wbr-0drR;
	Mon, 31 Aug 2026 08:51:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xjT-00000008wb6-10lv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 08:51:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 82BE4408EA;
	Mon, 31 Aug 2026 08:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D401F000E9;
	Mon, 31 Aug 2026 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788166270;
	bh=aJhSr1y8SNVGJVWTrH8sOv+0JMoXHZb5RD+4Hd9G5m4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XL8fXmsEqDF/eDGwhootlckY4E55cvv2oQqeOsEisCc+wHuyE+QwnAjYwAK4ro4QT
	 U+fyylyiFMVq0XyTyJ56T/nJguFoRbEEhVZ+faax5kQeg5Y/9S38O0RdePoCb/uyPA
	 +VycH0kSNOucWa9TAVf5qSYCqxrKXMDX7tky7aaqHQWLXeiPv2CcNcnunh4fRbOGE/
	 3RPLfzmtDm9rB1j7H2NJr72muX4HhIQuBxTVtEaOeoTHmYhrXTFGITdGPF4zSNzZEj
	 jvEkobecxKqWzmC+f9ndBwC4pX+HyY0Qiw7GUWjVq6Xz5Ayz3RzyI7dT93uCQz5gTw
	 x7hP7vMLmGJEA==
Date: Mon, 31 Aug 2026 10:51:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: generic-ohci: Document ST STM32MP1
 SoC compatibles
Message-ID: <20260831-gay-colorful-cat-edf6c7@quoll>
References: <20260828150202.173109-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260828150202.173109-1-marex@nabladev.com>
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

On Fri, Aug 28, 2026 at 05:01:26PM +0200, Marek Vasut wrote:
> Document SoC compatibles for ST STM32MP13xx and STM32MP15xx series of
> SoC, so they can be used as more accurate compatible in SoC DTSI. The
> SoC DTSI currently use plain "generic-ohci" which is not future proof.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---

This should go also with your access controllers property. What
happened to it?

Best regards,
Krzysztof


