Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9690EF36BA7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 08:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqsICuNeDYtzACFY0OBqv8dh7bWOtKXThWNFKGmM5ug=; b=mb8OR9ixLVUhctD8zk5s7T2WVy
	q52JXCicOWXufBfJWzEdkJeq8i6Ak4LHpfBjXxnaN6SIlZU39RKDGvCitvbiWJDEfLXGVPq/rDFSx
	jJK7ojDaNTXBMYaxEkwOWz0keH9sP/4aLYw9uDpJvHbh2Nv6djJAWnht0ZgKREGj2IzVqYH2quBqQ
	BMJxsf0ZmShoM7iroJiqxWvl1Z3mk+GBQkztBKvW9AAEYtHkbyj6E7DT1OWw9YAGEXYhWopUZN0cv
	/WDfwxQITTP+SfclyHAAkLWRX21Jx2mCET4wyVjK1Dzx3KTuenWjnnHSPx2Jm06XfF58Ge1VjixFX
	tTdFhQ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBTQ5-0000000DFfx-2oa5;
	Sat, 11 Apr 2026 08:10:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBTQ3-0000000DFfY-0CNB;
	Sat, 11 Apr 2026 08:10:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B195B43F78;
	Sat, 11 Apr 2026 08:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5CEC4CEF7;
	Sat, 11 Apr 2026 08:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775895017;
	bh=SHceqr27kEj+0RSDjwQQzD1DRgFk1oE0l7rwV13BJeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1yzoztbqGAOudaoSWJy/bw8Lb7TLv0yfsDmXWbNeLBIZudmGq8XBcBAFRSSudg4i
	 EyuTFrGp4FXWeBHQaDNET8tlQDZTjobiIqG1fgUCFzR8abT1yc8Qqpee4Eb3wYKBGl
	 T8mMSc4JUDTpRhcILF0+r5t2H9YPN04zFbfE4Fc/bKoD6k590sc+NxV8Y/FCGC01HG
	 Z+6uikek37NjW9rxJmFVh2puf1Tfkf5MTnD38SdcfUlYSySV2YUK0iUnzDoc29YGsg
	 4sw+i3UiEoW9YgbR+YUZRYc08Y9U1sue5w04sSucAoc2D+PYl9CZxlPJtMK7tJajgA
	 zlhWyTN56f4hg==
Date: Sat, 11 Apr 2026 10:10:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, mturquette@baylibre.com
Subject: Re: [GIT PULL] Rockchip dts32 changes for 7.1 #2
Message-ID: <20260411-crafty-ethereal-boar-f7abbf@quoll>
References: <13980380.dW097sEU6C@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <13980380.dW097sEU6C@phil>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_011019_108119_95E170D0 
X-CRM114-Status: GOOD (  19.87  )
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

On Fri, Apr 03, 2026 at 03:39:31PM +0200, Heiko Stuebner wrote:
> Hi soc maintainers,
> 
> please find below a new ARM32 Rockchip SoC for 7.1 . This goes on top
> of the generic arm32 changes I just sent.
> 
> 
> I've split this off from the other ARM32 changes, because this contains
> a shared clock header, shared between the devicetree side and the clock-
> driver side.
> 
> The clock pull-request is sent [0], but not merged yet - probably after
> easter I guess.
> 
> And while in the past this has always come together in time for the
> merge-window, I wasn't sure if in the soc multi-maintainer context the
> handling changes. So depending on your preference this could also wait
> until after the clock-subsystem-side got merged.
> 
> 
> Please pull.
> Thanks
> Heiko
> 
> 
> [0] https://lore.kernel.org/all/3746710.R56niFO833@phil/
> 
> 
> The following changes since commit 94c8dc1fa8e1ad4037084204152bca1e799d7d1c:
> 
>   ARM: dts: rockchip: Pass linux,code to the power key on rk3288-veyron-pinky (2026-03-24 17:06:35 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.1-rockchip-dts32-2
> 
> for you to fetch changes up to 683192d7d5b47e89d920867f7c6997d2c0d1a0ad:
> 
>   ARM: dts: rockchip: Add Onion Omega4 Evaluation Board (2026-03-24 17:40:11 +0100)
> 
> ----------------------------------------------------------------
> Support for the RV1103B SoC and the Onion Omega4 board using it.
> While the RV1103B only got a B-extension to its name, the SoC internals
> were reworked heavily. So likely it's mainly pin compatible to the
> non-B variant.
> 
> The dt-binding for the RV1103B clock driver is shared with the clock-
> driver branch going into the clock-tree.

Thanks, applied

Best regards,
Krzysztof


