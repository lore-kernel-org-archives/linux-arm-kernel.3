Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C68E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 07:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/i0gCRzDaXGtYYVv2Zxs38lN7Aca/FNPAhgbOuZpcI=; b=ozZhDoZPLBQKXv4hebNBTy1Ybs
	I+WGrZsbAkl42CUrljer4K4+FWdc1syvh7xppZe/0ko+4RzFbzYQ9aBKSYjvE0JTMyfuqQHP95aRt
	WBYlhoLCdQMU80y7Bsmj5V5fLuTS+7d8FwCUeDSLBnlIEZcl3zX5ARWFelvH6TwLXD9hmq5Wdq8az
	o4DUQv790XOW652IHPlZCT6+OBZoVgp8FMS42jyj20vTY3sSEGFoX8sN4btKchj80/fMzUV70yrOL
	3l2BEbrIAlEpKD4Vk6EdgapehNKulDQdWT4sAN3YngXJGibcgCam6OPi0z3GhO+9XJgn4BMCFDd/+
	pVaMTJJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXbU6-00000007hYm-1CxZ;
	Tue, 14 Jan 2025 07:37:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXbSS-00000007hHO-02sS;
	Tue, 14 Jan 2025 07:35:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F0A33A40C1C;
	Tue, 14 Jan 2025 07:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26087C4CEDD;
	Tue, 14 Jan 2025 07:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736840126;
	bh=S/i0gCRzDaXGtYYVv2Zxs38lN7Aca/FNPAhgbOuZpcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZzyJLMNrSRaugcJCsl3kfLwZt9sLPftx/4pvZU6DN7PXFeV3VK45p20hjIknYeaJR
	 H44TpgKO5fP7X+qfTVs8keL5stccEHZvafwBTYxpFI1Ot4OwY+hKrXN+IoMApiALrc
	 froj+V6cNMOQ1dd47G6Sqn2q0lPbfiC+1PZmxQfHTTGMfRiAxuaUsWZL3fnHVsyxI8
	 GjQpe7oZGtPn0zIRO6kTI4GDYLBfp21fiS+71JNQM7KZ5e6yjZxL5dI3koUHEDOcZc
	 vuZ2BKtc6ledBSrddgHbVMKITz6V6ONzGSgNzqbFkpv0l+k78EqHZbJUvMbTUuvhE6
	 nFx11iFlG/uQg==
Date: Tue, 14 Jan 2025 08:35:23 +0100
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
Subject: Re: [PATCH 6/7] arm64: defconfig: Add M31 eUSB2 PHY config
Message-ID: <7vsuyuig7p2xojx5hwnqq3wvkptd6yp4jqnckbrjohajtghyy2@koqdxx373ttc>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-6-09afe1dc2524@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_usb_master-v1-6-09afe1dc2524@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_233528_112322_50B635D1 
X-CRM114-Status: UNSURE (   6.08  )
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

On Mon, Jan 13, 2025 at 01:52:12PM -0800, Melody Olvera wrote:
> Add configs for the M31 eUSB2 PHY for SM8750 USB.

What is SM8750? Which company? Which board needs it? That's a defconfig
for all platforms, not only for your SoC.

Best regards,
Krzysztof


