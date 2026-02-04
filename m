Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C9DE8B397
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 18:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDnpK7Apjj2T9UYeZbMpsuvqBdBCYvvpnsGqsNrqmls=; b=UlHtmrBPGQWl3kn5xN+KCH/8Td
	S67yPs+UuTT32vT/JizXRMQmvFI5dSjpveq2BE4sXZSGSCuS3RMF+RCXJe6g0H8voP7eHMWweO7HZ
	SOlzNoIFzA5fJ696Y/xsROZeReLd9fhzZkaKZo6LPqnY5mNUBex4nT9IsE+yU0ho7dE4HFFuUXXYV
	U1+Tk50bPhAO6aC/Y/xbu3AaCOThgKOukSzXXkZHE39qS4JI060Zvd0702F+7U/lfXElychnY+xzM
	yvuja2TCv8uk7mIigGx5I3kWQsQQVHQqTateEmuRz0t4seFAbNKY93g5EiNZ0WisUZl7Qm3dsWNeA
	xTKB/fsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhZ1-00000008vUF-2ndD;
	Wed, 04 Feb 2026 18:25:20 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhYy-00000008vTs-1dQu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 18:25:17 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 9F162C0127E3;
	Wed,  4 Feb 2026 10:25:15 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 9F162C0127E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1770229515;
	bh=lpK1Zrp0KaaCyZ9NMwJqLwpT6YZg0RTNLTEmT781GU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qnXTEC95XbN+rlZI1NZEYnU6iXc1zD0iNrAM4LPJcC/wucgNNn/zfS/WepU8ltQNT
	 4ZqL7pOd4Be6PuIVLD1TNZxXV2eLICYrSDLnBGtK9zr8fYMjykfArBGXEgLnbRXOb1
	 /oWljLW0vrY0+FqOO+5l0PhZsXKKy6vxfxYqkTtc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 7C3B41B854;
	Wed,  4 Feb 2026 10:25:15 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>
Subject: Re: [PATCH V2] ARM: dts: BCM5301X: Describe PCIe controllers fully
Date: Wed,  4 Feb 2026 10:25:15 -0800
Message-ID: <20260204182515.1154618-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108224026.3550-1-zajec5@gmail.com>
References: <20260108224026.3550-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_102516_503336_E97A1959 
X-CRM114-Status: UNSURE (   9.51  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu,  8 Jan 2026 23:40:26 +0100, Rafał Miłecki <zajec5@gmail.com> wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Tested successfully on BCM47094 SoC using Linux's pcie-iproc-platform
> driver.
> 
> This fixes:
> arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dtb: pcie@12000: 'device_type' is a required property
>         from schema $id: http://devicetree.org/schemas/pci/pci-bus.yaml#
> arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dtb: pcie@12000: 'ranges' is a required property
>         from schema $id: http://devicetree.org/schemas/pci/pci-bus.yaml#
> arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dtb: pcie@13000: 'device_type' is a required property
>         from schema $id: http://devicetree.org/schemas/pci/pci-bus.yaml#
> arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dtb: pcie@13000: 'ranges' is a required property
>         from schema $id: http://devicetree.org/schemas/pci/pci-bus.yaml#
> arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dtb: pcie@14000: 'device_type' is a required property
>         from schema $id: http://devicetree.org/schemas/pci/pci-bus.yaml#
> arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dtb: pcie@14000: 'ranges' is a required property
>         from schema $id: http://devicetree.org/schemas/pci/pci-bus.yaml#
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

