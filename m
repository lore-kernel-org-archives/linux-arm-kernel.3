Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0E5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 08:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbtVrRW1/+4BBbRbmu1/lW/JULCQ1c3ev/kg5xMHLVc=; b=r7w3LnmwNVLRSQzsEkDrBEX6d1
	7sBVDSF9D095u7Cqvx9J/iNH+UM0NHHEck59xqvg8aP+B88wdGDSd+nvf7xMwWn/LyiraLqn6EOQ2
	ATjhU9cceJOHeQN74JUjhp+jMEuAmFLyiF4kyA1cKYDtr3UmWRfIj4pIUN+TWQoHLV/ngbEYamYAe
	qHVHOqTSkuioPi7Dxn4OgFRAvuX2H76s+JWpZwYdjknJ+O/3bFUABJSjA4SlEaX73CEmqljJHmvnz
	o0/x7gxTEES0jU+hN0W+rAudA18XAhbW/toHiD+EevEXuZrs+KyURSSMBJPLyLDofvqM45zEbCXdM
	EcjriXCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLeQB-0000000HGvk-0pDY;
	Thu, 12 Dec 2024 08:19:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLeON-0000000HGUy-0Ijb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 08:17:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 08F105C6098;
	Thu, 12 Dec 2024 08:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC03C4CECE;
	Thu, 12 Dec 2024 08:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733991470;
	bh=9L8I21enfW9cEAjR+NIYJvYAjvbWbGI6CWCsEgxGvOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tSm2RCRhyRfgXBimI0IUQRlYVDBL42c7/flr9mv++UgonqsjrKTnwFh0fvzwbdICJ
	 qfrat0q/51IMZaQYIcF/uNbbtrt1uhoOJSsq4W1R9Q8qfukE3VPFtlVFNpzaNRxN1D
	 fZ22f1Y+spDrtToReY5rQTYwTNJsE82ul72AEalx6nOHR8oSq/UgqoVwVtiXcY/BCV
	 Zrzk+D7JqiR2NhOUZ2HKK6vO5qFW7TVbzgc0EtbHyM02EkJ8eRHWwdBIeGgw8wGdCE
	 J1QJC1k4/lzBo2gfEQD3aduJLREZ11C7opg+gv1bJxHTfwarwpVRgW/SbpyiTKHR9r
	 TauA3NvxGedbA==
Date: Thu, 12 Dec 2024 09:17:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH v3 07/13] dt-bindings: clock: Add SAMA7D65 PMC compatible
 string
Message-ID: <faf3547rv7easjc6rwewzn3xdp2y2zc4opsbqvhvsbi6e5g6fd@dkcdkiycp5op>
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <5252a28531deaee67af1edd8e72d45ca57783464.1733505542.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5252a28531deaee67af1edd8e72d45ca57783464.1733505542.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_001751_151678_68FA65E0 
X-CRM114-Status: UNSURE (   9.14  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, arnd@arndb.de, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, sboyd@kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, linux-spi@vger.kernel.org, claudiu.beznea@tuxon.dev, mihai.sain@microchip.com, linux-gpio@vger.kernel.org, dharma.b@microchip.com, linux-serial@vger.kernel.org, varshini.rajendran@microchip.com, krzk+dt@kernel.org, romain.sioen@microchip.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Dec 06, 2024 at 12:59:52PM -0700, Ryan.Wanner@microchip.com wrote:
> From: Dharma Balasubiramani <dharma.b@microchip.com>
> 
> Add the `microchip,sama7d65-pmc` compatible string to the existing binding,
> since the SAMA7D65 PMC shares the same properties and clock requirements
> as the SAMA7G5.
> 
> Export MCK3 and MCK5 to be accessed and referenced in DT to assign to
> the clocks property for sama7d65 SoC.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


