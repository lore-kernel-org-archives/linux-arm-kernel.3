Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8027FD42B97
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 15:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+T4tSwskXOccnMHjrQgT921+1/jkcnTnTZ1NbAhny8=; b=gTbqCPhODNS2pfIAudYKeyZjUi
	cPcVsBtp5DGtC/gpT6rTNsj0h4ZQViTQPydQ2CyyMitEN4NvlFdtoI8HJ0SuPgKpQVxVTsXLJaOhd
	EFCpnEGrHCPdGngobt5UEKu/x2BgTOZykj0f45PRaR38Hv4N2xhFLt+FyHVYR06TzRyXOrkiY3Ve8
	cqkeAPFpKkSdkJ0N05aWhmhMsacNUvxGTQ2gJ9ADF2hVXddrA9Cm28qzHZWz44HyV9NKrbc9JI2HK
	9Sw5t4YkZ58ZBUbv+U1O+L0bz2SqB9VNa6/vrQF355PqfD6BuiTmSTkuQ3QoowLo6HfISnw7Nvklk
	72WAhJKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsej-00000003vlS-2F1Q;
	Tue, 12 Nov 2024 15:18:13 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsc2-00000003uuZ-0UAr;
	Tue, 12 Nov 2024 15:15:28 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1731424523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+T4tSwskXOccnMHjrQgT921+1/jkcnTnTZ1NbAhny8=;
	b=As8GlpHyj4QIfc0wiqwTGXTfMj1WhRthprGtIRGhtbFpPJgGHGutu0qGzKOPHPyJ2vqvnx
	BrUrIgTd0z/MWaPePRTUFoBdHJex4vZXbl2E0H0YMvPwmJRZcNpjD/hafUsz1rE22v8aKU
	W9pZz9NHd8ZueTSVpGPGs2WUMKVlyhVZT8WuTF3PXSqQYCCNXMDcIXq0ipy20Ko9/HrZsS
	NwLf61tktTX/blwvOCLEpg3OuYafMoTsinJ47BinZatfMEcbsKkzgi2yVW62wqnYlD+WhY
	5x6FhvpOrGNUb6W0UBEYWuTw08t4mB/oMXph8wUKBRZI4nSLxVDgulf5maU0OQ==
Date: Tue, 12 Nov 2024 16:15:23 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: =?UTF-8?Q?Tam=C3=A1s_Sz=C5=B1cs?= <tszucs@linux.com>
Cc: Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki
 <naoki@radxa.com>, Chukun Pan <amadeus@jmu.edu.cn>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: Enable sdmmc2 on rock-3b and
 set it up for SDIO devices
In-Reply-To: <CA+Gksr+WvS-S+jeYYG=Bo9cemvnJmjsmU4aj9YnD3t8-HY7wbw@mail.gmail.com>
References: <20241111181807.13211-1-tszucs@linux.com>
 <20241111181807.13211-3-tszucs@linux.com>
 <9fbdf05c-42e6-4ac5-9542-805200bc8c87@kwiboo.se>
 <260af427ae64d6f3b02a1579ee83eb3b@manjaro.org>
 <CA+Gksr+WvS-S+jeYYG=Bo9cemvnJmjsmU4aj9YnD3t8-HY7wbw@mail.gmail.com>
Message-ID: <303ad3910668e852d6670d1c79dc22e0@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_071526_473839_22B7170A 
X-CRM114-Status: GOOD (  29.21  )
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

Hello Tamas,

On 2024-11-12 15:35, Tamás Szűcs wrote:
> I think it was totally fine to disable sdmmc2 at first, especially if
> it couldn’t be tested or wasn’t needed right away. From what I’ve
> seen, this board works great even at higher clock speeds than what
> rk356x-base.dtsi suggests. I don’t have access to the RK3568 errata,
> and there don’t seem to be any limits mentioned in the TRM either.
> Overall, this board is doing just fine as it is.

Sorry, I'm missing the point of mentioning some clock speeds?  Any
chances, please, to clarify that a bit?

