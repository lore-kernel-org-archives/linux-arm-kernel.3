Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EB4C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 10:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FTrEsli7hTdx7wP27T0dCOvOiUKO99dvvhMt+K/pGg=; b=QAcNHhNu7JTD6Pqiaz3e3TDCN+
	auYIYSLDxke4WoqGdDD4uTMt9qXw6N0yt6K9NImzXKASzTBvCkI8sn5JqfVjdUbsTdm+8tMYIvrjA
	NFfk51AzuRNW/ERTMngJKlBGc7HYcByY5xazMaun5wl5erlruOjZiCkh7DX7fPY0FuG/99AEBOLMf
	ZnEr0colg9hIrtSJ8wExk1FY+ICrA09/oTPRTYgz/7G8jI0NpK781xhNakOUB3ILPjaDkFK50s87C
	u7r3c9CyY45i/9MsNkS3Do+yuI5ucUCmLYrRRPOtcjScUbNaZ/Yds7dxVd/YExwhlIZJLxFgw24LF
	RGcARRzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFsI8-000000038Ej-0UR8;
	Fri, 16 May 2025 10:27:48 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFsE9-000000037TA-3ZaC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 10:23:43 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1uFsDs-0002TA-Kk; Fri, 16 May 2025 12:23:24 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uFsDr-0031Py-0C;
	Fri, 16 May 2025 12:23:23 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uFsDr-008SsJ-0x;
	Fri, 16 May 2025 12:23:23 +0200
Date: Fri, 16 May 2025 12:23:23 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Bryan Brattlof <bb@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <aCcSG5ah12N0yOwi@pengutronix.de>
References: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
 <20250507-am62lx-v5-2-4b57ea878e62@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-am62lx-v5-2-4b57ea878e62@ti.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_032341_894736_59B8E408 
X-CRM114-Status: GOOD (  20.20  )
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

Hi All,

On Wed, May 07, 2025 at 10:09:20PM -0500, Bryan Brattlof wrote:
> +	rti0: watchdog@e000000 {
> +		compatible = "ti,j7-rti-wdt";
> +		reg = <0x00 0x0e000000 0x00 0x100>;
> +		clocks = <&scmi_clk 273>;
> +		power-domains = <&scmi_pds 60>;
> +		assigned-clocks = <&scmi_clk 273>;
> +		assigned-clock-parents = <&scmi_clk 1>;
> +	};
> +
> +	rti1: watchdog@e010000 {
> +		compatible = "ti,j7-rti-wdt";
> +		reg = <0x00 0x0e010000 0x00 0x100>;
> +		clocks = <&scmi_clk 279>;
> +		power-domains = <&scmi_pds 61>;
> +		assigned-clocks = <&scmi_clk 279>;
> +		assigned-clock-parents = <&scmi_clk 1>;
> +	};

In the TI downstream TF-A we have this in the readme:

| AM62L Clock SCMI ID List:
| =========================
| 
| **Note:** For using the clock parents, the scmi clock ID will not be the actual number itself,
| rather will be starting with 0 for respective parents similar to how it's being done in TI SCI
| Documentation: https://software-dl.ti.com/tisci/esd/09_02_07/5_soc_doc/am62ax/clocks.html
| 
| For eg. for AM62LX_DEV_MCASP0_AUX_CLK device, clock ID will be 192, however if we require the parent
| to be AM62LX_DEV_MCASP0_AUX_CLK_PARENT_HSDIV4_16FFT_WKUP_0_HSDIVOUT1_CLK then we would represent in
| the device tree as:
| 
| ```
| assigned-clocks = <&scmi_clk 192>;
| assigned-clock-parents = <&scmi_clk 1>;

This doesn't work. It's not conforming to the SCMI specification and it
also doesn't work with the Linux SCMI clk driver which will hang on a
cat /sys/kernel/debug/clk/clk_summary. This is because all clock
parents will be the SCMI clocks with the lowest ids including the clocks
with the lowest ids which will expose themselves as parents.

It also prevents the userspace from being able to make a tree structure
from the clock tree.

The corresponding TF-A code is requested for upstreaming here [1] where
I also commented on with the same issue.

Please stop spreading this further. The parents must be the actual
clk_id, not numbers from 0..n.

Sascha

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/34834

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

