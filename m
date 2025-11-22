Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E43ACFC535
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 12:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVxv9e506dlBqgsuzWADLOFxM1iWHjGiZRkoIlBlax0=; b=zlD3/pXxK/ZzB7fH6lLJ2+/oAf
	d9UdwZTW6Xwjqlj5+Fwa3G+oYxgPb3VWkr/rEqDlW/jyEY/f1g4mx1bhY0s9Juuoj3OPTS0K/Iem3
	rOUD2Soj05JmD3FmnKQhwkXmPFLm2UZtKUjBqp79gu5fuV4jRn+XLrknFL5NlmLA561z+CAPJvuNF
	ZoYcscWwHY5u5Qq5uIMn34RYP98Hx3Jos4Iw0oHVbRIgn7peEdnD3+2J0SvUMDn1pBJTUy3ywXWZc
	65ALizkgsjh92GsUN2WYhZz1TfDsQ4WbTCY+rIISWH1ObDNjb0XC1nW1zBagZkcIHhvPngkvFQDe3
	9Mvw775Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMnDO-00000009bDw-21aI;
	Sat, 22 Nov 2025 12:59:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMnDN-00000009bDq-1viu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 12:59:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 846A260160;
	Sat, 22 Nov 2025 12:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E029C4CEF5;
	Sat, 22 Nov 2025 12:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763816384;
	bh=hz/hyG3+eaA7+AWH/F7CrtmX/ec8gFR5mri57a2wfXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1XdEiebHD6r5GI3cr7CE97VCbLYvOlEah1y1F/htZgjFkhSUHfYWVGNg+CExOb4Wv
	 VLbf5A9LYd7Hz0BT3vCSuPUsujQSieKHb95OPMT8mBwVM0dt1bC7rph9ORMSNVajFG
	 8ffYDYMm3fneHFkNb+I3kJeqTdiG6DRRUUGPcDIY=
Date: Sat, 22 Nov 2025 13:58:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Roy Luo <royluo@google.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v8 0/2] Add Google Tensor SoC USB controller support
Message-ID: <2025112258-italicize-exile-37f7@gregkh>
References: <20251122-controller-v8-0-e7562e0df658@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122-controller-v8-0-e7562e0df658@google.com>
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

On Sat, Nov 22, 2025 at 09:32:04AM +0000, Roy Luo wrote:
> This series introduces USB controller support for the Google Tensor G5
> SoC (codename: Laguna), a new generation of Google silicon first
> launched with Pixel 10 devices.
> 
> The Tensor G5 represents a significant architectural overhaul compared
> to previous Tensor generations (e.g., gs101), which were based on Samsung
> Exynos IP. Although the G5 still utilizes Synopsys IP for the USB
> components, the custom top-level integration introduces a completely new
> design for clock, reset scheme, register interfaces and programming
> sequence, necessitating new drivers and device tree bindings.
> 
> The USB subsystem on Tensor G5 integrates a Synopsys DWC3 USB 3.1
> DRD-Single Port controller with hibernation support, and a custom PHY
> block comprising Synopsys eUSB2 and USB 3.2/DP combo PHYs. The PHY
> support is sent as a separate patch series.
> 
> Co-developed-by: Joy Chakraborty <joychakr@google.com>
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> Co-developed-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
> Changes in v8:
> - Add COMPILE_TEST to dependencies for build coverage.

Nope, that didn't work :(