> Regarding device tree overlays, they would be ideal for implementing
> secondary functions, such as PCIe endpoint mode for users with
> specific requirements. However, the primary functions for PCIe on the
> M2E will be root complex mode, along with SDIO host, etc. In my view,
> the hardware is well-designed and interconnected. Users have a
> reasonable expectation that these primary functions should work
> seamlessly without additional configuration, right out of the box.

That's basically what I referred to in my earlier response, and in my
previous response regarding the UART.  Users would expect the Bluetooth
part to work as well, but the error messages I mentioned look nasty, so
perhaps something should be done about that first.

> Dragan, what did you mean by SDIO related power timing requirements?

Whenever there's an SDIO module, there's usually some required timing
of the power rails.  Though, I don't know what's that like with the
non-standard M.2 SDIO modules that Radxa sells, which are intended to
be used on Radxa boards with "hybrid" M.2 slots.

Once again, please use inline replying. [*]

[*] https://en.wikipedia.org/wiki/Posting_style

> On Tue, Nov 12, 2024 at 5:41 AM Dragan Simic <dsimic@manjaro.org> 
> wrote:
>> 
>> Hello Jonas and Tamas,
>> 
>> On 2024-11-11 20:06, Jonas Karlman wrote:
>> > On 2024-11-11 19:17, Tamás Szűcs wrote:
>> >> Enable SDIO on Radxa ROCK 3 Model B M.2 Key E. Add all supported UHS-I
>> >> rates and
>> >> enable 200 MHz maximum clock. Also, allow host wakeup via SDIO IRQ.
>> >>
>> >> Signed-off-by: Tamás Szűcs <tszucs@linux.com>
>> >> ---
>> >>  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 8 +++++++-
>> >>  1 file changed, 7 insertions(+), 1 deletion(-)
>> >>
>> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>> >> b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>> >> index 242af5337cdf..b7527ba418f7 100644
>> >> --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>> >> +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>> >> @@ -688,14 +688,20 @@ &sdmmc2 {
>> >>      cap-sd-highspeed;
>> >>      cap-sdio-irq;
>> >>      keep-power-in-suspend;
>> >> +    max-frequency = <200000000>;
>> >>      mmc-pwrseq = <&sdio_pwrseq>;
>> >>      non-removable;
>> >>      pinctrl-names = "default";
>> >>      pinctrl-0 = <&sdmmc2m0_bus4 &sdmmc2m0_clk &sdmmc2m0_cmd>;
>> >> +    sd-uhs-sdr12;
>> >> +    sd-uhs-sdr25;
>> >> +    sd-uhs-sdr50;
>> >
>> > I thought that lower speeds was implied by uhs-sdr104?
>> 
>> Last time I went through the MMC drivers, they were implied.  IIRC,
>> such backward mode compatibility is actually a requirement made by
>> the MMC specification.
>> 
>> >>      sd-uhs-sdr104;
>> >> +    sd-uhs-ddr50;
>> >>      vmmc-supply = <&vcc3v3_sys2>;
>> >>      vqmmc-supply = <&vcc_1v8>;
>> >> -    status = "disabled";
>> >> +    wakeup-source;
>> >> +    status = "okay";
>> >
>> > This should probably be enabled using an dt-overlay, there is no
>> > SDIO device embedded on the board and the reason I left it disabled
>> > in original board DT submission.
>> 
>> Just went through the ROCK 3B schematic, version 1.51, and I think
>> there should be no need for a separate overlay, because sdmmc2 goes
>> to the M.2 slot on the board, which any user can plug an M.2 module
>> into, and the SDIO interface is kind-of self-discoverable.
>> 
>> Of course, all that unless there are some horribly looking :) error
>> messages emitted to the kernel log when nothing is actually found,
>> in which case the SDIO/MMC driers should be fixed first.  Also, I'm
>> not sure what do we do with the possible SDIO-related power timing
>> requirements?

