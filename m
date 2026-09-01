Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7890FC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 03:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIDSWWJL1/ZyKjvyzV3U4YRE3sZdN82loB/qsAbNygo=; b=Dayyvj8L3Oz3gKTUaS0/61O9Zh
	HrxO8qvZERbe2OyrTS8isN1ZTuiVr2v62bzZfZbm9xK89UD3bG1io0tgX+WFV25wcYtPXJ1t24MZx
	ri/FOs4h6+FphXqeJN1yzQ0AK8QOBdgzUkuoUTeEvLwliPMkX/hBiDZQUq264ejZN5yEtSu0Kiez9
	MuDimFBhEH96b3mqa4KQh3qubszBzizwFB4BU+K485ooi8gbrzg7oboyn3BAJElV4KHzS8dK19/DE
	u7gdlZNGTbshOojB9YfuUkAy5jmonQw6zYqcV1sC51iviEPa+J0si+yEVRmFk4PUNhDs2mrFS1t8g
	/NcGjjQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ers-0000000AvCs-3kFT;
	Tue, 01 Sep 2026 03:09:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Erq-0000000AvCY-3eq3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 03:08:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bIDSWWJL1/ZyKjvyzV3U4YRE3sZdN82loB/qsAbNygo=; b=eJBOYtckzCo9aPCCE8FmIKImVq
	jvBOo1tgpkOED8vrSiPmue7K9O0ir3t3gZro0lLzAl9144TJdd3sVgVVfmr9hBkCN9Ktg16aAiM1V
	WW9FBMZq5iBptrBkXvQRC9ylhC6xntR9Ce630gBn+vf181HUOYjsNtiUXa0n2j/a+FvA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x1Ero-002IIS-6C; Tue, 01 Sep 2026 05:08:56 +0200
Date: Tue, 1 Sep 2026 05:08:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: helios4: add Wake-on-LAN gpio key
Message-ID: <e1087196-fcfa-4c1f-96da-ef76a3e03a11@lunn.ch>
References: <20260901025311.955936-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901025311.955936-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_200858_911799_E6A0A54F 
X-CRM114-Status: UNSURE (   8.42  )
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

On Mon, Aug 31, 2026 at 07:53:11PM -0700, Rosen Penev wrote:
> Add a gpio-keys node exposing Wake-On-LAN on its gpio0 18 input,
> allowing the board to be woken from suspend.

Could you explain this some more. Why a GPIO key? The MAC needs to
know if the PHY can wake the system, in order to offload the WoL to
the PHY.

    Andrew

