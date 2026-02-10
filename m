Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE80FE94628
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 01:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tdo0p9iBsMfTh7ALH7mex/M3S8aQYGr61IWEE+eNsMI=; b=qWhwahecYfH7taqEkHE/cVRPGj
	yN9L1SboHwr+HPPriXHQ/vVTpW9LDUwJ+2lCuky3agnJFo0GT/d0RykTcWKxtkPJfZPhCvU1gmVjV
	p6WFBNAbICbBwpMWo9lYtUa5oaGC2wKGp1WcFN2aNH1DyO21zwiNnTFU268tCJ9HP9jzEr3I2wD9E
	eBi5GogS3YwYS4vqaO6VMaKVWDVSTV8OsKXLNOhofwg+CrcGjxjwuM9VqINiZtmfc3Yq5Szo/KlHI
	MwbAiZuGJyDyeuQ3XA/WPSOJajEqseLUtcJjPJUy/twICWWCm07m4WsO1Wt54UkUWTfusKDVN4i51
	NFYdyxRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpcaG-0000000GHbz-24Vr;
	Tue, 10 Feb 2026 01:30:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpcaF-0000000GHbk-1lgD;
	Tue, 10 Feb 2026 01:30:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6119160137;
	Tue, 10 Feb 2026 01:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB022C116C6;
	Tue, 10 Feb 2026 01:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770687030;
	bh=Uo2Pfl6hyhMXQD3RE7rk1AAawAsayGOyRKqwMxrRElI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b17xXxT1qROJYRtlyi8CwFU78ehZFBEo28RsXAmTsu9gdxHALE9ZCjcX9ZE0RYhFW
	 F2vCeOHxWJc6XJcNQeBH4PcKnMc9/Og8gyYkTWb9rBTmo9CXytP7fQJwXnJTaXcOAp
	 vnwtVvqj5+R3U1YQ/4A9Ti9tHqIQI0wYkeAnCsGLNCTMEa449PT6MXaWdh1/HrXdeA
	 43wR/K90+CWDebSF03rDGdsltgK6Xgr5h6ElWRKdbB+g72Sr4yyLzayUxsmI9Q+dIk
	 DEGSMqafLv2cBjLTmNsIEn6VXcKm7ksdd7NKxBK1WQx99QaRerEZRiDsoPOhNKKA2x
	 8iFXDu70A/7vw==
Date: Mon, 9 Feb 2026 19:30:29 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
Cc: openbmc@lists.ozlabs.org, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: axiado,ax3000-emmc-phy: add
 Axiado eMMC PHY
Message-ID: <177068702757.2279882.2179431241227360532.robh@kernel.org>
References: <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-0-a2f59e97a92d@axiado.com>
 <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-1-a2f59e97a92d@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-1-a2f59e97a92d@axiado.com>
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


On Fri, 06 Feb 2026 16:22:08 +0800, Tzu-Hao Wei wrote:
> From: SriNavmani A <srinavmani@axiado.com>
> 
> Axiado AX3000 SoC contains Arasan PHY which provides the interface to the
> HS200 eMMC host controller.
> 
> Signed-off-by: SriNavmani A <srinavmani@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> ---
>  .../bindings/phy/axiado,ax3000-emmc-phy.yaml       | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


