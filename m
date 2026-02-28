Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE425FEE4ED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 14:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMh8c+ggoIPUI/l9GdwHfBAeSvb2X4JRqC6Enzr5e/E=; b=pYBsJCLJlh89d6FLgbGryDJd+p
	/HOgDojqLOkJn5F/DZXJQ8vhIBU/6BtsUAQmZFWiGdHMx/hGBOS6ZgOhfO18WWjFwMnqvTwVdeZb5
	1LSaOy6hD6cfRXRGSo/0x1ErdhJOp1A5evhfsWub/0tSn6cOl3Bn8D+8bqnO4+x9KPzfPsjr/25fb
	MgenfBrtlmAKIfvM0rY7pog+LC2FQxFVR4kHu9p9qmijVH+k/XeLS7xTDaErYtOe2X1JrWuL3SHfq
	nNbHOlyP8YFYqhpnmVUUCmuYX2RvieL7PEE8ZwhUwySlwjTOtrIG5pvtpI9Z0+DMgjnU2aQqEdp+M
	a5w/dS3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwLYB-00000009wBt-1wTA;
	Sat, 28 Feb 2026 14:44:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwLYA-00000009wBb-3NDS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 14:44:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4027261118;
	Sat, 28 Feb 2026 14:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7183EC116D0;
	Sat, 28 Feb 2026 14:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772289849;
	bh=D/V84I++CGPRixWIXwRVaJCeGB1kFgaeefcBrnaxXbc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JTzS4eT4U0jWAF2K11CNh4YnEC05Z7K6olSpRD6JEY30iEu1SKCp9hdx8CKifmnqn
	 ttgMF/+4HmKLPIehW8mb5y3zk6KM1t0+mrx0cC6sdbAQDxHZLcvMlJXLhqHyoXwezx
	 R8Fu6wuSe/mT/AcGoa3U1vo/EsRGH1m8pLue6Yn1mh3kf5IV7db/XuRt5E9F8wX0oR
	 y6vMpxFAIHuw8SR2kaGTaa9bAdMyKiAPktFVODQoQJQj9OtVkJo0TYG0dFb9zTXpqg
	 8dlc3SS01/0DhI9kL7YUTkExxVwJT2fzeau7VdmAMNS/Bteo1JsgwhEZHYMlrW94El
	 yO1Im9g2XlPkw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260210-s2mpg1x-regulators-dts-v2-1-68783c9e0a32@linaro.org>
References: <20260210-s2mpg1x-regulators-dts-v2-1-68783c9e0a32@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: exynos: gs101-pixel: add all S2MPG1x
 regulators
Message-Id: <177228984717.54920.3352980611735084045.b4-ty@kernel.org>
Date: Sat, 28 Feb 2026 15:44:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
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


On Tue, 10 Feb 2026 11:30:43 +0000, André Draszik wrote:
> Most rails are the same between Pixel 6 and Pro, with the following
> differences:
>     * only Pro has UWB
>     * Pro uses l2m, not l14m, for TCXO
>     * Pro uses bucka, not l31m, for NFC
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos: gs101-pixel: add all S2MPG1x regulators
      https://git.kernel.org/krzk/linux/c/862529843fb0de9b007a9423996d4cfe19cea883

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


