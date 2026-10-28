Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09916606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 12:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GNz/Qrw2;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R7QsyzZX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cVPfinBcqbOTfVLlNcyfK95ZPjIWvy4g7kt54rOT7UQ=; b=GNz/Qrw2f3WBVE
	IwP4/ATT+70F8Cg+XexQ1TX1h3MrmkFRcUJcKhC6tZCMelkfAakCVWo5dWpIZSjoM5DayOOlUWV0r
	SFPYU2ItABQHf8ls9PAaugQue35aDM+WDLNv2Ghu25r96cbU9/Rm6QpTQD9O0sFuQuaCudTfkdYgC
	EfkiDRmtLnHoba6L57MVG3XD+ofwglmcdDh+3nKg7XAX+hga9h+kmo+MzgUZv8sliPpkoshfd82Uq
	mLWQ8ff/1hZuNGypYYWHMpWMnWEId2kOMpKXqfU39TnvtW+WfvoHXmMw8uaqmwXTfPpSTRpibE7ES
	B77NSM/keTTHCViWQKUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2hF-00000006wv5-2pOI;
	Wed, 28 Oct 2026 12:24:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2hE-00000006wuk-1zz3;
	Wed, 28 Oct 2026 12:24:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C990601FE;
	Wed, 28 Oct 2026 12:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C2F1F01825;
	Wed, 28 Oct 2026 12:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793190239;
	bh=cVPfinBcqbOTfVLlNcyfK95ZPjIWvy4g7kt54rOT7UQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=R7QsyzZXVOBspXAzif+Uty1yaR7OocO1eksw27ZhIaRbw/zacVji13CDlOTud6Swz
	 U2Pr9SoeMIodt6hlwTKc23qnEot+1Xf+3Fpmqs2sc0x+gAy06cQPwl6HX50O//Vwg0
	 JfeUTjqUb6rRdtqKeiyFtt6jrxr2rPqr+7BpvOubiYfbBNjj4q1AQgL3IVswavsSPa
	 uVG9pyHRrxOYa6AUoIOQF7N8VrJo7GhhRsf5VfthPgerxVv7Az9UBhLHjeT4p7vif6
	 G1sW7qs05H+nVGh2G8fnJ5PUmtl5GjcNwmlcRVNtpupitI1FhE4sJq0eEI4OVZNEUH
	 QK71F8+3qDytA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v14 2/3] phy: move and rename Airoha PCIe PHY driver to
 dedicated directory
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261006102937.10972-3-ansuelsmth@gmail.com>
References: <20261006102937.10972-1-ansuelsmth@gmail.com>
 <20261006102937.10972-3-ansuelsmth@gmail.com>
Date: Wed, 28 Oct 2026 17:53:46 +0530
Message-Id: <179319022610.10280.5883386163307156406.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=906; i=mani@kernel.org;
 h=from:subject:message-id; bh=Mff5QIqkdgNj/liBi+gaY4m1v9rfasm070afTA3Ry+Q=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq4elVXqDJm3di9PWM5V1+d6+9zjcjgs05/y0rW
 f5QcVFPU3mJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauHpVQAKCRBVnxHm/pHO
 9dN9B/wNOCkrjfY+pJYF9ctJ4uUInfPKV3MX7T2VRidZvY7axyDCyG/TuaH5jj+U+zn17S+ed2D
 xMfyNmPCL/+qG0lSSQgF3Tlh5p9D+nbMjFxaLX1UEFfLs9gJ+pib/zWf3vi+J6utQoiP3+91duI
 d0PPqg+eSkmmiwT/JT4QJgTyHNmK1+LqZkqMEna3M2eQMBp3iP2k2EAZpI8z6hFtxZIlfuQNxit
 YOSAkV1FLgYyo1L11INZq6/x1Fef/8SCrnZwSNxIJoVHB8Be2Lo525o2WkWPWbBxh5rnQZ57/cZ
 99+0vgb7oSfJaqckRYvXnJzNDZmg4c9sBY169YOmxSzpiONy
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-06 12:29 +0200, Christian Marangi wrote:
> To keep the generic PHY directory tidy, move the PCIe PHY driver for
> Airoha AN7581 SoC to a dedicated directory.
> 
> Also rename the driver and add the relevant SoC name to the .c and .h
> file in preparation for support of PCIe and USB PHY driver for Airoha
> AN7583 SoC that use a completely different implementation and
> calibration for PHYs and will have their own dedicated drivers.
> 
> The rename permits to better identify the specific usage of the driver
> in the future once the airoha PHY directory will have multiple driver
> for multiple SoC.
> 
> The config is changed from PHY_AIROHA_PCIE to PHY_AIROHA_AN7581_PCIE.
> 
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


