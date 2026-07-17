Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9648C4450F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 06:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCuquY/F6jRPOIqXiEYxfkYbky36x8A0G994F705RxA=; b=cMKyHSGkS44l4mPXki1zclPlO3
	llpEFkEnOv2kxJunesZdFm1yhXTM1zW94g5QWrT2ZZkxaV//NjZZAnI0pkp7zo/Q9XPC8rF/y3k2e
	OHtQIS7GMBCPEmlkPvF7AjXncWeh3Gj5ExQt3MLLm5aQvJJlzTeoR38MERoMRimymjhN1XWLySThh
	b3+owu5CttxtVrTXFrow1F3EzBbtUVYI3uhTZZGEbD1s0XRKim53Fptt41ec3vsEMfwbHUDaWD2VR
	O3YXLwau7xHoUqPjpahXTZlKiUUdpRPump7JmJorJa5pixgJ8Mnvi6hYcTMdm8eP7Yw+mAVQDAmYf
	sjAYDqRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcCW-00000001I2D-27h3;
	Fri, 17 Jul 2026 06:37:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcCV-00000001I21-1SME;
	Fri, 17 Jul 2026 06:37:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C691A60204;
	Fri, 17 Jul 2026 06:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FCAC1F000E9;
	Fri, 17 Jul 2026 06:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784270254;
	bh=xCuquY/F6jRPOIqXiEYxfkYbky36x8A0G994F705RxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mwiE0MNqTye8d8JrDqSXXN7XMhLkFoVdHa65K4dvMEXBUsuupnxYeuQ/s6QI53Hhh
	 K5iDaFtKk2OyhK49xsGZzFINm6+2yA556i05NSeNUjjpVYY18REINwX+yb/SGsP17b
	 Sp+1jRISRyydKjy3YViqFHWZTfDXUYf7eCdHX9nC185lbJXjiYH8ht9g7JXDMVubYU
	 BNRKBVaAptkkiNexoZVcU1jinxsZFZv137ACnpHcfxuB/IrGi7qJ1ggUbchOrC4xAM
	 NZEQjs1R+ZPhxbj17Ba96ILna9ReqyIxtOW18fK0Z+Jyod29o48HORqEwkateUFrhC
	 2MA0IDR72VGRQ==
Date: Fri, 17 Jul 2026 08:37:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v7 00/13] ZTE zx297520v3 clock bindings and driver
Message-ID: <20260717-positive-terrier-of-realization-0e2a95@quoll>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
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

On Fri, Jul 17, 2026 at 12:35:36AM +0300, Stefan D=C3=B6singer wrote:
> Hi,
>=20

Where did you explain merging dependencies? Patch 2 (or 3) depends on
patch 1, so do not expect maintainers to guess that.

Best regards,
Krzysztof


