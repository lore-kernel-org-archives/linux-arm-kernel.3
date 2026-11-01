Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F134606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 10:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BxWiLqzP;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nAVAyA4K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PBPRx2QNJQ+QM0zRSUMWWFQHyRX2kqxgGvHiKxzQ5A8=; b=BxWiLqzPPvdBNs
	U2vf3f50BiZ3b377CGVcT5nTlpP2lP8PpC7QZ+vCyIkZ7barYAQ8EP3W/8mo84/rXuuInGB/jDhfb
	Ty8E4aj13Aya402mFdFBgxAVwCtKTifRd7STWXpaS/3yanloegZ//LGSIGhEAjAsA6f68hms+vIgf
	T1xxK8AeCngbAH5O1tA2Bu9HFphQHFZjoe+hJDYYjZgZ3ozC54ZputVfBmdusV+57HcT+kJcxqghj
	eXV2aTd2HZ9xxsX4AuiHyM23pUNTLQ6xKWJXYb6f9yrLFqubOFM7Ne1iLKBrXJWdNcbGeM6xOFG8x
	ooqM6ucEL4YBNf0lBoYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNT1f-0000000E5uz-3GOf;
	Sun, 01 Nov 2026 10:42:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNT1e-0000000E5uq-1o7D;
	Sun, 01 Nov 2026 10:42:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B2A5C600E2;
	Sun,  1 Nov 2026 10:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A576E1F000C1;
	Sun,  1 Nov 2026 10:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793529777;
	bh=PBPRx2QNJQ+QM0zRSUMWWFQHyRX2kqxgGvHiKxzQ5A8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=nAVAyA4K5Ip5V7nDF+Ddov3KzTwTkvAZnBZmkLfMpOZqAe1W8jpTswCxwjxApOF2d
	 uWEVT6cMj8ncY8daPZBjhBEsqO36OInN7OvrtgfGMYcEfXIHWf3p3l+FVp2YMsGk94
	 ADLlsbdSH1CJd+nTCA4eagDj8bsKHs9bylLi+IjC9xYXiz3hhHMz7pRnmCbP7YpkNy
	 MWZD/MKOHPMKK+MgJupBNVZJfyBIyoUT+6PQA27VGQK9fHw6Fayu36ch16MWpstNKK
	 m39RSM/CnvSIv1hS1043R9jz73UwfFFwsliLHPUAuI6PWz8fYp7jXis93pieVx7Tzm
	 1Cbehw7Uvr+6w==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3] phy: exynos5-usbdrd: Use dynamic phy_cfg size to
 prevent OOB access
From: Manivannan Sadhasivam <mani@kernel.org>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org, 
 krzk@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com, 
 pritam.sutar@samsung.com, andre.draszik@linaro.org, kernel@lvkasz.us, 
 pengpeng@iscas.ac.cn, kishon@kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, jh0801.jung@samsung.com, h10.kim@samsung.com, 
 dh10.jung@samsung.com, akash.m5@samsung.com, hongpooh.kim@samsung.com, 
 eomji.oh@samsung.com, shijie.cai@samsung.com, muhammed.ali@samsung.com, 
 thiagu.r@samsung.com, stable@vger.kernel.org
In-Reply-To: <20261020063559.3530901-1-selvarasu.g@samsung.com>
References: <CGME20261020063617epcas5p4ba00854fcd38bf211c573629ee062621@epcas5p4.samsung.com>
 <20261020063559.3530901-1-selvarasu.g@samsung.com>
Date: Sun, 01 Nov 2026 16:12:49 +0530
Message-Id: <179352976902.2955.854677236716853573.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272; i=mani@kernel.org;
 h=from:subject:message-id; bh=Q6hkz49Y7C/46IdSVDugqi0a1zuCwlweH00ODBFmM68=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5xeqiK17PAEwdnRzSQo+D+kWeupWASL+RwRYy
 NV3WdPKLxiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucXqgAKCRBVnxHm/pHO
 9XGwB/93eMHO8R0XGhK/8k4EB0U2PnmWNCJCVbfPamNyDOKKBeiGai1NuYr6zulXn84LOYsKIPS
 eJ91TdkDlTCufw8wuxVITUBLc0xvlUXosHjAN8pWjLaHVSDeJc7dxWgZ6UD90LLJeV5GFzdHl/H
 d3G2K8pVPbv+Ot4vEAPJ0PJx+TUpvudlXs/9XLkEAqpvSEzdFcD8ZOBxKkJCcDU1Sga2/Rbr4Nv
 agRLt8rVuQYShZjkpqsFyQv3KDguFeokBg+zG2igGGZpNzAhI2hlobQezJZJn1hZNRqL727FwZ8
 j5e6gLrC2VPPr6dv/uXfFA+4y/BR+1PNQmP0DMHC0QPp+FgJ
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

On 2026-10-20 12:05 +0530, Selvarasu Ganesan wrote:
> The probe loop currently iterates using EXYNOS5_DRDPHYS_NUM (2),
> creating both UTMI and PIPE3 PHY instances regardless of the SoC
> capability. Several SoCs (Exynos2200, Exynos7870, Exynos850, Exynos990,
> and ExynosAutoV920) provide phy_cfg arrays containing only a single
> element.
> 
> On these SoCs, when the loop reaches index 1, the driver reads past the
> end of the rodata array, populating the second PHY instance with garbage
> data. Since the configuration structure contains critical function
> pointers (phy_isol, phy_init, set_refclk), any subsequent access to this
> PHY instance via exynos5_usbdrd_phy_xlate could result in a kernel oops.
> 
> Fix this by adding 'n_phy_cfg' to struct exynos5_usbdrd_phy_drvdata to
> store the actual size of the phy_cfg array for each SoC. Update the
> probe loop and the xlate function to bound their access against this
> value instead of the hardcoded EXYNOS5_DRDPHYS_NUM.
> 
> Fixes: 59025887fb08 ("phy: Add new Exynos5 USB 3.0 PHY driver")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



