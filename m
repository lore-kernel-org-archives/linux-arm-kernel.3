Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A840606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 16:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nLS8Pi7q;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=cp7XYZwd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+j7WtGz1aWIcd5SgWNnC84N10690oBDHORBkMbSfAj4=; b=nLS8Pi7qisnr08
	W5oOT87K3KSxuRJuX5u8Zetq69Z3DcUQnW+LnDnP86TpKdafRXottKUAq8FXMaBoX1qSRFCBjZwFz
	qBmxhVeuo7tf1Qbf8Ks38bTBn4Uzr+vvdbF8IKUfMOp1GRGNpEH9C5W8kKov6e2MSUaCtG5CETr5J
	qbIg0gQCbwvzqcA/zkvKIAlJWihYfPqIUFkKdI6rJplzut9O14lDZejZ2aoyMnxb2oCljQbye1dky
	S56LoxGoUonJTQzTEJ00+GyjE6xiTn2htf4sCyCotAt64DSUcM6R4J1tFm7gVlANzyC3gu7q4674B
	JoQaC9+cnZ0j9pF8yS9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNY8N-0000000Ef9I-1PHN;
	Sun, 01 Nov 2026 16:10:15 +0000
Received: from mail-m12829.netease.com ([103.209.128.29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNY8J-0000000Ef8b-2fA8;
	Sun, 01 Nov 2026 16:10:14 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 531304970;
	Mon, 2 Nov 2026 00:10:07 +0800 (GMT+08:00)
Message-ID: <b8221ba4-dccb-42f5-ae77-a6c087fa1d05@rock-chips.com>
Date: Mon, 2 Nov 2026 00:10:04 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: enable SD UHS-I on Firefly-RK3399
To: Yaozhong Li <yaozhonguwl@gmail.com>, Heiko Stuebner <heiko@sntech.de>
References: <20260922055011.14972-1-yaozhonguwl@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260922055011.14972-1-yaozhonguwl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa197e014ab03a4kunmba3f3551368d1f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSkhPVkhITx5KHk4dHhlOQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=cp7XYZwdXaDlzvLQMrFBjXRj7KnWLLjISdqCP97+EsTik0Zpfwho8VnY21EIOyAo31Ig6vU8Ht0t3dQ1l4xscPmH6rW1VIUfMlfEx5abbUbqSGmw0zaF9050tCQI2BLEYnpoj1R12GL2bWwEnJCa0Pek8lu3edxYe7XhFm9c42Q=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=+j7WtGz1aWIcd5SgWNnC84N10690oBDHORBkMbSfAj4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_081012_249874_EC9EA80E 
X-CRM114-Status: GOOD (  18.71  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

在 2026/09/22 星期二 13:50, Yaozhong Li 写道:
> The SD slot on this board stays at 50 MHz with 3.3V signalling. The

...

> 
> I have no schematic for this board. The claim about what LDO4 feeds
> rests on the vendor firmware device tree plus the measurements above.
> 

It's easy to find one:
https://github.com/armbian/armbian.github.io/blob/main/board-schematics/firefly-rk3399.pdf

Too bad it was designed this way! What if sdio-wifi is working on UHS
modebut people insert a HighSpeed only sd card?

> The analysis and the commit message were drafted with the help of an
> LLM-based assistant (Claude Code), cross-reviewed with a second one
> (OpenAI Codex). The device tree change, the measurements and the final
> wording are mine.
> 
>   arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> index 0568dfa..7cabbc1 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> @@ -777,7 +777,6 @@ &sdio0 {
>   
>   	/* Power supply */
>   	vqmmc-supply = <&vcc1v8_s3>;	/* IO line */
> -	vmmc-supply = <&vcc_sdio>;	/* card's power */
>   
>   	#address-cells = <1>;
>   	#size-cells = <0>;
> @@ -804,6 +803,8 @@ &sdmmc {
>   	max-frequency = <150000000>;
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
> +	sd-uhs-sdr104;
> +	vqmmc-supply = <&vcc_sdio>;
>   	status = "okay";
>   };
>   
> 
> base-commit: 940de590b839f71d6dc846160534bf202401b8b7


