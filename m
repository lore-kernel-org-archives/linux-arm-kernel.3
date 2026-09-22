Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C19C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUsE9yYFqfPx684JqjlrnAsRdOemuN8nrgTdith8yn4=; b=VnWrxmT64krRZymJA8vM9lXM74
	5K4t866DWa5/W306faIyvStfowOIYuG9UGjaePUNelXGlG6QXqEpqQymj5a3qUnOCc7zTVSWsOT+F
	JMCIpEM4B0hyHpFeRJaHiRAZ0LVmCiYu3w+rUP7vHi0y11vCWThzBROUXDJUaaLhMEsf1Vvh5f4vg
	9DE2ei7Rfk4uBzEOefG/+6Ix8Ktkx4PpKwmf6wIuFgKOoGglJj4k9U4EUUuzJkedIU5zmdnY9fnXv
	D4gKlvEb0spCai+7BOFfDaM3J4iK6zFO0jfxQq1EdOB+UZfEvLZgqaFo7WPsnt2X+lva5fiaVmwvL
	IROSl7Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x907w-00000005PV0-1zm3;
	Tue, 22 Sep 2026 13:01:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x907H-00000005PCJ-3r7i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:01:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D54560E0F;
	Tue, 22 Sep 2026 13:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C288B1F000FF;
	Tue, 22 Sep 2026 13:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790082059;
	bh=PUsE9yYFqfPx684JqjlrnAsRdOemuN8nrgTdith8yn4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GbCExJVhEnJ2Oegj8CtUT6F1lylujYvC6TeY7mLJUwf4r3rcGvUKcn7LpxyobrlfV
	 IL2nRpcq+JIXRVArIX4SfHStrYWrCjme5+rCSZJkWaJFDWpqbB1oV1zNHqeL+IZr8a
	 l6QdFm1b4de1XzpmjzN2xl0+c6bHtCnSv1J80IKKH5fPTsM8mOgtPrhP/YUO2SwG0l
	 NrLalpnF4eEZEyuLOhQpFj68RDPIMNLPmILeom64sTwPy0RUzNMXsW3v1b2c7Jscow
	 LharGAJwsEpsm/35u7e9DMtaZD1MpB40jT82t2DtVDFG67eyaxL0FSgLx1B5deEhNv
	 I4boPJiSTx/DA==
Subject: Re: [PATCH net-next v7 13/14] misc: lan966x-pci: dts: extend cpu reg
 to cover PCIE DBI space
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horatiu.vultur@microchip.com,
 steen.hegelund@microchip.com, UNGLinuxDriver@microchip.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, herve.codina@bootlin.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, mohsin.bashr@gmail.com, richardcochran@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Tue, 22 Sep 2026 13:00:57 +0000
Message-ID: <179008205732.2160803.970343877489221523@kernel.org>
In-Reply-To: <20260918-lan966x-pci-fdma-v7-13-0ecc179c8a2c@microchip.com>
References: <20260918-lan966x-pci-fdma-v7-13-0ecc179c8a2c@microchip.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Claimed DT-overlay/driver mismatch: the overlay whose "cpu" reg
  is extended for the ATU registers still declares only interrupts = <12…

--

misc: lan966x-pci: dts: extend cpu reg to cover PCIE DBI space

This grows the "cpu" reg region of the lan966x switch node in the PCI
overlay from 0x100000 to 0x800000 so the iATU outbound window registers
at offset 0x400000+ fall inside the mapping.

> diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
> index 7b196b0a0eb6..7bb726550caf 100644
> --- a/drivers/misc/lan966x_pci.dtso
> +++ b/drivers/misc/lan966x_pci.dtso
> @@ -135,7 +135,7 @@ lan966x_phy1: ethernet-lan966x_phy@2 {
>  
>  				switch: switch@e0000000 {
>  					compatible = "microchip,lan966x-switch";
> -					reg = <0xe0000000 0x0100000>,
> +					reg = <0xe0000000 0x0800000>,
>  					      <0xe2000000 0x0800000>;
>  					reg-names = "cpu", "gcb";
>  

[Severity: Low]
At this commit the same switch node still only declares:

	interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
		     <9 IRQ_TYPE_LEVEL_HIGH>;
	interrupt-names = "xtr", "ana";

so lan966x_probe() does not find a named "fdma" interrupt:

	lan966x->fdma_irq = platform_get_irq_byname(pdev, "fdma");
	if (lan966x->fdma_irq > 0) { ... lan966x->fdma = true; }

and lan966x_fdma_pci_init() returns early before the ATU setup:

	if (!lan966x->fdma)
		return 0;

which leaves the enlarged "cpu" window without a consumer until the next
patch in the series, "misc: lan966x-pci: dts: add fdma interrupt to
overlay", adds <14 IRQ_TYPE_LEVEL_HIGH> and the "fdma" name to this node.

Is it worth folding the two overlay changes into one patch, or ordering
the interrupt patch first, so the tree is never in the intermediate state?
The driver falls back to register based extraction/injection in the
meantime, so this looks harmless either way.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c%40microchip.com

