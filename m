Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19347E668BC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 18:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlFx12vBQGHDR9zpocYGant9l0zJdVzAb4Lso1/d6+Y=; b=HWkApjcJI2AM1c5KmLl9HOGaGM
	hY4mr+O1vC9pW/vKH10XtN+cOQ5gfGyylqIs2+oCwEmnPWmlTy4BJ0cKSvnP7GdMpTrKk24VYMqN2
	IWnTv0zypk2gdXc6ar42ktxPy4Ocse+uoCKvalAaPUXehviMXBPXRQrgJZtwegbec9LYbiOaC8Adc
	NdBqSgWJ+IsOUTCvXCOtOcmaRtgak0X19UhVebvXGVzxiI2DTB/Ktgw43x/Yv2eU0g+VbImPsT70b
	MHHwLTahqUw/c3/ByRVQdep1IjXjsDVTNw1nO/VFDVW62x5IUSPMkHNXCIK/hDHZHjBzW4kej3oOH
	qlc3gvZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGzP-00000006TiK-08c6;
	Sun, 24 Nov 2024 18:05:43 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.208])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGrC-00000006SRB-1azu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 17:57:15 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 9C130C0005C6;
	Sun, 24 Nov 2024 09:57:13 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 9C130C0005C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1732471033;
	bh=kIYnn2IzSJmvPLrK5pTh+LsC/BnqqWEMG15Zd8OS2WA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sLe1+FO0EsVKy0VGXugmce2xefdYj4FvLkt67puwCWXAO7JIWIGHQ2KccbqrWzXNE
	 EEw3hzepH9TVr3YihzdtMxlIHM5S5k5FlF+qhrwPBmKMEhXQabW0gCwYwazGA4v/H0
	 JLr0r5DsQw+8uZbgMPnkg/q87uvLYXAHfnRAhNaM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 3F76618041CAC6;
	Sun, 24 Nov 2024 09:57:13 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Sam Edwards <cfsworks@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sam Edwards <CFSworks@gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: broadcom: bcmbca: bcm4908: Add DT for Zyxel EX3510-B
Date: Sun, 24 Nov 2024 09:57:12 -0800
Message-ID: <20241124175713.718830-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009215454.1449508-3-CFSworks@gmail.com>
References: <20241009215454.1449508-1-CFSworks@gmail.com> <20241009215454.1449508-3-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_095714_493928_6F184740 
X-CRM114-Status: GOOD (  16.51  )
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

On Wed,  9 Oct 2024 14:54:54 -0700, Sam Edwards <cfsworks@gmail.com> wrote:
> Zyxel EX3510-B is a WiFi 6 capable home gateway (family) based on the
> BCM4906 SoC, with 512MiB of RAM and 512MiB of NAND flash. WiFi support
> consists of a BCM6710 and a BCM6715 attached to separate PCIe buses.
> 
> Add an initial devicetree for this system, with support for:
> - Onboard UART (per base dtsi)
> - USB (2.0 only; superspeed devices are treated as high-speed due to an
>     unknown cause)
> - Both buttons (rear reset, front WPS)
> - Almost all LEDs:
>   - Power (red/green)
>   - Internet (red/green)
>   - WAN (green)
>   - LAN (green; anode is connected to GPIO 13 so currently
>       nonfunctioning)
>   - USB (green)
>   - WPS button (red/green)
>   - Absent in DT: There are 2.4GHz/5.0GHz WiFi status LEDs connected to
>       the WiFi chips instead of the SoC.
> - NAND flash
> - Embedded Ethernet switch
> - Factory-programmed Ethernet MAC address
> 
> WiFi cannot be enabled at this time due to Linux lacking drivers for
> both the PCIe controllers and the PCIe WiFi peripherals.
> 
> Signed-off-by: Sam Edwards <CFSworks@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

