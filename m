Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE43CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 03:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4sqxOAXfrMVmvBv8GFD0sxlUnvNiXogPS2HdcbUW2BQ=; b=T17ygXPdnIwe+OiEpqmwA4zQei
	uHG9L9W6a1zA5LuM5Ze8ouiVgNFW2njWGykKYQAC3/7rT4vK30yAV687vWVnlJCY41Pt73mWSyYEp
	mxT4GewKPx2NtRufoyiVICGPusNkU1CF6zF12pizQHXo8KFayJeEcdZvRE0kAobUODoL9DbPv4ttY
	+KOcIK9NZo8DfbB2h2navbMk9RwTuQiS6Dbj63FGBJzs9JReybPPvC27Q36TL5JwqZNSxVZHKJbrT
	oZHuAltOHxVzD6aPNX3kf1vZJ2O6yDKqEufuo5RFlLkt1sws7uODDiFfSJ1wLcrETYmmL2SinXMai
	rcSvdmXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvSQu-0000000EDQH-3lNc;
	Mon, 08 Sep 2025 03:20:44 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvSO6-0000000ECnt-24p1;
	Mon, 08 Sep 2025 03:17:52 +0000
X-QQ-mid: esmtpgz14t1757301392t1d5f40cd
X-QQ-Originating-IP: ZUOPaUqj2wXqgkX85zS9BenCl9Em07B5jGELAC+KwJc=
Received: from localhost.localdomain ( [183.51.121.90])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Sep 2025 11:16:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6945571031618804772
EX-QQ-RecipientCnt: 16
From: Kaison Deng <dkx@t-chip.com.cn>
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Wayne Chou <zxf@t-chip.com.cn>,
	Kaison Deng <dkx@t-chip.com.cn>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add devicetree for the ROC-RK3588-RT
Date: Mon,  8 Sep 2025 11:16:30 +0800
Message-Id: <20250908031630.1010407-1-dkx@t-chip.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CALWfF7+6dTqLRHYKHL1iBf9YknLQ5yTrwPur8VySmjiy3mzh0Q@mail.gmail.com>
References: <CALWfF7+6dTqLRHYKHL1iBf9YknLQ5yTrwPur8VySmjiy3mzh0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:t-chip.com.cn:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MwoN/pFApqr2Vt+r9edkD4W23fv2wp8lvSNH0JRKcoZp4ypOp7PKYaVT
	61rDCSaagwCjh23QO+JGFccS2TVakpuBOZ4O0DbpItZ5VeUEJDCf8ceeLo57t7YZ3xw42QY
	qd6p6/KuEJNy6VEy+/xJCCTbSr6ubgxEg3YPCoqCXC8+3feCn4pP5KTP+vkeHdKiHpV3uZm
	lOK49FY5B01VwXjwmF5NP72v7WajSQ8IT5TcGmxVk0VjZAiC8fNY1f1+G+X3Z2sKICSHVPc
	J4Qy9XUPAJH8zFuAkNLZ8YplA2GJdqiliLY/C2GOHxsZwMqBHKz5crpyKbPv+fai43dHl4W
	UYKkZIL4uKO+mhzdHQnIVhffHCg3fdcTt91xJtGNvBMRBJFjdtiDUdZ5Y7utnhdNKEYDLM3
	SUuY6V0B2jtE23GYwr/E649ju3ikOKSCi0E8FZQ6swaNyOPwwbbcS5tU44BlAq0mHQ9oT6W
	MgU9EZbP+UX9l6uWeZbvTUqQYFaWz4OCwTwSTTtnG1Tvbv2cAFoVfE2CfckqI7oGK48jgED
	par/wcnbeZtKn08+Wn36EoYwJW7AkWhcYx2DsR+YKeEKDBN5x1bKr6tTQSNYH86832ahHBD
	BV19ls0Jod/5DBASwgWCrGupsimS0TR/5wBjzcZPwdkreqw1gwzT1x3kwzXa/0vrvHP8L2o
	0fRsWK/EwbeYgJTo8l+rx+YA1q0hSTiB6PU9QdCEitFX6xDUORil59y/awZy6CbVl/Nntp2
	Mvxr/cFKxnZGz/Gz5VQn9aswenZqYN0aARFz6fVrmVFBcDicGy3K9+fCCyyiyt8DAVkdDUK
	7KlYIgGNYLb2rPiFtSg9FrAaZ2VnHOGvTppfy8I4nPC+cAUUP4aYn9aVIdBWgSAw0swQ854
	3IFQ07irL11zRI8MsBRmw5wy4YFz1sHvMSSfkZA9dvMiUYF3hUG7tIE2EzLxG52IZ89Dwjf
	TuTqNWIIulgNG6o4ygs9q2c0oX+bymfaC83ePU+Hwa33BwCQBI+0tZVAPozrGkTmE/pnJnq
	mtv3sYaj6HFlL6eQQD980pUAP209xrYIlZEawMJRrw97pMRCTYX/onpGTW4IP6xHGQUG2ez
	nNZsvwHRh7+mo1KFEvSTWPKbv+0/qlLfxr7S4mxAUAK
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_201751_311228_FC54F601 
X-CRM114-Status: GOOD (  25.29  )
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

