Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D4DC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 16:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UC13X+NorbPPcdRnf2i7g+AqCcP8f4oWgIQYnDzkP4A=; b=Wpwrb23s5WSlvYGbfSqU8uQ3Mc
	M8jYdx5AA9K15zIZyQFHtlGTCB2JCxlsPFdvvDwU2JAp43PVjskcL6i7Me+9CuOHZ5GQamrAPSs2t
	IYEzXcOabmtCZ3QX7MV3AEQNQ99zErjTxcdOkDh9qamij2pMEeWYd2uzJrdljYYwjWTiJlKWVGZ7C
	WtDMsfLLbuLA4VxqYJb/5awYsiVJUlUMfJejnxlxYt0T/WkZFav2iVhZPkvWqGVO9YbP0g005Fq5+
	qm0Q/rqSjO7D/maQ+ZE6tppOZCC4BtlTK1QNdnGd1SwHvqOQLHAWEZUIkyKtKgfGEqjfXpDCO9R/h
	kGgw2DjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDVg-00000003MTr-2s4p;
	Mon, 17 Mar 2025 16:40:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDPd-00000003LLF-17Gv;
	Mon, 17 Mar 2025 16:34:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C97B0A46519;
	Mon, 17 Mar 2025 16:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5709C4CEE3;
	Mon, 17 Mar 2025 16:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742229240;
	bh=YXNIpXSQ0HSHHyJffyJrutOv2Z/LlwfQ1LB5ObJU4c8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BBRB8MD06NNtl92XO1LKxHaJdBIN/EYsBMJtVoTButPOl6ayJaVThYRCUmtIyxZHf
	 SBEFZ7JsWCMOdes3HZMQWF3OFigFEdjiNx16moTSfazhKdlDz2qJRhY1RoPF4isndW
	 HXeySH4plRQ4mZvyOoWr8bEZA1kdsVjOtU6+LN+0FGEmr+a0QMYRLQIJzBRCSUMaDk
	 7rCKfwDKiq3M6/fudE1gotgOb0mglwHd9ZjsURRw+90S33wRYGc8Nsb5s5VXANbbl+
	 6sYBmtCI4XzK+bhY8XedbbYQY30D8WP4UmPrx2lsXR/wGBfOqbuoR03eqjx7/9cDqJ
	 vZwxQpDYo1aNQ==
Date: Mon, 17 Mar 2025 11:33:58 -0500
From: Rob Herring <robh@kernel.org>
To: Jjian Zhou <jjian.zhou@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH RFC v3 3/3] dt-bindings: mailbox: mtk,mt8196-vcp-mbox:
 add mtk vcp-mbox document
Message-ID: <20250317163358.GA178378-robh@kernel.org>
References: <20250317110331.2776-1-jjian.zhou@mediatek.com>
 <20250317110331.2776-4-jjian.zhou@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317110331.2776-4-jjian.zhou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_093401_370364_382677B0 
X-CRM114-Status: GOOD (  11.45  )
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

On Mon, Mar 17, 2025 at 07:03:25PM +0800, Jjian Zhou wrote:
> This patch adds document for mediatek vcp mbox.
> 
> Signed-off-by: Jjian Zhou <jjian.zhou@mediatek.com>
> ---
>  .../bindings/mailbox/mtk,mt8196-vcp-mbox.yaml | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,mt8196-vcp-mbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mtk,mt8196-vcp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mtk,mt8196-vcp-mbox.yaml
> new file mode 100644
> index 000000000000..bd1b024e22f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/mtk,mt8196-vcp-mbox.yaml

Still wrong...

> +  compatible:
> +    enum:
> +      - mediatek,mt8196-vcp-mbox

mediatek,mt8196-vcp-mbox != mtk,mt8196-vcp-mbox


