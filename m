Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45ECDD2ED16
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 15:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aO9ESxpo+WcZXlPZzbFhPC6vhgA4zLWhTfZlLLkFc7Q=; b=T7BSVRM+cgO81qhj4AcHUabMZW
	Vihnnd8jWdwGNak/mLnaCG6csz2PacDw4rXipwD3C6E4vaR2ncKS8CJmplDFyK5K+qS3bSu+THRVn
	4E9q66J7KjrRaapJzYGHZcQWpQrMs82ciT1JbdcW0MeoXe+tyJ3k6Dfy3iwUg43s/BRZ44XaODe2v
	CBHBImzkjylxyn6/jY4swmHLpStd4FjuJefrlMGazqQSZJLxGx7CYqFS+tJzwYgai/7jYjKT91xAu
	JDfTCf/5HDj22lz3UcVtIKIEfSVtrZ1INvX6uYhcrMc8XO+sIzN5uQR92AAdIreCTeSF8/5faPdeq
	1VlAjzvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDDr-000000042SB-1zSK;
	Tue, 20 Jan 2026 15:00:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDDq-000000042Ry-1FSG;
	Tue, 20 Jan 2026 15:00:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A28B960018;
	Tue, 20 Jan 2026 15:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9864C16AAE;
	Tue, 20 Jan 2026 15:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768921245;
	bh=+emPDXpQmKKz6bMWTLUYNLMNyJcpfWYBtJXaLaKBvpU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JsKIMcRLL9OzB8pMebonIu8h9YMLxwWFNlLDnnSHkwdUPZqU50DI9cBUjP7oETmC3
	 SxmvEynZ4oxVYz1H/5bbGOWWrNTXU1P7XsjS3QNaZg83C0WerWi5+zWPJ1F25j81dE
	 7tH5j2vNughw/NJtCEF4KIrVM+zDPcGsQxvj032ZBNeSKoF7vi88Wx2PwZ9fDu+6Ab
	 DgJQRkEl0g+74XT18Gu06lUnJnDPwem78VX4LJkexBa4/xnqsoMw9wz5AcjfNUUWoF
	 LRI5ceMfPuQsOMJSabjfKVRsBxwANZ3tRrd8KGliEFwF9mStHMlMj4yQGma4Fx/eli
	 CuDAhLaxnXtdQ==
From: Lee Jones <lee@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Joseph Chen <chenjh@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org
In-Reply-To: <20260112124351.17707-1-chenjh@rock-chips.com>
References: <20260112124351.17707-1-chenjh@rock-chips.com>
Subject: Re: [PATCH v3 0/3] Add RK801 PMIC support
Message-Id: <176892124246.2259507.3674990175192687595.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 15:00:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
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

On Mon, 12 Jan 2026 20:43:48 +0800, Joseph Chen wrote:
> This patch series adds support for the Rockchip RK801 Power Management
> Integrated Circuit (PMIC) to the Linux kernel.
> 
> The RK801 is a PMIC designed for multimedia and handheld devices. It
> includes:
> - 4 BUCK regulators (DCDC)
> - 2 LDO regulators
> - 1 SWITCH regulator
> - Interrupt support for power key events
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: mfd: Add rk801 binding
      commit: a8a2add7b1889f00bc5d2b1f25fad34e89ef85fb
[2/3] mfd: rk8xx: Add RK801 support
      commit: 156442eb6e44d545f09559bd70c5b31fba39eb01
[3/3] regulator: rk808: Add RK801 support
      commit: 3e10bbd9c8a6d5d016b8e52c5d4ceba93a2304a0

--
Lee Jones [李琼斯]


