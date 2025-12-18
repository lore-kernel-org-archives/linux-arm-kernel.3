Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68698D6E2B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 16:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flkwXIsuycmRFZwE+EeysAAbLRNI56VtCwdtbrplhks=; b=w+XjdJtxbcQNeOFBtOpJXYWW5o
	G8RuzhwMPJIO/7NV8CY1kA6z+N7wpcmbe+XBMAMKJ3a6LsWgXUG1yxOgPY/KdCm4DiiisYa9F9iY9
	xmj6ShT1QwVTn6lerZMRm0suU91GaPxVx4r6ledcC+7BEOYU96wHZZBg1GnfPcB9325hFSblPTzOE
	DzZdu0taKXDp2iupI0G/i1s2aD49nk1BETvmNlHOHhWLPiLsV4XmoCVz39eRWlhk6SsWLTcmKzl5/
	gMkNLvs0z3/YHKxi6TYLJOMtjLNJrBX5ZcotLUxkh7rQOxvRnEsBUBWAAYizVCwFeMPmpM1I+S3m1
	qr8uw5kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWH4j-00000008qNC-2wEz;
	Thu, 18 Dec 2025 16:42:01 +0000
Received: from sender4-of-o55.zoho.com ([136.143.188.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWH4h-00000008qMk-1W4d;
	Thu, 18 Dec 2025 16:42:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766076111; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VZVOXfhWO2+fL3tvJ5QOL4osPgh7YsMea6XvxbjjozEGSb6nxNaEqqLi+nw6IcZ/H/6OcLzAnBW7XO6HlbDzo/XAFIib/sMnkuPZFRMgCSQxhMrRhm1nsbV9s/DTydKdgYz/um6pcPSZ+Yzcf7E+XyH6+vP5QiVNPhmPLGfnXl0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766076111; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=flkwXIsuycmRFZwE+EeysAAbLRNI56VtCwdtbrplhks=; 
	b=GaJtf7mT2vNoxFDQZGUEdHFDATd4AG/OYcg9V8887rYefRL2plW6CTJYplnG3qiLzgSZVin5hVt/gsXfUiyY1a+7rQRmn13XHljYVhfL4U5RP6sKC5T4XCUkZOmksb/4LAubtGx2A5077GMZaDnI/QnryFhW6eiceFM1/EeW9Ro=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	spf=pass  smtp.mailfrom=thesnowfield@sakurapi.org;
	dmarc=pass header.from=<thesnowfield@sakurapi.org>
Received: by mx.zohomail.com with SMTPS id 1766076108310603.0329261278846;
	Thu, 18 Dec 2025 08:41:48 -0800 (PST)
From: Chiyuki Akatsuki <thesnowfield@sakurapi.org>
To: krzysztof.kozlowski@oss.qualcomm.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	i@chainsx.cn,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	stable+noautosel@kernel.org,
	Chiyuki Akatsuki <thesnowfield@sakurapi.org>
Subject: Re: [PATCH RESEND] arm64: dts: rockchip: Fix wifi interrupts flag on Sakura Pi RK3308B
Date: Fri, 19 Dec 2025 00:40:21 +0800
Message-Id: <20251218164021.495-1-thesnowfield@sakurapi.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251217091808.38253-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251217091808.38253-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_084159_467525_0D379002 
X-CRM114-Status: UNSURE (   4.34  )
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

Thanks for the patch.

Confirmed that the interrupt flags should use IRQ_TYPE_LEVEL_xxx,
and tested on the SakuraPi RK3308B board, works fine.

Acked-by: Chiyuki Akatsuki <thesnowfield@sakurapi.org>


