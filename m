Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20589CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 21:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xdpCgI9+Y6cN5MSmGFBKONZOL4IJqg+NR9Qk85kt80=; b=o5aH3pp8bveoOwnzWzh4irjXZS
	zm6lAJgI/knwqI4i76v3g21IGS3yAQTEyUnjOBrH1z19nnY9LjZ0x3/d62rmVI03f08liA3x/Jsv/
	Tg4Rk3bdwuOEJemJ6KBgQeoLyIc+/9kHPQvT1ZLRllAn96YbNp4IlaQikTBDalxJYuKCPSIbjxyWH
	uR/kGNVGKz7jxBF5Nj+lHCJLGp2bhcF8u3ShRZcAgrnE5uh/vAwrwTGs9RC83CFURFcpPd4eVJSko
	IK71nKjBU8AOHihlmgv/akZVdMKZgxCKWKm2YvLhoQ3J8nkXC2apNJMcClxeWKTl510lZ4lqqRKrG
	Dn9cz76g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUdg-0000000En20-0EEw;
	Mon, 27 Oct 2025 21:20:28 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUde-0000000En1N-03Nx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 21:20:27 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1761600021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5xdpCgI9+Y6cN5MSmGFBKONZOL4IJqg+NR9Qk85kt80=;
	b=ZzCJ2mvlyM+oBKlKupVVpGp9PaleFmZxoOk6obZmhBvosz4iw+2eUciwBFZLxJZ4DVMsYo
	aOS84kkPO+Wfv6bKDUrlWJhAAEhk6X8TOp79J3xdxG/PhfCUWA+dCMvQAyhFHY0oaaH5dJ
	ylyBWIddMlEyQlCHODpPizWU2DVVELpXFUDVzORSZLltmiFNtab4+ATRxiXFbPJw3RwE4V
	0wXb5+3/B2oYfw3NBxOsCXqCEWLjD51LN+aPmurrE3vUAx/YYhU3SwjOCV0QRUj7FriQGc
	mI8bxn+QAE+UU9PmFZ9/HH28MR/bFpnTmpHQ6Ds9rnTFy4N9vXe8fMmM1NcbWQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Oct 2025 22:20:15 +0100
Message-Id: <DDTF376168GE.27A08H5NLTCRF@cknow-tech.com>
Cc: <sigmaris@gmail.com>, <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <heiko@sntech.de>, <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: pwm-fan overlay for NanoPC-T6
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Dragan Simic" <dsimic@manjaro.org>, "Alexey Charkov"
 <alchark@gmail.com>
References: <d583ee43-38c4-40fb-b33b-ce3153c9723b@gmail.com>
 <20251027200213.1821809-1-dsimic@manjaro.org>
 <CABjd4Yzfx-4xBHVB=W_r6nEdbwNJKdpHYB6bN3Xsk8dZOegJWw@mail.gmail.com>
 <2cfeeb0c-f7e0-b101-62c4-3b6eae40a30b@manjaro.org>
In-Reply-To: <2cfeeb0c-f7e0-b101-62c4-3b6eae40a30b@manjaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_142026_448427_B3308ECF 
X-CRM114-Status: UNSURE (   6.19  )
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

On Mon Oct 27, 2025 at 10:15 PM CET, Dragan Simic wrote:
> FWIW, the most user-friendly SBC family in the world, Raspberry
> Pi, :) requires manual enabling of the fan on Raspberry Pi 4.
> I haven't researched what's the background for that, perhaps the

RPi's have been using DT overlays basically from their start (ie way
before it became practically usable on the upstream kernel).


