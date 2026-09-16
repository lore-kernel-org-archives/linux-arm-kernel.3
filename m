Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86844C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 13:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=telJkgEX5dfuQTlALPM+8B3+Clo7PpLoK+svOYh28IU=; b=0dR9Ft+VkGojUXTXKrtKZw4GPG
	YOWqqx0Bk1zmuB0PmTaFs5bCTUG4/vJPfot1S/4vs/qGfCkdarmfF9k6bW9wZnke4Gbu3xyh4rL0S
	vSzq3Am8koJLfBRgnyiUIfGUklDPlpEqpujfeAxd798NXAny3C4ZMzi3sBi/V94Fi1UpEYuuaP2/Y
	g70TUy70nieVwY2E2hAQjco4sGHxfwoq8Da1vQX8xVXPeJs1/lTJ32pFVgiohvQ+cgEaEgcT94BPQ
	3tuUOI6Np9Y/0O9nDVg9rKPMXvc4JRWCZHhtqut1IhVa1J1dWTe81MkBBxu9tfe77bjU0cTuJSQD2
	JM+I6OBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pJm-00000009Ein-159Y;
	Wed, 16 Sep 2026 13:04:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pJh-00000009Ehc-2olT;
	Wed, 16 Sep 2026 13:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789563887;
	bh=tzgn5QzvgAOKeLXGf261rOeljkROqctlS7y9i8NT/c8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Gpe3jnNvfWdB77XGJ+zQTMyb9U/czO40qvphwhB+wioEsWLYZWZ/HmULQ4ZTOK5i5
	 JpAMDQXgHsYOHaESuuPrwFAAYn8uLUOUlgro+o9/TnkowC1XqxIDYy8gq/56Kag1QV
	 GgQOIc0xw7WDGIIDKMSoiQisBjurKEhZxgKA/GRJ29u5+I/SD0mR5TztecOivACHNd
	 TmkfB5VofSsofq/h++GUCB6jqghVMHy1AgIftZIISS4F8YN18pvHUxUXxTldUvctjT
	 WfveNFlqLDIMopZUDF6O6Ih/x858NBUKh5hXuI9Tauz9GobM2TiTBgKPKTHZNioLJt
	 xSedt0Ty0KIMw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5E70617E03B6;
	Wed, 16 Sep 2026 15:04:47 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Icenowy Zheng <zhengxingda@iscas.ac.cn>, YoungJoon Lee <getfeus@gmail.com>
In-Reply-To: <20260916035953.3111607-1-wenst@chromium.org>
References: <20260916035953.3111607-1-wenst@chromium.org>
Subject: Re: [PATCH RESEND v4 1/2] arm64: dts: mediatek: mt8173: Fix
 MFG_ASYNC power domain clock
Message-Id: <178956388732.116277.1060079303641396273.b4-ty@b4>
Date: Wed, 16 Sep 2026 15:04:47 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_060449_975079_72D6DA5B 
X-CRM114-Status: UNSURE (   8.74  )
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

On Wed, 16 Sep 2026 11:59:51 +0800, Chen-Yu Tsai wrote:
> The MFG_ASYNC domain, which is likely associated to the whole MFG block,
> currently specifies clk26m as its domain clock. This is bogus, since the
> clock is an external crystal with no controls. Also, the MFG block has
> a independent CLK_TOP_AXI_MFG_IN_SEL clock, which according to the block
> diagram, gates access to the hardware registers. Having this one as the
> domain clock makes much more sense. This also fixes access to the MFGTOP
> registers.
> 
> [...]

Applied to v7.3-next/dts64, thanks!

[1/2] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
      commit: c9b3c82c9f1f86cdb2449d47e4ca66a19159ee12
[2/2] arm64: dts: mediatek: mt8173: Add GPU device nodes
      commit: f0d8c2b05e2d384c0162b41d3728433c1bb23972

Cheers,
Angelo



