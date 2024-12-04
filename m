Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BFFE7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsHsdzyV/3o5nuMXEO42kgR8xs26fCs3pxlgwSBqmQc=; b=mRWWKz0FGR1zMjSloRgGVOxK9q
	YCgUah7tEDV09ELfC+1l1S1xxYUlgg8As0hZ4E19xLFQpTQtn01tu5TnNBKcwERBvAR2P6raSGTFs
	532DT6KzvrC/hGl0N5mMzK0L0sw4CgwzWB3f0F40O9HNBbNqrWvIrz3oPoVPYnuxsTjOac5fWijd4
	1YWhmFAxqV8htSdBLYbhdn4KMk0d91bFDRR82slSMF8Ge4DFLVA83ZxNB6etiobEw6g3YoHCjN0aL
	/K3gQcL+c2YUgU3Zi54n2XsKAM9Cs1Zl2DPxF0CcdW3LiagwOErmy1w0oH20714AfhnV0xzVQr6Tr
	eX+5wd7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqB7-0000000Cnk6-2AAA;
	Wed, 04 Dec 2024 14:16:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqA6-0000000CnYj-3hDC;
	Wed, 04 Dec 2024 14:15:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 791CE5C6EBA;
	Wed,  4 Dec 2024 14:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADEBC4CECD;
	Wed,  4 Dec 2024 14:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733321730;
	bh=fJGcZcCvocrYYD5ARLmU36d5qyxLWZqmfekPOwaJlFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xaje4v2LAo8DiuFogqnwp0IxwdRAJSvcAF4Wqr6Nl27/WXwqHyhLjcZoZFQLFZQgv
	 nhjO6vDUgg4YxbLx4d1gGM8prSl/a6VeIPjqirl5LO86NR7//gBFH9NUUvHuCgo7iy
	 4jv6yQOrkKrruEIthtgtxI0MmBf/ZfZLJnVft9XIKPl87097OCFBBNVnlMVPVRCHMc
	 MhmTiwa6tNhJQcAHSRmIQUGsleSQqjzCFMWDhuS/JtqIJXylgbmhRfOed42ws5YmlF
	 UIrf1CFqsqVScW7V8ObteDN+t1Tudkac15fKjBQ1JhxiRNqLxtlg/eLRHJlKYgSCxk
	 LSr5AXQ2QTPYg==
Date: Wed, 4 Dec 2024 08:15:28 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-amlogic@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: mmc: controller: clarify the
 address-cells description
Message-ID: <173332172731.169103.7423360262255147051.robh@kernel.org>
References: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
 <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-1-11d9f9200a59@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-1-11d9f9200a59@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_061530_957907_FB67E741 
X-CRM114-Status: GOOD (  12.02  )
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


On Thu, 28 Nov 2024 16:16:41 +0100, Neil Armstrong wrote:
> The term "slot ID" has nothing to do with the SDIO function number
> which is specified in the reg property of the subnodes, rephrase
> the description to be more accurate.
> 
> Fixes: f9b7989859dd ("dt-bindings: mmc: Add YAML schemas for the generic MMC options")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


