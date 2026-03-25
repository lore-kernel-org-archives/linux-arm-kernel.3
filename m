Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8AFFEC11B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOZIk34U0mHLVgpuEW3eWogRN1ut7eK56baNV+i+gCg=; b=uKm3VHrX7yUN8bI8UGo/jsj3Go
	wbBDzX2pEDoMzcBV8DejCDlKmdklat5hjYgOZ2ai7c8qlX949Mltos1o36mRtaV7TsBp3GTiJWzNI
	6/o51R2iO1eEuxk7DcQvxlgTfKA74Y+Emtmdiv7fS7Wpsqg4XYoyYcbSF/5h8ChvnG/gt+LSGzCqR
	4LhqMwPqTIWSpNpomIylKs0HGdj42CZEtbJzG29El0mfPNdpUC5/krGiZ5Zz5qAsBThZRH23vkGuz
	bc8Cl1zgqcVqY7c3R6qkos1RmTmHd3l4P8PNH0EGsosUJM+KH3+CKBJ+2/pNCvYungKUJyNc0mzlc
	545rkTDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Mm1-00000003JXW-24Et;
	Wed, 25 Mar 2026 11:51:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Mlj-00000003JCv-2CT8;
	Wed, 25 Mar 2026 11:51:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B3E2143A4F;
	Wed, 25 Mar 2026 11:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F905C2BCB2;
	Wed, 25 Mar 2026 11:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774439486;
	bh=ijQZYkQ8huX8bzZfiuwKK5l/O+taUFGXBf7mUcCwX/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F8VoBQpQxXDFHPLwjgn+FimF064VYiGnb02ISTZuo7sMCK/Or3p4aIxqTZnuLA+uL
	 /r3T+Vz7lEc5yc54KjVTpnI+VbV4XN+l9Nl46axhDOOVHgzVdpo/UGmLK8hQXPEUNR
	 ynBx5dd5yG3uJQWeeWTgH1cW2In1W0YVJ8QoBnAUk6K4WIL8a0REi+e01oXpRwalXe
	 gSeFc6w+k+DbJNNIa/GojyKKWjfTcx03289D4/2LfiEs6Mel5pKCUogETaR2OKLgYy
	 1ahoOxct2eimH12qdt9HBRcDZVXFXVZm9/7QyfTkESgul2vKzgUyr+V1bDmNBkVBYO
	 nsJxO9bsBzs0w==
Date: Wed, 25 Mar 2026 17:21:14 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: Re: [PATCH v5 phy-next 10/27] scsi: ufs: qcom: keep parallel track
 of PHY power state
Message-ID: <vu3cxpynr5mu2fzkrtmjcwijc5jz323wlnbc3r7lp2wxqmhydx@z5xhgf4myw2d>
References: <20260319223241.1351137-1-vladimir.oltean@nxp.com>
 <20260319223241.1351137-11-vladimir.oltean@nxp.com>
 <ezrcjjwtg5n76w4m65l27szu5mywx66ti3xuprkfcp3x6quvbf@2rew4zrnnbt2>
 <20260325114309.3k7xkfrffpxp5xq4@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260325114309.3k7xkfrffpxp5xq4@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_045127_619889_E2614978 
X-CRM114-Status: GOOD (  27.78  )
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

On Wed, Mar 25, 2026 at 01:43:09PM +0200, Vladimir Oltean wrote:
> On Tue, Mar 24, 2026 at 11:00:10AM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Mar 20, 2026 at 12:32:24AM +0200, Vladimir Oltean wrote:
> > > As explained in the similar ufs-exynos.c change, PHY consumer drivers
> > > should not look at the phy->power_count, because in the general case
> > > there might also be other consumers who have called phy_power_on() too,
> > > so the fact that the power_count is non-zero does not mean that we did.
> > > 
> > > Moreover, struct phy will become opaque soon, so the qcom UFS driver
> > > will not be able to apply this pattern. Keep parallel track of the PHY
> > > power state, instead of looking at a field which will become unavailable
> > > (phy->power_count).
> > > 
> > > About treating the phy_power_off() return code: from an API perspective,
> > > this should have probably returned void, otherwise consumers would be
> > > stuck in a state they can't escape. The provider, phy-qcom-qmp-ufs.c,
> > > does return 0 in its power_off() implementation. I consider it safe to
> > > discard potential errors from phy_power_off() instead of complicating
> > > the phy_powered_on logic.
> > > 
> > 
> > You could even simplify the code by getting rid of the 'phy_powered_on' check
> > altogether. There is no real need to track the PHY power state in this driver.
> > It is safe to call phy_power_off() without any checks.
> > 
> > - Mani
> 
> Ok.. as the author of commit 7bac65687510 ("scsi: ufs: qcom: Power off
> the PHY if it was already powered on in ufs_qcom_power_up_sequence()"),
> I assume you have hardware to test. Would you mind writing a patch that
> I could pick up to replace this one with?
> 

Sure, will do.

> I suppose that the power_count test is somehow no longer necessary after
> commit 77d2fa54a945 ("scsi: ufs: qcom : Refactor phy_power_on/off
> calls"), but frankly I don't see it - the ufshcd state machine is a bit
> too complicated for me to just statically analyze.

I believe I added the power_count check for phy_exit(). But since that got
moved, the check becomes no longer necessary.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

