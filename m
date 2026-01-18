Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9557C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 21:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qH+U+xKJhw7xryI6veBTOa8U279TGynYsRUuACCMLPY=; b=IjGaAMJ9ZTaue1aN3k85vvblw9
	r+Dy4RHt35pE2lnvN2DaMjfxvEG28y1BhugqV4AkKyt5KVKLL5Q2HGz7Ouhggi8cyDvFqv2soPact
	1Ywd6rGeY1VnA76r8IldF9GqUJdGQBBUZ0tBLIXOBxTz/IyJLK30C8iSO6Yu4p2/honb7zMihbt8j
	fIMhpxwaO9uY9oCKj0LcxnG/C8eCnzD4Z4dsPw11V8Dbq08HTxHEiigO6LCr9XLNcCAdk1FV7643m
	tfJKQ0A4RJ2ZlRvmjoDa2CaptVMBeqYcTufSCt8nEz1O67JKNwNb9wuK2yY7mqWoXVpXBuNxGf8B4
	/Cv5tsAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhabx-000000012jC-11jN;
	Sun, 18 Jan 2026 21:47:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhabv-000000012ht-2f6w
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 18 Jan 2026 21:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=qH+U+xKJhw7xryI6veBTOa8U279TGynYsRUuACCMLPY=; b=Xo9k2Z+Ju79JF/6eyln/xuyAKa
	65uSw0NEM6VrarR1w9rcS2SVXVd423kd8e0bm37e5YEmjj+BB3OL1cuQIsGlzArS0tWT3BlV6RjyT
	kKNK0kOavQSLtGm+o4q8Sjh7/8JNTBsCVPRfn+k9qLTWkD0gxRBKxgCEpwqXTpWxAc3fgp533duB4
	5TkgOrJ1f3GOwFSyBv6n7sNIP8wvcoYA3GQOogSIx3+m6DpOycJqirTO//c24GPaZRBDRe9nf2R4l
	k9mKj+36aqeBT9sOcnSSqpELUYVkaV4PzwAccSzBik+x64KEqkFCnuZWHr2sy842/DgCJe5GlWnKf
	td9fTMZQ==;
Received: from mail-108-mta237.mxroute.com ([136.175.108.237])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhabl-0000000B6tZ-37SQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 21:47:01 +0000
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta237.mxroute.com (ZoneMTA) with ESMTPSA id 19bd31322a30009140.002
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 18 Jan 2026 21:46:45 +0000
X-Zone-Loop: f2b79cc992eba2bd694729ad1a8e2001a51115b39ad9
X-Originating-IP: [136.175.111.3]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=qH+U+xKJhw7xryI6veBTOa8U279TGynYsRUuACCMLPY=; b=m0
	m5r80W9xJ2C75mW3h+wGqSTKCFwvg+dgNDar7fFzmVT99XhxCqOcLRLjn5UJDn47ktqEgCg35E2VY
	zl8SCg3r2PUMEhLbIHbX2ojpnAw1bnHbh6lLhzSSibE/nFUYIRYJ/yFynJYnKRDzKgL7CeKUN9o37
	VIaFSn/b5hj96T5RsPzech5KZA/m9TIXwAs7CcDrJkwQrzV6zlDPDwsNpqe+TgHvbkEPifPw3P3fX
	VSPqau0sRP4jSwXQziIBWPK9AkLNxvx2K9Xw1yB2omcp0jLazYSOQNkJNatGQbKUh9wvAFACCKZe4
	bowdRNmK+6SFITNnUvatERy5v3Cne//A==;
From: Luis Garcia <git@luigi311.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Benjamin <olivier.benjamin@bootlin.com>,
	megi@xff.cz,
	Luis Garcia <git@luigi311.com>
Subject: [PATCH 0/1] Fix imx258 variant on pinephone pro
Date: Sun, 18 Jan 2026 14:46:19 -0700
Message-ID: <20260118214620.3319040-1-git@luigi311.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: git@luigi311.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_214659_610239_D6A0A16A 
X-CRM114-Status: UNSURE (   7.62  )
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

imx258 had the driver updated a while back and it introduced
two variants, the imx258 and imx258-pdaf. The pinephone pro
is using the pdaf variant so this switches it to the correct
variant and eliminates the pdaf pixels from the sensor output
resulting in a much cleaner image.

Luis Garcia (1):
  arm64: dts: rockchip: Fix imx258 variant on pinephone pro

 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.50.1


