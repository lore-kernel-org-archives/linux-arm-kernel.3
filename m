Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CA1C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 06:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXSmEYs9TbtvGp/eM4EavpIH6gjJRcZp18E17KYaQ20=; b=QSvkPyepYORChHsYT6HOXuhfNn
	sePFb5wDdppHywdTbuttEiaePGxnom+TJEQL1pMcQXnnbg/WZxAPdbBIVpaYKRlzG4j7VmCrWAgDE
	Qs4ZRsEWeJOfhmrkVMqk6cl/Gz2q8oiTGRts+9i2yeOryO9Qs0qLakc64QW4xNUGpzzi+an483HfG
	7cuAKT8FwT5ynXeZAVX/K4Q9VXLTI8/jKh4JQc0n3z15Q9H4a4jlEcrl5o8GjtxKzfKQelwA8UYig
	7h8rFKX8E8sKpTH1ZWk2bsr4WZr81gTfM1R57R8gm6IjobgOwuitrKSzO/+MBw+guOqBjs4pbZ1zM
	EawCMh9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8NZ-000000015wH-46Uf;
	Tue, 04 Aug 2026 06:11:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8NY-000000015w6-44Y7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 06:11:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0961B600AE;
	Tue,  4 Aug 2026 06:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E004B1F000E9;
	Tue,  4 Aug 2026 06:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785823915;
	bh=PXSmEYs9TbtvGp/eM4EavpIH6gjJRcZp18E17KYaQ20=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=LZpCSM3RqZLgkfCU3TWvegvh/R7x1h7urJze+XOzns0XKzuNRnZNE+9ODkc50qZxD
	 FluRk1VqBz3CCawC4gviCbpkEyKSV52QaaqJcpJuO9APuHvw95Zog9faPEClMI0Jfz
	 3DdtQ9SCrbUWFEGvi2Vxo4cb5RQ8a5yHY2rWB1aj0iCaq7/cmssnCY5lICzmWRC2Ii
	 TKGw2efti4DhYvxeZ3MGi17W85MT2krtjUwb8JdAcakhByqzrqxmnFL/P/AAZc0sSk
	 9Cl3WtsvTThJzOhH5XC/AId3luPlIWj/aKA9i8aqlLsHSIciRjwsZ2zwE2gSpOb+r6
	 OZrGrJfx90u2Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260801210353.383880-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210353.383880-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: exynos: Correct white-space style
Message-Id: <178582391140.12883.16293784037220851134.b4-ty@b4>
Date: Tue, 04 Aug 2026 08:11:51 +0200
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


On Sat, 01 Aug 2026 23:03:54 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.

Applied, thanks!

[1/1] arm64: dts: exynos: Correct white-space style
      https://git.kernel.org/krzk/linux/c/db23b4aab4252f793d9fa97dc5d6f8d99c5e8e4b

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


