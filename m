Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24253D30CDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 22:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9vUSpEjSPMnjGALihciJWDPWN0mOu6ySB71SOZKM95A=; b=vxu5zogHu1wQsI8N0efmUURjIf
	Rpm65WwFOF9KZsdE4Kr7UnkbwB50eYGg+l4kEdF+cWTqIT4e4vJT6x1T5nfKFh8aQPIfqOcsjUSgE
	2C+l00maohV5LLaoD6U3hMJ9FJQVtCdRw2bi0eVu4yh99ZQFrL2MJYZqzhHDkirFeaIEFqV9ra5LP
	ZggAmbOH2IIlbcziJBpZEc8pKPPA6+RroKwCtcIyiiYRNnNXATUJ8yYOUYyMJc+AfPmIZeUbEToMC
	4MuOypmef42Aj2T338Ntv3U22u000mPMuCwLft1Bt5qKV2EWhVjrZPhUQbXQvADG9l+dJlXi4CQ1D
	2IcctFZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmts-00000007pOJ-3V74;
	Tue, 13 Jan 2026 22:30:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmtp-00000007pNj-1uNX;
	Tue, 13 Jan 2026 22:30:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A65FC404CA;
	Tue, 13 Jan 2026 22:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62439C116C6;
	Tue, 13 Jan 2026 22:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768343404;
	bh=HhYgya/+gHZZL3BnlzehiCFBNBYrrXdk9ohT+saOEB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k9UNEkrzSjMl/w0ZA3UHVOgoZR6ZfgYF77Fdp1b6d5mcBmMTaPRQ1Yd25VgPUGyit
	 2HtjtFKjF0TQJdj7UuNrJqqPX4fKIq3v+VY3q4wNdvwKxTQZz/uCAxVQlswbTu0j69
	 13G1cMBRBsllf7Vtlt6fT2O7o4WBqaz0WZuZfA2gTP65PFBz4B/J3srLI0Wyy/fih+
	 72y4bN3s/RhYejt4JZCKArQfgFVMZ/EQywshTc11ff8fWgc+ZyFgDTMjh4H2Nrhh3e
	 1ACeuTDzMx97tDYgI+J6rWcSLStQlijzcKofHweCezpx/6Ofz0zDzV1UgIo4YiUxWf
	 d1uH3rLoSdV9A==
Date: Tue, 13 Jan 2026 16:30:03 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
	daniel@makrotopia.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH] dt-bindings: net: dsa: mt7530: Allow interrupts-extended
 dependency
Message-ID: <20260113223003.GA198961-robh@kernel.org>
References: <20260113110020.37013-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113110020.37013-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_143005_516998_DBD1725B 
X-CRM114-Status: GOOD (  16.54  )
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

On Tue, Jan 13, 2026 at 12:00:20PM +0100, AngeloGioacchino Del Regno wrote:
> When the MT7530 switch is configured as an interrupt-controller it
> also needs an interrupt but, in this case, only "interrupts" was
> allowed.
> 
> Some devicetrees instead use the interrupts-extended property as a
> shorter form, and in place of "interrupts" and "interrupt-parent",
> as an equivalent.
> 
> For this reason, when interrupt-controller is present, depend on
> either `interrupts` or `interrupts-extended`; this also resolves
> some dtbs_check warnings.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml       | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index 815a90808901..ffeb8d5836fe 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -279,8 +279,11 @@ allOf:
>          - resets
>          - reset-names
>  
> -  - dependencies:
> -      interrupt-controller: [ interrupts ]
> +  - anyOf:
> +      - dependencies:
> +          interrupt-controller: [ interrupts ]
> +      - dependencies:
> +          interrupt-controller: [ interrupts-extended ]

We already fixup this case:

dependencies:
  interrupts: ...

And there's a few other cases like yours. So I've pushed a dtschema 
change to handle this case.

Rob

