Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DA3CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 13:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z97N0nvig8VQv1fl07JtA/y5utH7Z66UA6NeoFpj+7Y=; b=JcPt+TdKzm4RitQZNHbncsaVhe
	ds9YYHMNYcXvI7Q0ckTciSbEDOss94SbfYx6iuNFWpn6RwlqrhPcQp3Ch4/zKVUmyK86/0/6bs3Es
	3nNbSy1FowBk9D29kO2F9kWAIudEhGThke0UXyyZz0S5lgaYc6zp3/CAFI10vIfZEF4vVe4yRIy3k
	qmDsJuUv3xM3TNQ+LlmyAR9ELjL/n6MsXZ8GAHBJAst2B+B/rfZ0uHMRp7uYpa3x/U7N8TziAtLOG
	0mFii6EnJ5khwpCdJzDHo6Xk0Ym9dvS34xHXHBLvZGBm0tS0gTyWMWQwssJT8d4kNcdPOzlSkjpvB
	RwCvqNXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHfO-00000009VeC-2icP;
	Fri, 24 Oct 2025 13:17:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHfM-00000009Vdg-40M1;
	Fri, 24 Oct 2025 13:17:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F90960496;
	Fri, 24 Oct 2025 13:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA46BC4CEF1;
	Fri, 24 Oct 2025 13:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761311832;
	bh=A2BnR2YHSryVqsKA9P+YQyFmh/9l8BRKmmWfe/NlsaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aZtXvucm/CfsW7ZEu9pDdtzSjZjO5nS5yODdFkvQeRrlKFUKNtzshAe7d0sflUwTy
	 wmMAsC3Q/5aspelec9kXuFJC8WY8P1zDgKS8uNTWZFIKGPBatu1IjmhEt6oBILk1cu
	 CR1ZubmRc6Frirymaa1FDOREXiQXlH/67KI4Iyt+UF7e6Ay0F0H1I4VOyM2kkMGCzX
	 WIYBVY7gi5SQdBo4v/6kTn5ut0Siw6V84sdLKa6GnP9W/SF3RPT2v6d8yKkgseEn3L
	 QUyeXJxcDbLwlwse1OvnqYF/2F5ThD7UID+ak3DWfxbhkw0G2MIh8AH6gsXb93oDLq
	 4yeu1u+XB2H4Q==
Date: Fri, 24 Oct 2025 08:17:10 -0500
From: Rob Herring <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
	conor+dt@kernel.org, houlong.wei@mediatek.com, krzk+dt@kernel.org,
	matthias.bgg@gmail.com, mchehab@kernel.org,
	minghsiu.tsai@mediatek.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v3] dt-bindings: media: Convert MediaTek mt8173-mdp
 bindings to DT schema
Message-ID: <20251024131710.GA1563195-robh@kernel.org>
References: <20251001183115.83111-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001183115.83111-1-ariel.dalessandro@collabora.com>
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

On Wed, Oct 01, 2025 at 03:31:15PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for MediaTek MT8173 Media Data
> Path to a DT schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/media/mediatek,mt8173-mdp.yaml   | 169 ++++++++++++++++++
>  .../bindings/media/mediatek-mdp.txt           |  96 ----------
>  2 files changed, 169 insertions(+), 96 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt

Since the media folks haven't picked this up yet, I applied it.

I hope to see some more Mediatek fixes this cycle.

Rob

