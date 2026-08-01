Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50296C55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 15:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TUxPEWrqAyYmq7zFGTqdRtbt1fv1bsVlvA2fjtBvgM=; b=yVSSBNHu+366JFx9onBK+nyRED
	+4/+ccS5iwjCtqYz1yDoPac48gn9aU33Fyip35VylSibsQml8kDG/IL1lVP9KLXjl3C0kE/RhqwM8
	dy4K+O75CH3CPT9FePek2jT0PavQoMpx1+1oZ59BZbNDSJnW5Tcd3+qR6J3bKPd3UMgU9QvIH9/A1
	L5rAa943sOzZfaKRhtTpYhUXAbp05rnYWFmPpEEB33IT9l/+q2VonioQJ8QT/y8Y90bvJjJshrNN8
	uB3wjQoS/hQB/S9s+SZ2JKLRHzsTmy73EretpjY6hmousRGrrOxZPPU8YhMYIalgVoNLwTrD62qMa
	IHtXeqoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBON-0000000En4v-2Nci;
	Sat, 01 Aug 2026 15:12:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBOM-0000000En4O-0SVs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 15:12:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F784600BB;
	Sat,  1 Aug 2026 15:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2EBA1F00ACA;
	Sat,  1 Aug 2026 15:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785597169;
	bh=3TUxPEWrqAyYmq7zFGTqdRtbt1fv1bsVlvA2fjtBvgM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=C/ZBUik52fHm3Orq7L/Xpkfe8YUXMlFUYG/n3vEHsqXqjY3vTpSGdfPUMsjpUc6Q+
	 5p/GxryYxWmGJygkGLHCgW9n8svLdPRt8R1/3F4hh7DsK5fBVxPW7SdxpU7aE3QEv8
	 E6CH69J6WfRvNcXFMdAjU9EvWIpiBkdF3g26GZqpPTQdLXTlnbPdtJQKU57EBEJxDB
	 InJnwkJf0Iz/j7FibM3j0t5zNaiz9VQFA7nwqEPxwQdSe32j94zZt7JTac/nVu6OYD
	 DOyHRNKlvQwgaEfiObso2+9cR2oLIB/rkeNZb9qEpJuqq7Cn2QSsD7zeQaSxA0kpug
	 1N9NuoVQKKOew==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-fsd@tesla.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/8] arm64: dts: exynos/google/fsd: Trivial
 white-space changes to adjust to DTS coding style
Message-Id: <178559716446.66839.1421213254356516336.b4-ty@b4>
Date: Sat, 01 Aug 2026 17:12:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
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


On Sat, 01 Aug 2026 17:06:55 +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Fix stray blank line
> - Collect tags
> 
> Fix a few obvious dt-check-style strict warnings.  No functional impact.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied, thanks!

[1/8] arm64: dts: exynos: Move 'status' to the end to match coding style
      https://git.kernel.org/krzk/linux/c/bf1aee1ad1c087ffda617207890dc92042a28c96
[2/8] arm64: dts: exynos: Align continued properties and add missing blank lines
      https://git.kernel.org/krzk/linux/c/873fa6bd9a4f735575cd46a2824e0f0a454d8779
[3/8] arm64: dts: exynos5433: Override thermal zones by phandle
      https://git.kernel.org/krzk/linux/c/b9014d9fb72b890254ff99b6b1d1c8a0f31ad9cb
[4/8] arm64: dts: exynos: Re-order clocks and align continued properties
      https://git.kernel.org/krzk/linux/c/5128b3fbfbcabd55ca7a53f8a6182683287e28aa
[5/8] arm64: dts: google: Move 'status' to the end to match coding style
      https://git.kernel.org/krzk/linux/c/56bca5626deb478ecb8d3981f415737557701327
[6/8] arm64: dts: google: Align continued properties and add missing blank lines
      https://git.kernel.org/krzk/linux/c/483e4332596477e3f4b6032a6f1fc2d2db668890
[7/8] arm64: dts: fsd: Move 'status' to the end to match coding style
      https://git.kernel.org/krzk/linux/c/8356e0bc0e0b1f9c889dbcdd57f241b61c394fc3
[8/8] arm64: dts: fsd: Align continued properties and add missing blank lines
      https://git.kernel.org/krzk/linux/c/302937941c38b0e46c61ff5c77dd26d1ecaed524

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


