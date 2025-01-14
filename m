Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C65AC02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 07:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKSqg32KlA7HBFF3dCwKwfQdiTkObRaYO4p7SjbEM40=; b=vPCo6gLvW9hnwwwom9hJQK4thK
	PwFIstHHj2UqDhjuxUdfA220w/kRC2aJ68QQw4Goy69fxgz1D6CzDaeHPDWLkXXb1oses03qRFiXZ
	yOQyYhCYwwDzQ5hd+4l55UJZqvEEYCxr+kxs9/Do9Hjp9RJfexLEttpJe+uyHrT1f3v+/XQNQXf4M
	QIr2bh1mpwyHY5Qjy0lFUfi1LM3tavqCG713rzHmzyqtuFVS9fkOsTgh5RyL0+mcMJrSiaAmPWE6r
	9kIdtQ0L9nVfdaqO+fB9gVEWaIwZYEjIGVpxKak+U+9t1enRNdRMXux1fuLXn8yD7hGNSjub/Qx2t
	XPggWE+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXbNE-00000007gKK-1n6f;
	Tue, 14 Jan 2025 07:30:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXbLV-00000007fmS-47v0;
	Tue, 14 Jan 2025 07:28:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 13513A40807;
	Tue, 14 Jan 2025 07:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247D6C4CEDF;
	Tue, 14 Jan 2025 07:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736839696;
	bh=+XR/a+ADO7ckXyAl949/cflRubrUalFmRFFORbd1wek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qV3iz51kMcPnWT/z+AC7i88zIyHVY5x/tLrlVI+biUjYrUEvrHg1EFTVLOgNqn5ao
	 VagSclC2vJWNx95o/vcsI28qnL207cQpk37dWdOpCNhDO06dHSRc3g1VcDwwPd39wO
	 U+7XhxQuu83S6zIt+LfB+lPOT8XoOr1WT27IGhyDNqA2oGsvZ2KoldHd1xoqvXiOcw
	 A/l7QmOZhxrskE6ZyTVd3FUiG1ijiuMK/Ip0DvPqTo0w7ZfMElvzRGrt3EotbXebB2
	 aJzTWcm3gaD8LJx2fHucPWUMfU2mTPlbKF29XbCJ3V9F9EEI5UVDkFlO1Hw4kWraUU
	 gaPnRMaWCYGSQ==
Date: Tue, 14 Jan 2025 08:28:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add
 SM8750 to QMP PHY
Message-ID: <oosxr4qv4uesvikfm5xkqwqurs5xm4oji2dksdz4yzkwroucix@wqmljdzdujbi>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-1-09afe1dc2524@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_usb_master-v1-1-09afe1dc2524@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_232818_084264_9C9EB5DA 
X-CRM114-Status: UNSURE (   7.94  )
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

On Mon, Jan 13, 2025 at 01:52:07PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add an entry to the compatible field for SM8750 for the QMP combo PHY.
> This handles the USB3 path for SM8750.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


