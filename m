Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA871C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 19:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxjXyQqeMw1J5Qloq0r9LKBH/PNw5/cyffxXlOaLX/0=; b=Jrt6ZwF2hKSEE0EtHUFdojvLKw
	5gaSLm75rqpKY92kj7U0+7m6rkvFzCJAEP+3RRrP72R1kn7sFXVFv2Oe0PgWSrbghnljFWg3nngOQ
	ALHS6tGEKg19xQ3L4gxTWTkf3xPMi+AFE/U4l6ZQj0Gu7eqgcw9kqcajlY9QYZUN/2yltmB4tAjs8
	FrwDZMjAJ4zQU/zJ4Pdm7fy8N1Qks/ePhvwlqFX/0Kg7dyMpOKRSZBTV+Pbl19Yo9AOyg+1dSXFQM
	B6/4DN4QIV+hLApJ/jHKyCnVYVcExgiZxGvmDPiNZFhmC/D6L564xRNtLlg8ysDVvZeeVKp8QXT9L
	o79N5FIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk71r-00000005mjo-4Avu;
	Mon, 17 Feb 2025 19:43:43 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk70P-00000005mXS-0kfR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 19:42:14 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=lV84h0Em5ss0x1cbUHkV9HfjfNbc7ITWw815Cn+d5bkyDMCBn1w8amYBUCiORLxa/A3A7DKFELl9AjTM2c56k8sRH0lTWKWVvPamC3tNTp4hN85EAzjX/X0Ljr3o0P6N6A1mQ8L/vqp6klsd57+6q4zo0dVvK5cJAxxG7PNyAJPsBPaNQMiTx/zeeEHWrMOzoCm1Ql30ALtXwiC0enryFJh6a8YVGHKL1iXeUbHTMXb1V3i4IBmEiJFvPiXe5WHDnpSFTwVgARsgcRjjcn1z7Nj0K8aK4ssNenRZntLdeJnhiPQSfT7JM34rBw6rRpZS0AQ3rUikmPAHlBvNL7jDMQ==; s=purelymail3; d=purelymail.com; v=1; bh=yYX/SR79Dqqvmyu22HwNz7TvqcDwF99ty5EMBfajVJ8=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1182872981;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 17 Feb 2025 19:41:34 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Feb 2025 20:41:32 +0100
Message-Id: <D7UZ6BSEU6DD.2QRKZBTKMPD9F@mentallysanemainliners.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>,
 <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH 0/2] watchdog: Exynos990 WDT enablement
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>, "Wim Van
 Sebroeck" <wim@linux-watchdog.org>, "Guenter Roeck" <linux@roeck-us.net>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
X-Mailer: aerc 0.20.0
References: <20250217-exynos990-wdt-v1-0-9b49df5256b0@mentallysanemainliners.org>
In-Reply-To: <20250217-exynos990-wdt-v1-0-9b49df5256b0@mentallysanemainliners.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_114213_701713_B87C2691 
X-CRM114-Status: GOOD (  12.17  )
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

On Mon Feb 17, 2025 at 8:05 PM CET, Igor Belwon wrote:
> Hi all!
> This series enables the two clusters of the Exynos990 watchdog timer
> to be used. Weirdly enough, this SoC is missing the cl1 cluster, it has
> the cl0 cluster and then jumps over to cl2. As such, new cluster index
> code has been added to accomodate this oddity.
>
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
> Igor Belwon (2):
>       dt-bindings: watchdog: samsung-wdt: Add exynos990-wdt compatible
>       watchdog: s3c2410_wdt: Add exynos990-wdt compatible data
>
>  .../devicetree/bindings/watchdog/samsung-wdt.yaml  |  9 +++--
>  drivers/watchdog/s3c2410_wdt.c                     | 39 ++++++++++++++++=
+++++-
>  2 files changed, 44 insertions(+), 4 deletions(-)
> ---
> base-commit: 253c82b3a2cec22bf9db65645f934fbe095899a3
> change-id: 20250217-exynos990-wdt-0e9100ec5f99
>
> Best regards,

Please ignore this patchset. I did not test the bindings with my device
tree changes - as such, I did not account for the cluster-index being
more than 1. I will send a fixed v2 shortly. My apologies.

