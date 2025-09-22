Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99658CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 17:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYHdzbBtkvmEvyxabx8Jroqrgrh+LxldoB+7GCdGZIg=; b=JpSYLBi4orcPir69Nd2CdwUzXY
	Y7XopS7icg5f6i0Ok8HW3O6h9jncSWVV6t+WfrTkovS8v/CXPVI3QzyCvC2js0c79YAMukktjMKL8
	lAmwt6xi07ukVhtjMJRN7t9WTWEqdMumBLqcNrTNbbYlEgAMNSP8LTSSrFRYxpv3KsNjaW21zhyQX
	kNaXrpzfBkcXb28zKJ/PiokJYf0aicItCXlo/2ifaI3UFcAnsqyNMbKogE8fL68W1IbGhp7+gGJOX
	vqsVkD+/0CdhJ7IJHY9g1xYI7SZggS22VYOEvoUdY2F1EKTrdM7fe31lVoauha4aK9mzasF27JbWl
	GtexKCVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0k8Y-0000000B5FX-2Sc6;
	Mon, 22 Sep 2025 17:15:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0k8V-0000000B5Ev-3nEJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 17:15:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E69F143735;
	Mon, 22 Sep 2025 17:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F57C4CEF0;
	Mon, 22 Sep 2025 17:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758561333;
	bh=wEqeJMpLqHGZi/PwQq3I0CMJUgwHE876L0rlZKPKAWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tVYEwB6InMpqho4Kzzgk+MrzSQHBlHhdqSrn1u+oZBetxHLvnwS3OgmP69Xmkzsew
	 regeqbxCKfKK3Mrp3XtsNbBC8GB1g6LwxjWeyjnnxEw81y+GbTeXK4BigVT5viEe56
	 4EfwO4xJLlKFTfvM9VpdKGiUlb5UVcygRh+t86GNwQFzft7DmbHNrhgnhgOdo6uEYa
	 8bFY3YSL93oTtkGUsLtSdomTycL+eGVSRM39Pf1CQMgb5b2qztPSPVwVrPCN2IASzU
	 k2qQA3hctAmmbxqrmCIhUjL8MN9yuAq/MDolVv7pR6RnpXIdwSIaMxxGye9I0m+ckJ
	 gC7b1EyjtExbA==
Date: Mon, 22 Sep 2025 12:15:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: soc: samsung: exynos-sysreg: Add
 Exynos990 PERIC0/1 compatibles
Message-ID: <175856133245.488468.16132364519443523320.robh@kernel.org>
References: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
 <20250917-perics-add-usinodes-v3-1-a3629e4666ef@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-perics-add-usinodes-v3-1-a3629e4666ef@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_101535_963042_7BC2E824 
X-CRM114-Status: UNSURE (   9.33  )
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


On Wed, 17 Sep 2025 21:04:21 +0000, Denzeel Oliva wrote:
> Add compatible strings for Exynos990 PERIC0 and PERIC1 system register
> controllers.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml        | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


