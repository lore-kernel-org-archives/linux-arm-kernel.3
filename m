Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49F3F54AD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 00:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zuss7wBPaRYsZWeVEmPBdobtWdihJ6eoFJTEIumZiw=; b=VRDHvkMTNVqZmhiZUZI2OrdUxt
	f0pYrvtvbp4rQCjHn5Y4E36RoX+s2GgK+ufjqmYXZb1396ZukgGrKTP+IFajeORdUPD2KPhi/suh/
	5HuVWxdIjlgGJZ1ViOFSfXXI5HuDDoLg3BCjwtnh6by/AP+biKKQ5CmEqzAeOdcgxMuTa3Hj+biOF
	Pg/OOpY8+Jme6h/Y+3Q36h75CBVE/wgZVYoE+87J+aQd18GU1rkHBXtSYWGENj7kV4btAw6FM5fWm
	LuJXbFC3pa9lX2uC0Rq4AwHOMakRaTCugi/2IMcjKfiK5qrV0oaBjQ5nDwKD8ap80E/Tv3jaglVvh
	2m0rwBcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5CVd-00000002QQg-1G2M;
	Wed, 25 Mar 2026 00:54:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5CVa-00000002QQK-3Ann
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 00:54:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B50B943D61;
	Wed, 25 Mar 2026 00:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BF3C19424;
	Wed, 25 Mar 2026 00:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774400045;
	bh=dRfWufNAJCcOhh0AhmUSfHoYAd4HMIuJBmV7zbhHIv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AUbP/vJT3ju85md9fr2qXnnguARCnC6pYHEWEpWgxdy3mERVlbgDcDeN0tTsdggeF
	 KxflKX2yJwN7hFAEkp8hMd8eaVm5AUgnfY2+97Ty1E7yBjuR/Wl5PRZYCNeSrtPb3f
	 /kxaCN8j1pDIOkvGRsFvzPTB0rCZzuPhn1Y9rVwhKmm2HqQhOhNkCPN+H6l6VKgg/i
	 F9aG7r+Zu6Vfd4IUxNNp/DhFsEzIJ0BfxyIKb7z6ooH8gC2QhBxJYrECUxjAJGpvLG
	 js2BbpJNCjvSNmdhCNS+CrcA9r6yute3EqWKFLWaS7GtuxH1Z1n9edAI/rn63JdOE/
	 msh13CzeR4YhA==
Date: Tue, 24 Mar 2026 19:54:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
	l.stach@pengutronix.de, s.hauer@pengutronix.de, imx@lists.linux.dev,
	devicetree@vger.kernel.org, festevam@gmail.com, frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org, lpieralisi@kernel.org,
	linux-pci@vger.kernel.org, conor+dt@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com
Subject: Re: [PATCH v8 2/5] dt-bindings: PCI: imx6q-pcie: Add i.MX94 and
 i.MX943 PCIe compatible strings
Message-ID: <177440004361.2302904.12708290351428536062.robh@kernel.org>
References: <20260324023036.784466-1-hongxing.zhu@nxp.com>
 <20260324023036.784466-3-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324023036.784466-3-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_175406_814891_A865556F 
X-CRM114-Status: UNSURE (   8.17  )
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


On Tue, 24 Mar 2026 10:30:33 +0800, Richard Zhu wrote:
> Add i.MX94 and i.MX943 PCIe compatible strings and fallback to
> i.MX95 PCIe compatible string.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  .../bindings/pci/fsl,imx6q-pcie-ep.yaml       | 18 ++++++++-----
>  .../bindings/pci/fsl,imx6q-pcie.yaml          | 26 ++++++++++++-------
>  2 files changed, 28 insertions(+), 16 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


