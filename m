Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5561099B29
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdC3USVcxvSx4jGkfkGGvvdvFXuf41K1hIyz3nEj2Hs=; b=O8pZlN3TUCQYdzzyo1yoHMUMik
	SrIx66WsbtjlkFrFlOre3QNnyZZhziqtEtzhAU+cPcxoO/4tmgFoQ4rTHPp2qDGm7TYLAAuk/ntnp
	2RMYxU16JpRKtuD5st8qoxVaBi+lv017rOEr2PXeT+XDJbia/umPl7g4jXep+QwU/Yfk8POK9Mm3L
	9bgv4meT8Vt9n9aOzXdDenyx7O5vcDpgirgcdKE7uOXTz++jIep81UjCGZzGQxjZ4SFSd1FcZaKao
	AVkY8aqv4G2gJlWchZnnIo4dJ9CgdsLT7AGH5FFLcWu/V+gRo53lokkNc1FiIgUgRar8/BTcI2WCv
	z8PJVR/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dTd-0000000DED9-2DwT;
	Fri, 20 Mar 2026 17:17:37 +0000
Received: from lpdvsmtp12.broadcom.com ([192.19.144.207] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dTa-0000000DECB-0BsU;
	Fri, 20 Mar 2026 17:17:36 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 3EC59C0005CF;
	Fri, 20 Mar 2026 10:17:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 3EC59C0005CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1774027052;
	bh=R21t7CJG1kncbC3od1z7tRSdEb8yD9w4TggfZbdM0fc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nGkfy6j3SDkUEwSHlWiYTwRENS1Fm9GGv+QFk8CX8FWC91XVRqqLV3eJzd391Wee6
	 lJx4iqf77dXbcMuMiwT5xPUstWxnGIMxDbWFKw/mJZ0hhaAhKn5ECjoNAejeMC0ICt
	 AMjfnpzx8OLDn8U38LDVunAsPog2WPxuqKdlp2Pw=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id D1A6CA83;
	Fri, 20 Mar 2026 10:17:31 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: broadcom: bcm2712: Move non simple-bus nodes to root level
Date: Fri, 20 Mar 2026 10:17:31 -0700
Message-ID: <20260320171731.3070260-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320154809.1246064-2-robh@kernel.org>
References: <20260320154809.1246064-1-robh@kernel.org> <20260320154809.1246064-2-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_101734_170255_87085AA2 
X-CRM114-Status: UNSURE (   9.45  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Fri, 20 Mar 2026 10:48:07 -0500, "Rob Herring (Arm)" <robh@kernel.org> wrote:
> The 'gpu' and 'firmware' nodes are not MMIO devices, so they should not
> be under a 'simple-bus', but at the root level.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

