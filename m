Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C5EE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 11:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0vuif/2MSgYJhL7u/6moFdJqX1uZFlBxxll9z3J//M=; b=LTRhSaycRvX6NHfCgn3jMPCrLf
	1ndbgEeNyVcUvfPldhA94wSJwhiYC8CxH9V/KYCRtvoPrAIZgk4RN2r5uOwfG/ZVXH4asHjhtaFCz
	Wq44/+FF4SSC2Ce0Xk5hJXKkJoP5MzaD39DcGeO8q/H3ja5FEmVzcASswH0/5D+Do9L0QNe1Y/3vL
	fNFsIRNtLJ8srFnCs79/HZclDbUIf4oXv9GYU7vyztpHiL2B1JOfiKfwKjOIvlO8IFwxR1k5ov3pb
	hIFYY/IaeGgtLMxMD+79K0PQcmKlQwJkPipATmOKZf3l0n3ln4IJCcbyS8RioKbol6gh4mKSLH4TF
	id2hDVOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEoF-00000001gFh-31Qk;
	Thu, 19 Dec 2024 11:35:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEn9-00000001g68-2hqY;
	Thu, 19 Dec 2024 11:34:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734608045;
	bh=E8Pz3cZSaSQzxDv8Kyi3Nwu9usVT/jxkhew+Y65RPhw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=n3ws50JJm3JpJ9qmNc0ngym/Kd5Vlw0RQIEzK9l6vBKcZyJUg3gXSjnKLusrxmyzJ
	 vmYlz2MZteuP8Wnwi7y+Gg0FReQeTj4hMehP79f8SCwxBGr4VRRPxu4+/e45FWI+CH
	 JiU7oN/q/AHxnKRVIBWbDUErRh+jbtShVuxSFGCdScjfsZVyhAcfY1xqoWXs/uo+Xl
	 kbST+iYPM/zi5pXjsmyfzIW2UyWxLRymDa5cYJLBYcvYXGvmdCmknOS1oHJXVspaY4
	 mdNjs+e71QSkurs5jWJp3sMLF1fZ/felyoTyeYAKiMOvbTiQa/Su3ytXrY3iAIg2vD
	 k/gNEMNN5qJag==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 21EAA17E3628;
	Thu, 19 Dec 2024 12:34:05 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, wenst@chromium.org, hsinyi@chromium.org, 
 sean.wang@mediatek.com, dianders@google.com, 
 Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241212062046.22509-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241212062046.22509-1-xiazhengqiao@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v5 0/4] arm64: dts: mediatek: Add MT8186 Chinchou
Message-Id: <173460804505.49444.13450128112085661822.b4-ty@collabora.com>
Date: Thu, 19 Dec 2024 12:34:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_033407_870165_BB904505 
X-CRM114-Status: UNSURE (   9.60  )
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

On Thu, 12 Dec 2024 14:20:42 +0800, Zhengqiao Xia wrote:
> This is v5 of the MT8186 Chromebook device tree series to support
> MT8186 chinchou platform. It is based on the "corsola" design.
> It includes chinchou and chinchou360, including LTE, stylus,
> touchscreen combinations.
> 
> Changes in v5:
> - move sku17 here to keep alphabetical order.
> - do not use the MTK_DRIVE_xxx definitions.
> - Modify exton to extcon
> - Link to v4: https://patchwork.kernel.org/project/linux-arm-kernel/cover/20241202032035.29045-1-xiazhengqiao@huaqin.corp-partner.google.com/
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[1/4] dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
      (no commit info)
[2/4] arm64: dts: mediatek: Add MT8186 Chinchou Chromebooks
      (no commit info)
[3/4] arm64: dts: mediatek: Add extcon node for DP bridge
      (no commit info)
[4/4] arm64: dts: mediatek: Modify audio codec name for pmic
      (no commit info)

Cheers,
Angelo



