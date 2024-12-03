Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAF7E74AC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 17:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJMZjkVYR8TkLzoVBZtyFkZ4cJjkpNO9R+Qo4cX+WJg=; b=fwthYwH0pYnME2uIbXLF2Dfr3w
	yksVmJJT6MG6vHuFPldiNkPfF8RgjfjuqgDyfRnqYoDyy1nv9AL231bfkmP5x/xYARiw7NymKAlct
	OFgqAZOX0I0ARwf31+4yLghY6lNaNACEfhhXykGa7T5sZieAwPxfAujHs2UQ00jCPb5xGxWvGFAYT
	wPe9FCZ7HGWHQJ2w7NqfJgAwbS+/aUbFlbVA/sm/a6wLTUroHg07zI/GbJSbXg17KH394aokY/Gu/
	YsENjfnU0ZS+PcqkxI65FBBY3pxVZsui5kWt9tMaQ/n0PhDooYYVKarCkbtaV021yZ5699EsIdGxi
	Su89R+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWHg-0000000AC7N-06D6;
	Tue, 03 Dec 2024 17:02:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWEI-0000000ABUq-2l9i;
	Tue, 03 Dec 2024 16:58:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89AB75C6B93;
	Tue,  3 Dec 2024 16:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD3DC4CECF;
	Tue,  3 Dec 2024 16:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733245109;
	bh=arF+AUtSeu6ScqKrFJj4z1B2pVwQCLt63eW9K0h113I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YA/+5FUCNsnzc7OLhztiJaztpx3YVhqilIZltxUkySH8DqVvnFKO/OXroDo3LgeWn
	 uE8dW8TU8STjU4G3thzdB8bI2m7LSqs1TlH0rahyfAt2Ok5J0pZO4UMMSRIogcgJh9
	 FI2tGRgC//SEy3MVb/TGxsLK6kahOu3BPmkeZkUmHwUFIfkERsKMN+ZRszO4q6LyF8
	 DRKgCORo7yHFban6Du/ieT/y1Bzi5WI+xhsOwX6zDdR5tvnVdyb2F/Vn+3fEQbT/Q1
	 LUfN4eTq6DIdmmjvfZuHVgQHZVvizSHYxgmD6D/D36aELHM/cDPt6xDUQPxslOU0UE
	 k0d+YW0B12Xew==
Date: Tue, 3 Dec 2024 10:58:27 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
	krzk+dt@kernel.org, rfoss@kernel.org, devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	l.stach@pengutronix.de, algea.cao@rock-chips.com,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
	conor+dt@kernel.org, vkoul@kernel.org, kever.yang@rock-chips.com,
	linux-rockchip@lists.infradead.org, andy.yan@rock-chips.com,
	heiko@sntech.de
Subject: Re: [PATCH v1 07/10] dt-bindings: display: rockchip: Fix label name
 of hdptxphy for RK3588 HDMI TX Controller
Message-ID: <173324510682.1955832.14077962445640350158.robh@kernel.org>
References: <20241127075157.856029-1-damon.ding@rock-chips.com>
 <20241127075157.856029-8-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127075157.856029-8-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_085830_740240_F251C388 
X-CRM114-Status: UNSURE (   9.61  )
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


On Wed, 27 Nov 2024 15:51:54 +0800, Damon Ding wrote:
> The hdptxphy is a combo transmit-PHY for HDMI2.1 TMDS Link, FRL Link, DP
> and eDP Link. Therefore, it is better to name it hdptxphy0 other than
> hdptxphy_hdmi0, which will be referenced by both hdmi0 and edp0 nodes.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


