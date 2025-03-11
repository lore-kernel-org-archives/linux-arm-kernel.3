Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDA6C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 03:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aq8SV11ktNKPubNSIy42XayO8ZwBJ4qz7bkyi8r6F2Q=; b=DSk3KF5cw0AOBrvoEqyCMXTQwG
	HaiQXX9Lj/xFmVWz0Gp9xahJm371SFIaD+ZoZgibRTWkKBEyw/v4dG/zV75Qy9Ud5/AycTLkSb+l8
	IqJy/oNnfgXB4Qc92e0KZoGrmfUpTLqxpzhFp9NZ0UFf1gSE1Oovrcqr5yCP2wn4ujBK8MBiH7bBN
	m44ticB4rEKW5YQ+wX0E6AezyhSME27DKwbXx9aVfbGLXwFWYOqkdS8QfUmmhyB9VtsmwrEwqEwxM
	RZt5Abp063jM8ajx6i1FzBFl1JM6ssFSeA/8t7+0ZHgU5jF6lnFVuoOqwjev4SF+6xxko3H+jyd/f
	qTamBg1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trq9R-00000004Ve7-1LQ2;
	Tue, 11 Mar 2025 03:19:29 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trq7m-00000004VVX-32eM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 03:17:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Aq8SV11ktNKPubNSIy42XayO8ZwBJ4qz7bkyi8r6F2Q=;
	b=GG5GFchAxpAGPo82H5nUiF2ZbMql+rPtCfMG14RT6PpDA08JFfZvZ8YXfbX91T
	SQcOsDkTcV0GT3KaFF0tBLdC1GEruSaWpfA8NtYG2yGJ9mn00zIenoqdX7j7OQjG
	EMN1ggwZjC7VM/1o7BCBTqN+1Kv0Elzg7mDeoOJrrfNz0=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXU9o_q89nCfS0AA--.943S3;
	Tue, 11 Mar 2025 11:17:20 +0800 (CST)
Date: Tue, 11 Mar 2025 11:17:18 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/4] arm: fsl: drop usage of Toradex SOMs compatible
 alone
Message-ID: <Z8+rPvG177Csh2m1@dragon>
References: <20250228151352.91768-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228151352.91768-1-francesco@dolcini.it>
X-CM-TRANSID: Ms8vCgDXU9o_q89nCfS0AA--.943S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcxpeUUUUU
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxANZWfPo9QqJgAAsg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_201747_085424_130B57EB 
X-CRM114-Status: UNSURE (   7.32  )
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

On Fri, Feb 28, 2025 at 04:13:48PM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> The Toradex SOMs cannot be used alone without a carrier board, so drop
> the usage of its compatible alone.
> 
> Francesco Dolcini (4):
>   dt-bindings: arm: fsl: drop usage of Toradex SOMs compatible alone
>   ARM: dts: imx6qdl-apalis/colibri: Remove compatible from SoM dtsi
>   arm64: dts: imx8qm-apalis: Remove compatible from SoM dtsi
>   ARM: dts: vf610-colibri: Remove compatible from SoM dtsi

Applied all, thanks!


