Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD011090234
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 14:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5m+32hzqJwzrOftWfSmjrUSOroSDPafPYn0lQapCEVo=; b=pWkpggCq7L4XpJJzQhv/0slGST
	nON6jNK6HcA5odzs15oMdcIGp33Lp2CCK9Xa3DtAilBhpTKtQ2HCVv+hTlpAWZm3Val+gd8fqVOMc
	z9gMlhAey0JtfG01yBWge1mVNqkZmiHGec1F6rXiS8SnBvklAP5Bp89qe5YEEIC1xL7RYtooE3NLq
	pZPKXMca+HdxGlKzCTUh9tRMFX7vSj6Y4tkZ7BAVsoowwQxxd+LSe4iCshbFpBzaB+Ja/TfTzVbm3
	l9D+IlzppsFEA3jJUyqE56FT6CjnaURIIapTWLjufptmNOGTakINzwu44/YznpgxwSzlFeV3Lze6T
	MdePWtNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ej4-0000000Aq0V-03fv;
	Thu, 19 Mar 2026 14:51:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ej2-0000000Aq06-2pAp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 14:51:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E560C4048F;
	Thu, 19 Mar 2026 14:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770E8C19424;
	Thu, 19 Mar 2026 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773931911;
	bh=j1zhHp+LlWM4HYSeiz20Owo/jhwDZaDEh9PKWkA6qrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tkn+jAn10QP6PnJbXnnaIx5qs52AN0Ip4q1bDgcXKxpy688c33AwMWeQaTduS2I6E
	 FMawLISthXtDKVAJRIfIQCZ8tQhHuc4JvuoHa54l4ugrIYEzSLoQi+U8Ge5GV9onNd
	 OH2KkDu+dBU69BGKDweB/2+6WumCxD7pvv4iJXJAs1ryxM8g6xfmoSeWGrcWUvn0cl
	 eOb+3GAkjNmDu6mstiSfmTbMaKaMI3fmeYMkRCQLY0WUbJf6iAdXjlQvMC3WSlX16S
	 asSUTmnsTBS8zV+CIbnymSNxDRbRFTmzA1SXK6kJDmFOL0JVBGEjYdxMOhSe+2XIUn
	 yL15YoW3zep1w==
Date: Thu, 19 Mar 2026 14:51:47 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com, joro@8bytes.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, daizhiyuan@phytium.com.cn
Subject: Re: [PATCH 1/3] arm64: errata: Reformat table for IDs
Message-ID: <abwNg5LY9Ll235vS@willie-the-truck>
References: <cover.1772125743.git.robin.murphy@arm.com>
 <3adc16d4d035cf76803e706e325822b99c13e977.1772125743.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3adc16d4d035cf76803e706e325822b99c13e977.1772125743.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_075152_732865_EEBD8963 
X-CRM114-Status: GOOD (  12.56  )
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

On Thu, Feb 26, 2026 at 06:10:20PM +0000, Robin Murphy wrote:
> We have some inconsistency where multiple errata for the same component
> share the same Kconfig workaround; some are one ID per line, some are
> smooshed together, and some are entirely separate entries. Standardise
> on the single entry, one ID per line format so that things render nice
> and consistently in the HTML docs, and it's simple and clear to add new
> IDs to existing workarounds without churning the table too much.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  Documentation/arch/arm64/silicon-errata.rst | 44 ++++++++++++---------
>  1 file changed, 25 insertions(+), 19 deletions(-)

I think we're better off doing this at -rc1 in the Arm tree, so we avoid
unnecessary cross-tree conflicts for something that doesn't really matter
that much in the grand scheme of things.

For now, please can you send the SMMU patch on its own so that I can
pick it up?

Cheers,

Will

