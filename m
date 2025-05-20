Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3097C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 19:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvGH6qRwQcbhO99OunJTG4MQCjsdpwOOq5jFQkxbcCM=; b=IdcWx+pgCyP0NYZowqaR/7s262
	bmKilAsip//8JI7BtUaWnqHojTuExVcVdCIDXbOke9czBtHWN5GweglA6NK+Kw5vGu3KB2wBbl4Lh
	Lwmx6S59/DnovAvx/8S5poa3zLip29gaoJBvH/YlwT8tCu3k+TBnpsqwnHxMeSNEX99M9Yht4fgbm
	Z21m6+62VHhfpBA2YFmfk89yMLgkoynG2soGQZoX4JcpSq1ZKPfCQL5CRkkjwh3ODAFaVN28rtI/G
	4zAPMFioPtACavGqAk1319MycbBkawIIpbhenOYBYvE4haPvEJGgMoJT6KYRzkIRPtbZIz8ZYeTdp
	XhJV/c+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSHo-0000000DtBa-1bVt;
	Tue, 20 May 2025 19:06:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSDs-0000000Dsfr-3Vxd;
	Tue, 20 May 2025 19:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=UvGH6qRwQcbhO99OunJTG4MQCjsdpwOOq5jFQkxbcCM=; b=gbGl/dPhMuTmG/lpymtn1obWb6
	VjjI4aIoT2yGPdOpl+N7ldDaG8WKfWP4+j+kS1k2IvZ5vDxVfYmPlkcgQz8dq56NiD9M4FZC1lAMW
	+G5D41NCWzC/P2clzm3JwqMzIeJTmkMiblepFFt8O6fX9o1O9ecgzFi/tBqf4ud0wnM8NqyN1J74S
	/kw9x5XHpYhIPBnDjPSZ8rI4QopuszOT/bPF0REKfR+KIG9KTHGeqwxN5eeRs26wnfYGOHIqmebm3
	sS8IRAjvWD1R6gE5pkNesekr/dxiPv6b9yeNh0ABXyuAVuj/JaEnkEVdMHncsCC85UcQjupi2/k61
	TSZXTqvQ==;
Received: from [61.8.146.112] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uHSDl-0004Wi-Nw; Tue, 20 May 2025 21:01:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>,
 Diederik de Haas <didi.debian@cknow.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2] arm64: defconfig: Enable Rockchip UFS host driver
Date: Tue, 20 May 2025 21:01:48 +0200
Message-ID: <24315320.6Emhk5qWAg@phil>
In-Reply-To: <D9VW95BJVUZM.2KDNW7JLCKKF0@cknow.org>
References: <1741161252-138526-1-git-send-email-shawn.lin@rock-chips.com>
 <D9VW95BJVUZM.2KDNW7JLCKKF0@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_120156_880794_6B6088E4 
X-CRM114-Status: GOOD (  22.10  )
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

Am Mittwoch, 14. Mai 2025, 14:48:46 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Diederik de Haas:
> Hi,
>=20
> I'm updating my own kernel config and have a question about this change.
>=20
> On Wed Mar 5, 2025 at 8:54 AM CET, Shawn Lin wrote:
> > Enable Rockchip UFS host driver.
> >
> > This driver is first introduced on Rockchip RK3576 SoC, and will
> > be used for more SoCs in near future, so add it to defconfig
> > will make these platforms work better.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> > ---
> >
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 3a3706d..907e92d 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -1191,6 +1191,7 @@ CONFIG_SCSI_UFS_HISI=3Dy
> >  CONFIG_SCSI_UFS_RENESAS=3Dm
> >  CONFIG_SCSI_UFS_TI_J721E=3Dm
> >  CONFIG_SCSI_UFS_EXYNOS=3Dy
> > +CONFIG_SCSI_UFS_ROCKCHIP=3Dy
>=20
> Is there a particular reason why this is `=3Dy` and not `=3Dm`?
>=20
> For SCSI_UFS_EXYNOS there is an explicit reason for `=3Dy` in
> 5be91fe8d91b ("arm64: defconfig: Enable Exynos UFS driver")
> (it won't detect (some?) UFS devices otherwise)
>=20
> But this patch/commit doesn't say if/why it must be built-in.
> Is there such a reason or is `=3Dm` fine as well?

Most things are supposed to be modules. Though the on-soc mass-
storage devices get a bit of leniency ;-) .

I.e. defconfig is supposed to get you started, so not having to jump
through an initramfs to load the mmc of ufs module is helpful.


Heiko



