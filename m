Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CDBC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 03:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CtUXV0mQGTIfcUY2YyNONZFmUZy0TvR6ETuJjqvz6Yk=; b=jp8fTS7Wan34BhpjDeFxVMh2M1
	cixXb/D7QWCvWXo+qLysUFIOziE9ZfXtBnUCnrBgEuvtNrQNidHchekkAhIfSwEHVEvuFbxsr3ShB
	4gcdN7aVFNS6k6tPKk4WqZrV+8gxzcE91xKLmBdarTPJEmH7txO00bJkB7zyj1d1rf+z6GFOKCWT5
	zLOdkbeIy9VtvkcW2PDElmFHoKOOENM2IVOyxacFeV34QR38/Nc4Zv0LHVFUVZ3ntx32nj9EiIuJa
	ecqqee1TxDFInxBlkPD8223Ect2C+uqKyBhCnPp1NOJjs7cPtApVmCggN0vzsVqUJgzZ/XUROW5hM
	IF9nu5NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ElM-00000004Ok0-0VBe;
	Mon, 28 Apr 2025 03:02:32 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9EjN-00000004ObX-2YrG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 03:00:31 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c02:4b80:f94c:5522:c71d:5af2])
	by smtp.qiye.163.com (Hmail) with ESMTP id 13549a7de;
	Mon, 28 Apr 2025 11:00:17 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: wens@csie.org
Cc: andre.przywara@arm.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jernej.skrabec@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	robh@kernel.org,
	samuel@sholland.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH] arm64: dts: allwinner: a523: fix SD card detect pull resistor
Date: Mon, 28 Apr 2025 11:00:15 +0800
Message-Id: <20250428030015.20915-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAGb2v67=aENryhsQ6VBPwPXskMvMDZpzzeHz2LTUt-VDMTyzGQ@mail.gmail.com>
References: <CAGb2v67=aENryhsQ6VBPwPXskMvMDZpzzeHz2LTUt-VDMTyzGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQ0JDVh5OGkpOT0oYT0xPH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtJQU8ZQ0tBHUJPGEFOTklJQRhMSh9BThodSVlXWRYaDx
	IVHRRZQVlPS0hVSktISk5MTlVKS0tVSkJLS1kG
X-HM-Tid: 0a967a5696cc03a2kunm13549a7de
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NCo6FDo6FDICSjY#Py0SGAFO
	GBUwCxhVSlVKTE9OQ0tCSUpDSEJIVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0lBTxlDS0EdQk8YQU5OSUlBGExKH0FOGh1JWVdZCAFZQUpJT043Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_200029_826728_386F9393 
X-CRM114-Status: UNSURE (   4.43  )
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

> Fixes separated and squashed into the original patches.

https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git/commit/?h=sunxi/dt-for-6.16&id=dd97ddc4da0af02139b0e97e98c210219631e161

In the above commit, dts was renamed but Makefile was not changed.

> +dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a527-radxa-a5e.dtb

Do you want a patch or will you rebase again?

Thanks,
Chukun

--
2.25.1


