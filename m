Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948E1FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6JQRY/TB7lrdWItc9QstnyijSZASNOxZVp+OY/fTZQ=; b=GEJWBU3szS7eze45OAUVbVYfop
	RTc3iwZ/lOtzZ6Hc8ECkLbYHxSbZkX2Vmv4V6Coymt7t4LO4MVjwGAsxoImnxNdj9N7AOp4wAZWoM
	SDLVZMRmxFWg5jpekulZDPpBd2eNJCVNJRb15PMGDYMVbRBVzIIPZNlWfecaGW4M6tvy7I/GF6fVw
	xIPQlO0MwCAuWQVdP5ZcNcxwSPMaEpMNwtUXLSwAYrw7a07iLdAdPLv6NZrX/KN9E79kTqE+gaEQH
	lvjL300ToEJdiRxCRSvilZyK7nKdinrsxDALGQgKTgrO6hAjTUinGM1wfugmEp768Xuva8bgBbpNj
	qm5lRZbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcwS-00000000mc2-3Evm;
	Tue, 28 Apr 2026 07:33:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcwP-00000000maf-2cKW;
	Tue, 28 Apr 2026 07:33:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C0894010A;
	Tue, 28 Apr 2026 07:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A9AC2BCB8;
	Tue, 28 Apr 2026 07:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777361583;
	bh=6fTlJi+u/tA4P3ALw32S+WETC0LTfCt2D17LQA//3Lo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MpGy7DVFCqc2tz+PaWmZ2p7pRNgg8LFETk0UaUVr5ifYJTOWvPRBN+vpeP22WoWDq
	 C56OEtBNx7Q1r3apdzOEvOAq1SMo8UctK/m1K2F1bGNwyIU+N1WEjfDXxisU1KM4xg
	 BjlHJzkvzY3wzGUoPkAmSdvm5YxZgECJPhZ9OMPH6fdM+B+h4498MOM+78ScIjw5/u
	 fB46I4mKXaiN4n4YiZgYyk58xm3XVdkWLXwNVlXTGehM53Xc9jRizBsA4LXTZxredB
	 6a1BmClEmFGmfrQPJPr1IVj8i7gFV4T4F850Sg0qTXIIw8fAJLEPqQgHbD8Y9B80F1
	 TCH5DwTMzfA1Q==
Date: Tue, 28 Apr 2026 09:33:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"open list:MEDIATEK MT76 WIRELESS LAN DRIVER" <linux-wireless@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:MIPS" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: net: wireless: mt76: remove
 mediatek,mtd-eeprom
Message-ID: <20260428-mustang-of-therapeutic-upgrade-a95f9a@quoll>
References: <20260427034427.881389-1-rosenp@gmail.com>
 <20260427034427.881389-3-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427034427.881389-3-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_003310_446714_498121C8 
X-CRM114-Status: GOOD (  10.73  )
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

On Sun, Apr 26, 2026 at 08:44:26PM -0700, Rosen Penev wrote:
> mediatek,mtd-eeprom is a widely unused binding that predates and has

I clearly see a user. Please use `git grep`.
 
> been replaced by NVMEM. As there are no users, remove it.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../bindings/net/wireless/mediatek,mt76.yaml  | 19 ++-----------------
>  1 file changed, 2 insertions(+), 17 deletions(-)
> 

Wrong order of patches, you have undocumented ABI.

Best regards,
Krzysztof


