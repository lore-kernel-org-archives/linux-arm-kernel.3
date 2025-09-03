Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6CDCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNd8Kp8/6mY/bo0pYzbvUHKE9xd0rFFHOcDrIJjCFWU=; b=aQwxZ5LM/3mOJt8y3FxUf79rCf
	24ujSDaG4X1QtDKHTE2h188iTYBv8nGbzv4YJiqLruhp1Md4s70s7qa0KlHibqNPq7m1S5AkEaG4r
	iHj2bYCyhKlUx5mxrhYf3Nkt80E9S8ZBPiXxhL18dZD9KjQkWWknq2mMfX63VoGYeJ+LjCLvRARIN
	SM3VGb8TU1WeVqPt8av9QjkEU5rM9gpfbH8ojFjmQ7y3FAV3SoP/eoTu8yYc8Q5s7RmBMGblbVnrz
	/XLNV7XVkTQG+GA0YqDopZ9F8mruEOoQ+2E2OOTVUT/nmMeIbtcfsgeThk+gt7uTHYMOnHGH6hl0T
	T3Ssywvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utusM-00000007eSY-2Dgi;
	Wed, 03 Sep 2025 21:18:42 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utrCE-00000007BMC-1E2v;
	Wed, 03 Sep 2025 17:22:59 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 6A66BC000C6F;
	Wed,  3 Sep 2025 10:22:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 6A66BC000C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1756920175;
	bh=MgR3tYmVRb8vi08gFaEidd7fXX3CfhvWHiW0QflcxGo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MlkBA6QnPCNo2FcawW4uT+Gz1EJVgjkBd9nbRAdayc/HP+ysGLPlA8GU9E5AmwLJa
	 Pstlg+3YByjjjpg4r/X8vQx1vz62LtFWO9r5NGOVsjFhS3yMrR81drZjApVRRHPEIO
	 O18WrfkYWFVsHr9ILOgmdOsR7c63nfWMTCN0nAxg=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 0A6A0180004FC;
	Wed,  3 Sep 2025 10:22:55 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: Add default GIC address cells
Date: Wed,  3 Sep 2025 10:22:54 -0700
Message-ID: <20250903172254.2512047-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822133407.312505-2-krzysztof.kozlowski@linaro.org>
References: <20250822133407.312505-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_102258_421930_4613F34A 
X-CRM114-Status: GOOD (  12.57  )
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

On Fri, 22 Aug 2025 15:34:08 +0200, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> Add missing address-cells 0 to GIC interrupt node to silence W=1
> warning:
> 
>   bcm2712.dtsi:494.4-497.31: Warning (interrupt_map): /axi/pcie@1000110000:interrupt-map:
>     Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
> 
> Value '0' is correct because:
> 1. GIC interrupt controller does not have children,
> 2. interrupt-map property (in PCI node) consists of five components and
>    the fourth component "parent unit address", which size is defined by
>    '#address-cells' of the node pointed to by the interrupt-parent
>    component, is not used (=0)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

