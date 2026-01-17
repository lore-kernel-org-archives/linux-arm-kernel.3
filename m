Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B748C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 01:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMRcznBOnU3b+ca7JCLsZUfddRMTN0e1ix/B10KN6kM=; b=wt54KVcuunzdFXDQjc424lPwQL
	xzmVztNJPyXZoZ9mHj0NLgHJdAV6XokUuZEt7wu8jhkyYstzcOWpQcDsZwFnXkIgp9h8YAT9RQHo9
	0wVgASRhbyZ7KVu+CAf10UfqH2zhB4KBNLjjrGSGmy4Pf0RCTAzJCWI58hD+QouUtyoZoWZVyWyle
	zRlAsGP9sZsCTm+6OJhBFxWTQHp4pr6oORhJKJZ+O4pspW0+5I8H8/zUmnQ3wf66KXng7EtYYyb/6
	/fYj0fIasrTGqAzWx1+euDcSAcNbLYh834IVjgiLxvGiwLo/7lQ4IrpV162vu9cgtuqKSf8Lntl/P
	l+WAxeog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgv3f-0000000F60q-2npH;
	Sat, 17 Jan 2026 01:24:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgv3e-0000000F60f-1UAj;
	Sat, 17 Jan 2026 01:24:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6584060127;
	Sat, 17 Jan 2026 01:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E498FC116C6;
	Sat, 17 Jan 2026 01:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768613093;
	bh=+/nCIgRUvPlsiKTpAeKa3/TVmwZi8Ea2lEh1s9Lq5fM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AHZWO9Euy1ms1PqJiF5griw+xUiA/79k/DFTwa0Ew1Pp9Xn2PW2UxwdfuA6G7jkU/
	 d3d3xqSIZKijc41DlUXLMdLZaFoUAQAY2IB8yArUTFaW6bzQzMsUNFRUyerxjjdQlY
	 NWcuCf0nLkFufGI8yngHpfpEfWo1YLL7MtlcUzzwW13fD/dOif/4+N2Ox5d2k+3ME3
	 dFKymoIz4Nx6PWwCYVSSgMwxJg4JLaIjpKTTVDs2zNZ5D4qihMIGtpjVKlDlYiJgty
	 PU46N4Ii9uBe3n8yc1ufLKMv6a1eHQ7FF2NrIXyFERohT8/mkNEaXPvg7mmLYgx0SY
	 Zqd/yIPyljb8w==
Date: Fri, 16 Jan 2026 19:24:52 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mediatek: Replace Tinghan Shen in
 maintainers
Message-ID: <176861309133.2330594.16947587442978287595.robh@kernel.org>
References: <20260116172915.99811-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116172915.99811-2-krzysztof.kozlowski@oss.qualcomm.com>
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


On Fri, 16 Jan 2026 18:29:16 +0100, Krzysztof Kozlowski wrote:
> Emails to Tinghan Shen bounce permanently with "550 Relaying mail to
> tinghan.shen@mediatek.com is not allowed (in reply to RCPT TO command)",
> so switch to AngeloGioacchino Del Regno - Mediatek SoC platform
> maintainer.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml | 2 +-
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!


