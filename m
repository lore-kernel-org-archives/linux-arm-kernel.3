Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF20CF9C51
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdX2Z1aHQYuz7uTanecSo3lzbM9LtpaWwDRVaEnxCTc=; b=L2A/CKBCFLaFXIUSlY4hsocRoN
	7wadYCOn0imcCh+7QsMAtGbxwBhKVusvteV4rxpGiJaZPC0mSzx7Oa1BgY3yiYgKIs41v/zWtHjzP
	Ujd+jwmhlSxxL4iZ1k6xbcdZnc9+ylFCR8O15xyuAY992QFHT1puqA9JuAImjcY5NN/2ccUi7sMFB
	XlCYdxEaUr670ow5L84EfG4CwRw0w76rHjOQ3m5AIxUhTTXLyF0I90CJFYnhsmdgZqnNPZmcvSboL
	DUoRHW13TZyAbZGAhyXX3RoOIGhoyb04PRY0JgwmPn8SuuYdraGTjnk5N6mrUHxu1HebVhDZzbFr5
	PzXejMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8FW-000000074tL-1rGZ;
	Thu, 20 Nov 2025 17:15:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8FV-000000074tE-0pcP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:15:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BA1A601DE;
	Thu, 20 Nov 2025 17:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9A3C116D0;
	Thu, 20 Nov 2025 17:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763658912;
	bh=tUJeMypbWx64/Z6otC6Zk4ZaZQUUS8H+FmWqI2gi1+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fvihmd45/mBHgMjyHRpRIgcbXtJm3kydpQz6CiDR3/QE1c9N9zXA4ooHDUYYwDcQ5
	 MhmsUfDUBnGZU3vHANf6U3dQpZl4uMYFagQxAZZbFeEzcm7vtoiiR/SV6cdDXER6Sj
	 Q8qKm0Lxo8Xm3BGaukHDsmUoFaHlP1JhT2zHvD2pyRm6pgMqLdgpiZ19Ira+7dIthY
	 uVr5Mwj4E/DvjSkWL25HduORAAP4MFR2h3fY+40fId4dGL+q4o0SlfX5043f+oMfBK
	 j6fmPIbHizjIcP/d8oWgqF06QhBr9wdJR8J31ziPXZLuuWS4dW48t5wSVJERtvt720
	 v8sZqCeoZS8NQ==
Date: Thu, 20 Nov 2025 11:15:10 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Eggers <ceggers@arri.de>, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: eeprom: at25: Add Anvo ANV32C81W
Message-ID: <176365890864.1562501.17836862471978863678.robh@kernel.org>
References: <20251118121513.88352-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118121513.88352-1-marex@nabladev.com>
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


On Tue, 18 Nov 2025 13:13:10 +0100, Marek Vasut wrote:
> Document the compatible for ANV32C81W 256kb Serial SPI non-volatile SRAM.
> Although it is a SRAM device, it can be accessed through EEPROM interface.
> At least until there is no proper SRAM driver support for it.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Christian Eggers <ceggers@arri.de>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Markus Heidelberg <m.heidelberg@cab.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/eeprom/at25.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


