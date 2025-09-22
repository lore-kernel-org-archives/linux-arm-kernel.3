Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D902CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 15:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFU+3WTepX+DzDUJeKQm8qVV1FJKax489i2OqeAtQzQ=; b=qL4UDOGrPuD175fYa/UbnpWqM9
	d9TWvO6PVxnXlti0CtiF0fNDOhOYf93PD6/PD/FUMR2bD9G1ql2HObtdj+ktXNMOX0/aNJ3TeKeZo
	upSufaQKCc3gVMBBI/c2Q0dUbQ6fOztNFTCIVWwZuAu6AWSaj4L9/ET1cnY6vmZ0SuH7WdefMqPhM
	jufBLV0//ItZfOHivTXgZZKg46+RPUKtT/r2f4HJa4G+a0TK6VzAl5Nb8MCL+Tbuhp8NmgVUqienx
	XK68FyljG16CWTYfEyfTPOrlYG6bo09C6AOPpK1BSuXu2SPgccSyVuBxXBN7hJ8buah+84z9Z+ooi
	1hjCVVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iYt-0000000ApM7-3oCY;
	Mon, 22 Sep 2025 15:34:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iYs-0000000ApLb-2EDp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 15:34:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2AA4601AA;
	Mon, 22 Sep 2025 15:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59471C4CEF0;
	Mon, 22 Sep 2025 15:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555281;
	bh=R9bSzvYDP/5lyTx6wb918b5EYWwUtu/KCM4x0gs1JpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j6fbJ745qj2IUxkZ27opt1+vjPQ7SQFxxhmoPFVaU5jGfJjjPbPIMMlFPGBg0HZfP
	 W7jhueujEPXhnHHI/FWvdDUQiXUZ66YxhwHLaeFKreZBW/+1KBcO1gc0USMl9xCal0
	 dMmiViT5yuMPxCe7pRuOhXHtsdrS/6vfdMUvvVb5KHnKlVn8cM7JQS80f7w4ZMA+d3
	 CerhBnikDUzwRiImlW7lV3UvEKcdiYFtL744PdLDsbxaYXgGB3W3eGg37xEFNCXOyz
	 kq2vw9I2eDtXwuqO9/2XcL4FksBAu/YdCi6E4Njp3B4FJrlUDtBsUFVJPhUq6dIs/S
	 qviOBOEEnQRfQ==
Date: Mon, 22 Sep 2025 10:34:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: mmc: samsung,exynos-dw-mshc: add
 specific compatible for exynos8890
Message-ID: <175855527966.4176202.14757582451293066589.robh@kernel.org>
References: <20250914131848.2622817-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914131848.2622817-1-ivo.ivanov.ivanov1@gmail.com>
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


On Sun, 14 Sep 2025 16:18:48 +0300, Ivaylo Ivanov wrote:
> Add samsung,exynos8890-dw-mshc-smu specific compatible to the bindings
> documentation. Since Samsung, as usual, likes reusing devices from older
> designs, use the samsung,exynos7-dw-mshc-smu compatible.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


