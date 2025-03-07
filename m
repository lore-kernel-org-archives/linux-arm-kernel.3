Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E590AC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 07:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3sq6HJtdSf7cor2Lj4FnQZlFvMlGk5L9LjnXrolxwU=; b=dyXGSGy3w789ddzBmxnTg1CsJ4
	wLv3VFLRNRJ6VzA4RzzRetRIij0HYoRxhtL0En92YCIOOvubHqmhdXrxYTjXKzaZWfruX55J+ncEG
	WiZN6gKKbG8dLP9VVwFHljSf1S2+Yt8lR6mk0MbeNg6TNrdkstvQVD1P0+/R64TDIZla1S31Di/cn
	H9w6fF8smjesbht7KDJxTMeOuXveSbr/P91S0xcJtMNYSNbUekFxGn7kNPemTkfTD6ZDnDpbIUhrC
	roaNdFWEZAoOmJNS3z3JB0vE+RAz2VpvFr4M4mZzRnLHPNo3AT/MxUBrPVdIJMkv28IjlKnwYVTYu
	YwSXrHzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRsN-0000000DPc4-1BSu;
	Fri, 07 Mar 2025 07:12:07 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRqk-0000000DPPH-0A9B;
	Fri, 07 Mar 2025 07:10:27 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:3300:bb12:a0a3:40d:e82f])
	by smtp.qiye.163.com (Hmail) with ESMTP id d4f8d463;
	Fri, 7 Mar 2025 15:10:22 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
	detlev.casanova@collabora.com,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	ziyao@disroot.org
Subject: Re: [PATCH v2 8/8] arm64: dts: rockchip: Enable SD-card interface on Radxa E20C
Date: Fri,  7 Mar 2025 15:10:20 +0800
Message-Id: <20250307071020.756277-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <5a0a7ce1-1dfb-4d19-8a1e-0d89d177f5b8@kwiboo.se>
References: <5a0a7ce1-1dfb-4d19-8a1e-0d89d177f5b8@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTU4eVhlNHRkaTU9JHkMdGFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQUhIS0tBGRlKSUEaSxpIQU9LH0EeQ0kdWVdZFhoPEh
	UdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQktLWQY+
X-HM-Tid: 0a956f70dd1003a2kunmd4f8d463
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NVE6Hjo6MDICHDcIIjULGjVC
	CAIKCT9VSlVKTE9KSEhKT0lISUNCVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBSEhLS0EZGUpJQRpLGkhBT0sfQR5DSR1ZV1kIAVlBT0NCNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_231026_273544_F28099DF 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
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

> On the E20C the sdmmc controller is routed to a microSD card slot mainly
> intended for use with microSD-cards and should normally not need SDIO.
> 
> What card/adapter do you have inserted in the microSD card slot that
> requires use of SDIO instead of just SD or MMC? What is the use case you
> have that requires removal of no-sdio on E20C?

I inserted an sdio wifi module (via sdcard adapter) for testing.
Just out of curiosity :)

Thanks,
Chukun

-- 
2.25.1


