Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4372DCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 07:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6MYlnhD622vn+jskvtP2u3P8TmkgrkKitICNkrmhfs=; b=grS2oW8eheEtenWliPNBuMHa4l
	mVRzsg9DzEFv4gldqdBSdfZfFeqKR4oylzLapdm2+e7d3N5dZFLLyjkj0MddUUD/NrUiH0VcCTl4V
	Uinh8coE8NVV7bKfEbsykveDsM+e1s1/Sbk/i38ObGyCXM8rtR5IKVol5e+YLWefBt77kl8SHxaDv
	Vxb+PMYzOxJfONyUXm6JAhjWxaX+WgKIznnuDp2VnBE6gHy8JsDsSfn5/qiRTopwNG6X5A21tmW+e
	w4JvSK7IjeNuKq8NPJcnSdrIwb+TQshsSmY1h6uVzI/yc+6paUpP81QtaMmFQDsS2cAEeXiTe/5nT
	3rc8WydA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIisC-00000006go3-3hxh;
	Tue, 11 Nov 2025 07:33:04 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIis9-00000006gnO-1KnQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 07:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=A6MYlnhD622vn+jskvtP2u3P8TmkgrkKitICNkrmhfs=;
	b=pCGrPFo8uuYBh8CwNEyIz8LkgTxF1S38/tKl8mkLe/rQnC/7CQYUhVlPCthal5
	Y444dprs5ZCeKf2knL9EpU9B1bjhxloPOCCCvCnPUPKOux+XPpaSs/8Ug/mhfPnu
	/UzJ+eSFO7gcOQoad+30bFkU4r/XwELH+eVZBtB5lQ+iE=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHDpuV5hJp_hnNAQ--.5255S3;
	Tue, 11 Nov 2025 15:32:39 +0800 (CST)
Date: Tue, 11 Nov 2025 15:32:37 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
Subject: Re: [PATCH 0/2] dts: imx: cleanup warning cause by fsl,mpl3115
Message-ID: <aRLmlQHs5tF2lBb7@dragon>
References: <20251022-fsl-mpl3115-v1-0-93187d095efc@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022-fsl-mpl3115-v1-0-93187d095efc@nxp.com>
X-CM-TRANSID: Ms8vCgDHDpuV5hJp_hnNAQ--.5255S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrGF17CF4xGFyrJF43uFWDXFb_yoWxWFcEk3
	y8GFWkZ348Cw47K342kr1FvFWkG34UAw4qgryYg3y2vayI9rWxWrsrKFy3W34DGFW0vr4v
	v348Kr4DXrW3KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU86wZ3UUUUU==
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNhe9I2kS5peamgAA31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_233301_697904_9D663966 
X-CRM114-Status: UNSURE (   8.08  )
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

On Wed, Oct 22, 2025 at 04:43:20PM -0400, Frank Li wrote:
> After commit f11e4374b(dt-bindings: iio: pressure: add binding for mpl3115 )
> vdd-supply and vddio-supply is required properties.
> 
> thread:
> https://lore.kernel.org/imx/0e00bb14-19c7-493a-9629-354bac3a273e@baylibre.com/T/#t
> not prefer change both to optional. So update dts to fix CHECK_DTB
> warnings for both ARM and ARM64 platform.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Frank Li (2):
>       arm64: dts: imx8: add vdd-supply and vddio-supply for fsl,mpl3115
>       ARM: dts: imx: add vdd-supply and vddio-supply for fsl,mpl3115

Applied both, thanks!


