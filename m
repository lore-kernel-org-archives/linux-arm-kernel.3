Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59378CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 10:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBhnotlEsGNXWRA+nqwT2aT1GJfi6Kf+refz42NAA/I=; b=RQFhS1syl1cB/n4WGWxqMge5A6
	U8uNcOzMna3T8ko1kpOKC+Mrkwk+JoTm1NeURl1kBi1l0IN2E+UIAx6DPujBil2oaOPX1kyFMotIx
	bnBBx807KGUm8dGi5C1aPBNsZuax71ObvgmX4dkygIf6PStDV5M0qzUsaoVYtU2q+S4JuM3t2jzee
	y58Z5R3ScxOl8m0V6o+xOhGW3oxzCrU2dpSwLRU9wpa0dnnTseXNWUvj9fy8BSDWJAFmFV1e4cTZt
	L7q8cguPvvkgEzZQY7VmhGHz7VmjYqkmFZ40uclyxtSt4WVnH5cE7mb/c3KNfVtTnd174Ddhh95KV
	jm2UB/ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTEa-00000000uC8-1YzQ;
	Fri, 05 Sep 2025 09:59:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRmQ-00000000Lnb-34Ic
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 08:26:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E8F343BC6;
	Fri,  5 Sep 2025 08:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0657C4CEF1;
	Fri,  5 Sep 2025 08:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757060806;
	bh=CLdI6ur32afEiqGlVI3tRuJmZiIibp0yrP4zf7xjWyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SIyBx6iSgZ9Kn2f2NyibdwkBYeeFf6rKD6Bn1S2Om0IdJ+TIbQyLwO/MmW9cQls8R
	 yjOyC53OqpDbotMzePlWX7BsPu8EGo68qrQuiugDRhbtdhvLXUIl+cIbIycwD0asSO
	 593JZZPtRHHi886wZ2Qh/RysPIFsewc2QmjHRXOLgJX4VlSRvVLBYS6YMyh6EZqr5U
	 0zJ9Xz4mNRS8Orsc/uIBpnyjBL2KNr8TzdpIE/6ig2rKAT5B9OWDKhLCQA8ak0Mlmm
	 3VWaPdwjgmj0TtMIZRFJIYnx0pRctas/r68vP+BjXm9c+iAdMjvcVoxm6zVyH9SHBL
	 sX7fhHCBG48YA==
Date: Fri, 5 Sep 2025 10:26:43 +0200
From: 'Krzysztof Kozlowski' <krzk@kernel.org>
To: Faraz Ata <faraz.ata@samsung.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, rosa.pila@samsung.com, 
	pritam.sutar@samsung.com, dev.tailor@samsung.com
Subject: Re: [PATCH] dt-bindings: i2c: exynos5: add exynosautov920-hsi2c
 compatible
Message-ID: <20250905-cocky-woodoo-copperhead-9dadfd@kuoka>
References: <CGME20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1@epcas5p1.samsung.com>
 <20250904072844.358759-1-faraz.ata@samsung.com>
 <5643d3e6-a034-4e2a-babd-d82fb3d58e9d@kernel.org>
 <08cd01dc1d9e$00d416d0$027c4470$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <08cd01dc1d9e$00d416d0$027c4470$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_012646_787420_8AA51073 
X-CRM114-Status: GOOD (  12.14  )
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

On Thu, Sep 04, 2025 at 06:45:08PM +0530, Faraz Ata wrote:
> Hi Krzysztof,
> 
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > Sent: Thursday, September 4, 2025 1:35 PM
> > To: Faraz Ata <faraz.ata@samsung.com>; andi.shyti@kernel.org;
> > robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > alim.akhtar@samsung.com
> > Cc: linux-i2c@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> > kernel@vger.kernel.org; rosa.pila@samsung.com;
> > pritam.sutar@samsung.com; dev.tailor@samsung.com
> > Subject: Re: [PATCH] dt-bindings: i2c: exynos5: add exynosautov920-hsi2c
> > compatible
> > 
> > On 04/09/2025 09:28, Faraz Ata wrote:
> > > Add "samsung,exynosautov920-hsi2c" dedicated compatible for HSI2C
> > > found in ExynosAutov920 SoC.
> > >
> > > Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
> > > ---
> > 
> > Where is any user of it? I looked on lore and found nothing.
> > 
> I will send dt patch shortly.

Still no users. I will mark it as changes requested in the patchwork.

Best regards,
Krzysztof


