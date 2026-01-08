Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1B1D1D484
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYyHIP4DyFCGFNDFsKuOGj+qln4UlSU7WORKeqIw9RA=; b=a4SCfAd8LCu9Fe2k9aCQBTXcE8
	3wbyRZqydNRS4PwQkYqKDxTVgLVY91UbD6+94sKld89Bt0fhY6F+tKK4HoWJKBMJcqAdXuC5J2VOy
	xqTDOaafHGU36ME11/5Z47omMIZ4sWvANQG2JReaZQ5nYZ0CG+ZzqKfRlEeg0X3yDBRF37QxxUNXy
	3HnzTUI5qtN8Az5/Pga+X64kl+T5XWg6uFyyMjnH7BKNBTMNe1O3JOLvUvqk7BSHh+MdP3YFvH6UU
	VptPIhpDC03xSisPA+Kaw/6wuEpMvYrrWSpcwyytVXWt+OkSqEfZD7+2z9USw3ZrFiqRSTlR60yb7
	273dRQlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtui-00000000RLH-2ncu;
	Thu, 08 Jan 2026 17:35:12 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtug-00000000RKD-3ZiW;
	Thu, 08 Jan 2026 17:35:12 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 4CB80C00C4E2;
	Thu,  8 Jan 2026 09:35:10 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 4CB80C00C4E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1767893710;
	bh=S0eLTF0zTkP7XHO/izr6BZJOv2gb2LKsChACnp335No=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UrFsRFq25+Ry3UvnwAwJTzHgycZtqwZjEM5hF1hzp0ic06b6WylFmkG6jP7c+qltc
	 tleRNN40V+W5Ryn9C5hKWJIicszoVnONG4j6Ok3eZOjXFREyoisn64EXXHXaWnvw08
	 vB17gICGG+FqyRbKWmyjbicDJoeIrn8Iw1bumBLw=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 20EF81CAF2;
	Thu,  8 Jan 2026 09:35:10 -0800 (PST)
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
Subject: Re: [PATCH 08/13] arm64: dts: broadcom: Use preferred node names
Date: Thu,  8 Jan 2026 09:35:09 -0800
Message-ID: <20260108173509.3784772-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106-dt-dtbs-broadcom-fixes-v1-8-ba45874e4553@kernel.org>
References: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org> <20260106-dt-dtbs-broadcom-fixes-v1-8-ba45874e4553@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_093510_913831_0A938CFD 
X-CRM114-Status: UNSURE (   7.67  )
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

On Tue, 06 Jan 2026 20:09:47 -0600, "Rob Herring (Arm)" <robh@kernel.org> wrote:
> Update various node names to use the documented preferred names. Node
> names/path aren't considered ABI, so changing them should be safe.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

