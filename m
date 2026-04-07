Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE949FF510E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 18:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BOVVRUNNwx2LwRvagVlTVA+P8ggQUnFfmm4OhRcOWok=; b=1+qovsLN0L5aPr0+Wnrl9H0Bks
	K/DHa0znDCrxN7w4i/wGZq59hrTrYGk2T75g3LxUsu4HbwM5swmgFF6glRQD2AmmGRrdJTS4GEaJr
	DYoOtzA2BLpnJWomsiQMcwDnASQoiQhIzdeJ9UqQw5j/fk0SRwMpoPHDU+G740ej5KXhjfU9F4IZb
	8zxUM52pSUaqzgyuNeWo5jPtmE6cZ08k0/j38kSVbvlqxTZgxyPp/YClva5qimQVS5P53h0gNYd7a
	SgwDWwMfB71i2aqMv9JI53EoLsRCeJQSn63I0Fsa2cyMzT3uWjEVsBgm2EBMZEGjPMXrB2xGOpKQj
	n+jojBGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wABQ5-000000077By-09G9;
	Tue, 07 Apr 2026 18:45:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wABQ3-000000077A7-02Le
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 18:45:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7549441B24;
	Tue,  7 Apr 2026 18:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F6FC116C6;
	Tue,  7 Apr 2026 18:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775587498;
	bh=RfoCuSdIyOP4Fpm9kXSutxGN9meBpEZjFRVOEcgj1aM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkZD1cxBKdN+1FjGJRZwk7GdvwvsHf0/DaPIVcsacSzG8dPIBV6byoiBAH485l2Tu
	 n61IoJ55UEJpNTpqCg4FX3/KUAVvIYDocZ9rL4h6vAIdD/KvW8AZSPWio7rZ5Dvr9S
	 M+edeW6vgcKIUVUPGjkkxGFdl7w+sYdl3Z3CXC85FBSyxHy1i93sYl2TZ23GMbmCJQ
	 9mk68FvEgLmkSXWK17IFq3JFpLhHgtsnaGW8gSyINAFNZyz7txL1CMEbprwqb3w1vR
	 BHnb7ipiBknWtPKP4MLrEuyqilOXfefBp3XGBz2s5oX6IJk2WDyTiOG/MBUNpCQ+0G
	 AlEFq5m86kdJg==
Date: Tue, 7 Apr 2026 13:44:55 -0500
From: Rob Herring <robh@kernel.org>
To: Padmashree S S <padmashreess2006@gmail.com>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm: marvell: Convert
 armada-380-mpcore-soc-ctrl to DT Schema
Message-ID: <20260407184455.GA3369046-robh@kernel.org>
References: <20260327114653.593582-1-padmashreess2006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327114653.593582-1-padmashreess2006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_114459_070856_405A643C 
X-CRM114-Status: UNSURE (   9.05  )
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

On Fri, Mar 27, 2026 at 05:16:53PM +0530, Padmashree S S wrote:
> Convert armada-380-mpcore-soc-ctrl to DT schema
> 
> Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
> ---
>  .../marvell/armada-380-mpcore-soc-ctrl.txt    | 14 --------
>  .../marvell/armada-380-mpcore-soc-ctrl.yaml   | 32 +++++++++++++++++++
>  2 files changed, 32 insertions(+), 14 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.yaml

Please move this to 
bindings/soc/marvell/marvell,armada-380-mpcore-soc-ctrl.yaml

Don't forget to update the '$id' value.

Rob

