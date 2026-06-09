Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A5ACD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 10:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCiLXcWuJfatr1OmxZs97SJjzEizLGoaLacwwE8YyJk=; b=oWI68ToWk3+8LtDLBnTEmvT+rB
	kraw/MyVbeoPYMXPttFI/yuUogil97a407Z7uc20HQ44JeS+n/RjG2CEnnUYeuTMrSxhtyuJDx9+0
	N9YqhQ7QcYB7c0zIg+hOsj24+6Z8+OPWk7uGfecZAMvqmU7zCTGqqoOf4C6kepPBk+EQonGeqmzKU
	2fvM3jk/SazMXG0aBJbqA32nRwd3ZDf8uHgLqE0O1m3fWi/OXMw/2IZyKwGEhuiYbqhlr2okVx8WI
	5WWmJYxKeBKKLBbM/Yk947bP+Ytm2P24OFGTxgENGW1tCZxJKj2c9BpyNjCMZMgeS2EzdTH7OOgDE
	b6JNw4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtuU-00000005Nby-0D77;
	Tue, 09 Jun 2026 10:42:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtuS-00000005Nbm-3z4J;
	Tue, 09 Jun 2026 10:42:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 35C2D60172;
	Tue,  9 Jun 2026 10:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7DAF1F00893;
	Tue,  9 Jun 2026 10:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781001735;
	bh=cCiLXcWuJfatr1OmxZs97SJjzEizLGoaLacwwE8YyJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E2Tcu9KUZCuwzRp9i6Ivi9wlJZH5ofQfr5XYJHwvKMMQcM8RZqYEP2OiRwTisM15e
	 wNxadimCrnZ9fU8RgF/yLk9pRL0xnNE/QyHXyemm/bVSo2xaq4c0RaH4sN5vvh5kOH
	 nW5ybrfpMBCTbGnxshTQeNZztSsn00Bn9T73gr9XO07LbazGH528UyKoc1plSGSCAw
	 E0ajqBfWzsCGI1qGr8pyeKMyvWCFO0LQqBHJ6wPsNX1gKDpmokRocvL8NQy5Ep2POS
	 WuLk5D6G83FaS2ivAuKl1FHwKzxgxskUn8RZu+FB46MpeMUvE3ZzhIAXgNIkZf1QP2
	 cz0aUCIlspVmg==
Date: Tue, 9 Jun 2026 12:42:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: arm-soc <arm@kernel.org>, soc <soc@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
	matthias.bgg@kernel.org
Subject: Re: [GIT,PULL,2/3] MediaTek SoC driver updates for v7.2
Message-ID: <20260609-meticulous-abiding-beetle-5d75b1@quoll>
References: <20260601091225.5223-1-angelogioacchino.delregno@collabora.com>
 <20260601091225.5223-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260601091225.5223-3-angelogioacchino.delregno@collabora.com>
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

On Mon, Jun 01, 2026 at 11:12:22AM +0200, AngeloGioacchino Del Regno wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-soc-for-v7.2
> 
> for you to fetch changes up to 7d462de9f65b002b439b1b168bf3b5579b0de48b:
> 
>   soc: mediatek: mtk-mmsys: Restore MT8167 routing masks lost during merge (2026-05-11 11:20:48 +0200)
> 

Thanks, applied

Best regards,
Krzysztof


