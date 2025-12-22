Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A29E674B1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 13:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1c9ZPZRZkz14B3cF0kxLCmvcGTxuNJZNvYxvmg4ZTGA=; b=AL5848t9HgWcwrDCJFdbdfkQJg
	TZiKKtZq+QWTXbskAxREB3z++CtzxGNhuk9u0iE6ANZiY96Vq1AwS3z+4yqWJ+BpwPvUSRwHTGCUk
	9JnTA5zCLzLOWaOkS6+AuTTJwi/1ynswGBl0Ps0RLYfx1P51B9e5KfuZKr5PO20ku7L43XP3sJMqV
	6vDKPqCMJxY4j9BgUIadvN9ydHVIyhciXu/OM6rWAq31mvS8pRZmHXFTVGKiw1ArNpLSzv2enF/nq
	8/3vpRxLjsMx0Qbm/osX6Z3wwWRWkJeU7CmvKOmY1Iwgm18bMCObEEy9Ko5DAqdT53NmmmFtXk9qB
	+1oHB8eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXg8j-0000000DpMm-2qHn;
	Mon, 22 Dec 2025 13:39:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXg8i-0000000DpMO-2d9W;
	Mon, 22 Dec 2025 13:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1c9ZPZRZkz14B3cF0kxLCmvcGTxuNJZNvYxvmg4ZTGA=; b=AoDgwDWB34drisoKS5l4zKoqMc
	Y8Hnj8eBJLITuzJODxvKjNOlJM5BmceV50B4Kr9gs/KVcCtSdA5zdbOQD+ZsAOsfgPdjWPiOi0kZz
	VwhYBW4oPcymH7XkKJlRBsqYSeXJf6lA+LgS9lDre07903cS1hQMQdkwcitBhirZmZnmucjxGmnfl
	+Xl49gMP8don2KHSxGFnmooxUDvo2qLoqKyITDcuKQQQV4dLAuvyB9YhLIs/gNWLHkKEv7Rwm0NKm
	YBml0noXznMTHK7MX42R9OFqBc25RxPPIBxlf3a4FC04F3xbO+3WCLmZGtTiP95tf0UlsDGzAuNs5
	DqlE+k3Q==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfHE-0000000F3S5-2NDa;
	Mon, 22 Dec 2025 12:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=1c9ZPZRZkz14B3cF0kxLCmvcGTxuNJZNvYxvmg4ZTGA=; b=O7YYw/E5YjomHWfZoJ7vD3dncy
	KzvaCkoIAq5An6hIlP6SiqkrKsZIG4DkoWc3ip7d/UDT46max9CrdQmtNsmEiOrxeaucRbK0E8d5q
	3PMWS0Xkscx98wmUYiv5Lz8NUmOtLM3kELki8YHZ/uvUCuBhXonOmxl1WYyuEqOON6WznjJ2pvddG
	XCDSBAgBXQicUbQnZElPczJ++2eQUbzzWHW8yf+k7lo4xuGo2gqdrRh0OKx+MWr3eS1iKKOfqV1ax
	qBf4vllJMezhHj67Qo62y2yluC5pU/kTrv7cZNmbCgraWji41QCeczhHrLrtGM4ZiamH4Svn9LdrS
	wOaUv7lQ==;
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vXg8c-0005vi-1b; Mon, 22 Dec 2025 14:39:50 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: enable saradc for ArmSoM Sige5
Date: Mon, 22 Dec 2025 14:39:49 +0100
Message-ID: <3767252.NG923GbCHz@phil>
In-Reply-To: <aUlHa-QhCLOk8AGa@venus>
References: <20251220100010.26643-1-amadeus@jmu.edu.cn>
 <20251220100010.26643-3-amadeus@jmu.edu.cn> <aUlHa-QhCLOk8AGa@venus>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_124440_663598_B9D5B87E 
X-CRM114-Status: GOOD (  15.19  )
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

Am Montag, 22. Dezember 2025, 14:32:53 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Sebastian Reichel:
> Hi,
>=20
> On Sat, Dec 20, 2025 at 06:00:10PM +0800, Chukun Pan wrote:
> > Add ADC support to ArmSoM Sige5 board.
> >=20
> > Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> > ---
>=20
> The reference voltage is different between the different board
> revisions. Older boards (1.1 and 1.2) have SARADC_AVDD1V8 connected
> to &vcca_1v8_s0, but newer boards (1.3) use VCCA1V8_PLDO2_S0
> instead. I guess considering &vcca1v8_pldo2_s0 is marked as always
> on, we can ignore this difference, but I think it's worth a comment
> in the DT and the commit description. Otherwise:
>=20
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

darn, too late for this one - should've waited longer for
this possible Rb :-) ... I did add the others before pushing
though.


Heiko



