Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C21FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 04:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lY3pHDqBhZkwmlfby1vou0JW0D/+selSw5j/J+G5UCs=; b=HuaO33nQoVmx7oDE9moHhtXf9G
	SRpRyb3FUnxyd+uRWbrCEblIruhIWlxRhzJ7Uns90npBQRMx68fy1nucO89DZ3I7eRpFuavgSDDts
	kH8qpdfRXNPfHxRtUurVuRyVnIwFkBetE9bwgQpBQYmtkJyGNHY7W4/7nev2T3z4Mr/2bEYrHfQvQ
	pfgNszPzFFYxZvPe8/HhI0NRZmiGvimdz3DbStwm5l1XJNRYNMqvOfEOpgXWXb7cLAZLkRqhskYD+
	bBMsYvGPapKlP+Ok5kga3pWqvh/JVA+zaN9tFY/7g9aBDzbAm7ibYzjF/wFPqt142+F4OJPpdr5je
	CbxwCoQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6iSm-00000003Y7a-46GF;
	Mon, 21 Apr 2025 04:08:56 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6iQu-00000003Y0o-3WoV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 04:07:02 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1745208416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lY3pHDqBhZkwmlfby1vou0JW0D/+selSw5j/J+G5UCs=;
	b=bDafJ9QDK4n8Kw4J6oQOtsQsJb8TTq//YPFV6XDpE46S4esKOtwQhw9EHL3tIdA8xJel2X
	18Ar/ny+n4/KmKydMkiKNzvwnabxk7Tf4aFSP2nic6mHQrqFTfLYxF4KXNGjpbdDrayrdd
	gCZmn6rF9GymUwOc3MUGS9KSNNO8t6wUux3BsNIRtuPtYyPca6exygrmLijAHK0dxgriq+
	D5xuc6LBc5sVkFqOSxqH2JwSILHjnInmGwVwcB6AjQLqojoCzyJFawKnD+QL7berCMLf6o
	AgUowsvI9c6Su4K8wibFVCXP4OpFCdKb/y6AtJt2ut5Zz8UIhN9MLxH+1s/53g==
Date: Mon, 21 Apr 2025 06:06:54 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Peter Robinson <pbrobinson@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [RFC] arm64: dts: allwinner: a64: Add overlay for Realtek
In-Reply-To: <16b34d85a710b4900e6d842c001a38b3d538bc2a.camel@icenowy.me>
References: <20250419160751.678827-1-pbrobinson@gmail.com>
 <f063ced3436e239eaad8ab0589ba2cb1@manjaro.org>
 <16b34d85a710b4900e6d842c001a38b3d538bc2a.camel@icenowy.me>
Message-ID: <98ce582813cd899d4b9efd671625ac99@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_210701_251525_B3FA2B42 
X-CRM114-Status: GOOD (  26.02  )
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

Hello Icenowy,

On 2025-04-21 05:43, Icenowy Zheng wrote:
> 在 2025-04-19星期六的 20:08 +0200，Dragan Simic写道：
>> Hello Peter,
>> 
>> On 2025-04-19 18:07, Peter Robinson wrote:
>> > Add overlay for the Pine64 Realtek rtl8723bs WiFi
>> > module that works on the Pine64/64+/SoPine devices.
>> >
>> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>> >
>> > I've looked at overlays for other vendors, such as available
>> > for some of the Rockchip devices, and I believe I have this
>> > mostly correct but would like some feedback both on if I have
>> > everything needed for Allwinner devices, but also what's needed
>> > to be able to use a single overlay across more than one device.
>> >
>> > This is dependent on the following [1] patch series.
>> >
>> > Peter
>> >
>> > [1]
>> > https://lore.kernel.org/linux-devicetree/20250419160051.677485-3-pbrobinson@gmail.com/t/#u
>> >
>> > ---
>> >  arch/arm64/boot/dts/allwinner/Makefile        |  6 ++++
>> >  .../allwinner/sun50i-a64-pine64-realtek.dtso  | 30
>> > +++++++++++++++++++
>> >  2 files changed, 36 insertions(+)
>> >  create mode 100644
>> > arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-realtek.dtso
>> >
>> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile
>> > b/arch/arm64/boot/dts/allwinner/Makefile
>> > index 00bed412ee31..be991f8d8110 100644
>> > --- a/arch/arm64/boot/dts/allwinner/Makefile
>> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
>> > @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=
>> > sun50i-a64-olinuxino-emmc.dtb
>> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-orangepi-win.dtb
>> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-lts.dtb
>> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-plus.dtb
>> > sun50i-a64-pine64.dtb
>> > +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-realtek.dtb
>> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinebook.dtb
>> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinephone-1.0.dtb
>> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinephone-1.1.dtb
>> > @@ -52,3 +53,8 @@ dtb-$(CONFIG_ARCH_SUNXI) +=
>> > sun50i-h700-anbernic-rg35xx-2024.dtb
>> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-h.dtb
>> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-plus.dtb
>> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-sp.dtb
>> > +
>> > +# Overlays
>> > +sun50i-a64-pine64-realtek-dtbs      := sun50i-a64-pine64.dtb
>> > sun50i-a64-pine64-realtek.dtbo
>> > +sun50i-a64-pine64-lts-realtek-dtbs  := sun50i-a64-pine64-lts.dtb
>> > sun50i-a64-pine64-realtek.dtbo
>> > +sun50i-a64-pine64-plus-realtek-dtbs := sun50i-a64-pine64-plus.dtb
>> > sun50i-a64-pine64-realtek.dtbo
>> 
>> Thanks for the patch, having this DT overlay makes perfectly
>> sense to me.  The only possible issues may arise from the
>> resulting size increase of the compiled .dtb files, caused by
>> the implicit inclusion of symbols.
>> 
>> However, please see an earlier linux-rockchip thread [2] that
>> shows the desired layout of the additions to the Makefile, which
>> was determined through a few rounds of discussion.
>> 
>> Finally, I think we should choose a slightly better name for the
>> DT overlay, instead of "sun50i-a64-pine64-realtek.dtso", in which
>> "-realtek" seems a bit to vague.  Perhaps "-wifi-bt-addon" as the
>> filename suffix would fit better, and it's virtually guaranteed
>> that there will be no new version of that add-on board, so there
>> should be no potential for name clashing.
> 
> Yes. In fact I think Pine64 messed up with pinouts of Wi-Fi modules and
> only the RTL8723BS module works with Pine A64. (The Broadcom/Ampak ones
> only work with Rockchip boards, as what I assumed.)

Yes, I can confirm that the two Pine64 WiFi+BT module variants
aren't interchangeable.  I forgot the details about the actual
hardware differences, but they're large enough to be incompatible,
which is quite unfortunate.

>> As a minor suggestion, the patch subject should also be tweaked
>> a bit, because "Realtek" is also a bit too vague there.
>> 
>> [2]
>> https://lore.kernel.org/linux-rockchip/20250226140942.3825223-4-heiko@sntech.de/

