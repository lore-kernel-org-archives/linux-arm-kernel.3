Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ABECFA447
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 22:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gM84J8dLm2E5WJWGPKQkrFKN/hoKwgW1+D2ZGMc92hE=; b=yv3l2QIw1WKJG9uQcbEkLXNsj9
	dWsn00LtAq2UxlF/fVr1khF80K1uGrWntGmZm6rohEpIvNjzh6oAvrn+izyX8iCHxrWte3Go1Fibs
	nZSZwohQZliTisKlSiHs6AvSQzSy4Jq5HOPDUs3MXAVeFE4kZyGEipzOM9yDl+3mc/ON0HD9KlvYP
	KER2UHywaKqiMG1ZY0cxjKp7KT9WYGQbLHChGPqfbwPLYsrk4SBhGEH5N6KG8T2oeQKMLnddWMysF
	gfV4blIiun8jZ7acyVW6L8Gu4xdXXnnVWgMkvt9ZuwwX+fx1ccSoSh0f7VoMzH79OE2F9AzHjghuC
	aj9E3doA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMD3l-00000007WD4-0hEZ;
	Thu, 20 Nov 2025 22:23:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMD3d-00000007W8Y-1ou2;
	Thu, 20 Nov 2025 22:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=gM84J8dLm2E5WJWGPKQkrFKN/hoKwgW1+D2ZGMc92hE=; b=uqK8DfX8KFOZgzW0W6dlbMKxzH
	O01MKfKYx/Yub0Qn2Eb5Z2ZnpO3wM5PLr9tPMACD3aayCkOUytAuC6CY84lq4hLGZ3sgkIMcK3Lhz
	3ChMb5ACrDx9CBUSLkXD0LOEIhyiCz5373wuTJjDO/bXoyq1RJh4G1kub1v1ZxH0ArnUvfYcvkGSE
	oduQaGW8XEf/rNfZP39jOAuqfZdt2s2F87ZKQjmSCLGVtYh7L7rrDViCvTrJYdrRVYCP8fzRIdzgx
	nL4yxpTJg7Niiv/kQGQhICec1UpI4M0o7UUtwF3FKLh0xX/SzX5ML8HV3/ab6xjFgMIev0+4ga+iz
	wKmRG1kw==;
Received: from [213.192.12.196] (helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vMD3X-0007Je-B1; Thu, 20 Nov 2025 23:23:11 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ukleinek@debian.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 0/5] Some cleanups and addition of another Qnap TSx33 device
Date: Thu, 20 Nov 2025 23:22:59 +0100
Message-ID: <176367711145.9778.8075871539964271822.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251112214206.423244-1-heiko@sntech.de>
References: <20251112214206.423244-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_142320_069140_1749D227 
X-CRM114-Status: GOOD (  12.96  )
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


On Wed, 12 Nov 2025 22:42:01 +0100, Heiko Stuebner wrote:
> This fixes the 2nd network adapter on the TS433 and adds the TS233
> a 2-bay device being otherwise similar to the TS433.
> 
> changes in v2:
> - add Conor's Ack on the TS233 binding
> - drop TS433 ethernet-delay patch, as that was unneeded and resulted
>   from me doing wonky stuff during testing and are completely useless
> - drop tx/rx-delays from new TS233 dts as well
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: rockchip: move cpu_thermal node to the correct position
      commit: 15efa2414602ad4c411ea8d4113b87656ebe0737
[2/5] arm64: dts: rockchip: describe mcu eeprom cells on rk3568-ts433
      commit: 81f116991433d2547d7f350873cb4511ebcd4fec
[3/5] arm64: dts: rockchip: move common qnap tsx33 parts to dtsi
      commit: 35202606ea08b9ec2b1386ac937a729e25d5beb0
[4/5] dt-bindings: arm: rockchip: add TS233 to RK3568-based QNAP NAS devices
      commit: a576b51e13870ba957e13e6cc265431260a32a77
[5/5] arm64: dts: rockchip: add QNAP TS233 devicetree
      commit: ce0b84e766ad7b2ec5d2ac7840675f223640f3e3

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

