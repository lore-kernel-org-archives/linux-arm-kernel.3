Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EA1CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 06:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdBJkXBM2f2lxuXdlvTwfecGcxvNtiYK4WzV8kBx/FM=; b=Mi/DQ7A+pgCiltlCoRc9YnIoh6
	rXfJwnux1NqB16lV4hHDRCQWCOI7kcsiLJO4HptCjok1ZCwG59NipDeuiCVSuTNsb2ofLXZpGDnGt
	PrLQQHW3SSfXWAjmPQkHjHv++xVzSvH9ntvrzvZaF/hIXhHe/Xm5A9aUbaPOKK2Q9ok43LwjdVkBg
	nxb+6QCFKNsgF/W9RvRg0ORKeA++iKRL0jHK8H3q6mqppme9AQZeg6VEHCQP2Ec5y/3zkqvm1FQNF
	tSObOMJRSC3Q2bl70NHoNjCnybFDJSEBG1/MzPvc9fSZQzGXj8z1Cvm6oVUWFQgE+hiqDVBsJKxcT
	LnqufQrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvVSA-0000000Ezxn-1QFV;
	Mon, 08 Sep 2025 06:34:14 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvVN2-0000000Eykr-3aKm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 06:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KdBJ
	kXBM2f2lxuXdlvTwfecGcxvNtiYK4WzV8kBx/FM=; b=fb2cqCtrCl9j2zohzs14
	5E4+mqsQdMOSJs4yjC1zDQVQ0DZhRH83RvWGrat+wgmXbFMmRzoiq8r/wfsR0QcZ
	pf4xVf70wNtjewYgcKVR6TUaWCxxAzhlcFP6ayr55Vdu+YbrwkGlB/9UdX8PjjRe
	64LuGi2/7zXuDLSd6s17sGupqOAO4feXMjqO3vOMgzJFfFyB3T0NU5mb3oJ9bkT2
	DJIMA2SY1VHQZSHfccuSolfcpxc9khfJFjcnRSIsMsIjLRILh8AhQln8mn8U8WL+
	uQiCPId5FyO7lM1Oc6vyo5FpXuGgSeINUFn9Cm+IDoVnBaMtUtLgOgsaFTgppWss
	dw==
Received: (qmail 716679 invoked from network); 8 Sep 2025 08:28:52 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Sep 2025 08:28:52 +0200
X-UD-Smtp-Session: l3s3148p1@KvEYTUQ+moMgAwDPXyerAKQ7QDbxBzog
Date: Mon, 8 Sep 2025 08:28:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Rework fan hwmon comment
 on Retronix R-Car V4H Sparrow Hawk fan DTO
Message-ID: <aL53pOVpdaR2YcVX@shikoro>
References: <20250907225338.426253-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907225338.426253-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_232857_774542_8F239E3B 
X-CRM114-Status: UNSURE (   7.80  )
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

On Mon, Sep 08, 2025 at 12:53:05AM +0200, Marek Vasut wrote:
> Reword fan DT overlay hwmon comment to accurately locate the
> fan control sysfs hwmon node on Retronix R-Car V4H Sparrow Hawk.
> No functional change.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I also double-checked that the paths work with both overlays (which they
do). Dunno if that is worth a tag. But in case it is:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


