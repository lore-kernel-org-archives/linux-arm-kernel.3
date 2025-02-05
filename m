Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE80BC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 08:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hlEcY6wI7Tid0SbWbmHdCLX6bWZroYsN/XVC0Gjrk6c=; b=KINkOCb/UNw9D3du7H/gTiNdpr
	/PpJgeUmxxhi9+JPjpyQuLbyVYfIvhOZ6+ElAyavMEikpzlggU/hU8aK8Wf+AePYmFSbyov7/yDo+
	GnrpoB8dC895YSuhQkdIFQKQNi+cz6x8CLK/jVW5+WV0C0IQVykSb6pgZ3QD5wHmLIaYky5h7DEY/
	Jw/Ev/Rzk1UXkWe/1pGo3mLri39Tdc8v8t5u+ch0hltqChkItuBwvsOErYrwriT0rKTmIhtPoyXDk
	j1Utjy7n/tGe1PcRpta2drpxtpHbQ5sIbmTMDrNn/JJn/s+FqXD3JsOAi6g7C545F+sV8Ei4KoUfs
	deXXF5fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfan9-00000002aIv-36GD;
	Wed, 05 Feb 2025 08:29:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfakY-00000002Zxw-28Db
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 08:27:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 38BAA5C5418;
	Wed,  5 Feb 2025 08:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4F5C4CED1;
	Wed,  5 Feb 2025 08:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738744029;
	bh=ETR1Agu6oBr3w2SdxuurAFr3g4zECpbf/Tkpdskw4tE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UEWO9RyE/R9jqBKyZtYZct+PYNR+BH5fYijbI/Uv3FBjxsYxMKVXgjxIO/yqNyTVI
	 Ee5EK9mjELYpl6QNHvYCQC0PB8X/Jd0UQamWIxbiJMxxSsbKk1+LvblycBXeX0eneV
	 yNpY+7Sl62yZRGh2un2w2lOXUBO5Ks2lp98Wzt4er2HiNXx3DUasgNL/qBOSx5POFb
	 IIFKIarNHy76uzvFMY/GofiNj2S9EbnNK/v1hbBr0R3EFI+eiV81xG9qHTo2tsXoPr
	 rPbiSklTLypnhYBGrTUk131A+cqdgRgWB3Rsi6Xoq6iPhu3wnUPKgv9FB5hILNSnmX
	 sFCXCjtVqdeBg==
Date: Wed, 5 Feb 2025 09:27:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sergey Lisov <sleirsgoevy@gmail.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: i2c: exynos5: add exynos7870-hsi2c
 compatible
Message-ID: <20250205-succinct-ammonite-of-agility-4c3bbb@krzk-bin>
References: <20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org>
 <20250204-exynos7870-i2c-v1-2-63d67871ab7e@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-i2c-v1-2-63d67871ab7e@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_002710_604320_31EE6A9C 
X-CRM114-Status: UNSURE (   8.88  )
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

On Tue, Feb 04, 2025 at 02:03:33AM +0530, Kaustabh Chakraborty wrote:
> Exynos7870's HS-I2C controllers are entirely compatible with
> samsung,exynos7-hsi2c. Document Exynos7870's HS-I2C compatible string
> appropriately.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


