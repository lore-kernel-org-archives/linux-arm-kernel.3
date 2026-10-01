Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13060CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 11:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Mlkdl64PmAPMAqQJcQvZerEmXjJBZryxJajGPr9dYk=; b=T0MBgufx3k0hUxeh05Gcp3NYy5
	QsHiCZhHJPREtbpaAHSzkW8vzKLoCUrB4fSKU2YtrZXs1dsBLkwK+5vJBz0hJsW1pjpAFJhoNB/x+
	VXC1elwzc+jwXgKOwSAWTrmPTn+WffEwMqaEIlfwaS/cffviEqbc6gT6dJblJtS7U750fG/PdAaJi
	WWon1I9ea1kh+n+iNpgLpqd7wBJnHF4C/bAeiH1RvcdGJqucfHkSxgE3ntTazq5WUUyAsmi7sNfgT
	7wRUJY+cAAdCu5GFgAyHDM89uhs3WxG13u8cq5Bnfk0n5K+FDWgrOdzEAMYbQb8TnxWak3e3k1Xz7
	DmDZjBNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFLu-00000008gw2-1iuF;
	Thu, 01 Oct 2026 11:53:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFLs-00000008gvl-42gx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 11:53:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A81443B76;
	Thu,  1 Oct 2026 11:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B3C1F000FF;
	Thu,  1 Oct 2026 11:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790855608;
	bh=5Mlkdl64PmAPMAqQJcQvZerEmXjJBZryxJajGPr9dYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jO9dg2JbYQZsG1Xo5tAXokcr/GNT9qTdFL3g+5yZ8SomdA9ZPkAKFlN2Yzd1jzts8
	 axnGAYQFxy1equJRv6CTrd+3nu0kq2iqwQSEPxapH5OHOciLVqqzV5Wb2H2huCJRmC
	 cPVlMpoXbpVm1Hz7ClxyJZ6Q6N/8Sc+yHLeyYxX/vqXl1C+50js7DnTvjeKCGsLQ/a
	 yAZ+JCyzhTf0UYu92cLPsLOeG7vgqO7NLpvztMmqxiZdzNLs4QSr2bNrIwD2AdYfxw
	 SP0p8t1xdYqeHfQH/m0hFzFhHs1ikASrIqOmS92wNYQW3WdYAHCfs2GNCt1ZqMX1lp
	 WQl0Vj32eLa/A==
Date: Thu, 1 Oct 2026 13:53:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: Re: [GIT PULL] Qualcomm Arm64 defconfig updates for v7.4
Message-ID: <20261001-delectable-provocative-condor-33bbbd@quoll>
References: <20260923024939.406813-1-andersson@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923024939.406813-1-andersson@kernel.org>
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

On Tue, Sep 22, 2026 at 09:49:39PM -0500, Bjorn Andersson wrote:
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-7.4
> 
> for you to fetch changes up to 897cf6d54f366885e190e75b3a221e7b3ae35065:
> 
>   arm64: defconfig: Enable PMIC5 Gen3 ADC thermal monitor (2026-09-12 14:18:26 -0500)
> 

Thanks, applied

Best regards,
Krzysztof


