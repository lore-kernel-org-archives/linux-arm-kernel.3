Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF178C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mPM2QrK3+k4qQZbJgrxtRptJibEjDw1XeLRQM0tPpM=; b=q66pVrJkFOfRU5xRxZoOKo6Xyj
	ll5N9rClYnMO9wpFX1P5eDZoeWAJ61rKc13Y3Ywuy+TsgAJzS+hB3dGpGE/DdTTqbD7Dilt+Lz1rh
	2c4qOBwOqGYWIx6bV/09vgi0hjZH3hJM2GzMLMO6sfdPn0ySKy7tlwKWTplnmSgxbwuz79uetrF5z
	8Eh/aEJGu7VfcKtz8O3qWcnvgOgQ0Bb7GKmHt2zMfaN9bF3huehmE/lep6r1VC7wvE1KyhAacS0Q/
	9STy5rf6S1XZf9uiD8nLKLrAzfzOQv9skoWwmaz2EJIQxD2awDiglF4oBaJYfZBrQuQ/gKKIe01fu
	yocSPrvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nTn-0000000FA8S-413H;
	Wed, 02 Sep 2026 16:06:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nTm-0000000FA89-1s6s;
	Wed, 02 Sep 2026 16:06:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 01E5140F43;
	Wed,  2 Sep 2026 16:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69471F000E9;
	Wed,  2 Sep 2026 16:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788365185;
	bh=6mPM2QrK3+k4qQZbJgrxtRptJibEjDw1XeLRQM0tPpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a0gK+HzjYGWpxOA2Y9GFMa0ZRamanNJZEIbJPcOvqOlx27aaU6fVjq2PwAo9+Y3rj
	 QA9D+rrM7JdjXIrmf+uxjEP9E+oRyR1Jl2KeJ6r1qtWS39YV4KF72ujCkTO5AnjEvP
	 91T1pEIj7mxajMhmY1o2yWWTU/eJZd+gUuMyMweqrGcdwhjz8wgqG6AQu2Ga/ZioOF
	 c+eOzgB2f+uKTm5xMdU6bZRSH+zM/zY+8xOC8+gktkbeymk2mtk6MOPyxgKpObDo2y
	 hf7c2DvQEJLeIWrpwuBfxc9l5uF0JqcUng1PRWtlWBIpAh5FJacPGXvH/A27y/FaeO
	 u0C8O+ll03O4A==
Date: Wed, 2 Sep 2026 18:06:13 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: actions: Replace spaces indentation with
 tabs
Message-ID: <cd5h5yvpxnp3h2vagf2x64nesjani2hxxkklbx7hyrpo6z45ut@7l5mpkcpn5jy>
References: <20260829194140.108124-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260829194140.108124-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260829194140.108124-4-krzysztof.kozlowski@oss.qualcomm.com>
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

On Sat, Aug 29, 2026 at 09:41:42PM +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Please take it through ARM SoC tree.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

