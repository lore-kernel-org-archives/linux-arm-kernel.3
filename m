Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314D8CAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 22:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=AQEhGPAGapHSg5qquRV2E42XYlhXgDfD1VzKJMYPb3E=; b=qEqE4DvYQa07LL
	ZjZse/cKmesHONHFSithIeIIgqzPmqwl4Ewj7J8cKkNjTn21UA5edM0PdF1LSp0ptfOSZSO+rDusa
	ab7+Ps0QvOtkR1zbx9Fq3qg5zb++sgt3QYz+gd0C1WdEJ1++W7YfSZ4me2EvWPx2gY+pL1mdWwcLR
	QV9NB1b1xA6BQMmTKOfgx7iY+OY9sIfGDa9ox6WM6+6yxQVdmQpmGCJpebnrc6ld3l1sbHwwbLwhS
	qCtMWIQhAHr6XBofpplLnyaSGqIRzWaZGRn6bHa4lyhI2nhY+JWxovpvpY9oOjJ3y+Du/CI4hg1Jf
	TFdl4np72sSnUvPCKF/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0TR-0000000FCgO-46jj;
	Wed, 17 Sep 2025 22:18:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0TQ-0000000FCfX-1JYL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 22:18:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6387D60055;
	Wed, 17 Sep 2025 22:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3043C4CEE7;
	Wed, 17 Sep 2025 22:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758147479;
	bh=fbdW+KLDFPxSjGQleOs2jS1S1g6p2m+vvMK1Y9c6Oso=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=WiO9y55NLHOAOCK2KmkjN2HDDGG1i3ZDMfTVlWD/l7IniL/n/Hy0DW5q2oKUhsMQf
	 D6WTIEo2Jpc+/pcaoe9kxfHk+Xl8UQDzhAYQn4HvLggUwJQHT62ZnMngLU0e0MiN+x
	 wjI685uwrPsmZl9sM06ejL9L91e758An1sU/1efbR6q5EfEtNPFzo0qFzAHWp8f2sq
	 41/EKx+3Hl6Mq5fxI2lHZ/S0MA1qGtWiEwVy4bgKPbYr48hqNGPu55/CJWRCmabGks
	 EFOfN1DKIC/VClQNU8Sxw8ZWoUJEsiPTSUgU0G1BIZ3y68Sn+dtaneBPSPm8WKoVr7
	 5WVI/lJhM+tMQ==
Date: Wed, 17 Sep 2025 17:17:57 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] dt-bindings: pci-imx6: Add one more external
 reference clock
Message-ID: <20250917221757.GA1878979@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917045238.1048484-3-hongxing.zhu@nxp.com>
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

Update subject line similar to patch 1/3?

Also, I notice most binding commits include "PCI:", e.g.,

  dt-bindings: PCI: brcm,stb-pcie: ...
  dt-bindings: PCI: qcom: ...
  dt-bindings: PCI: altera ...

On Wed, Sep 17, 2025 at 12:52:37PM +0800, Richard Zhu wrote:
> i.MX95 PCIes have two reference clock inputs: one from internal PLL,
> the other from off chip crystal oscillator. Use extref clock name to be
> onhalf of the reference clock comes from external crystal oscillator.

Not sure what "onhalf" means.  Maybe it means something like this?

  The "extref" clock refers to a reference clock from an external
  crystal oscillator.

Same issue in patch 3/3.

> Add one more external reference clock for i.MX95 PCIes.

