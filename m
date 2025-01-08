Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12751E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 10:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmfS8WCoNt6jj/+YKKOpy0JjmbTDxj2kikSVgcXZn2k=; b=wkMJaLHT5F3AHrlMLwA4wSSFE0
	KxsnOptobFxYHIKZayr4geso0mph4A2ta43CYfTycgLOFwiAVfuY021x9uGG1h+0AiLytmxeNxxig
	NTrnrmO6Fk2h5jjNc2w9bP/EKnSEd/IidA3eiTMmDeFC8Pk9tmXzaCdb79nOt9sbkUeEcL7LEnAvD
	0O8p/NVUBmGU+91Sl+9lcTj1Z0v9TmnPuqelA9zWJxp7BGHd8aSoTbjbDLDbW1M4F7ysToihGSxBa
	B2rpMGzOBH33dS3ci87S82P253MvMFSVmqK5vU/vyVODRs/W9GT2Xe6DXR64Up3052T0lLmDGlat+
	j2TTu1VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTkI-000000085ef-2ZZ4;
	Wed, 08 Jan 2025 10:57:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTVe-000000081ts-2RX4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 10:41:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AD900A40AC4;
	Wed,  8 Jan 2025 10:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDD8C4CEDF;
	Wed,  8 Jan 2025 10:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736332917;
	bh=WmfS8WCoNt6jj/+YKKOpy0JjmbTDxj2kikSVgcXZn2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oNKj1/hk9puW7qlcHbCto0eDlorfwprV9zhNVsGDWEridQUVIxw03u11XmjQkjF/9
	 cAZh+Vf9lGdvLZhENGP6Mbdx3XyqcnjiHlPsMTW9s9mHxvLskvxCfa2O5dtigC1Xt1
	 xqi1ZEobsb1YaECz9qBBVHAmm3FO2uAGlt9NIeJJ/UmTgVpbd8GExSHX4Pk9hprv/Z
	 UmjF+3VtydjXWeLCPC3kip1WmuVJ5v4f1SnXn9mW0IYHueiDumdVfNVfTGvGv69cPl
	 0Ok2NSK29wlK9CepBu/6wT9EqtO2purXCLygLGvNS5rNLhxUptfYBONw/R+FgU3/Ko
	 mp9whUKAxCWWg==
Date: Wed, 8 Jan 2025 10:41:50 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add
 Apple DWI backlight
Message-ID: <Z35Wbs3-VrQZu846@aspen.lan>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
 <20241211113512.19009-2-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211113512.19009-2-towinchenmi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_024158_685323_01CBFC9E 
X-CRM114-Status: UNSURE (   7.28  )
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

On Wed, Dec 11, 2024 at 07:34:37PM +0800, Nick Chan wrote:
> Add backlight controllers attached via Apple DWI 2-wire interface.
>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

