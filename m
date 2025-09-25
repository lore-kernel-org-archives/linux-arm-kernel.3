Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F52FCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 15:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlMI+igi+LUMuQTqkSmm+VJAddaRP7bPzXdlAl4mAb0=; b=XCtYRBWZ+ortTRRvIYeqaVCbIP
	ISjdNaNmNqYBGZffadxp5I2X1WVM/WkNHFEoKIV17Jzr5Hull3OTJ7wnOpqtv6NNJcv3hwMjcUil5
	MP54FAqNDd+AKrskIJmiRtgzIiP74uu7SbqpnoRvUcQoXRHeOi2uMyn99HWQB5GRANRdKUyDUGvaO
	fLr3kFyY3pf73XxKuTu06X8oCaq51pIU2t+LuSQWxPWI9F+CBNVez8Whqz13iZe6NoIW78i0JHZ1i
	JrcXjmC88ti0YsAzTtIuT1gX2I8IXHM0L8/70Rp0mOMfoz+GeLs6jYkYMdShNF1yX7g0iGueczjVV
	kfXhHo7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nav-0000000AS63-3InJ;
	Thu, 25 Sep 2025 15:09:17 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nas-0000000AS09-0leW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 15:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=DlMI
	+igi+LUMuQTqkSmm+VJAddaRP7bPzXdlAl4mAb0=; b=D+zFVvp5d2xB7jpplLVU
	hqWybUKO1wDY4FwXn2fJREtMIql6+iXhMLvYIlE11blKhEwl893U5gbPRpAQrepf
	sv4XJZuHE0psDeLJShsht6T1pigvCLYLbEmzk4sC5VvXhgsJ9uCWan1YyrDU2MhM
	0rc4tXMy0R0l/v5Cs+y8QwVNRUADfgLi4wggO7war9QMxavXLt21OdO4pgdGXu2s
	od3cECpPMpHzKY3fd4gXqE+Hckp9JOuv15178UZrLcMbWoCaHUfUDdAAwbiaSEah
	075zBeoasHdDz/r6+UhgIawd5L3NvjKyi/dVH0VXoRQ7LgifaNSgqEkp1h04nHhm
	4g==
Received: (qmail 1914123 invoked from network); 25 Sep 2025 17:09:07 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 17:09:07 +0200
X-UD-Smtp-Session: l3s3148p1@mu3tjKE/spQgAwDPXwQHAL/S9V79e5yL
Date: Thu, 25 Sep 2025 17:09:06 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT
 DTO to Retronix R-Car V4H Sparrow Hawk
Message-ID: <aNVbEvSRCpQSXT4W@shikoro>
References: <20250907161130.218470-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907161130.218470-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_080915_097074_1493BC25 
X-CRM114-Status: UNSURE (   7.81  )
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

On Sun, Sep 07, 2025 at 06:10:53PM +0200, Marek Vasut wrote:
> Add DT overlay to bind Argon40 fan HAT, on Retronix R-Car V4H
> Sparrow Hawk board. Fan RPM control and full RPM on reboot has
> been tested.
> 
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

As the dependencies are in, can we have this patch in -next now, pretty
please? :)


