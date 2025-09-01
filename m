Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00E5CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QCKsadPorcrMOKVsQ5a3M/HhJWHUnwxI+X8EWWLOCs=; b=19hQ0/SFDwcHS9wJ/u1ejLi851
	OMyFiTCwBZm08ZnhB2k0QyvgWoENwlf7orifNDSaTFqrxxuOokZxGGegUCeaAaCvq8BJJzDc8lOpL
	91ti20N7hIXb+D74f9etCeqezuME8+OisjcKGC0LcwfT3/VgyPzGyooqA/zmovBJUnS2aVWp45DA9
	Fe3Z6BcszrNXQQeQaQ/w6a+LM7KeYrX7hM1frN2wtrAoSouMPQHYXQR1G+b8ixgvwZEhYHpOA9OEp
	Ywt1UUBgathHpHVcQfVN6Rk8pwgAqciQmOLV3IrEdXscW5dFynigbxolqkBpFU58OJKXN6tRejbUi
	BkNUXLCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDnG-0000000EICl-1M5N;
	Mon, 01 Sep 2025 23:18:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utAvQ-0000000Dkmc-3oBm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 20:14:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 534FE4092F;
	Mon,  1 Sep 2025 20:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12478C4CEF0;
	Mon,  1 Sep 2025 20:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756757688;
	bh=XUjw+gkTug2t0oPPOFwOLTpUa/DqKZjK1vNIgNUzZI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XWCeABhKhjS8GHMFOD0CpQrHOrekr6efDq6tXA2PkLGEw54UnKQ5+ENvMTNj5S3G0
	 r9QrkojsuFEDfDjWCQjFO5EDWteUFyHd4JdJSTY5O/3BQC5vcZ9Xs3Zzscv5lXftzs
	 6cuTCTBT6rfch2slTZbr1aV0mcmNnE63o27CmqfdPIdDuf3kEV2oH+KWISAtCx94iC
	 VYHpq26cMo1IbS3Hb3+/Ggo80zYSnHhBn8KhQOS7Z0+u1vrjPK7Zjj8QfHZdmRANLJ
	 Ot650HiQjcgbvURdekk44U5YZU1ZzhI9VlPUssCZNlYDeXYHKl0FQFqusQJICrAPj7
	 gYeUb8lqWmq8g==
Date: Mon, 1 Sep 2025 15:14:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: samsung: Drop S3C2410
Message-ID: <175675768662.267701.16704430254181198518.robh@kernel.org>
References: <20250830111657.126190-3-krzysztof.kozlowski@linaro.org>
 <20250830111657.126190-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830111657.126190-4-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_131448_967391_D70D63C7 
X-CRM114-Status: GOOD (  11.37  )
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


On Sat, 30 Aug 2025 13:16:59 +0200, Krzysztof Kozlowski wrote:
> Samsung S3C24xx family of SoCs was removed the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of remaining S3C24xx compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../samsung,pinctrl-wakeup-interrupt.yaml     | 19 +------------------
>  .../bindings/pinctrl/samsung,pinctrl.yaml     |  4 ----
>  2 files changed, 1 insertion(+), 22 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


