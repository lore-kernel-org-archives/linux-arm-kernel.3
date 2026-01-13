Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F07D30CDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 22:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pucd+G5aa0PzUeRY++f9dVcuMe4Ta0KK0tCfqj0Iq7g=; b=AkVNmvC8Kyv/tqhi0jXSfMXPL8
	ZM5+A08coCDBz3gR496OoATqrfLfogeUNr1Rg+s9PtouvdW7J1y40hggOy+rphLXnbmtqsm4m5JgC
	ecG2neOVMXUJpQjOYEEqTsFmzfPpppxAz27/xTlNcX4psyWI2SynZmCXEfwP5FpPqtYeL/Q/ez4qb
	91oE3WcCB7zDAgkBax8jDLM0Nzau3qpGOqz8jEpZ1cNOTt4uDuEexn/EOlkSLhhW6k9EIDKQK1IaH
	Yk9oEn3fbUUzBjiv4h2zCcV27jd5EZoP9vDPIlUwqAzqvWGU+BRs/4CQSWMQWQO+Q5PY14kgArgLw
	hPCRRk4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfn0T-00000007peo-3sEu;
	Tue, 13 Jan 2026 22:36:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfn0S-00000007ped-39Y1;
	Tue, 13 Jan 2026 22:36:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2B6E6000A;
	Tue, 13 Jan 2026 22:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6461FC116C6;
	Tue, 13 Jan 2026 22:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768343815;
	bh=KnVjavPiBn10fAwKoZ9AxMWWLrQDeyNt9CWuUHHMCaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aEd1jP+3Ckz+Toi+4/j3sSrkYBiGUhlh3646PpYh8fwZotQDP44U2fcLomASRxzA4
	 ZJjIvL0zq7Bf2x/iH5LrGadET7fhRU16mfWwdxA685CK5VklFl5lhw7kl364Pd1viw
	 fv4T23vynYdf4HskNp5o4aFZtYgt252xTwltgpPVochev2I37ztbFuQS/7GHZw96/w
	 FaZl3/2LpUyi6P6eKIItQ5+ZEXv3LgX8HHy8DnagVtdiRD8s8LN6ci7HfpG86K2fSP
	 q7KoYDaN4Nlzf8QEQkT+3oBhN36h/L5dZpupb7FZSEcFgBZsSZsumH8m4nMH3iMU6G
	 Wuq9WJAjN2aSQ==
Date: Tue, 13 Jan 2026 16:36:54 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: davem@davemloft.net, conor+dt@kernel.org, andrew@lunn.ch,
	matthias.bgg@gmail.com, gregory.clement@bootlin.com,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-crypto@vger.kernel.org, atenart@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sebastian.hesselbarth@gmail.com, herbert@gondor.apana.org.au,
	linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: crypto: inside-secure,safexcel: Add
 SoC compatibles
Message-ID: <176834381386.366633.8858781364146409753.robh@kernel.org>
References: <20260112145558.54644-1-angelogioacchino.delregno@collabora.com>
 <20260112145558.54644-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112145558.54644-2-angelogioacchino.delregno@collabora.com>
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


On Mon, 12 Jan 2026 15:55:55 +0100, AngeloGioacchino Del Regno wrote:
> Add SoC specific compatibles for the SafeXcel crypto engine,
> including one for the EIP197B used by Marvell Armada CP110 and
> and two for the EIP97IES used by Marvell Armada 3700 and by
> MediaTek MT7986.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/crypto/inside-secure,safexcel.yaml           | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


