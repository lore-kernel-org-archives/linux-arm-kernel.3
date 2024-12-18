Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201C3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 09:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZqqAQt6LhQKzl/5tpVngrLjA3XvxMa3w8FOsPlhfXw=; b=IYDLMCQc33+zHLpaNJnHC92u0U
	UfY665Gc5etAEgvYL2z3quToJ0IF8vZihj11dZVsWuQ1MDSnFvS5yjK+hdEguRXz7VT7271ED71Yf
	61eUaX4j8n0da8wfUVkrPdaVyLFQlDKjZsSi+PCPMTr93lir4Q/lYUX1bt1/hQUPiGpRY7OPZuqqO
	NgHlYk97ajYPz/O4z2siPAOglzdplR3wm3e2qgc9XdNn4D6z3oS87HW1amGDwCKVE/6uo6Kf8XbFH
	wOz7BGYiMJ4lFmGQVh5andilwZzvmzi0xNUKI6PWmDP8p9J83F1Mk4AejIuMhmZNV7V1KmR+yQlwA
	VXU4HPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqFw-0000000G3xx-0T3h;
	Wed, 18 Dec 2024 09:22:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqEr-0000000G3t8-0K93
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 09:21:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 564FE5C484E;
	Wed, 18 Dec 2024 09:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B80C4CECE;
	Wed, 18 Dec 2024 09:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734513664;
	bh=Joxf91zRAXiTP8nr5vRtQiFgbbbWcdv7Yamp7pB847Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5hcSH8ooPBhGZqErclxci8uP7prhV1ZdwaqcTB+bwAa8GRfLCDVFVe4n+c32yMZg
	 C1CzkV4AShBwXnis3lHCbJON9oPNXwYn2OxPwEgE8m3m5otfywd0VpmxTZbMiwOXqr
	 iySj9gFsSen2kDRuIpPknWBwniotQc+sD0Stj1tRt+21kiqTcO3xGEUODEHsrpyuJt
	 9LsjggR28XZBVM5CSAogRyADPtcTZ0tujnIVE7x5siHAz0IJljl8DwTFBU2TFeuXtk
	 2BgMnJ6h09sq9rv015mVdI91oJHu12K0a7HyVq4luK2cA8jC65V7yFEN18kFYTe4N+
	 oeOZ89RmKjenw==
Date: Wed, 18 Dec 2024 10:21:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: Add label in the coresight
 components
Message-ID: <tida22chffj2znikeotmo52aqnzvmedn3aa7a2coarz2dwjc7w@duw5fby4hexk>
References: <20241217063324.33781-1-quic_jinlmao@quicinc.com>
 <20241217063324.33781-2-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217063324.33781-2-quic_jinlmao@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_012105_159631_3ABB8D89 
X-CRM114-Status: GOOD (  11.71  )
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

On Tue, Dec 17, 2024 at 02:33:23PM +0800, Mao Jinlong wrote:
> Current name of coresight component's folder consists of prefix of
> the device and the id in the device list. When run 'ls' command,
> we can get the register address of the device. Take CTI for example,
> if we want to set the config for modem CTI, but we can't know which
> CTI is modem CTI from all current information.
> 
> cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
> cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1
> 
> Add label to show hardware context information of each coresight
> device. There will be a sysfs node label in each device folder.
> 
> cat /sys/bus/coresight/devices/cti_sys0/label
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


