Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD8AC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WXtzIkWp44jITYT1U7u3Ybzwe75zSNxYIfNq6iyk7w=; b=srhOEVIPD2wzUguTGbOcqJC3WT
	UPvSm7hzMUoF/t8ZLvHos4mgYzHCirZ19vQ4GYSTpoUDHXORhmDRVlDk4zUzoCNk7Ls/cwX42t/iR
	piQVL9V2gaN925cTu0Y8v33ssWp0WezU9LDabEQ6mqDu+60YSnvxNNjQia+q5bnAilpldsXHb3l0J
	spu0rJHYfd17GmMArMCtu3tWQyaJeFpZkLhj5uQbk5gZXql8BKZ6US0V7eRLeXuM0a1w6grDmuy3i
	otvLLHReGd+pkhZ70w50K++yfthpdTpzu0J1+YxHvgxgqcl/onqXE8APM6Ss8AshmQx9qVLAOVPkZ
	iT4r3XUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEA7-00000006MgH-2iMz;
	Tue, 08 Jul 2025 19:39:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCCy-000000067s7-369l
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Jul 2025 17:34:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6WXtzIkWp44jITYT1U7u3Ybzwe75zSNxYIfNq6iyk7w=; b=DRDHJbCX0v9/HqSpQNc77jAVjv
	qeqySZJxrPcqjutHEdIZL07Mo0Wx/uggFNUu/lbx9waLWb34HyswUBnzsP1xeszgtt81VvgjJAGIC
	f9sGiKUNQ4qpvq5ivzhlkwHLCEwICAWcUjKsn/gv86l6i/BPd+eQ/w4OsTrG8iwmUWrrDQJlOciC0
	T8KHAKRZtk7vOOqtDvAAvwy68up5dXRq7KIUIuscM7shGQOcFK1IjvtKWCO51XkXNxuDlmz62NeiN
	uyemy8XfuOqxcmZiYhlhVl9AInp5lXC657HcCsYBveC6VeeZCwTfLedrYkHsrt8VT5E+SEpy9vQrY
	mu+3PzSw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCCu-00000008lVB-2JqL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:34:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A864346916;
	Tue,  8 Jul 2025 17:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA1CC4CEF6;
	Tue,  8 Jul 2025 17:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751996052;
	bh=z4Ig+4c3O1m133hnPsDcA3pm1ASaonn9kHoCQ9HjQXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Im2I+iWD8CS4Jt1cft7/CN6/TlJhIy9vRGvcqmxLwx/G8LMLwUnmLvCo6vbBBy0+X
	 VcpYLKjr+aGpyhnA7lPCmpZ8ovKxKPXCjvLvEF74iFdfRhWjOxYlAztfSvo9aLLWBn
	 kum0105EDhmGNd1DdEw6OdH00jykx8y0rPEYcFIhts7LQ29vICE/CHSg3Sjtbb9AJF
	 71ms7PA5laq2cNfTqP98ThvqPU65d7PdcEPSaOG/B/Lhq1XWEhPShZRvVG6z6FN8Jr
	 2hk94hvfjVq8/QPE60MgvEbSd2mDwhxcOAtv2ZecJuYW6vr8z5SSHcUMK7lfmauUDM
	 UQ/2/Qf66onZg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uZCCo-00Dqhw-If;
	Tue, 08 Jul 2025 18:34:10 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Toan Le <toan@os.amperecomputing.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 10/13] PCI: xgene-msi: Resend an MSI racing with itself on a different CPU
Date: Tue,  8 Jul 2025 18:34:01 +0100
Message-Id: <20250708173404.1278635-11-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250708173404.1278635-1-maz@kernel.org>
References: <20250708173404.1278635-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, toan@os.amperecomputing.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_183416_945864_82ADB2ED 
X-CRM114-Status: GOOD (  13.78  )
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

Since changing the affinity of an MSI really is about changing
the target address and that it isn't possible to mask an individual
MSI, it is completely possible for an interrupt to race with itself,
usually resulting in a lost interrupt.

Paper over the design blunder by informing the core code of this
sad state of affair.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pci-xgene-msi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pci-xgene-msi.c b/drivers/pci/controller/pci-xgene-msi.c
index b9f364da87f2a..a190c25c8df52 100644
--- a/drivers/pci/controller/pci-xgene-msi.c
+++ b/drivers/pci/controller/pci-xgene-msi.c
@@ -183,6 +183,7 @@ static int xgene_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	irq_domain_set_info(domain, virq, hwirq,
 			    &xgene_msi_bottom_irq_chip, domain->host_data,
 			    handle_simple_irq, NULL, NULL);
+	irqd_set_resend_when_in_progress(irq_get_irq_data(virq));
 
 	return 0;
 }
-- 
2.39.2


