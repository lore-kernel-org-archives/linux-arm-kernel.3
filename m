Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0CDC71135
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 17:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qfFANaE2Z9KyVUPauvw+y1ORcZBf4Q97gY/GQagmqs=; b=Vu4gCWBIcj4NzCukvWyysdNToS
	scdnxk2RG3pan0GZJtDgo5esm7o3G4qCLBeO4oWlS8zPUMe6POs3Sy+8j4VCi3OMWtR/D52Hmh+1E
	rAK43Eew/zETxda6opUq8vggXKrUgGyrzuyhOeOvcmJyoECkc4P8hSkY+1wkctw9/yidKaGwHwkWB
	96BMq1SaWb3n/4OnNRqv+8uJez17pGEdCfIGi3q3pRmB/batWNQQt8G6A7MKPR9nfyIlCF2y8jaPx
	jFHxGbUPHQyUP1+wLhP7hmymrOFw0DWNygjAjinAqLDVIqEay1SlrocMBHCodQVMa1cpWLWEPieHJ
	h+2hpQVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQqlg-00000002gxo-0KsE;
	Sun, 15 Jun 2025 17:03:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQqbM-00000002fx3-3KOl;
	Sun, 15 Jun 2025 16:53:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3DC6361127;
	Sun, 15 Jun 2025 16:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F86C4CEE3;
	Sun, 15 Jun 2025 16:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750006379;
	bh=vX5HGgA8fC7YjZ06YgAI2G0Iz9bLuEWdLseKSEem3jM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dIbhoEGu2cJUWtgIefClLundN6NQBYR/s6XRyLA5x6eah5qTnoOufS8JJ0A0r/GTH
	 3554rdwXsHPEWfc1MtI6iG/OffR4J+2kTwQOZGc7RT0Rv6SRJexDL3CkGG0m4UJOb6
	 Bs5hZUm1is6XIp5UlWmLbpnhRLmrbwKcSI64eo2uReEUdrv3rb2m3J/MgT+dqMGn31
	 a53L01h7MYNpUzIwTZ83mL8l+gqQUz1xS4nxpJmkD1aqdl5MdCDJ8VP4msh6Ff4UAm
	 15n+2fvR+jVBMHc3rELXtjDspjemffNThae+AAH/EAVb4FGRy0Jx03XLlqUIi4sgGQ
	 4IHN6T7TVDVVA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v6 00/10] phy: qcom: Introduce USB support for
 SM8750
Message-Id: <175000637361.1180927.2580740047031375607.b4-ty@kernel.org>
Date: Sun, 15 Jun 2025 22:22:53 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Tue, 27 May 2025 14:04:36 -0700, Melody Olvera wrote:
> Add support for the PHYs and controllers used for USB on SM8750 SoCs.
> 

Applied, thanks!

[01/10] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add SM8750 to QMP PHY
        commit: 439cdb309c3cf630b11661872ace09e1a7c5d630
[02/10] dt-bindings: phy: Add the M31 based eUSB2 PHY bindings
        commit: 1166a2ca0900beafbe5b6d1bb357bc26a87490f1
[04/10] phy: qcom: qmp-combo: Add new PHY sequences for SM8750
        commit: c4364048baf4878c270e94aa224bb114b445704d
[05/10] phy: qcom: Update description for QCOM based eUSB2 repeater
        commit: b0d8d731b4b0fc83bb4826a2c805f4c877c98cc1
[06/10] phy: qcom: Add M31 based eUSB2 PHY driver
        commit: 9c8504861cc4102463f31fe1f5e120a6deb15c15

Best regards,
-- 
~Vinod



