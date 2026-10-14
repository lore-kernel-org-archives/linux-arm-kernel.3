Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E34CC6B24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ceqfmDgJF+WCAppCjeCtJerZ7k+zNnEfBBwFXdsDMkA=; b=OLAjf3aM6ZuVjw+J7Pa+rVgq5Q
	xwIsYA6ak2wWxBL17JMuRLkuOd8VS+sqrigKReazLsrXUAutVle+8yYKdS+oFtkeDBejR0KrqIOi4
	Bu/R/jnE9tp4DGvagxA5IXpEI4f4+1Z9wyjc06qk0FffGNCEy3g1ZVO6z0lIX/Vt3cYQsPxyz5EwS
	SoEZCWg8+wWnDmfa1zEhghhnIou4Jq69HW+8oVCuNUk7qyWTRFGrl/awVgV/KtjgcIiCV59C6/mqF
	SGRgwgYuM7Rqe9KBfqrTI3ZnSYErTf67CaN6UckaOKG8x14FJMir1Ta1OayLzoGck64S2zqT9r9U4
	QAhrOhMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwj1-0000000FGU3-0tkW;
	Wed, 14 Oct 2026 11:00:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwiz-0000000FGTf-469K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:00:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F838405C0;
	Wed, 14 Oct 2026 11:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FC31F000FF;
	Wed, 14 Oct 2026 11:00:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 1/2] PCI: Expose
 devm_pci_alloc_host_bridge_release()
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Semih Baskan <strst.gs@gmail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Arnd Bergmann <arnd@arndb.de>, Rosen Penev <rosenp@gmail.com>, 
 Rani Hod <rani.hod@gmail.com>, bcm-kernel-feedback-list@broadcom.com, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
In-Reply-To: <20261013220421.1588051-2-bhelgaas@google.com>
References: <20261013220421.1588051-1-bhelgaas@google.com>
 <20261013220421.1588051-2-bhelgaas@google.com>
Date: Wed, 14 Oct 2026 16:30:35 +0530
Message-Id: <179197563532.38040.2990484499406539707.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=639;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=m2zGuI1114KB7j2Md4jUhmFglPbeNlyzqJzKL4P086U=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqz2DWgeXL37dRXhlsw+cju33dbarzvO4skPBCf
 XNu9gd5OPaJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCas9g1gAKCRBVnxHm/pHO
 9ST7B/95w7G/Q0Ayf+Fn8WxvcIro1W8eLT4TqGaJ5xN5vjz72qAs+mDUnuUlLWWaQwx4O/IyI32
 0tlfRfuxr2yU+qb7SLiNPskgPQsocJ90VBkCsBG6VXbTy8XR6JXE9BGqJVghyN9BdlxTjWP9LXY
 kp2Z6cx+UsoJ0xmNyt0fjFmwcey8jCZbmqTg+AP9ffMKUppB35fHfFiPvS/RyGC+h5fsf1LuYDH
 yK21Ulp7ZnybzG1lRqgTRiH87OYwPAgrJVu+ujPNROPZ1TdkhvM49r+kkZcLsgFtnYQ3JLJMA59
 QIFFwRJHGlemAsi1fGGHVeBF32u1954SZ11WsUnk0kCjae2U
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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

On 2026-10-13 17:04 -0500, Bjorn Helgaas wrote:
> devm_pci_alloc_host_bridge() allocates a struct pci_host_bridge and also
> parses device tree resources and claims them.  There are drivers, e.g.,
> pcie-iproc-bcma.c, that need to allocate a pci_host_bridge but do not need
> device tree resources.
> 
> Expose devm_pci_alloc_host_bridge_release() so they can avoid the device
> tree parts by calling pci_alloc_host_bridge() directly and adding the devm
> release function manually.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


