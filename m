Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A075C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 07:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/7/uFVkH7fbdkVCmtDBJiDLcA2Ta8d7AFWr0TEb6zU=; b=Qhwla+ikVvUE2Ec/n8k4N0QOfx
	rczxU7Pn6DO9s+pNqW2hGULckhWdNeqqH2TlCfqg+ML/uTODKiDMugCPiPdejDFagrssb5Rsugg8N
	kr64+9O8az1rlyfZM/1OdCppQAJSn/EfwKivpHAJ885dBh2aS9eutCHG2WBi9ioBSbobvHgOE9FTM
	5mkR396//OPTsXvH7WYu0Nd1ly765W+FTupadzC3EjUrXZix7TeKlo4QB4CJGK09joH2aLYT6Nzoi
	jEHN9EmsB0hnmz90jw5z/PQ9V/C2vSLpdk+JuKN9eiGgmbDMtpPk7edlJK1tSaS7YO+Hd7RXsxM4d
	xfsqNhRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4E8f-00000000ujH-2xDx;
	Mon, 14 Apr 2025 07:21:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4E64-00000000uU1-0sre;
	Mon, 14 Apr 2025 07:19:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1F40CA4863D;
	Mon, 14 Apr 2025 07:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC602C4CEE2;
	Mon, 14 Apr 2025 07:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744615151;
	bh=5XAwYqPF/VcumK0eqoVgJ7WMHjerh75+AgOEX07/FYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PCxRpoo5tBeIdkv6YPps3K58/RgIF8jkAbi3crSrltPrby0+rAINAv/jYbrLiu4J9
	 eKKnKRj8rVIytyAEtadMBcsYrNzBw93UPb01ZYTd/w6vcLGzaPw7szlvAL5glU+R81
	 Xk2a/9+wdFcpMvqpGEjWKzrTsCqfETOsIRhfcWW2FughmX9XcbiBVpBLEsdpWyWTOe
	 uEQbD9AL7AuDl8RQtgiDdxQuj9eUPyPpSSA2ien2vZYrBnscjcnIFLOMiMN8NrF9qv
	 jpC6p7PwHpPp6Xqxef7L2dz3jP7IXfoV5+POEPEv0J1lxx9A5Jr8uQJXVkC9FUavHz
	 wMuyZXe9FMeGw==
Date: Mon, 14 Apr 2025 09:19:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Rob Herring <robh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 02/10] dt-bindings: phy: samsung,usb3-drd-phy: add
 exynos2200 support
Message-ID: <20250414-mottled-divergent-swift-666aaf@shite>
References: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
 <20250412202620.738150-3-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250412202620.738150-3-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_001912_320245_84854530 
X-CRM114-Status: UNSURE (   9.03  )
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

On Sat, Apr 12, 2025 at 11:26:12PM GMT, Ivaylo Ivanov wrote:
> Document support for Exynos2200. As the USBDRD 3.2 4nm controller
> consists of Synopsys eUSB2.0 phy and USBDP/SS combophy, which will
> be handled by external drivers, define only the bus clocked used
> by the link controller.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../bindings/phy/samsung,usb3-drd-phy.yaml    | 38 +++++++++++++++++--
>  1 file changed, 34 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


