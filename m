Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0ECCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 19:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoZk3LG8MJPhAcqQxCeOJQGD1MdGR/TjDFzUla+aVVc=; b=himflZASDWCgjvlkQoYFL6rOBP
	t86VXEoUx1f7RDGHglhGBkjXSucFgSK3Ou5CX7c5qaakwzs/pvwzSIjUGTz30ZzUrEqU0dkSwLJ/o
	nlSsKKwuav7HbZkR26TPPk/MiFBiH0Is2NjE1OAE+L8OLp1fwtFHEsi/Dk/IuB0MsvqzFc+TZANEy
	1IcdyDV/8gbKssj6QqDsU2salQyCfvnXgEgen6V9/o5R8hMyZHfsqbr1MyPC5VDRAKGKrkStWBMEF
	i0CGx9Oy4vvRNAOxr11C+xtbcyXt0vsnhsIgMhKuPPVZPKurh/4vDCD8Ut30mlFr+u8vbcN4znc2L
	ZWjjupfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzK6l-00000000yMl-3tUC;
	Thu, 18 Sep 2025 19:15:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzK6k-00000000yMe-3wcP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 19:15:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10AAF601A4;
	Thu, 18 Sep 2025 19:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9411CC4CEE7;
	Thu, 18 Sep 2025 19:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758222953;
	bh=MdXdHMNG/Jg1OzCMhQMXRrx24VoocLdYQOqhwxpuULE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kYVU55zs4hkC0IeLxrSCXai8GQ+OH0tC/ZBFvqF2f4G5dJq7OjO+PTKHdZnQdy0h5
	 60FBeFjV4pxaEerauQNCoRGb21SUvTPOp8pvrOK8Uf+GRVjDppC16C60+vWipo2QGP
	 w9zHdN9+YtfAxctXIVs3WSBsF9SzRtW4jQqLPWuO0WZnWxksvPSo8Lgn3Wfc7eOGFw
	 ilbmP8c1QQy9JYTDcwOksZkB0hHpFyDbqoyeSqE4TN0ixlP8mwke+AqC1yTKag7y1n
	 L4NNHvel6qjqdx5fek6neWyO6AWz82ZZMT2LgUQfEA6qiLmucrGZ3XT2j9OGXs7JAH
	 KxuGhcSMTn0Mg==
From: Sven Peter <sven@kernel.org>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Marc Zyngier <maz@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/6] arm64: Add initial device trees for Apple M2 Pro/Max/Ultra devices
Date: Thu, 18 Sep 2025 21:15:36 +0200
Message-Id: <175822291278.28444.14875676651074123815.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250914-dt-apple-t6020-v2-0-1a738a98bb43@jannau.net>
References: <20250914-dt-apple-t6020-v2-0-1a738a98bb43@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Sun, 14 Sep 2025 21:38:43 +0200, Janne Grunau wrote:
> This series adds device trees for Apple's M2 Pro, Max and Ultra based
> devices. The M2 Pro (t6020), M2 Max (t6021) and M2 Ultra (t6022) SoCs
> follow design of the t600x family so copy the structure of SoC *.dtsi
> files.
> 
> t6020 is a cut-down version of t6021, so the former just includes the
> latter and disables the missing bits.
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (asahi-soc/for-next), thanks!

[1/6] dt-bindings: arm: apple: Add t6020x compatibles
      https://github.com/AsahiLinux/linux/commit/28f94ed138c3
[2/6] arm64: dts: apple: Add ethernet0 alias for J375 template
      https://github.com/AsahiLinux/linux/commit/6313115c55f4
[3/6] arm64: dts: apple: Add initial t6020/t6021/t6022 DTs
      https://github.com/AsahiLinux/linux/commit/a8f20eb60788
[4/6] arm64: dts: apple: Add J414 and J416 Macbook Pro device trees
      https://github.com/AsahiLinux/linux/commit/44a952585b4b
[5/6] arm64: dts: apple: Add J474s, J475c and J475d device trees
      https://github.com/AsahiLinux/linux/commit/9da45d978ccb
[6/6] arm64: dts: apple: Add J180d (Mac Pro, M2 Ultra, 2023) device tree
      https://github.com/AsahiLinux/linux/commit/637f7d2c731f

Best regards,
-- 
Sven Peter <sven@kernel.org>


