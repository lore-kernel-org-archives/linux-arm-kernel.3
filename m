Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA91CCEFCF1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2zwHgmmmKUQpUt0JZaXJQukZ0E+S2rrXrmJMYEwXC0=; b=EFEC5rh7DxyRCfijvkG/EjfUNB
	tANn+GKIXS15tnDuYurVN0qUey1Wey1wz4Bf4FlLFdX80fd0k0QDB9aJF/wT/a9IzEzoAAmmkHjvZ
	MC/4xzQWEAc/MUWKTnpMXJJT0FtTkVI9lehbIHHSG2ogR67/I0eex1B53a/TGI2EtCwAj8gFf5ewz
	fmKUzkM9P9G4iHY+FdAPWCFW+crqiF2ufmFEnpwHZmDpNn/evz6h/bHLOHjjeqzWlKCFewz6aNpfx
	PV1cRSQ9S0WWcyMuUeCM3FWv3b37BRryRRiJfG2Fo4UhLNChvJq4zaHKvy/Db0K0xHzCL2/JbVoin
	krVczb3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdC0Z-0000000DhJf-3Qas;
	Tue, 06 Jan 2026 18:42:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdC0V-0000000DhCa-1B6o;
	Tue, 06 Jan 2026 18:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=p2zwHgmmmKUQpUt0JZaXJQukZ0E+S2rrXrmJMYEwXC0=; b=wjrYTKmAi9lDZF3scqG6qGYveo
	xA2yrj5/FBeCJW1myXSeXowszmG8+o0FBwJ+rRFGO98C8mzMibMq/7Cxjen4z/ztBE2aJIVId9tR7
	6Q4lfAvvKgvI3kTiTDJ42DkRbtYTguHL4WcMmM3jC6oN0fOA0jOu9FSIoo5Bbom3xRD9No7/H0htA
	rjnDjdKFc7pf8SMirrs4yP+ESBpRz1fnJfLzGoJWWUomDrpGhPI8GCXPYu6EpTDj3mPMBepD/V+JQ
	Uov/uQ8O9ttrRbX4ht+UqAGJQTBfWnBJvPcBM0zBQrClDSRKeCa45/OTF0MWqqc6LowAw/u0VbtS5
	mg6dWU/w==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vdC0M-001Hfs-Ve; Tue, 06 Jan 2026 19:42:07 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: Enable PCIe for ArmSoM Sige1
Date: Tue,  6 Jan 2026 19:41:57 +0100
Message-ID: <176772487181.3029798.17129671560253140548.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260106100000.225445-1-amadeus@jmu.edu.cn>
References: <20260106100000.225445-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_104215_323069_A4EBB072 
X-CRM114-Status: GOOD (  10.31  )
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


On Tue, 06 Jan 2026 18:00:00 +0800, Chukun Pan wrote:
> Enable the RTL8125 network controller and corresponding PHY
> connected via PCIe on the ArmSoM Sige1.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable PCIe for ArmSoM Sige1
      commit: f01f0e0700740dc7a2e5ed1af89d9770c1127d2e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

