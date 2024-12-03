Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09C2E6C60E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 07:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJktaLxFgth/eHbkWBr5EAm/4MPxkM9NRQG5MPKJ7dM=; b=VNo/LfW2ehP/lz4K7RZsoAvNvZ
	xVwzpvG3kortazBy+Tyf2KSNQOJzny8dxUyPLL12i8S9nPa6Cd40Zt9l11/2RcaeofzFoaoH8TmOM
	JHSMXFwx+tseTVJYCtPdyUuSqO7LD0/jZqn9JRGF1eQDoMYKIyGw6EOSz/btVN7V9nly7vFqoYDDb
	mRwCpP2YjI8Pd5EQcD6+AxY0oqvmT9K9YTcc27FjlH9awHbgSvcB3g3o8luQTDoAFnauyVBj0KDmX
	klRtXoyp0Nfe5c5Xn0+g8jtNTjDRF76m4cRHkwFiQo+fb9O1Z80DfE8idaOAgsH8i5taeaW9UJteQ
	D/NbrV2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tINSA-00000008Xki-2O3S;
	Tue, 03 Dec 2024 07:36:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tINRA-00000008Xdu-1yXi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 07:35:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F3F8FA40500;
	Tue,  3 Dec 2024 07:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61661C4CECF;
	Tue,  3 Dec 2024 07:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733211311;
	bh=ypnPxAFE2fhbzwzfe1LjgidD7AjC20QK8t5DD9iGi8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bOdwXzQ2yFb70zgcAsTxHKDF674yjrz/bxd3oNv3NHcFW39DUbCTOV4Bh3oaFNL/u
	 1xLH6G+pcwcHuFybzsJ8PR5+7tbfLW7XmHOnemZP6eLQ2wGnZ5jIuuYeBlO3xUXM5/
	 bFbDlgYNUjeHXobKQS5PnG7wIWH98dd224HcoVKyio4JNd3EfUC2y7+emNYVO4ItMF
	 +UzTqXKNqj+80N7XabwENPPMA4LqheN3DVgfKs2AKzl0yDKhkYTItuMy18aDPNihUE
	 apmT8ksG/lxG9T5TgFGQjcrO42c25FsUd6DZm7NkeAqEvVtYGywm/jfGlqA4p7LIWL
	 QLq6MnsPeyYYA==
Date: Tue, 3 Dec 2024 08:35:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Romain Naour <romain.naour@smile.fr>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	kristo@kernel.org, vigneshr@ti.com, nm@ti.com, Romain Naour <romain.naour@skf.com>
Subject: Re: [PATCHv3 1/2] dt-bindings: mfd: syscon: Add
 ti,j721e-acspcie-proxy-ctrl compatible
Message-ID: <douamjn7udsmbcouplhgg4i3drq5ayltraorgr43sb4lxwy2sj@gd4t3oy4rg5f>
References: <20241202143331.126800-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241202143331.126800-1-romain.naour@smile.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_233512_572966_B513FCAA 
X-CRM114-Status: GOOD (  12.38  )
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

On Mon, Dec 02, 2024 at 03:33:30PM +0100, Romain Naour wrote:
> From: Romain Naour <romain.naour@skf.com>
> 
> The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
> SoC are used to drive the reference clock to the PCIe Endpoint device via
> the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
> obtain the regmap for the ACSPCIE_CTRL register within the System
> Controller device-tree node in order to enable the PAD IO Buffers.
> 
> The Technical Reference Manual for J721e SoC with details of the
> ASCPCIE_CTRL registers is available at:
> https://www.ti.com/lit/zip/spruil1
> 
> Signed-off-by: Romain Naour <romain.naour@skf.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


