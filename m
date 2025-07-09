Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA415C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 23:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DQ9gjXXuEt0O2/rJn65m+kWyPKUAoslRtuiFDYcZeU=; b=sh+Z2kT9f1P5LlwNxbAed8mb+e
	ryBhanodYzWqO4piUdrM3e5e8CXJXzUQEbtGnRoydvry4g9lnT/dSm6ASq7XQanuALhp8he9JjniT
	fwkdjzCWZPQNuLaazzoi6Wnb8q+rIROZsRLQZq9yGMA2FgDM81Mc9psmjyI6TuRaFuTlQVCdy608T
	j+fvAliV7cBeSXyqfqdby8AsZ8UvLCikklYENtOMn1LCJTRAskZ3+/C9FMyr+fFsAdZv5Qmf8vdjn
	ldj0vfjuZT3vJi1EVMHkxbSiRaKyMI1zeIH5fhXe6svQ36iSQzxNsC/RcuTy7PtXDPOzpjVIC2r9v
	gcZPZRtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZegT-0000000AHNx-1fH1;
	Wed, 09 Jul 2025 23:58:41 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZee8-0000000AHEC-3i3h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 23:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1752105375;
 bh=2DQ9gjXXuEt0O2/rJn65m+kWyPKUAoslRtuiFDYcZeU=;
 b=gnOdsi+iPnQQ5HaBSPMoDTf/pb76fKqHmwIoIFcVora4NiDlL6dleYq/RYhTm8SkoHM/EfEPq
 caLkZHju1EEaxGLH8JEeDENlRcu6ngDtscGoYPRr9WyDOVH15P2GfEvsKzrH2Xcjbordh0vhQL1
 Ybv2AGdh59mPd6pwL10UVt14+XHXhG01QXVu5XRhKPH80WB97AzxiQCPERyN6oAuoFb/t1resDm
 yqY2WJMnBeVriHvsjsiRYemnbD0wrfTfPpexk+rCNsYLk94K6y76EpVIMDx5zETKsNcpmzVo40d
 PcuPCF+2TfzviOcoibGRfziznFXc9AJRTCIVIZTEPWEA==
X-Forward-Email-ID: 686f0196c4bb2e06178a2682
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.1.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <5ce03a37-1b60-4328-8d04-07bf835def94@kwiboo.se>
Date: Thu, 10 Jul 2025 01:56:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: rockchip: Add Radxa ROCK 2A/2F
To: Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250708224921.2254116-1-jonas@kwiboo.se>
 <20250708224921.2254116-3-jonas@kwiboo.se> <aG3vPsUd-FPkhi-S@pie.lan>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <aG3vPsUd-FPkhi-S@pie.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_165616_974680_7C4C0705 
X-CRM114-Status: GOOD (  24.29  )
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

On 7/9/2025 6:25 AM, Yao Zi wrote:
> On Tue, Jul 08, 2025 at 10:48:52PM +0000, Jonas Karlman wrote:
>> The ROCK 2A and ROCK 2F is a high-performance single board computer
>> developed by Radxa, based on the Rockchip RK3528A SoC.
>>
>> Add initial device tree for the Radxa ROCK 2A and ROCK 2F boards.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>> Schematics:
>> - https://dl.radxa.com/rock2/2a/v1.2/radxa_rock_2a_v1.2_schematic.pdf
>> - https://dl.radxa.com/rock2/2f/radxa_rock2f_v1.01_schematic.pdf
>> ---
>>  arch/arm64/boot/dts/rockchip/Makefile         |   2 +
>>  .../boot/dts/rockchip/rk3528-rock-2.dtsi      | 292 ++++++++++++++++++
>>  .../boot/dts/rockchip/rk3528-rock-2a.dts      |  82 +++++
>>  .../boot/dts/rockchip/rk3528-rock-2f.dts      |  10 +
>>  4 files changed, 386 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
>>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
>>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
>  
> While testing the patch on my Rock 2A board, I noticed one of my SDcard
> that works perfectly on Radxa E20C and NanoPi Zero 2 cannot be correctly
> read out under UHS-125-SDR mode,
> 
> 	# dd if=/dev/mmcblk1 of=/dev/null bs=4M count=4
> 	[   18.616828] mmc_host mmc1: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, actual 400000HZ div = 0)
> 	[   19.193315] mmc1: Skipping voltage switch
> 	[   19.202046] mmc1: tried to HW reset card, got error -110
> 	[   19.213312] mmcblk1: recovery failed!
> 	[   19.213709] I/O error, dev mmcblk1, sector 0 op 0x0:(READ) flags 0x80700 phys_seg 256 prio class 0
> 	[   19.225201] mmcblk1: recovery failed!
> 	[   19.225530] I/O error, dev mmcblk1, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> 	[   19.226283] Buffer I/O error on dev mmcblk1, logical block 0, async page read
> 	dd: /dev/mmcblk1: I/O error
> 
> which could be reproduced stably.
> 
> the SDMMC controller issued interesting messages during the tuning
> process,
> 
> 	[    0.665246] mmc_host mmc1: Bus speed (slot 0) = 148500000Hz (slot req 150000000Hz, actual 148500000HZ div = 0)
> 	[    0.851940] dwmmc_rockchip ffc30000.mmc: All phases work, using default phase 90.
> 
> but actually it doesn't work with phase = 90. If the frequency is
> limited to 100MHz with max-frequency = <100000000> instead of the
> default 150MHz, tuning results in a very different phase,
> 
> 	[    0.665483] mmc_host mmc1: Bus speed (slot 0) = 99600000Hz (slot req 100000000Hz, actual 99600000HZ div = 0)
> 	[    1.166340] dwmmc_rockchip ffc30000.mmc: Successfully tuned phase to 141
> 
> and the card works, too. If I set rockchip,default-sample-phase to 141
> in devicetree, the card could work at full 150MHz as well.
> 
> I think there's something wrong with the tuning process, or the board's
> design cannot always run reliably at 150MHz.
> 
> Could you reproduce similar failures on Radxa 2A? If so, it may be
> necessary to lower the SDMMC's maximum frequency for the board.

I have not been able to reproduce this issue on any of my ROCK 2A or 2F
boards, my boards seem to tune phase to around 250-265 for the sd-cards
I tested.

Could you try with something like this:

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi b/arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
index fc23c51836b15..a82791db55699 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
@@ -285,6 +285,10 @@
 	status = "okay";
 };
 
+&sdmmc_clk {
+	rockchip,pins = <2 RK_PA5 1 &pcfg_pull_up_drv_level_3>;
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0m0_xfer>;


Changing clk drive strength seem to be something that has been done in
Radxa vendor kernel [1], could be something that we can include if it
fixes your issue.

The kernel I tested was built from [2].

[1] https://github.com/radxa/kernel/commit/e9b33cbc97a902560d3f3b43b4d36a1a0ac68a50
[2] https://github.com/Kwiboo/linux-rockchip/commits/next-20250708-rk3528-boards/

Regards,
Jonas

> 
> Regards,
> Yao Zi


