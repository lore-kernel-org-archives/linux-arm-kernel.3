Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDD6CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+M9XlNis07KpTAkkQrP3znn5sFqicxG8ze3SLTNWwE=; b=Cfn+R0OI9I+tNG2xOtc7piB8G7
	6WJsxZIzitGqxr12WJSyUGHUwc9GPaFv7GX2ax/lK3Uj2HIK0F9H/OYdqB7S4K9+AXlXYGZN38ysV
	NLLoCLWe74vpKj6FykOQUgs1rOshd67diKXuxEWzXcvi8jt9QD9Gyl/crOm2jEUExXa5dtJAauJpr
	9tehuyrDVTUxRNEagj3wuPm45dlChOMpM1sS20X6Hy+GpWSkw2ifUwFA3BWnaArKUuXnx6ObjOPII
	D0Gq0OtcNkfCXOLXSFodsj+9FJixqrgyaats5E9gCuEt13SnUfhHU9RCG00ohuylQlMrE1fucrgyI
	u3H7yARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugWD-00000005T4J-3WlI;
	Sat, 06 Sep 2025 00:11:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuaxA-00000003iZo-3Hyy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 18:14:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5AADC601AA;
	Fri,  5 Sep 2025 18:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1290C4CEF1;
	Fri,  5 Sep 2025 18:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757096066;
	bh=sKIzohfHjobHO7SXpKvZ0tTHicEsp56cVztJWhm/0V0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BrZE0Gs8hnOSpo716jzKc1BTmUzos1aJ87JdO5xXPyuHu6KcqaAO5UmJKZVnTfFOy
	 RxiN41dvEz6I1MLYuj165bTcE2o08YexQxpbnq2P0JRNmKWNmN4iMg0NEi4Ya5yyLl
	 T5S4i41W8HDmxU4hE+52aa6bgyIx1Q2eBz+oi+riZqsuKuRLZq50F1E0Zt5+9AQqF5
	 rA6rMB4cn/MAhjJ8Xq6T9COQDe5G8j5ZODXbg7a57q+Pwu3gJlfHopnqHtVHT5HNAt
	 /478erheEcLcXvjd7GTqYipC5EjMr0co/a9GUpmq11NcNpL93j2M3vwsxrK7C0Yeby
	 Gvj6MCZJBmRug==
Date: Fri, 5 Sep 2025 13:14:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Roland Stigge <stigge@antcom.de>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/7] dt-bindings: arm: nxp: lpc: Assign myself as
 maintainer of NXP LPC32xx platforms
Message-ID: <175709605970.1054226.866828735436779531.robh@kernel.org>
References: <20250904184647.397104-1-vz@mleia.com>
 <20250904184647.397104-2-vz@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904184647.397104-2-vz@mleia.com>
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


On Thu, 04 Sep 2025 21:46:41 +0300, Vladimir Zapolskiy wrote:
> Make a formal change to reflect the actual NXP LPC32xx maintainership
> for the last years.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> Cc: Roland Stigge <stigge@antcom.de>
> ---
>  Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


