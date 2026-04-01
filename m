Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85298D35162
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWWOl7c+kzXuKjko58q0PDqEtcQr+e91DhojVvxsQt0=; b=EJnB78jkFupYZjXOHiaFF6WrgG
	TVE25oTXwmpl0cR4AD23cqpKC3NqWKqWEEMgAk99B24jtGCBZ0al05OrTcrkrffHhQD+DBX2p36qd
	13xpcR5/1Qnev86d8PnaTl4OQBYnj9lMc3mTJljTB0ORjJhKgDuf6o9e5onkytfMWMXNSa6d+8lOC
	1kP5r0idw8E5hp03JHfVyWW9CSSqDmsRRzdh9qP72w4c70VuT370bV2ZjuzHMiabsodyaOOQGkhkp
	CEKZaTV0SvM90qcaXkJThROYNCKnZh2K3prKQCbD6AkrBWDAGwzJxkqDC1YLyPewEH8n3rIcw9WPr
	3YjTRtTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u7e-0000000Ekjc-3XDi;
	Wed, 01 Apr 2026 11:52:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u7d-0000000EkiF-3yHx
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 11:52:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mWWOl7c+kzXuKjko58q0PDqEtcQr+e91DhojVvxsQt0=; b=Db6Slmp+xhFSGEB/xhUpwK89vT
	du+F6AOvheQxetZuC4VAbBW7T4kqVwhz9iBI5Jt8kAJXy40E5LPk4r94ZLcltIzw+em9V+D5E95oq
	/fUNYEi0Y5MOuSW1ZlAnBWHOM8JC3rVCru+gYJg0oCcFMl+8lnHcwBKArHGx2Z7QEbF7Dr+4+qWUI
	6wF45TPjHb0ACzSSh6OkIJU20bp2aRcKjmqj/XkYZNc3PFxQwIr8otc2tR3IPXxOHb1J49DJxP7bB
	1ugUqmtbPIhRWe8rZNiF7eoS3H4DgTC2vkRRqHXDNnAaIwrlMkBG07XoPDwt9MkZsKbMgpDNt9ZOp
	bN8TiCig==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u7a-00000000GGE-2fjF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 11:52:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E669408C5;
	Wed,  1 Apr 2026 11:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A32D5C2BCB9;
	Wed,  1 Apr 2026 11:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044349;
	bh=8bFBCsVMJnke/coqS6cZXLm60R6QVNtAu/p4N7NwRDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hTeqr13Fl+j5wBWj6QfYbYMVez4DJprV4/Z/dOKv3ivMV7RtMZABppsyA1JXy+jof
	 KEhDmjgUgWEgt1DdGAGt3eTezlK/W6DhLk+wAbngKJlJapK6XkDT+vRN69T7TdjFa0
	 UnueeiXWBJgVp/1KJSprLHFwkuDmxw3zgoSuTLgCti9U6wrKQQOiCNdutDWTdzDaqa
	 h2D4Uku3h7eDOATeQodWoCy1QJJRusRXaqkKnl/z/vE9fuxC/1vxI7GvN9zF+icmFr
	 /8IF5f8a7vnBmpL4VfAoTStHlgjNTdNxtEjnoDyapazP1vvcj752yBIH0+6WQQ78sm
	 kyRE1ptM7DvUA==
Date: Wed, 1 Apr 2026 13:52:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wei Xu <xuwei5@hisilicon.com>
Cc: soc@kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, zhangyi.ac@huawei.com, 
	"Wuliebao (Joab, Turing Solution)" <wuliebao@huawei.com>, "Shenqingchun(DanielShen)" <daniel.shen@huawei.com>, 
	huangdaode@huawei.com, liguozhu@hisilicon.com, "Zengtao (B)" <prime.zeng@hisilicon.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, shiju.jose@huawei.com, salil.mehta@huawei.com, 
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [GIT,PULL] arm64: dts: hisilicon: fixes for v7.0
Message-ID: <20260401-illegal-omniscient-lynx-c4ea5a@quoll>
References: <69C63082.1000806@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <69C63082.1000806@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_125230_981339_6B1FCBD7 
X-CRM114-Status: GOOD (  11.62  )
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

On Fri, Mar 27, 2026 at 03:23:46PM +0800, Wei Xu wrote:
> Hi ARM SoC maintainers,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> ---
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/hisilicon/linux-hisi.git tags/hisi-dts-fixes-for-7.0
> 
> for you to fetch changes up to 1af997cad473d505248df6d9577183bb91f69670:
> 
>   arm64: dts: hisilicon: hi3798cv200: Add missing dma-ranges (2026-03-21 03:38:11 +0000)

Thanks, applied

Best regards,
Krzysztof


