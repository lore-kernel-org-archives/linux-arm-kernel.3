Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457B0D5A6EB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 07:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NH2QXtrlg3soMHEH64f1kzx9exe0HexikLoBaolmwxQ=; b=a3XlffkE5+aLF/5XghJ2jJuH83
	zCX84FQLzBJ+06a8tZmGsFdCVmIp0E6SRTOAEcYGc2lD4AWGNlp59EkONvtnwM7eYke08R3NHZYGV
	P17gDHOcDY9TIhkj6oDbn4oYbz3JlKSWV7yJQWjk3NKB9qOhGdANL7XjlDQfnOAox/eZG2Zpn5K7e
	f37cNaYq+NJPNIdt9oHWP/iF39KrCs2WK2oR9UxerS5bFPmMxFwPsY/jwSbvI8FmJpyLGAGpAHF6D
	dw8WQhndnPEDRFhWLZ+AejWqYq1LTl89KrBLoX7SZNNlABtUZ8n97jFhmMeuDzeBRW8CMpDc+dUKo
	d0Vfmcmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFq9g-00000009rRx-2glJ;
	Tue, 26 Nov 2024 07:38:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFq8h-00000009rEw-2ddB;
	Tue, 26 Nov 2024 07:37:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ACEC45C5CAF;
	Tue, 26 Nov 2024 07:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21035C4CECF;
	Tue, 26 Nov 2024 07:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732606658;
	bh=r++3Qo7JVxc4zP3NbHwY47VSgGg58VDRmi+G71l8cAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b+OsL5e2jt0v1wI37WnVDynehv54EZ+19kfRw7zwBXYJs7jGd6/lCUH2E+KuGGMn+
	 CRs9s1DT7vM9mrsbFkqfXjzE2zcv+PRPT8PRaqhbf6udC5ErysrrMYq+rfqOmVFczx
	 C3ORS0aQWiCjlScWQ6yzEdarj2RI5x4cTMdL7eXJ/sWxK7ikVlONunFWyetZo9XkMr
	 O4hUSrMjH4Cj9wpdZSEMzUQD81ROfLBEsbY1Xc24nkuGU8cyN1I+TYs5789waEszgR
	 mzyEpyVmm5/0WDxdSKa7kKRMCA0HSiCWbjMcPUiiAbULv14b5JOFCh70F1NzLGOtxr
	 KDCInoFuHzHMw==
Date: Tue, 26 Nov 2024 08:37:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mathias Nyman <mathias.nyman@intel.com>, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: mtk-xhci: add support mt8196
Message-ID: <uy22btn4qv3gc3glizyuzdlxawgvvjgk765jjjk6mj4ftadbyv@hh62ph3ug5gg>
References: <20241126025507.29605-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241126025507.29605-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_233739_706490_E5B5FD54 
X-CRM114-Status: GOOD (  12.21  )
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

On Tue, Nov 26, 2024 at 10:55:06AM +0800, Chunfeng Yun wrote:
> There are 2 USB controllers on mt8196, each controller's wakeup control is
> different, add some specific versions for them, and add compatilbe for it.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


