Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FADC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 04:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=To/I2h6qM9lUrYs8VLR2XZQfXlUelYFY1hxgFj3shtg=; b=JE9/0h7jKg+AmFQFqooVL+NE8E
	aZU8eJxsOkWyoGKnuX2/dlV0Ae0atrfvXWZT1mHvVJVOztwFVUwyjaTPHSrWc6gJmE9PsMvJcOYQ2
	0XGrVbwBW8fNolutlHA9eTilDvll2tsK2NUpAHv4czMfzk96BU+7Awl870WQ1hduQHDiVIEqBpidr
	LBmjcaXj/1X4E5TliFuSnesQC1n53Bmt/eiNRKlllkegkXIZroG1ZkNMGRk3vr0C/nPr9l0njQDQv
	6A1RpdTAJuTMKjGM3C2dawOW3F4djgQIjSVBu4FJz9GStQZPYBYFU+mXdBRNf7SASjAKAi6GXmGS9
	U6krkbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXRv-000000041qh-1mHn;
	Tue, 15 Jul 2025 04:39:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWux-00000003y5E-3FyZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 04:05:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3833961139;
	Tue, 15 Jul 2025 04:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1610C4CEE3;
	Tue, 15 Jul 2025 04:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752552322;
	bh=iFMMfPSoD1n2DPXVFl8J1DaftpkELhHD3mIta9r3dVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K99vDCBP68Y7f4gY89Ja9IwjR44n70m9iYI+MsHPNuXlgvRIwAVPwTkDGhioksC15
	 LZ9LdNzHqBGmb4tD8aVNd3mjb2ZxZ352azgCyWwJ+lQldUxw3Oa8NZHNkB5TehghZD
	 FBoZA+zskf73JtiRcWpCudG2mpA/FaEaCPMrwFcfjARpjlGQ/TN+20pW7KJ0lrMl2A
	 2jCgajvWC1G4vblAUFmQoozlaSF1fpy2C6Bnuhgp9NqI4pn7BEDArk03G+WNZ2BG0K
	 Vceb1kdyb0a+Pmzvsun1oh8Ou3fVTZjoS0dbTPt1plqCV5WvaArXEbwobeFtSW+YEr
	 jQjR7mnkbZ2LA==
Date: Mon, 14 Jul 2025 23:05:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Toan Le <toan@os.amperecomputing.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-pci@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 apm,xgene1-msi to DT schema
Message-ID: <175255232106.43576.10425019978348638150.robh@kernel.org>
References: <20250710180757.2970583-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710180757.2970583-1-robh@kernel.org>
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


On Thu, 10 Jul 2025 13:07:55 -0500, Rob Herring (Arm) wrote:
> Convert the Applied Micro X-Gene MSI controller binding to DT schema
> format. MSI controllers go in interrupt-controller directory so move the
> schema there.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../interrupt-controller/apm,xgene1-msi.yaml  | 54 +++++++++++++++
>  .../devicetree/bindings/pci/xgene-pci-msi.txt | 68 -------------------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 55 insertions(+), 69 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/apm,xgene1-msi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pci/xgene-pci-msi.txt
> 

Applied, thanks!


