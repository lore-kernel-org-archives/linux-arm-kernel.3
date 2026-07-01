Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E56C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 06:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/Br7n8skDAshjgKN/WmFTTuKkr1LxKAT3b5k1fkpvo=; b=tTEWll2QftrGrHXicoP9CZrfxp
	S7k6svDwKVrwX9frgNPt65z8OQhFmIehqxCNDlHxJkOv4S74PUYJTq9DesTnJBNUJpBgCm1LNJIyA
	vRCVW+0t6Sb0TcFZEqm2XF9yFiqoIlVtkhIolwWRLb5isULpkoUJmaksY7VQidloQ61xKj2Ixe+La
	nIQNPRF/2fKAi/wzsqoc8EKYlK6atouVx52rkPdTFKqBwV9jSuA3hwXJcIWwkga7K4fEI6mMr6VLw
	QQTN02OZbEWrI01/6l0alQCkQbPlPMv6k+/ZvgpChY8p1ol9adRyvdrPoQTLqAsLAGXOd1rN0rpYe
	F4Ph5dwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weot8-00000000q5O-2zD5;
	Wed, 01 Jul 2026 06:57:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weot6-00000000q4r-354p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 06:57:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 21CCC40941;
	Wed,  1 Jul 2026 06:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0597A1F000E9;
	Wed,  1 Jul 2026 06:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782889056;
	bh=S/Br7n8skDAshjgKN/WmFTTuKkr1LxKAT3b5k1fkpvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eardjtRk0tVHOFgzGFet5eWB/jfl1S/rTNInUeK5BXbYMBX/2j8MFCLN4w3XLb3sW
	 MMTnLPihVbBVf2aGqidO2l1HxExbbjNprWS471p9MQpxyEddgh7EHPIhpwMkC1slxn
	 jyRZGPZJJ21xbvh1qHqnYJ+r9aeP/KOpk7EK4CrKuTHiKMU+MF5o9lNsr6dFjKeLEi
	 Hb54fqmJ16O4fQgeZKcm6Rz3A5OtXFRrGhov6KiBQgB79GN5r+djfskdHUz/lnTvum
	 RlVyBYrTLHA/Vo/qHApjH1RHRXcteS5FW5EwfQTUQ8S18FHW1NnY5CsSJdXfyqfXhq
	 sPM0Hio/kaN7w==
Date: Wed, 1 Jul 2026 08:57:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
Message-ID: <20260701-stirring-piculet-of-vastness-a361e5@quoll>
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
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

On Wed, Jul 01, 2026 at 09:53:41AM +0800, Jie Gan wrote:
> The TNOC compatible previously only allowed the two-string AMBA form
> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
> AMBA bus.
> 
> Convert the compatible to a oneOf and add a standalone
> "qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
> standalone string carries no "arm,primecell" entry, so the device is
> created on the platform bus instead of the AMBA bus.

That's a Linux driver specific reason, so not a valid one.

Describe the hardware instead.

Also, you do not get other compatible for the same device.

Best regards,
Krzysztof


