Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0542DC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 16:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEvcjf+hPSNKYzepNwfqlyyO+EK0h7HWQILOOJ7OSPw=; b=uje3M9Yh2nwRxWyJoVbpDSG3yz
	R8YmEBB3dr99eMQCshvFJRKVT2ZmfHBZLQPxGEaP/HuLrc+EFEL+A3iN2/kiG7fO+wkbUJz/hNIFR
	1dj7bZEJuRi4nsh38V8UlxEtrCsN1t5JkDN2cB0w0g5/pUhC/F8OKlHylNKPy/YtA/G5akwxerpGw
	oKYToHLO2Lfs44LcITsILtbr0YTLkdrSPp/Hw9RWmjwG7W4MjWAAzymCNNSnSsv9QrKhsMfvaVUnL
	ZMai6tKMLOW5kiPkmYaacawm1KyAsk5GnWh2c5OxXiLeH4PBcbIOREUfqEC403gXVwQJIqgukz9ua
	4KV8NiMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7JB-00000008aBj-3dKN;
	Wed, 29 Jul 2026 16:39:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7J9-00000008aBA-3L7k;
	Wed, 29 Jul 2026 16:39:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=MEvcjf+hPSNKYzepNwfqlyyO+EK0h7HWQILOOJ7OSPw=; b=M2EPNilAZcFkLn1YkjNSy1+dXx
	zduEtcnM+Ic8TcvVrjMB/F/dw53SxlmjkJmzer9I3etcukntSsy0NNnkwI2Ghb8wAowtHH3TQO0Jd
	/8ncYtjPKEXWt3MGfL/b8zSVBGEIT26Q5zzyudDjAT445nz4+y7n31UyGwsFRu6iWav+NGODTHyOb
	yndJmocGY4w1nmPodo1YGAMH2wEDkyuqqTY/z+DiQU+0kheQDQo7KnrtJCBf77sWlhNZlemrEen19
	Pl5e4Ha/zdZ/2H3PTJ1WPecopWJ1F6ROUqSL/yH/kHtOPpMo2MyIyYg7fWJsvCThZn8v/yvYFHYRO
	/xEKMXAw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Lee Jones <lee@kernel.org>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 2/4] dt-bindings: vendor-prefixes: Add techvision
Date: Wed, 29 Jul 2026 18:38:55 +0200
Message-ID: <1954916.R1toDxpfAE@diego>
In-Reply-To: <178419851981.1265391.16595891427832466278.b4-ty@b4>
References: <20260711192842.845048-3-samuel@sholland.org>
 <178419851981.1265391.16595891427832466278.b4-ty@b4>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_093903_856258_D731B535 
X-CRM114-Status: UNSURE (   7.91  )
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

Hi Lee,

Am Donnerstag, 16. Juli 2026, 12:41:59 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Lee Jones:
> On Sat, 11 Jul 2026 14:28:26 -0500, Samuel Holland wrote:
> > Techvision Intelligent Technology Co., Ltd[1] aka Shenzhen Huiwei
> > Intelligent Technology Co., Ltd[2] is a manufacturer of single-board
> > computers.
>=20
> Applied, thanks!
>=20
> [2/4] dt-bindings: vendor-prefixes: Add techvision
>       commit: f0e0417373ca55d07cba596e8afe081c078843ad

I can't find neither patch1 nor patch2 in neither the LEDs git nor
linux-next. Is there a git push missing somewhere?


Heiko



