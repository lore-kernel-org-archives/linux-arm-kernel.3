Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ADF606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 12:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Oh8qa4C;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jLeQxq3E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Nl+iYw0LPM2qJU28izRxAhKGykaUojGg+hrj05SQt9U=; b=4Oh8qa4CebIgif
	BuiGQVw64AWwceR67PF7tMUwmJWOPGYT2M5yib+Y0YcK/uyLe9jp8Tadj8LnR8teTYZMTQ4xTQ4dV
	R89+LQHnFu2714IJ/IcXcAPYfUqoSRvsqrpnIV+vA0qiFbmVGpUCOeEZUWiNXv+9SrhVKGQ+cKaYZ
	JEPFwAI5yehGF+SbnpUu+bDuNQjynDL0SMUpg2vq07/4+bcHB3zOPO17SKJV8h4KXv/yiq8mTCis8
	BCKLtyvuRP5HJxkLsNNxIPjrMlfoiFxU6FxeoNmvSk4S3kusUUQXtTYlRluN8QnniLJDddY/ilorG
	I7WuiXszIDzEYllmb9Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2js-00000006xEK-2ijB;
	Wed, 28 Oct 2026 12:26:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2js-00000006xE8-0l5D;
	Wed, 28 Oct 2026 12:26:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E76840641;
	Wed, 28 Oct 2026 12:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600051F01825;
	Wed, 28 Oct 2026 12:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793190403;
	bh=Nl+iYw0LPM2qJU28izRxAhKGykaUojGg+hrj05SQt9U=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=jLeQxq3EqmL+ZNsfmLuHMmsN1JuAX12s1hPnPIUtQPcCE/fgCvuenF1ixwFcE+Z4+
	 ho986GAYvR5HYnui7EsPuaop4EYy7FXD9fbuGUhFnmgwXb79WhF8M5MoPPwGAfjEab
	 JJZLw65nAx+t1cvn5ehxXwua9GuxwV+/IZkv+D4wgY30mrflPkVr6vwxruMH2RRynl
	 8ZjlNVCy98eeVGXU6CrTwnMH6XqTNWEnyAmYVQgMhF/h9H44Y7HTQukupl/tqpnqa8
	 83zYBr4+HShtJvHctnPg4G2eF+usYH2Fi1eHl/UwTep5IFDLtIJ14q+6hL2O6MZPq2
	 STMM6eWnOjTTQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v14 3/3] phy: airoha: Add support for Airoha AN7581 USB
 PHY
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261006102937.10972-4-ansuelsmth@gmail.com>
References: <20261006102937.10972-1-ansuelsmth@gmail.com>
 <20261006102937.10972-4-ansuelsmth@gmail.com>
Date: Wed, 28 Oct 2026 17:56:33 +0530
Message-Id: <179319039371.10280.14715290131373013201.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=780; i=mani@kernel.org;
 h=from:subject:message-id; bh=RUJq/WI6WEMNCXi6b5aa8T8284lY0i6iVNFgZaShnUQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq4en9+TkdSNjyln2O384bRQmrJFULwYzDcjb20
 syO+Oz4QhWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauHp/QAKCRBVnxHm/pHO
 9ee0B/9ssp1IgWidAezyFy5oARkD3AhbfTvj4WeKvbmmWjFl2883kCyz7dufYdcl9YSsF1/xrPZ
 i6t5SXL9Ziyg6jkBUQr3LcaQJe82BYH+yBd6LjVnW8BG9O0NOp0uPMOoQJpBK97+N33ogZ/QP32
 PAaV1jtopZ4bdgfHFAM98LeB4D3fWYOTUVpjdWPBjyyWgMMAnx+0VTYi/jimn2iknJb4XaWgwFx
 huUEBKS2JhVloYMWRoVOi8XM5I+kAMsq5goQpHhjky5K4h4CL9XWP2/PLkyRMFtUk2Ep9zolHdv
 qLeYqhC2vtCrZkV7pY5khjwILt2ZnWLKp/sucJO7enlzidj3
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
> Add support for Airoha AN7581 USB PHY driver. AN7581 supports up to 2
> USB port with USB 2.0 mode always supported and USB 3.0 mode available
> only if the Serdes port is correctly configured for USB 3.0.
> 
> If the USB 3.0 mode is not configured, the modes needs to be also
> disabled in the xHCI node or the driver will report unsable clock and
> fail probe.
> 
> For USB 2.0 Slew Rate calibration, airoha,usb2-monitor-clk-sel is
> mandatory and is used to select the monitor clock for calibration.
> 
> Normally it's 1 for USB port 1 and 2 for USB port 2.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



