Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EE0CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 08:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPoSQh6RVd8FMXKZkZ85J09JZuSMMI6FbJBEpchnaN0=; b=G3bBxmEAfNZthpCenVFboc9rb5
	upuhM3sNV3D7ll5jmB3BdE9EdHZUXsna4kjDQY6UKqNeU9A9IYCkvwf1QVQKvdDGZRrga4Hc8KNAI
	+HIbMgBh1UAJmvGAzjcLfMYf1V+az7yHCuFdoiF6le4pAkYWHwAJqfEWgPz5K2przUMONZVVnsaMC
	48Jw0F5/XSaLfmaG/0WxCluajj0hd7v6gEi2R0zAALNW/hEp+j6x+1xXMHbDva7ixvTllzC4nWVl+
	reVTwvnaPDG48Bi2bRMMzoLpIKnTBrZDZQ2q9gj+G9EEDFFfOmwM7HckdhrGhYpmXRScDU4h8jRxa
	15+LtZmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvKt-0000000F410-3Xua;
	Thu, 06 Nov 2025 08:27:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvKr-0000000F40s-2JXn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 08:27:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E70E860216;
	Thu,  6 Nov 2025 08:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0826FC4CEF7;
	Thu,  6 Nov 2025 08:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762417632;
	bh=z5CUnIFcxYpg/qcDL2lc1ciSvozZtGdVoApOxfgjqgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IQOd+w87rTb48tKJAnd0inB2WzSV5a0mgZ47zMntQnFpgkEufy5/cnQ7e6tEfZmW6
	 RHsjIt5Ncs3gDLyzBBb8t3ryKP/gDwH/7LMaauPyDO8RvilYtIZ7VlYnRcjfUDdhah
	 vcQtaEIWBCTl7RhjHb6luE9120lUgo4yGlp9KTTn/BFgxj0IucaaYu7G/widQnZetC
	 fajiOSGMIXyckgVlxGYx544BbWABeofqcNFx4P+cG9pogOKQhF7iHW74JtWz37xT+z
	 9CZMnvBBKz8w+TkvhmOv9EBA8LaktBk4WgYtnlZ6hqfPjfjgpYhnfYlP3hcqDFs3cq
	 yrc6Cxomb9/yg==
Date: Thu, 6 Nov 2025 09:27:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-binding: arm: add CTCU device for hamoa
Message-ID: <20251106-imaginary-speedy-agama-c8f437@kuoka>
References: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
 <20251106-enable-etr-and-ctcu-for-hamoa-v2-1-cdb3a18753aa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251106-enable-etr-and-ctcu-for-hamoa-v2-1-cdb3a18753aa@oss.qualcomm.com>
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

On Thu, Nov 06, 2025 at 09:57:25AM +0800, Jie Gan wrote:
> Document the CTCU compatible for Hamoa, enabling support for the
> CTCU device on the Hamoa platform.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Nothing changes, so same comment.

Best regards,
Krzysztof


