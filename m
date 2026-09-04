Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E838C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 15:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARvk+jeiMUzyhbYcfXcJvSnOgQhd/AjgGwr4YyE7wU8=; b=4pEj0dBygnQecj6HNt9dWTZXgI
	I0wJaQymCjq7OvTVcwUK7uFzrENqOh5KrahANTwRaRY4sPhIRiTSZjguW+48FMPqMRFdR4m2w1SL9
	4HSdJdYsa2U36xCSCIQJPg8zJ/z1RJNwq/XPxW0VF0JQCWHdbsmKuyc15JBpL+d3x3g0TbWkojvWw
	eHQRBLtZIUBPHVDUxNgj0gRFFKnBaRFoZ1x/sE7eT02nlcbviOpFT6OQECrD9aTmdn6fj+ibfWovv
	V2Rxc612kCMuIQR2EAZWRDB0VJhQnVjnG0LgJ0C81nulQvfEwYWkyvP0bJzRgl6KhYpmhk8btee1B
	F1fFIT8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2VX5-00000002Tbn-0kId;
	Fri, 04 Sep 2026 15:08:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2VX3-00000002Tbc-2nWE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 15:08:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C170A601F0;
	Fri,  4 Sep 2026 15:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126D21F00A3D;
	Fri,  4 Sep 2026 15:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788534524;
	bh=ARvk+jeiMUzyhbYcfXcJvSnOgQhd/AjgGwr4YyE7wU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B2lE3+q1t75Z/keg6U27hOdQWvP8u0eogpLupMhpMzoGVnjHx1j+FvSgBJBLHMxvU
	 1yAWM9S66TtsB9Uo0fNgdOqQXfvtHEuf2Q61vVBofpp2AJSPa5A8DfOyS0tLBy+9tL
	 6gxfdxgbJ22F7GDTjyyMaErDk4ku3DpvY6Of8pRR5cmk0H4HVRX5FMZJBWJSTsW7tr
	 WL0p5Kn7roZ7Bq0MCy2dRY/S0SvDbBEjSjnapnCf7uDp9FumgaD5yuOwPOM+tSoyYR
	 cUkIBHFYt9cCCr4OflYzcY8E5vRikyHsvswoI3Sern0GLuRfpKIERUN6Bw7cKQRYPf
	 EfhuG+vuvVpOg==
From: Sven Peter <sven@kernel.org>
To: Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 0/3] Fix dt-style-check issues in Apple silicon multi die .dtsi
Date: Fri,  4 Sep 2026 17:08:27 +0200
Message-ID: <178853445265.30635.15460192495790532545.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903-apple-soc-multi-die-style-v1-0-eeb05ea0c187@jannau.net>
References: <20260903-apple-soc-multi-die-style-v1-0-eeb05ea0c187@jannau.net>
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

On Thu, 03 Sep 2026 15:59:31 +0200, Janne Grunau wrote:
> The MMIO nodes in t60{0x,2x,31}-{die0,dieX,nvme}.dtsi are indented by
> one level to signify that included at this level. This looks weird by
> itself and dt-style-check comaplains about it. This can be fixed by
> moving the referenced soc nodes into these .dtsi files. Since the parent
> soc node varies add a preprocessor define for them. The multi die .dtsi
> files already depend on the preprocessor. Suggested by Krzysztof
> Kozlowski in [1].
> 
> [...]

Applied to local tree (apple-soc/dt-7.4), thanks!

[1/3] arm64: dts: apple: Fix style issues for t600x multi die .dtsi
      https://github.com/AsahiLinux/linux/commit/7973168301e4
[2/3] arm64: dts: apple: Fix style issues for t602x multi die .dtsi
      https://github.com/AsahiLinux/linux/commit/dc0336fd26c4
[3/3] arm64: dts: apple: Fix style issues for t6031 multi die .dtsi
      https://github.com/AsahiLinux/linux/commit/f3f2d38a606e

Best regards,
-- 
Sven Peter <sven@kernel.org>


