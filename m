Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E4EF483E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAqS21j+dgn3eq5TXshYqvdvTfTq623T+A9lnyLaExQ=; b=sPbze0L8ZBdzdo4fYstA6m79BL
	W91HqHoZJqs+W0pfc5PMZUA9JP6ICHM/OMS6d3bA6kpU72r0h/6ZVjO13sFSJXboGTrajlIbIg/ys
	47FrmjR74Y09wWR/OELzojo7byvcwJdDtu8F66fxweWxDgQ0noqaxj7KYGAC52dkJ1cK9W+ihqZIZ
	9WdUptWMnX59e1gWvEPsiX6VaCcmHsxVY67FgqxalHvfgRCJQpArGagaRVw6WtjtqnHRNYOQia1jA
	VAmIKJ2t1iJjjUkD9lv9wYFlfNgKSLaxIE6S3Jl86sjBrmqxIUWDbLHvrlXbxIBKElzShQ4q0Rm7t
	iTVQq5Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kl6-0000000HRGS-3QAM;
	Mon, 23 Mar 2026 19:16:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kl5-0000000HRFy-3uKF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 19:16:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 51C22600AC;
	Mon, 23 Mar 2026 19:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF47C4CEF7;
	Mon, 23 Mar 2026 19:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774293375;
	bh=1nF+saa90o7U+gCHf9BeJ9mw/K1YHlF0/VNjlIghgx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WAbsMxnGX6XhQ6Gt8uhiEP+Sqq+4tsZmBGMYHL7dgJVzURomVB0k5/0xkKvMuUe/W
	 JefAmj5rYWkqvjA+WKe0Y0xqqO2ZwpriXJIfBLrzkmLbDieSO6lPU4rokKsOzsNfqi
	 LPh2+X2eM3A1/D/7Pdcsa+uqogHfn3mvU3TjU5f+uaiTNoQGvHfqflJwxXawdCS/up
	 h4uwsPMaXY86j2wL21GVoQPnBzlm7ktQmYKvxnBHsooFLVKhaE2SwKKbV//p8xgkrA
	 VzNA+rcSOpUuip1FKyuOs+SCYfg6b9sN4aZtS5wFFTGpnjDzPsAY9/B/cwt5g1Iphm
	 4dFUDAnZY7e/g==
Date: Mon, 23 Mar 2026 14:16:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 2/4] dt-bindings: remoteproc: imx-rproc: Support i.MX94
Message-ID: <177429337280.1109099.6895391728397977603.robh@kernel.org>
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
 <20260312-imx943-rproc-v1-2-3e66596592a8@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-imx943-rproc-v1-2-3e66596592a8@nxp.com>
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


On Thu, 12 Mar 2026 20:36:57 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add compatible string for:
>  Cortex-M7 core[0,1] in i.MX94
>  Cortex-M33 Sync core in i.MX94
> 
> To i.MX94, Cortex-M7 core0 and core1 have different memory view from
> Cortex-A55 core, so different compatible string is used.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


