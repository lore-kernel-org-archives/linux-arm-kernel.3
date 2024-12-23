Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523DDE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 12:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGKjXT44ZxRLzSSUoOpZvLtX/l3kIF1j/AjArQpwkAU=; b=y59ButP46AIN10PehklyhoNA1w
	5NIkTMde0I3k985bytNMTWl/yWkMern87f9VS/nZTscUydLCaPp7OE8Wk+hpYeny8n6V/ajcRI2Tf
	treyOrliO15g8b28G3lCnJUeUzwDTBWNf7JIUn4+P5+TorQnSeUrHVwr9bw2HMfr4AazHAhUt4Q1p
	T906QS3vUKbXu22096f2TUKQ4znXMu8E/FhCtC1a/U9RgufVKYibX7G3tSs9z4rRMZWWfX8DL0CvS
	IZ1Sx9q3BCWJYWovd86MZMxGDPSE7biHYUnkwRyQ8y5JBd8ynMt5ARbcTCzHdgp6qM2gpLYFd+oTG
	3muc/Lmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPhjA-0000000A0BS-3fJ7;
	Mon, 23 Dec 2024 12:40:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPhhy-0000000A04X-1kez;
	Mon, 23 Dec 2024 12:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SGKjXT44ZxRLzSSUoOpZvLtX/l3kIF1j/AjArQpwkAU=; b=wwPMXFHV6pZGalDr4H4ARCpQjp
	JX/74ZMXMJou9/+klqzemjn9t/ujgZh7UYLgaOY/tyvH+Bkk+JzEu5Zn4i5bKwTN8pdDnf+APH9ok
	zSxoZs21/BBd+IyqF8RycethVN4E658aLIPO5W5guswqIOZ0N4t6BOJHZ7f3NtcK1w88CG/MW3fhD
	T3gz1M9H97AJNO+wknh2JZRs4I9O2onE3jg8gKw0XbkswkOnNMBtHEEvSiNjSdNAh1PPtMv2dLPz0
	1j4C0fCgSpDOKzBMUxVAo2gdcyJ5uPRbYmuE8vScNWmZpJMdHXICqtrC3u3yhyZkq/Od6gK9YvmCc
	oT2dahag==;
Received: from i5e860d12.versanet.de ([94.134.13.18] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tPhhg-0002QI-VZ; Mon, 23 Dec 2024 13:38:33 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Finley Xiao <finley.xiao@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Liang Chen <cl@rock-chips.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/7] dts: arm64: rockchip: Add rk3576 pcie nodes
Date: Mon, 23 Dec 2024 13:38:31 +0100
Message-ID: <2046140.PIDvDuAF1L@diego>
In-Reply-To: <bfd84b6b-9b19-4d9b-b0a3-cb6ed1f8084c@rock-chips.com>
References: <20241220101551.3505917-1-kever.yang@rock-chips.com>
 <i54jjqt7uaxrurdapsyxwmb5iokiwzgm5cvlaamlggycrpyd3v@azhmfwgetrzm>
 <bfd84b6b-9b19-4d9b-b0a3-cb6ed1f8084c@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_043850_493488_F3B88719 
X-CRM114-Status: GOOD (  22.88  )
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

Am Montag, 23. Dezember 2024, 11:49:23 CET schrieb Kever Yang:
> Hi Krzysztof,
> 
> On 2024/12/22 14:38, Krzysztof Kozlowski wrote:
> > On Fri, Dec 20, 2024 at 06:15:47PM +0800, Kever Yang wrote:
> >> rk3576 has two pcie controller, both are pcie2x1 used with
> >> naneng-combphy.
> >>
> >> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> >> ---
> > Please use subject prefixes matching the subsystem. You can get them for
> > example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> > your patch is touching. For bindings, the preferred subjects are
> > explained here:
> > https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> >
> Will update with arm64: dts: .
> >> Changes in v2:
> >> - Update clock and reset names and sequence to pass DTB check
> >>
> >>   arch/arm64/boot/dts/rockchip/rk3576.dtsi | 109 +++++++++++++++++++++++
> >>   1 file changed, 109 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> >> index a147879da501..df7dfe702221 100644
> >> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> >> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> >> @@ -1016,6 +1016,115 @@ qos_npu_m1ro: qos@27f22100 {
> >>   			reg = <0x0 0x27f22100 0x0 0x20>;
> >>   		};
> >>   
> >> +		pcie0: pcie@2a200000 {
> >> +			compatible = "rockchip,rk3576-pcie", "rockchip,rk3568-pcie";
> >> +			bus-range = <0x0 0xf>;
> > Follow DTS coding style in properties order and everything around here.
> 
> I can do it for most of the properties, but is there any other rules 
> other than sort,
> 
> eg. compatible and reg in the beginning and status in the end?

correct, that is the preferred sorting :-) .


Heiko