Hi,

On Fri, 2025-09-05 at 20:50 -0500, Jimmy Hon wrote:
> On Fri, Sep 5, 2025 at 9:32 AM Kaison Deng <dkx@t-chip.com.cn> wrote:
> > The Firefly ROC-RK3588-RT is RK3588 based SBC featuring:
> >
> > - TF card slot
> > - NVME 2242 socket
> Could you update the commit description to match device tree. It
> looks
> like the M.2 2242 socket is configured as a SATA (i.e. "sata2")
> instead of NVME.
>
> Is the M.2 slot also wired for NVME operation? If so, will you be
> providing a DT overlay to use it in that mode?
>
> https://wiki.t-firefly.com/en/ROC-RK3588-RT/usage_sata.html#software-configuration
>
The default is sata, I will update the commit description to match the device tree.

> > - 1x USB 3.0 Port, 1x USB 2.0 Port, 1x Typec Port
> > - 1x HDMI 2.1 out, 1x HDMI 2.0 out
> > - 2x Gigabit Ethernet, 1x 2.5G Ethernet
> > - M.2 E-KEY for Extended WiFI and Bluetoolh
> > - ES8388 on-board sound codec - jack in/out
> > - RTC
> > - LED: WORK, DIY
> > - BTB connector for PCie, UART, USB, CAN, SARADC, GPIO
> >
> > Signed-off-by: Kaison Deng <dkx@t-chip.com.cn>
> > ---
> >  arch/arm64/boot/dts/rockchip/Makefile         |    1 +
> >  .../arm64/boot/dts/rockchip/rk3588-roc-rt.dts | 1120
> > +++++++++++++++++
> >  2 files changed, 1121 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/Makefile
> > b/arch/arm64/boot/dts/rockchip/Makefile
> > index 9d56d4146b20..ad684e3831bc 100644
> > --- a/arch/arm64/boot/dts/rockchip/Makefile
> > +++ b/arch/arm64/boot/dts/rockchip/Makefile
> > @@ -181,6 +181,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-
> > 5-max.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-plus.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-ultra.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-quartzpro64.dtb
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-roc-rt.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5-itx.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtbo
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts
> > b/arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts
> > new file mode 100644
> > index 000000000000..1d50009d3153
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts
>
> [snip]
>
> > +
> > +&hdmi0 {
> > +       status = "okay";
> > +};
> > +
> > +&hdmi0_in {
> > +       hdmi0_in_vp0: endpoint {
> > +               remote-endpoint = <&vp0_out_hdmi0>;
> > +       };
> > +};
> > +
> > +&hdmi0_out {
> > +       hdmi0_out_con: endpoint {
> > +               remote-endpoint = <&hdmi0_con_in>;
> > +       };
> > +};
> Does the board support hdmi0_sound and hdmi1_sound (and the
> corresponding i2s5_8ch and i2s6_8ch)?
>
Thanks to remind, the board support hdmi0_sound and hdmi1_sound, I'll add them.

> > +
> > +&hdmi1 {
> > +       status = "okay";
> > +};
>
> [snip]
>
> > +
> > +&sdhci {
> > +       bus-width = <8>;
> > +       no-sdio;
> > +       no-sd;
> > +       non-removable;
> > +       max-frequency = <200000000>;
> > +       mmc-hs400-1_8v;
> > +       mmc-hs400-enhanced-strobe;
> These properties should be in alphabetical order.
>
I will adjust the attributes to arrange them in alphabetical order.

> > +       status = "okay";
> > +};
> > +
> > +&sdmmc {
> > +       bus-width = <4>;
> > +       cap-sd-highspeed;
> > +       disable-wp;
> > +       max-frequency = <150000000>;
> > +       no-sdio;
> > +       no-mmc;
> > +       sd-uhs-sdr104;
> > +       vmmc-supply = <&vcc3v3_sd_s0>;
> > +       vqmmc-supply = <&vccio_sd_s0>;
> > +       status = "okay";
> > +};
>
> Jimmy
>

Kaison

