Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6754BC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 13:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vaqAtTWmkLsPHkSA7uCUPeZbWl+EaSXDCXmNJEKF8ak=; b=H2SdqtSBvcxeITDgboEGzcrppV
	2WVWWUz70BlIv0DM+PcPA60lOJ5juArVfAAv/aKOI2FHuTmYJZBjhmAtR9CmeXb1b6PrqM51RO9Zr
	Df/aUTOihX9F5Eg66X5UXBsBVp4m0eIc+BePL8ioySmq6tQMIlt6YERYZ/qR/SA2tRZdV55H84OLm
	dRHWfQZIBpdak7XVo1eGHMX0QtnnTQ8IbvGDQLVgms0XCxdvUjPFkIOTfoUC/ZSlzWn3ryHIWszW2
	GXeWSLhsW1jPXz5g1W2UNfQLrLsqajHu+eR7r6NW6X8KfkjlGO43JXKoVhIYusggOHU/XXvUYgo06
	yY96J5aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuAZC-00000002k4f-0Lvi;
	Mon, 17 Mar 2025 13:31:42 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuAXU-00000002jb7-1sjy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 13:29:58 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 9C5A1C00151B;
	Mon, 17 Mar 2025 06:29:53 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 9C5A1C00151B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1742218193;
	bh=bAPzg4jZ6yCIFwOyTlpOE28lXMU29xomma+LuF2yFQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VTyYtTNsAbfn0v4FGtsHck+XBGa+bf7Vj4qt7NI64d9BWW9TkdmTYzb1UpHrArO5Z
	 ADSXXSp1nYHIk3sxWXjgKPdI2HT+g0lzFxw1s6N2exu+DD86u6jhszw2PHoIYLjfFU
	 MUKN/xNQLu7sAc0vVLmCOYFivnXcmumDEsCcclfw=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 0F8E818000520;
	Mon, 17 Mar 2025 06:29:23 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Artur Weber <aweber.kernel@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v6 03/10] ARM: dts: Drop DTS for BCM59056 PMU
Date: Mon, 17 Mar 2025 06:29:22 -0700
Message-ID: <20250317132922.2698513-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304-bcm59054-v6-3-ae8302358443@gmail.com>
References: <20250304-bcm59054-v6-0-ae8302358443@gmail.com> <20250304-bcm59054-v6-3-ae8302358443@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_062956_584528_350EF2F7 
X-CRM114-Status: GOOD (  12.59  )
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

On Tue, 04 Mar 2025 07:20:34 +0100, Artur Weber <aweber.kernel@gmail.com> wrote:
> The BCM59056 PMU has its own separate DTSI, meant to be included
> in a DTS file after defining the pmu node on some I2C bus.
> 
> This seems rather unintuitive; drop the DTS in favor of adding the
> BCM59056 PMU node directly into the device DTS files.
> 
> If the amount of subdevices supported by the BCM590xx grows, and
> a common device tree turns out to be beneficial, it can be reintroduced
> in the future.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

