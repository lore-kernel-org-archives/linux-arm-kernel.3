Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D49D1D484
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+3cBsKkhOIrvzemYjrsWbMboCAXUY0W4xvSX+wmGck=; b=Y1Tsa8zXKle9OXutgPwlVWGWXf
	DzFbMSjAYUziubpADFqCYjZwY76cVOaLAW0exNwWyxavEOs2wiCDJaYLTFI0gqt7aF4u5JeKi5KyO
	+n1DdyUsAdf+7sUVuNn5fOpy99JtomP9uG/5fYHuo4AXasheA9PQpBMySEAOEa0G4lr7iuslSbYlX
	hlT+Y8l/Tml5rxjumsxuUxxX+2ejRi15ju97aF32V3PxUuGFgTAkL4Ysjd5k+5z3UR2oGlW/xsXFz
	ro8V+1IGtMg8rKA15hjG1XYclv4tyxFJS3TKAdGV/rKvp8Zr/+5oFMpjrFxWxf9hy6U74z480cN2r
	7waEbUZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtuY-00000000RFi-1yC9;
	Thu, 08 Jan 2026 17:35:02 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtuU-00000000RDX-09B7;
	Thu, 08 Jan 2026 17:35:01 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 87822C0187D0;
	Thu,  8 Jan 2026 09:34:57 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 87822C0187D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1767893697;
	bh=ihvn7pI+5tVjcR2/rIz78L6ZLWmGOBZvDq6UmtxDWTY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MIZiGTQ8NUe+ilgD9G+nM78ZYgLQXzgAQSElAZKk1w64U0Qq+iiTJaW8loKUzTAVl
	 5uMaNHOqDEM/sp/ZMFZ/qGqNg7J2dcLAUhfYtjZWPevdGkBNfYEtguqNt3NiZ/s9eN
	 7QHB3RotWrGU/21UzD+VctaV6X7GI3n4I/smO3/0=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 5AD921CAF2;
	Thu,  8 Jan 2026 09:34:57 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/13] arm64: dts: broadcom: stingray: Move raid nodes out of bus
Date: Thu,  8 Jan 2026 09:34:57 -0800
Message-ID: <20260108173457.3784678-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106-dt-dtbs-broadcom-fixes-v1-7-ba45874e4553@kernel.org>
References: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org> <20260106-dt-dtbs-broadcom-fixes-v1-7-ba45874e4553@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_093458_099817_084094BD 
X-CRM114-Status: UNSURE (   8.17  )
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

On Tue, 06 Jan 2026 20:09:46 -0600, "Rob Herring (Arm)" <robh@kernel.org> wrote:
> The 'raid' nodes are not MMIO devices and are not part of a bus, so move
> them to the root level. Drop the unit-addresses as they don't have any
> address.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

