Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DC6CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 12:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3Qo4vQuldjoeK8jA2JAjzxfTebhX5t9oUEQ8z+qotY=; b=waiQ3Zfd9VCBxADgUsaLxVEkSt
	DzXcBLo5+A0nxeAOOUnl8OPaj7UNFabAY7Q4jUEUSYrKeJozVA4Ar8c5AQ6hxZYR4fwpzCEO6y0/+
	xoTekFrOFpKso5n7lcszpqk8HNL67V8ZS56r4q/HDYJFxgcXQFehWpC0paXWjjeM5CfUOxbvIArQz
	pI6954P63Y9nq8pmXUP7DHuYX5D4jUY4qt3uKRoCVjQ1wP7hwOymMRAqKVc/luP+gmLnoXy1AZxu3
	6jNovamADWgTFM7+ViRvmKox6o5nGkLEhYhSvvj+qI178t0JpQ/t+82c30AQ5BqeuWtzWrYIQWIiG
	toBAyELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVuM-0000000806z-1TCu;
	Sat, 10 Oct 2026 12:10:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVuK-0000000806U-23Yy;
	Sat, 10 Oct 2026 12:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=i3Qo4vQuldjoeK8jA2JAjzxfTebhX5t9oUEQ8z+qotY=; b=VTWpHr+KtF39azVyZIek20nMIY
	+FnSybPUCNY+P86lTxWZKiDvVoUwLAQfs86PABO9X1B6OA5CBTgAWjQ9+ulq4vwWyuQtvBciOf5LC
	kQQIkOM0c5qYIq8rzgd8YqPou+h6GbyQBtdVugkuW6ZySR0nuBbzlh2HX6eWidtzNIdNdmgvYFZN6
	/u+bXQdBMsX59PrLoiu98t0F5ZebvgkL7k07zhOZLPZxTGtBuRKjOn+agpb8hYSsb9W13Ij4PKH8C
	Y4B3yZzR6abkNMZd6Mn8LzTVRmnhl2pfOAqAw/KrMbFIA+tvHuLqMTjz6lbbxgIlcO896HHQffzaZ
	0bXg6tSA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: Add Radxa E54C
Date: Sat, 10 Oct 2026 14:10:21 +0200
Message-ID: <179163420722.3552553.10756820019323228213.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260820100020.3370385-1-amadeus@jmu.edu.cn>
References: <20260820100020.3370385-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_051032_814160_87506717 
X-CRM114-Status: GOOD (  10.62  )
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


On Thu, 20 Aug 2026 18:00:18 +0800, Chukun Pan wrote:
> This series requires the following commit in Linux v7.2 to make the
> switch work: https://github.com/torvalds/linux/commit/9da2c8672f77
> 
> There was a conflict between eMMC and SPI Flash, so the unmounted
> eMMC was disabled. The schematic can be found below:
> https://dl.radxa.com/e/e54c/hw/radxa_e54c_v1.2_schematic.pdf
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add Radxa E54C
      commit: 49b9e84fcd80bcc16f78ad8386b83f76f61f3a4d
[2/2] arm64: dts: rockchip: Add Radxa E54C
      commit: ae965b9856f033145e292b0c29082a26bcc45efd

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

