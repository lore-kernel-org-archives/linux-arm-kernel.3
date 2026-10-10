Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBE6CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 11:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2QMIZs/oc9yRzCjq2BhYPtU9ekIc1h07F+4lA6c/ZXg=; b=ZYSiyRMm7PG8OHeeJQTWGDI8Tc
	hBdw6wXyZf3HoqXi7aKypEsIsA8ntRR82IViqFUMhbl+wfWB59L1nSJ7QioX+1UxrrdSiw/TDRhEN
	S5n3t9Ui4KH1swQLPQ3k+V9Ao4mooBmzqYaHVVDf5PN4/PYzhnSAWxU8RvPqcbhKOWco7P4ANzlTg
	HfM/EYGLa7UVJzB47nOqrCKmygKzwgHx5ndkWnHy9paOXr1tWFPCqdxNDLwx81D6O06rtmTm0ShWE
	XN48wQKpF8zZ1EETQWuJEek1tzGWrZIg0Ms5BVgC2KE43vleqO2/ZgP3mBx44uvNHvvKi6lTYiiIT
	sC2VouVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFV29-00000007toQ-44qC;
	Sat, 10 Oct 2026 11:14:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFV27-00000007tmf-1hKH;
	Sat, 10 Oct 2026 11:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=2QMIZs/oc9yRzCjq2BhYPtU9ekIc1h07F+4lA6c/ZXg=; b=w0wmdhV4TiNxrVczb8Yn1jK5Uq
	z9NbpQm6+pdQpgWIGADElquT73oCjhiP0ECtJupz4vup0N0dog3gNHt1JVe7xCJ+AqcwoTiIS+QTS
	p2fcJ1jT4uGfSW/N4wa6ap7IRA7lj5CxacLO4ezT8RPmJGlvETJY8D6HjD2Vy/1q8HN2xJeoMCzwn
	vjYVefeCgpiWLKrn2k39AvtMtmSapJafXgl3NqPxVe44jRAxj3Fhh7/ciK0DNyfVkugt4XWA1w0lm
	suTZDgdjnI5CaL2RJ7CBpGGrNJP2ymO21UrEoD07TtolSW96y/6w2+MHwQBrjM3LHPPqW5zhrobm2
	jD7Oihgg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: add pcie30phy data-lanes on rk3588 coolpi-cm5-evb
Date: Sat, 10 Oct 2026 13:14:11 +0200
Message-ID: <179163084344.3536058.1908487872830452514.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <1791536997-182608-1-git-send-email-shawn.lin@rock-chips.com>
References: <1791536997-182608-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_041431_495244_922DB421 
X-CRM114-Status: GOOD (  10.03  )
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


On Fri, 09 Oct 2026 17:09:57 +0800, Shawn Lin wrote:
> Both pcie3x2 (PHY port1) and pcie3x4 (PHY port0) are enabled, but
> pcie30phy had no data-lanes. Without it the PHY defaults to aggregation
> mode and assigns all four lanes to port0, leaving pcie3x2 without lanes
> and unable to establish a link. Set data-lanes = <1 1 2 2> to split the
> lanes as 2+2 between the two controllers.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: add pcie30phy data-lanes on rk3588 coolpi-cm5-evb
      commit: 5f48abc96182700a006b25b9bfbf80c19455760a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

