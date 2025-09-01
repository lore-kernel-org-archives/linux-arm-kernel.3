Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0457BCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stjYM3Rj+rt5MgEaHpvvjLtUCHv/HuQ1DWy9A2twRh4=; b=pCZc8mMmxXcuQbISczWGlKX4Tu
	1v0DNWlRx40WXTKJPNUFY31/JEsgXZDmc7pm3zTtVIbs1eIwfV7VZfMKx6OzwjldnlNrR9cWw+JHy
	pFf5MS8LYotQMw3J/6iKWVc7XgRMsPGRvslPSEwohBQFfmIMabUcSiDwxKUMILaDpJwvN7HFMxKFs
	1Na3EKW1CBat2n7S5LjEjub5KOebPzsExPa1xn4kBQmL919YTJj7AsAJ//ehCEsbqsI6StDoN8r57
	Siu+EMmZ9FGDygZxlSnAg+lFdLqqDOnUTUdHmWzFtCshnNxaMPWQqtecEGkRihLU4d9D2xbL9ZVfE
	1ujQpQLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFHG-0000000Ea8O-266n;
	Tue, 02 Sep 2025 00:53:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utCCq-0000000E047-3JOb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 21:36:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A6A444B7F;
	Mon,  1 Sep 2025 21:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD0FC4CEF0;
	Mon,  1 Sep 2025 21:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756762612;
	bh=/VwsRtkf+UQjoJQCltm2n7rC7ZNkfCMHAtZoj9SYAoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WR9x4nD5mYppOBzRfQSkxm81iBYsxGRWcszsJt8sbAAxey5vAaNGJHkH1XIPXisn0
	 fsNfW0+R1HySPCR6as9SgO6O1yK46w8W3KJJ9sWezje+VopTCLWEOdFaGtSNSUY0xf
	 i4V/Rbw5V8Qu7bLnmm1H/GHe/ku6UhwPGRyl0LjSDlFN2S/KqbyKJKnf3xJ6KLeuAG
	 3xjaMCRzzCQGnLskabc8nAYbTTXZwAinY4Kpmgg/xmudOvnqGwYkXv+Xhyk4TV8Txt
	 GzQJvsDXEIEGK0Y8wgtWMN4WhXXehSPp+0kaiEjryN6AJVG8W0HLkpEyH1RXJ0Frxa
	 2WVij89GLHJ6w==
Date: Mon, 1 Sep 2025 16:36:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: s3c2410-usb: Drop entirely
 S3C2410
Message-ID: <175676261030.385621.4936391711475637356.robh@kernel.org>
References: <20250831122222.50332-3-krzysztof.kozlowski@linaro.org>
 <20250831122222.50332-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250831122222.50332-4-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_143652_848527_D4BE6F30 
X-CRM114-Status: GOOD (  11.20  )
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


On Sun, 31 Aug 2025 14:22:24 +0200, Krzysztof Kozlowski wrote:
> Samsung S3C24xx family of SoCs was removed the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of remaining S3C24xx compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. None
> ---
>  .../devicetree/bindings/usb/s3c2410-usb.txt   | 22 -------------------
>  1 file changed, 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/s3c2410-usb.txt
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


