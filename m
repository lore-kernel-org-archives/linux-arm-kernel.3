Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB558C9831F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 20:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlT6zjYynKmXd+lhEZPBZmKaApaIb7Mj9xPaX4dJNTQ=; b=Ua8Ar+huPujeeD3SkXxBFdgLFH
	QnWjRLB4xdS7IzUtCh3GFOK56MLmsyMy1uWI0i+CQc5nXDCe2qnBkV6ij0M1E+a8AHyf7UHrSvlH4
	CVYy+dBoI4IYsRtEfj0x9WN6CIX0f+WD/qgUEe3b1EgqRhGuDhdk6AbhfAGC2fneJ3LKEQe8mbIOv
	QqqGPCbIjSBIR33cC6tIIdr1p2cGbvdnuuvn6gkGe7+FKYPb2aN6ZzVnLCN9BSDUMUm37Xg5X9w8j
	4+GiZ5lmndmEiUybGknD49OxBBg4nAOzvhOeDVNcNVX421NJotImmH3OQO/Fs3ARQz+CvoCnNbadi
	quUpTbJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9puq-0000000C7qq-3Ham;
	Thu, 24 Sep 2026 20:19:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pup-0000000C7qh-1eoq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 20:19:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D595F408FE;
	Thu, 24 Sep 2026 20:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5070B1F000FF;
	Thu, 24 Sep 2026 20:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790281174;
	bh=XlT6zjYynKmXd+lhEZPBZmKaApaIb7Mj9xPaX4dJNTQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aol5CJRJUOPjv2DedekKsGHEioDBF0q5yA/09UyY1QbBsl4w4fvrcXWTnl8fOgaI2
	 V3z1fr2mrRRwtLcV07lf4ataUcxXxWpsw3zX1d0nRcDQel6C8JChK/u3ub1qPe8f2w
	 t15VYRXV2gtIHo5XtbiKXmmkUHwsvKe9mD0lavHrSJ3Mge80qJWo1j8oCkWATO2PFd
	 CxA+HYlPyBZn0EQnaoGa38tC9fxsnPY79UneJVp/uGTPuLxp3v2bOL7OqlqBfTDWGk
	 ZADrnTpTbMfJWs60PPqPcypzTF9kPiYnN6ggVs+cYHSn9zo1N7tlwcaKT+1jOBmpiz
	 ZhJv+W6FH87FQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Amit Sunil Dhamne <amitsd@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260919-max77759-charger-dts-v3-1-78b68fbf7d4a@google.com>
References: <20260919-max77759-charger-dts-v3-1-78b68fbf7d4a@google.com>
Subject: Re: [PATCH v3] arm64: dts: exynos: gs101-pixel-common: add supply
 and regulator properties
Message-Id: <179028117091.127367.16717014077324931001.b4-ty@b4>
Date: Thu, 24 Sep 2026 22:19:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Sat, 19 Sep 2026 01:04:10 +0000, Amit Sunil Dhamne wrote:
> Add power supply and regulator properties to the MAX77759 pmic. The
> usb-typec device will reference the regulator provided by the pmic as
> it supplies vbus to the typec device when operating in source mode.
> 
> Additionally, describe the charging path as well. The pmic draws its
> input from the Type-C port and in turn charges the battery that the
> fuel gauge measures, which gives the full ladder:
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos: gs101-pixel-common: add supply and regulator properties
      https://git.kernel.org/krzk/linux/c/3653ea2aa0a212677569a98cfccc183ba2c890cc

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


