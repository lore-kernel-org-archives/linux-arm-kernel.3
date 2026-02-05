Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA5EE9129B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 09:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXHKXj2q+hUp7W4XE9lm91DIQvC5jxU9oZvddNKM1t8=; b=rDWuM6Ip7XrjpgAdJ0OknnNdl1
	CWB01bKLJ9VQNy6IdS+ghMzl/bUjHYmohv033Clpd22zprTrrSH8kcg28bJ9YZWjDrmpKCH9Q6wm4
	D727nwgMRbkhOq4NNZcOCko+bjEqINAFq1VOrALUqsJrpTXVl4e4doPt/p/Crc9uuwdPoFPL8/ZEx
	Rh/Vl8Ph30HfQU1cqebrTcd8PmFOOHSxTZK73n1q75LC6dFx01aIDscbWzNrJw8vILpPiE07/Shhm
	Nr8VWEvGDbVbt2ByXsMoQNAL3iiiH4YWIHoGhYjhAFdKthlWjQuAC7M2BAUh1wPFQXZfQSfnnLmww
	v2vnTw7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvXj-00000009gok-1C89;
	Thu, 05 Feb 2026 09:20:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvXi-00000009goP-1SF9;
	Thu, 05 Feb 2026 09:20:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78A2D600AD;
	Thu,  5 Feb 2026 09:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EAFBC4CEF7;
	Thu,  5 Feb 2026 09:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770283253;
	bh=NRd5oHFvHBd6W3hDw0oXwMkQXN1d4sUNHl26Lk8tCEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ez1qzQtTp6tu3mb1Ub20jyWGn7go7h/4yIexj4UGZgLB67tk6Gwl8kWZT+HPQp3uk
	 rYszlsTGDnAoNuWwirmh/3mO4R9F5w1zeS58t683G+Bjuk+WDWlTV814/k04lv9HMu
	 FLzuuwisxULTORI2i8G1ol2JBopn0pt9+F3C+GdhoEdi2At1eS6q1bmFsnZSz/JY8M
	 q1DOEsLfMx8utTbBoVtxTNsZgAmkNYq9s0VxsARK9PfGMTSR5HPxdpUTMaeHKMKs4z
	 5ARGxy/aS3yOL6oG4CjKYib1vdoBquN1VzidvBxMhjMoYW/1TgJO4O4RwUpK6L9ix+
	 j6CtcKlz2BBMw==
Date: Thu, 5 Feb 2026 10:20:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Richard Cochran <richardcochran@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com, 
	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Subject: Re: [PATCH v5 01/18] dt-bindings: clock: Add MediaTek MT8189 clock
Message-ID: <20260205-garnet-okapi-of-experience-dd7f84@quoll>
References: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
 <20260202062840.342707-2-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260202062840.342707-2-irving-ch.lin@mediatek.com>
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

On Mon, Feb 02, 2026 at 02:28:08PM +0800, irving.ch.lin wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> Add dt schema and IDs for the clocks of MediaTek MT8189 SoC.
> The MT8189 clock IP provide clock control for main system
> (apmixedsys, topcksys and vlpcksys) and
> subsys (eg. peri, mfg, venc/vdec ...).
> 
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> (cherry picked from commit e2402a4f2db8db0ef3cf8613f42397aaa199ad29)

Drop...

Best regards,
Krzysztof


