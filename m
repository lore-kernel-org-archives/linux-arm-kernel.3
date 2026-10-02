Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5110ACA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfnfzWmm2BDCyb+S8lJSQc0AkVFKWdTNICDV/Hi2Ki4=; b=Pi5ymj4N/F5w8FhEkjogaNTomF
	o+zcvAJF5SMT3PIQxPJ9Lcd/Y14cSk284MSsiWoPHl+h4sXRnsHsMVp/f+PindIO9CBt6Ok6twVT+
	fAdpPUtTIRgc3HBx0jNbVrTAXFh7VSAhawsrKooomWQKTKKrXglThn6Q8EZZN2ZZIAi/7W2sV4XYf
	kN24id2wiPEz3I4mWb5c7+OhS/g4PeSNcv5TWuwRSTrdJdV5Ecv4dnmrJyVGT6WvXNkzXYK99ZHHV
	kqxhpLGRE9Q1EPw0paFfaoYwiMEQLJVQBgtjSaNfHTs2MJdKYIatk3d4i2Tuv3WztA394bzYAi9Qz
	0+H9dA/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZxU-0000000BDVt-1i6l;
	Fri, 02 Oct 2026 09:53:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZxR-0000000BDUw-0Lvd;
	Fri, 02 Oct 2026 09:53:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 78FEC405C1;
	Fri,  2 Oct 2026 09:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965391F000FF;
	Fri,  2 Oct 2026 09:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790934816;
	bh=sfnfzWmm2BDCyb+S8lJSQc0AkVFKWdTNICDV/Hi2Ki4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qjqe23iOSVU285nzC63eIKl4jZp1VpzdZd4v2d1vx4o0ao/QZ/tt8an6Lcm7L7yVd
	 6WRbVsRVVqusz3SGbqJp7rf9W3wiIXXPS98fvKU9T4+fgwbdzLAI0/7tQ+UWzwLQRr
	 3LvEjKU6lwZeMUT9aGyli5ZTUUUrcaw4CWw5GAcB8n1Mguwej9xl2bldBbd90BND3Z
	 xe6ChjszAv6Pb4690hittPC1WE2mDIo6sIndUgxKGRkRns8TIAOB8/fyGKo19H4tAX
	 L1ZkFQB3T+58T79LPVPkS7/ERyDoEmeuwRMmOy8COt0UNX4bGguA4LclPR/YjsG75R
	 CKN9K2ZVkC7nw==
Date: Fri, 2 Oct 2026 11:53:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sander Speetjens <sander.speetjens@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Jonathan Bell <jonathan@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, pbrobinson@gmail.com, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v9 2/3] dt-bindings: rtc: Add property for Raspberry Pi 5
 RTC
Message-ID: <20261002-prompt-sophisticated-sawfly-bb6f04@quoll>
References: <20261001193703.734323-1-sander.speetjens@gmail.com>
 <20261001193703.734323-3-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001193703.734323-3-sander.speetjens@gmail.com>
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

On Thu, Oct 01, 2026 at 09:37:02PM +0200, Sander Speetjens wrote:
> The Raspberry Pi 5 has a built-in RTC that can be battery-backed
> via the VBAT pin. When a rechargeable coin cell is used, the
> hardware requires a trickle-charge voltage to keep the battery
> topped up.
> 
> Expose the trickle-voltage-millivolt DT property so the driver can
> program the correct charge voltage for board specific configurations with
> the attached battery.

Commit msg could explain that you do not reference rtc.yaml due to node
naming rule.

> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


