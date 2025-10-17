Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA4DCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 22:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uNB7f2GhMoMMrFcnpWT4+BTuxmy0+e4wKcZHhjPwYs=; b=tNj37KeBFUs1oItbnPReCZADW9
	wLRL4pNQ5mmUdAlOJh5d/psvwByj9pdX5fG51CsVzbaQZF71noejcWPssPnJ9YkdHT6zFEaLwGUsa
	T0L4UhI0SZIyCI6u66BHf4pjRw/dsNgfXIYsQDa3K0+kD8fn2qzGDKVBWk9+34d5ch/oAXMRZGRAR
	d6B7ATQyqt7TJix0UOpxPfRXpsLA+qKX4VVaEEOLkzPMCe8AWF2T7m3Kkn3cJl0uZHZ0YH10sosw+
	FEYA2aRyZ9YflvXoJx6WISxmL0PYdY/gVllUJDwZX1fIYBykh5PvkFEtJ2kXWe+TdGBk7j0Q2hCSM
	mpfkRhaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9tGz-000000098tu-2WCY;
	Fri, 17 Oct 2025 22:50:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9tGw-000000098tZ-3D5o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 22:50:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E43445614;
	Fri, 17 Oct 2025 22:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354FFC4CEE7;
	Fri, 17 Oct 2025 22:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760741406;
	bh=LR9ow0WDk7nKg118rjVF5Bu2uA14Kqebz9VEjk6ZGFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJlv+3RB4tOSA0/JVh8mq4dTGKdCNbnhiGr2lCi3sJ6z4JMsckJAscoDIaMTE5o9W
	 sudrro1mgc/w7yKxfnyfJBvZVZIBKfmT69SChu0l/rvZRg4gX9mlM0NSdiafVL0sU2
	 gCIdzPbRpgpXCo4U8BJD0rexVgQgpxoqItbP7s72hdbEwqx4C9y9/9K8ByeurWMo07
	 CgJpExXBfUBhDoGreFSZ67gahULszKOZg6xl8WKV6+egnJFRYmqpw04LXkbN5fSVhC
	 fqLsZjTJZGIWhZMbRmyaotuK77ffyox8K1O6h6O0eoj75lmNbbtGQoB1kGsOkvbPW3
	 zVhPpZpUOh8tQ==
Date: Fri, 17 Oct 2025 15:51:58 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org, 
	swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev, 
	sean@poorly.run, airlied@gmail.com, simona@ffwll.ch, alex.vinarskis@gmail.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_riteshk@quicnic.com, 
	quic_amitsi@quicnic.com
Subject: Re: [PATCH 0/4] Enable mdss1 Display Port for Qualcomm lemans-ride
 platform
Message-ID: <b26devgysl3s2tc5gncmpwsq57eyjtcdqzidt3c4bauw24kosb@chmgunmg6iv3>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_155006_879419_2D847F4A 
X-CRM114-Status: GOOD (  12.49  )
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

On Fri, Sep 26, 2025 at 02:29:52PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> This series adds the DPTX0 and DPTX1 nodes, as a part of mdss1
> on Qualcomm lemans SoC. It also enables Display Port on Qualcomm
> lemans-ride platform.
> 
> ---
> The Devicetree patches are dependent on following patch:
> https://lore.kernel.org/all/20250925-lemans_dual-v1-1-9c371803198d@oss.qualcomm.com/

Include that patch in your series instead of relying on the community to
resolve your dependencies, please.

Regards,
Bjorn

> 
> Mani Chandana Ballary Kuntumalla (4):
>   drm/msm/dp: Update msm_dp_controller IDs for sa8775p
>   arm64: dts: qcom: lemans: add mdss1 displayPort device nodes
>   arm64: dts: qcom: lemans-ride: Enable dispcc1
>   arm64: dts: qcom: lemans-ride: Enable mdss1 display Port
> 
>  .../boot/dts/qcom/lemans-ride-common.dtsi     |  84 ++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi          | 245 ++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.c           |   4 +-
>  3 files changed, 331 insertions(+), 2 deletions(-)
> 
> -- 
> 2.34.1
> 

