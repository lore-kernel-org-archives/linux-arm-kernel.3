Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C1AD2ED0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 14:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OuuOxL55HdAFY06SfOG3LOC3qubiad/RGrqlyB0hkLI=; b=a3VQdB4UlIxlofbPPOo54ZGtLs
	LPQNea+N5vyRskuWENQ1WihuRVUXyj38DSjw1FO5JmF4RWDIdpc9AQ+KSooW8rj4Rdk/J6J0f93AC
	r90sHriF2WBBbnGkxFER1VBpvbsLyKTIYOo1d7qvGseAML9AU2Qx80qehD3ZuEBl3lHq0rgu3JDG4
	4paRMcM6sFkKPTizeU+t0k2Pm0gzCaOzPIR7aQZxUIPLY2ajUsK9xS7KYdReQQPdpcsBwBjediU9+
	ryiRld8//RI05EecMPRHSQxU4GzghV1yc96Z/u4WcFYlEV87QtfJw9+liv2Lwf+3dlPdQaxCGm8Iu
	f9V/Howw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wCi-0000000FNW0-31dJ;
	Wed, 01 Apr 2026 14:05:56 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wCc-0000000FNVZ-0YiU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 14:05:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1775052348;
 bh=OuuOxL55HdAFY06SfOG3LOC3qubiad/RGrqlyB0hkLI=;
 b=AGJgc02OXQjbMrUMtMMYzghrOXuC5Ga2oqdwaPHrYDlSarhl/qCeV4FSqo3LJmRJ9BcdiqYKO
 yCuuTaxrXCGvxkfCioZdtfegFg0cDMCe+n/TjanqCdEpjEjlehrt5xpr4ctvxB+f+pY+9W4L7B0
 szodGmtqgXk1rsNcctdSdRhTBjhyrAW7tuCMDSkZmMsEIFmBv6jmQUUyTKxua2NboBJJ3gKBQbP
 xyHabaZ4K3WBrO8x3v3la6AlBNxjGZxeOgRxSwqQ25Jm8fXtW4AiL0n/UQ8bV8zWsaInlh8fSHo
 CflW+45h0ehCkZGhCKD7Bv8OP520CxomKupEztTArHCg==
X-Forward-Email-ID: 69cd2639c44eae2b77aac006
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.6.64
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <d7e235c0-425e-4da6-a51e-5efdcac5a5f0@kwiboo.se>
Date: Wed, 1 Apr 2026 16:05:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: rockchip: refactor items from Orange
 Pi 5/b to prep for Pro
To: "dennis@ausil.us" <dennis@ausil.us>
Cc: FUKAUMI Naoki <naoki@radxa.com>, Hsun Lai <i@chainsx.cn>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, John Clark <inindev@gmail.com>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>,
 Chukun Pan <amadeus@jmu.edu.cn>, Alexey Charkov <alchark@gmail.com>,
 Peter Robinson <pbrobinson@gmail.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Mykola Kvach <xakep.amatop@gmail.com>, Jimmy Hon <honyuenkwun@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20260401010707.2584962-1-dennis@ausil.us>
 <20260401010707.2584962-3-dennis@ausil.us>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260401010707.2584962-3-dennis@ausil.us>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_070550_572557_D93C9375 
X-CRM114-Status: GOOD (  12.01  )
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

Hi Dennis,

On 4/1/2026 3:07 AM, dennis@ausil.us wrote:
> From: Dennis Gilmore <dennis@ausil.us>
> 
> The Orange Pi 5 Pro uses the same SoC and base as the Orange Pi 5 and
> Orange Pi 5B but has had sound, USB, and leds wired up differently. The
> boards also use gmac for ethernet where thre Pro has a PCIe attached NIC
> 
> Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> ---
>  .../boot/dts/rockchip/rk3588s-orangepi-5.dts  | 184 ++++++++++++++++
>  .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 202 ++----------------
>  .../boot/dts/rockchip/rk3588s-orangepi-5b.dts | 181 ++++++++++++++++
>  3 files changed, 378 insertions(+), 189 deletions(-)

This patch seem to reintroduce a lot of duplication for the 5 and 5b
.dts-files. Please reduce the added duplication caused by this patch.

Maybe it is better to create a rk3588s-orangepi-5-base.dtsi or similar
where everything that is shared for all three boards is moved. Or the 5
an 5b specific parts are moved into a rk3588s-orangepi-5-5b.dtsi or
similar. Then the change in 5 and 5b board .dts-files are kept to a
minimum.

Regards,
Jonas

